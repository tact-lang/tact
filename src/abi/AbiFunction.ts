import type * as Ast from "@/ast/ast";
import type { CompilerContext } from "@/context/context";
import type { WriterContext } from "@/generator/Writer";
import type { TypeRef } from "@/types/types";
import type { SrcInfo } from "@/grammar";

export type AbiFunction = {
    name: string;
    isStatic: boolean;
    resolve: (
        ctx: CompilerContext,
        args: readonly TypeRef[],
        loc: SrcInfo,
    ) => TypeRef;
    generate: (
        ctx: WriterContext,
        args: readonly TypeRef[],
        resolved: readonly Ast.Expression[],
        loc: SrcInfo,
    ) => string;
};
