// ============================================================
// Footer year
// ============================================================
const year = document.getElementById("year");
if (year) year.textContent = new Date().getFullYear();

// ============================================================
// Reveal sections on scroll
// ============================================================
const sections = document.querySelectorAll(".section-wrap:not(.hero)");

const revealObserver = new IntersectionObserver(
  (entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        entry.target.classList.add("in-view");
        revealObserver.unobserve(entry.target);
      }
    });
  },
  { threshold: 0.15 },
);

sections.forEach((section) => revealObserver.observe(section));

// ============================================================
// Highlight active tab based on scroll position
// ============================================================
const tabs = document.querySelectorAll(".site-nav a");
const allSections = document.querySelectorAll("main section[id]");

const tabObserver = new IntersectionObserver(
  (entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        const id = entry.target.getAttribute("id");
        tabs.forEach((tab) =>
          tab.classList.toggle("active", tab.getAttribute("href") === `#${id}`),
        );
      }
    });
  },
  { threshold: 0.4, rootMargin: "-80px 0px -40% 0px" },
);

allSections.forEach((section) => tabObserver.observe(section));
