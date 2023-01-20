import { getHighlighter, BUNDLED_LANGUAGES } from 'shiki';
import fs from 'fs';
const grammarTact = JSON.parse(fs.readFileSync(require.resolve('../grammar/tact.tmLanguage.json'), 'utf-8'));
const grammarSample = fs.readFileSync(require.resolve('../grammar/sample.tact'), 'utf-8');
(async () => {
    let highlighter = await getHighlighter({
        langs: [
            ...BUNDLED_LANGUAGES,
            {
                id: 'tact',
                scopeName: 'source.tact',
                grammar: grammarTact,
                aliases: ['tact'],
            }
        ] as any,
    });
    let res = highlighter.codeToHtml(grammarSample, { lang: 'tact' });
    res = `<html><head><meta charset="utf-8"></head><body>${res}</body></html>`;
    fs.writeFileSync(require.resolve('../grammar/sample.html'), res);
})();