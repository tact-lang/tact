import { getHighlighter, BUNDLED_LANGUAGES, BUNDLED_THEMES } from 'shiki';
import fs from 'fs';
import yaml from 'js-yaml';

(async () => {

    // Load grammar
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
    const grammarSample = fs.readFileSync(require.resolve('../grammar/sample.tact'), 'utf-8');
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
    fs.writeFileSync(require.resolve('../grammar/sample.html'), res);

    let tokens = highlighter.codeToThemedTokens(grammarSample, 'tact', theme);
    fs.writeFileSync(require.resolve('../grammar/sample.json'), JSON.stringify(tokens, null, 2));
})();