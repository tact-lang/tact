import { ASTRef, throwError } from "../grammar/ast";
import { CompilerContext } from "../context";
import { WriterContext } from "../generator/Writer";
import { getType } from "../types/resolveDescriptors";
import { TypeRef } from "../types/types";

export type AbiFunction = {
    name: string;
    resolve: (ctx: CompilerContext, args: TypeRef[], ref: ASTRef) => TypeRef;
    generate: (ctx: WriterContext, args: TypeRef[], resolved: string[], ref: ASTRef) => string;
}