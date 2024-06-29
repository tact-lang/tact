import { ASTExpression, SrcInfo } from "../grammar/ast";
import { CompilerContext } from "../context";
import { WriterContext } from "../generator/Writer";
import { TypeRef } from "../types/types";

export type AbiFunction = {
    name: string;
    resolve: (ctx: CompilerContext, args: TypeRef[], ref: SrcInfo) => TypeRef;
    generate: (
        ctx: WriterContext,
        args: TypeRef[],
        resolved: ASTExpression[],
        ref: SrcInfo,
    ) => string;
};
