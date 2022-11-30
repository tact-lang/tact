import { parse } from "../grammar/grammar";
import { ASTFunction, ASTNode, ASTType } from "./ast";

export type VariableRef = {
    name: string,
    node: ASTNode
};

export class CompilerContext {

    static fromSources(sources: string[]) {
        let asts = sources.map(source => parse(source));
        let ctx = new CompilerContext({ astTypes: {}, astFunctionStatic: {}, shared: {} });
        for (let a of asts) {
            for (let e of a.entries) {
                if (e.kind === 'def_struct') {
                    ctx = ctx.addASTType(e);
                } else if (e.kind === 'def_contract') {
                    ctx = ctx.addASTType(e);
                } else if (e.kind === 'primitive') {
                    ctx = ctx.addASTType(e);
                } else if (e.kind === 'def_function') {
                    ctx = ctx.addASTStaticFunction(e);
                }
            }
        }
        return ctx;
    }

    readonly astTypes: { [key: string]: ASTType };
    readonly astFunctionStatic: { [key: string]: ASTFunction };
    readonly shared: { [key: symbol]: any } = {};

    constructor(args: { astTypes: { [key: string]: ASTType }, astFunctionStatic: { [key: string]: ASTFunction }, shared: { [key: symbol]: any } }) {
        this.astTypes = args.astTypes;
        this.shared = args.shared;
        this.astFunctionStatic = args.astFunctionStatic;
        Object.freeze(this.astTypes);
        Object.freeze(this.astFunctionStatic);
        Object.freeze(this.shared);
        Object.freeze(this);
    }

    addASTType = (ref: ASTType) => {
        if (this.astTypes[ref.name]) {
            throw Error('Type already exists');
        }
        return new CompilerContext({ astTypes: { ...this.astTypes, [ref.name]: ref }, astFunctionStatic: this.astFunctionStatic, shared: this.shared });
    }

    addASTStaticFunction = (ref: ASTFunction) => {
        if (this.astFunctionStatic[ref.name]) {
            throw Error('Type already exists');
        }
        return new CompilerContext({ astTypes: this.astTypes, astFunctionStatic: { ...this.astFunctionStatic, [ref.name]: ref }, shared: this.shared });
    }

    addShared = <T>(store: symbol, key: string | number, value: T) => {
        let sh: { [key: string]: T } = {};
        if (this.shared[store]) {
            sh = { ...this.shared[store] };
        }
        sh[key] = value;
        return new CompilerContext({ astTypes: this.astTypes, astFunctionStatic: this.astFunctionStatic, shared: { ...this.shared, [store]: sh } });
    }
}

export function createContextStore<T>() {
    let symbol = Symbol();
    return {
        get(ctx: CompilerContext, key: string | number) {
            if (!ctx.shared[symbol]) {
                return null;
            }
            let m = ctx.shared[symbol] as { [key: string | number]: T };
            if (m[key]) {
                return m[key];
            } else {
                return null;
            }
        },
        all(ctx: CompilerContext): { [key: string | number]: T } {
            if (!ctx.shared[symbol]) {
                return {} as { [key: string | number]: T };
            }
            let m = ctx.shared[symbol] as { [key: string | number]: T };
            return m;
        },
        set(ctx: CompilerContext, key: string | number, v: T) {
            return ctx.addShared(symbol, key, v);
        }
    }
}