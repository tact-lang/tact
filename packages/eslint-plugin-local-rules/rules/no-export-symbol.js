const ts = require("typescript");

module.exports = {
    meta: {
        type: "problem",
        docs: {
            url: "https://github.com/tact-lang/tact/issues/1695",
            recommended: true,
        },
    },

    create(context) {
        const parserServices = context.sourceCode.parserServices;
        const checker = parserServices.program.getTypeChecker();

        return {
            ExportSpecifier(node) {
                const tsNode = parserServices.esTreeNodeToTSNodeMap.get(node);
                const type = checker.getTypeAtLocation(tsNode);

                if (!isSymbolType(type)) {
                    return;
                }

                const name = context.sourceCode.getText(node);
                context.report({
                    node,
                    message: "Forbidden to export the '{{name}}' symbol",
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
