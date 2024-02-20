import { ASTConstant, ASTFunction, ASTNativeFunction, ASTType } from "./ast";
import { CompilerContext, createContextStore } from "../context";
import { parse } from "./grammar";
import { TypeOrigin } from "../types/types";

type ASTStore = {
    sources: { code: string, path: string }[],
    funcSources: { code: string, path: string }[],
    functions: (ASTFunction | ASTNativeFunction)[],
    constants: ASTConstant[],
    types: ASTType[]
};

const store = createContextStore<ASTStore>();

export function getRawAST(ctx: CompilerContext) {
    const r = store.get(ctx, 'types');
    if (!r) {
        throw Error('No AST found in context');
    }
    return r;
}

export function openContext(ctx: CompilerContext,
    sources: { code: string, path: string, origin: TypeOrigin }[],
    funcSources: { code: string, path: string }[]
) {
    const asts = sources.map(source => parse(source.code, source.path, source.origin));
    const types: ASTType[] = [];
    const functions: (ASTNativeFunction | ASTFunction)[] = [];
    const constants: ASTConstant[] = [];
    for (const a of asts) {
        for (const e of a.entries) {
            if (e.kind === 'def_struct' || e.kind === 'def_contract' || e.kind === 'def_trait' || e.kind === 'primitive') {
                types.push(e);
            } else if (e.kind === 'def_function' || e.kind === 'def_native_function') {
                functions.push(e);
            } else if (e.kind === 'def_constant') {
                constants.push(e);
            }
        }
    }
    ctx = store.set(ctx, 'types', { sources, funcSources, functions, constants, types });
    return ctx;
}