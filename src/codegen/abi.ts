import { AstExpression, SrcInfo } from "../grammar/ast";
import { CompilerContext } from "../context";
import { TypeRef } from "../types/types";
import { FuncAstExpr } from "../func/syntax";

/**
 * A static map of functions defining Func expressions for Tact ABI functions and methods.
 */
export type AbiFunction = {
    name: string;
    resolve: (ctx: CompilerContext, args: TypeRef[], loc: SrcInfo) => TypeRef;
    generate: (
        args: TypeRef[],
        resolved: AstExpression[],
        loc: SrcInfo,
    ) => FuncAstExpr;
};

// TODO
export const MapFunctions: Map<string, AbiFunction> = new Map([]);

// TODO
export const StructFunctions: Map<string, AbiFunction> = new Map([]);

// TODO
export const GlobalFunctions: Map<string, AbiFunction> = new Map([]);
