import { getHighlighter, BUNDLED_LANGUAGES, BUNDLED_THEMES } from 'shiki';
import fs from 'fs';
import yaml from 'js-yaml';
import path from 'path';

(async () => {

    // Patch grammar bundler
    let grammarBundlePath = path.resolve(__dirname, '..', 'src', 'grammar', 'grammar.ohm-bundle.js');
    let src = fs.readFileSync(grammarBundlePath, 'utf-8');
    src = src.replace(`require('ohm-js')`, `(require('ohm-js').default || require('ohm-js'))`);
    fs.writeFileSync(grammarBundlePath, src, 'utf-8');

    // Load textmate grammar
    let sourceGrammar = fs.readFileSync(require.resolve('../grammar/tact.tmLanguage.yaml'), 'utf-8');
    let loadedGrammar = yaml.load(sourceGrammar);

    // Process grammar
    function replacePatternVariables(pattern: string, variableReplacers: VariableReplacer[]) {
        let result = pattern;
        for (const [variableName, value] of variableReplacers) {
            result = result.replace(variableName, value);
        }
        return result;
    }
    function transformGrammarRule(rule: any, propertyNames: string[], transformProperty: (ruleProperty: string) => string) {
        for (const propertyName of propertyNames) {
            const value = rule[propertyName];
            if (typeof value === 'string') {
                rule[propertyName] = transformProperty(value);
            }
        }

        for (var propertyName in rule) {
            const value = rule[propertyName];
            if (typeof value === 'object') {
                transformGrammarRule(value, propertyNames, transformProperty);
            }
        }
    }
    function transformGrammarRepository(grammar: any, propertyNames: string[], transformProperty: (ruleProperty: string) => string) {
        const repository = grammar.repository;
        for (let key in repository) {
            transformGrammarRule(repository[key], propertyNames, transformProperty);
        }
    }
    type VariableReplacer = [RegExp, string];
    function processGrammar(src: any) {
        let variables = src.variables;
        delete src.variables;
        const variableReplacers: VariableReplacer[] = [];
        for (const variableName in variables) {
            // Replace the pattern with earlier variables
            const pattern = replacePatternVariables(variables[variableName], variableReplacers);
            variableReplacers.push([new RegExp(`{{${variableName}}}`, "gim"), pattern]);
        }
        transformGrammarRepository(
            src,
            ["begin", "end", "match", "name"],
            pattern => replacePatternVariables(pattern, variableReplacers)
        );
        return src;
    }
    loadedGrammar = processGrammar(loadedGrammar);

    fs.writeFileSync(require.resolve('../grammar/tact.tmLanguage.json'), JSON.stringify(loadedGrammar, null, 2));

    // Generate sample highlight
    const grammarTact = JSON.parse(fs.readFileSync(require.resolve('../grammar/tact.tmLanguage.json'), 'utf-8'));

    for (let f of fs.readdirSync(path.resolve(__dirname, '..', 'grammar'))) {
        if (f.endsWith('.tact')) {
            let name = f.substring(0, f.length - '.tact'.length);
            const grammarSample = fs.readFileSync(path.resolve(__dirname, '..', 'grammar', name + '.tact'), 'utf-8');
            let highlighter = await getHighlighter({
                themes: BUNDLED_THEMES,
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

            let theme = 'dark-plus'; // Most features

            let res = highlighter.codeToHtml(grammarSample, { lang: 'tact', theme });
            res = `<html><head><meta charset="utf-8"></head><body>${res}</body></html>`;
            fs.writeFileSync(path.resolve(__dirname, '..', 'grammar', name + '.html'), res);

            let tokens = highlighter.codeToThemedTokens(grammarSample, 'tact', theme);
            fs.writeFileSync(path.resolve(__dirname, '..', 'grammar', name + '.json'), JSON.stringify(tokens, null, 2));
        }
    }
})();