import { getParser as getParserNext } from "./next";
import { FactoryAst } from "../ast/ast-helpers";
import * as A from "../ast/ast";

import { getParser as getParserPrev } from "./prev/grammar";
import { ItemOrigin } from "./src-info";

export type Parser = {
    parse: (src: string, path: string, origin: ItemOrigin) => A.AstModule;
    parseExpression: (sourceCode: string) => A.AstExpression;
    parseImports: (
        src: string,
        path: string,
        origin: ItemOrigin,
    ) => A.AstImport[];
    parseStatement: (src: string) => A.AstStatement;
    parseModule: (src: string) => A.AstModule;
};

export const defaultParser = "new";

export const getParser = (ast: FactoryAst, version: "old" | "new"): Parser => {
    if (version === "new") {
        return getParserNext(ast);
    } else {
        return getParserPrev(ast);
    }
};
