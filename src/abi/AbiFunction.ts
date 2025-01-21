import { AstExpression } from "@/ast/ast";
import { CompilerContext } from "@/context/context";
import { WriterContext } from "@/generator/Writer";
import { TypeRef } from "@/types/types";
import { SrcInfo } from "@/grammar";

export type AbiFunction = {
    name: string;
    resolve: (ctx: CompilerContext, args: TypeRef[], loc: SrcInfo) => TypeRef;
    generate: (
        ctx: WriterContext,
        args: TypeRef[],
        resolved: AstExpression[],
        loc: SrcInfo,
    ) => string;
};
