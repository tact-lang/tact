import { getParser as getParserNext } from "./next";
import type { FactoryAst } from "../ast/ast-helpers";
import type * as A from "../ast/ast";

import { getParser as getParserPrev } from "./prev/grammar";

import type { Source } from "../imports/source";

export type Parser = {
    parse: (source: Source) => A.AstModule;
    parseExpression: (sourceCode: string) => A.AstExpression;
    parseImports: (source: Source) => A.AstImport[];
    parseStatement: (sourceCode: string) => A.AstStatement;
};

export const defaultParser = "new";

export const getParser = (ast: FactoryAst, version: "old" | "new"): Parser => {
    if (version === "new") {
        return getParserNext(ast);
    } else {
        return getParserPrev(ast);
    }
};
