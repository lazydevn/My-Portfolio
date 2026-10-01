document.addEventListener("click", (event) => {
  const link = event.target.closest("a");
  if (!link || link.target === "_blank" || link.hasAttribute("download"))
    return;

  const destination = new URL(link.href, window.location.href);
  if (
    destination.origin !== window.location.origin ||
    (destination.pathname === window.location.pathname && destination.hash)
  )
    return;
  if (window.matchMedia("(prefers-reduced-motion: reduce)").matches) return;

  event.preventDefault();
  document.body.classList.add("page-leaving");
  window.setTimeout(() => {
    window.location.href = destination.href;
  }, 340);
});
