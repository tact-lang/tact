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
                    ctx = ctx.addType(e);
                } else if (e.kind === 'def_contract') {
                    ctx = ctx.addType(e);
                }
            }
        }
        return ctx;
    }

    readonly types: { [key: string]: ASTType };
    readonly variables: { [key: string]: VariableRef };

    constructor(types: { [key: string]: ASTType } = {}, variables: { [key: string]: VariableRef } = {}) {
        this.types = types;
        this.variables = variables;
        Object.freeze(this);
    }

    addType = (ref: ASTType) => {
        if (this.types[ref.name]) {
            throw Error('Type already exists');
        }
        return new CompilerContext({ ...this.types, [ref.name]: ref }, this.variables);
    }

    addVariable = (ref: VariableRef) => {
        if (this.variables[ref.name]) {
            throw Error('Variable already exists');
        }
        return new CompilerContext(this.types, { ...this.variables, [ref.name]: ref });
    }
}