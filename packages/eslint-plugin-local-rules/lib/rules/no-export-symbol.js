"use strict";
const ts = require("typescript");
const { ESLintUtils } = require("@typescript-eslint/utils");

/** @type {import('eslint').Rule.RuleModule} */
module.exports = {
    meta: {
        type: "problem",
        docs: {
            description: "Ban exporting witness Symbol",
            recommended: true,
            url: "https://github.com/tact-lang/tact/issues/1695",
        },
        messages: {
            forbiddenExportSymbol: "Forbidden to export the '{{name}}' symbol",
        },
        fixable: null,
        schema: [],
    },

    create(context) {
        const { esTreeNodeToTSNodeMap, program } =
            ESLintUtils.getParserServices(context);
        const checker = program.getTypeChecker();

        return {
            ExportSpecifier(node) {
                const tsNode = esTreeNodeToTSNodeMap.get(node);
                const type = checker.getTypeAtLocation(tsNode);

                if (!isSymbolType(type)) {
                    return;
                }

                const name = context.sourceCode.getText(node);
                context.report({
                    node,
                    messageId: "forbiddenExportSymbol",
                    data: { name },
                });
            },
        };

        function isSymbolType(type) {
            const flags = type.getFlags();
            return flags === ts.TypeFlags.UniqueESSymbol;
        }
    },
};
