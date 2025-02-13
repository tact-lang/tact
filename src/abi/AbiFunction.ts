import type { AstExpression } from "../ast/ast";
import type { CompilerContext } from "../context/context";
import type { WriterContext } from "../generator/Writer";
import type { TypeRef } from "../types/types";
import type { SrcInfo } from "../grammar";

export type AbiFunction = {
    name: string;
    resolve: (
        ctx: CompilerContext,
        args: readonly TypeRef[],
        loc: SrcInfo,
    ) => TypeRef;
    generate: (
        ctx: WriterContext,
        args: readonly TypeRef[],
        resolved: readonly AstExpression[],
        loc: SrcInfo,
    ) => string;
};
