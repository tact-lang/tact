// TODO: move this to a standalone new rehype plugin

/**
 * @import {Root} from 'hast'
 */

import { visit } from 'unist-util-visit';
import { toString } from 'hast-util-to-string';
import {
  bundledLanguages,
  createHighlighter,
} from 'shiki';
import { createOnigurumaEngine } from 'shiki/engine/oniguruma';
import fs from 'node:fs';

// Import custom grammars
const grammar_tact = JSON.parse(fs.readFileSync(new URL('grammars/grammar-tact.json', import.meta.url), 'utf-8'));
const grammar_func = JSON.parse(fs.readFileSync(new URL('grammars/grammar-func.json', import.meta.url), 'utf-8'));
const grammar_ohm = JSON.parse(fs.readFileSync(new URL('grammars/grammar-ohm.json', import.meta.url), 'utf-8'));

/**
 * Highlight inline code tags with Shiki
 *
 * @returns Transform.
 */
export default function rehypeInlineCodeHighlighting() {
  /**
   * @param {Root} tree
   * @return {undefined}
   */
  return async function(tree) {
    /** @type {{node: import('hast').Element, lang: string, code: string}[]} */
    const nodesToProcess = [];

    visit(tree, 'element', function(node, _num, parent) {
      if (node.tagName === 'code'
        && node.children.length === 1
        && node.children[0].type === "text"
        && node.children[0].value.match(/\{:\s*[a-zA-Z0-9_\-]+\s*\}\s*$/) !== null
        && parent !== undefined
        && parent.tagName !== 'pre') {
        // Obtain the string value
        const value = toString(node);

        // Match-out the inner language string
        const lang = value.match(/\{:\s*([a-zA-Z0-9_\-]+)\s*\}\s*$/)[1];
        const code = value.match(/(.*?)\s*\{:\s*[a-zA-Z0-9_\-]+\s*\}\s*$/)[1];

        // Save them for future processing
        nodesToProcess.push({ node, lang, code });
      }
    });

    // Prepare Shiki
    const hl = await createHighlighter({
      themes: ['one-dark-pro', 'one-light'], // TODO: abstract away
      langs: [
        // ...Object.keys(bundledLanguages),
        bundledLanguages.javascript,
        bundledLanguages.typescript,
        bundledLanguages.json,
        bundledLanguages.markdown,
        bundledLanguages.bash,
        bundledLanguages.shell,
        bundledLanguages.bat,
        bundledLanguages.batch,
        bundledLanguages.powershell,
        grammar_tact,
        grammar_func,
        grammar_ohm,
      ],
      // TODO: Made the 'name' lowercase in the TextMate grammars
      langAlias: { fc: 'func' },
      engine: await createOnigurumaEngine(import('shiki/wasm')),
    });

    // Apply highlighting to each target node
    for (let i = 0; i < nodesToProcess.length; i += 1) {
      const res = hl.codeToHast(nodesToProcess[i].code.trim(), {
        lang: nodesToProcess[i].lang,
        theme: 'one-dark-pro', // TODO: move out
        // theme: 'one-light',
        structure: 'inline',
      });
      nodesToProcess[i].node.children = res.children;
      // console.log(nodesToProcess[i].node);
    }

    // TODO: hoist preparation elsewhere?
    hl.dispose();
  }
}
