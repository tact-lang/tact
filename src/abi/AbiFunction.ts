import { AstExpression } from "../ast/ast";
import { CompilerContext } from "../context/context";
import { WriterContext } from "../generator/Writer";
import { TypeRef } from "../types/types";
import { SrcInfo } from "../grammar";

export type AbiFunction = {
    name: string;
    resolve: (ctx: CompilerContext, args: readonly TypeRef[], loc: SrcInfo) => TypeRef;
    generate: (
        ctx: WriterContext,
        args: readonly TypeRef[],
        resolved: readonly AstExpression[],
        loc: SrcInfo,
    ) => string;
};
