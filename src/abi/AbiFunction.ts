import { ASTExpression, ASTRef } from "../grammar/ast";
import { CompilerContext } from "../context";
import { WriterContext } from "../generator/Writer";
import { TypeRef } from "../types/types";

export type AbiFunction = {
    name: string;
    resolve: (ctx: CompilerContext, args: TypeRef[], ref: ASTRef) => TypeRef;
    generate: (
        ctx: WriterContext,
        args: TypeRef[],
        resolved: ASTExpression[],
        ref: ASTRef,
    ) => string;
};
