import svelte from '@astrojs/svelte'

export default /** @type {import('astro').AstroUserConfig} */ ({
  // Comment out "renderers: []" to enable Astro's default component support.
  integrations: [
    svelte()
  ],
});
