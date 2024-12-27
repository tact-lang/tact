import { getParser as getParserNext  } from "./next";

import { AstExpression, AstImport, AstModule, FactoryAst } from "./ast";

import { getParser as getParserPrev } from "./prev/grammar";
import { ItemOrigin } from "./src-info";

export type Parser = {
    parse: (src: string, path: string, origin: ItemOrigin) => AstModule;
    parseExpression: (sourceCode: string) => AstExpression;
    parseImports: (src: string, path: string, origin: ItemOrigin) => AstImport[];
};

export const defaultParser = "old";

export const getParser = (ast: FactoryAst, version: "old" | "new"): Parser => {
    if (version === 'new') {
        return getParserNext(ast);
    } else {
        return getParserPrev(ast);
    }
};