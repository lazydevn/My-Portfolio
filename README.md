# CS Student Portfolio (code-editor theme)

A single-page portfolio styled like a code editor: tabs across the top act as
navigation, sections are laid out like files (`about.md`, `projects.json`,
`skills.yml`, `history.log`, `contact.sh`), and the hero renders your intro
as a syntax-highlighted object.

## Files
- `index.html` — all content and structure
- `style.css` — all styling (dark editor theme, responsive, no build step)
- `script.js` — scroll-based tab highlighting + section reveal animation

No frameworks, no build tools — just open `index.html` in a browser.

## How to make it yours

1. **Name and tagline** — in `index.html`, search for `ALEX CHEN` and the
   `hero-object` block and replace with your name, role, focus, and city.
2. **About** — edit the paragraph inside `<section id="about">` and the
   four stats in `.stat-list`.
3. **Projects** — each project is a `.repo-card` inside `<section id="projects">`.
   Duplicate a card, change the name, description, tags, and the `href` on
   `.repo-link` to point at your actual GitHub repo or live demo.
   - Language dot colors already used: TypeScript `#3178c6`, Python `#3572A5`,
     C `#555555`, JavaScript `#f1e05a` — reuse these or match GitHub's actual
     language colors for others.
4. **Skills** — edit the pills inside `<section id="skills">`. Group them
   however makes sense for you (languages / frameworks / tools / coursework).
5. **History / timeline** — each `.commit` in `<section id="log">` is one
   milestone (school, internship, hackathon, etc). Keep them in chronological
   order — that's the one section where order actually matters.
6. **Contact** — replace the email address and links in `<section id="contact">`.
7. **Favicon / title** — update `<title>` in the `<head>`.

## Deploying it for free

The easiest option for a student portfolio is **GitHub Pages**:

1. Create a new repo on GitHub, e.g. `yourname.github.io`.
2. Push these three files (`index.html`, `style.css`, `script.js`) to it.
3. In the repo settings → Pages, set the source to the `main` branch.
4. Your site will be live at `https://yourname.github.io` within a minute or two.

Alternatively, drag-and-drop the folder into **Netlify** or **Vercel** for
an instant deploy with a shareable link.

## Notes
- Colors and fonts are defined as CSS variables at the top of `style.css`
  (`:root { ... }`) if you want to shift the palette.
- The page respects `prefers-reduced-motion` and has visible keyboard focus
  states built in.
