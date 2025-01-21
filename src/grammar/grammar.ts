import { getParser as getParserNext } from "./next";

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
};

export const defaultParser = "new";

export const getParser = (
    ast: A.FactoryAst,
    version: "old" | "new",
): Parser => {
    if (version === "new") {
        return getParserNext(ast);
    } else {
        return getParserPrev(ast);
    }
};
