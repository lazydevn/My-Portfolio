Add-Type -AssemblyName System.Drawing
$sourcePath = Join-Path $PSScriptRoot 'images\cutout-original.jpeg'
$outputPath = Join-Path $PSScriptRoot 'images\cutout-transparent.png'
$source = [System.Drawing.Bitmap]::new($sourcePath)
$width = $source.Width
$height = $source.Height
$visited = New-Object 'bool[,]' $width,$height
$queue = [System.Collections.Generic.Queue[System.Drawing.Point]]::new()
function Add-IfBackground([int]$x, [int]$y) {
  if ($x -lt 0 -or $y -lt 0 -or $x -ge $width -or $y -ge $height -or $visited[$x,$y]) { return }
  $pixel = $source.GetPixel($x,$y)
  if ($pixel.R -ge 238 -and $pixel.G -ge 238 -and $pixel.B -ge 238) {
    $visited[$x,$y] = $true
    $queue.Enqueue([System.Drawing.Point]::new($x,$y))
  }
}
for ($x = 0; $x -lt $width; $x++) { Add-IfBackground $x 0; Add-IfBackground $x ($height - 1) }
for ($y = 0; $y -lt $height; $y++) { Add-IfBackground 0 $y; Add-IfBackground ($width - 1) $y }
while ($queue.Count -gt 0) {
  $point = $queue.Dequeue()
  Add-IfBackground ($point.X + 1) $point.Y; Add-IfBackground ($point.X - 1) $point.Y
  Add-IfBackground $point.X ($point.Y + 1); Add-IfBackground $point.X ($point.Y - 1)
}
$output = [System.Drawing.Bitmap]::new($width,$height,[System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
for ($x = 0; $x -lt $width; $x++) {
  for ($y = 0; $y -lt $height; $y++) {
    $pixel = $source.GetPixel($x,$y)
    if ($visited[$x,$y]) { $output.SetPixel($x,$y,[System.Drawing.Color]::FromArgb(0,$pixel.R,$pixel.G,$pixel.B)) }
    else { $output.SetPixel($x,$y,$pixel) }
  }
}
$output.Save($outputPath,[System.Drawing.Imaging.ImageFormat]::Png)
$source.Dispose(); $output.Dispose()