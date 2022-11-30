import { parse } from "../grammar/grammar";
import { ASTNode, ASTType } from "./ast";

export type VariableRef = {
    name: string,
    node: ASTNode
};

export class CompilerContext {

    static fromSources(sources: string[]) {
        let asts = sources.map(source => parse(source));
        let ctx = new CompilerContext();
        for (let a of asts) {
            for (let e of a.entries) {
                if (e.kind === 'def_struct') {
                    ctx = ctx.addASTType(e);
                } else if (e.kind === 'def_contract') {
                    ctx = ctx.addASTType(e);
                } else if (e.kind === 'primitive') {
                    ctx = ctx.addASTType(e);
                }
            }
        }
        return ctx;
    }

    readonly astTypes: { [key: string]: ASTType };
    readonly variables: { [key: string]: VariableRef };
    readonly shared: { [key: symbol]: any } = {};

    constructor(astTypes: { [key: string]: ASTType } = {}, variables: { [key: string]: VariableRef } = {}, shared: { [key: symbol]: any } = {}) {
        this.astTypes = astTypes;
        this.variables = variables;
        this.shared = shared;
        Object.freeze(this.astTypes);
        Object.freeze(this.shared);
        Object.freeze(this.variables);
        Object.freeze(this);
    }

    addASTType = (ref: ASTType) => {
        if (this.astTypes[ref.name]) {
            throw Error('Type already exists');
        }
        return new CompilerContext({ ...this.astTypes, [ref.name]: ref }, this.variables, this.shared);
    }

    addVariable = (ref: VariableRef) => {
        if (this.variables[ref.name]) {
            throw Error('Variable already exists');
        }
        return new CompilerContext(this.astTypes, { ...this.variables, [ref.name]: ref }, this.shared);
    }

    addShared = <T>(store: symbol, key: string | number, value: T) => {
        let sh: { [key: string]: T } = {};
        if (this.shared[store]) {
            sh = { ...this.shared[store] };
        }
        sh[key] = value;
        return new CompilerContext(this.astTypes, this.variables, { ...this.shared, [store]: sh });
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
        set(ctx: CompilerContext, key: string | number, v: T) {
            return ctx.addShared(symbol, key, v);
        }
    }
}