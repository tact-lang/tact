import { ASTExpression } from "../ast/ast";
import { CompilerContext, createContextStore } from "../ast/context";
import { getType } from "./resolveTypeDescriptors";
import { TypeDescription } from "./TypeDescription";

let store = createContextStore<TypeDescription>();

type VariableCTX = { [key: string]: TypeDescription };

export function getExpType(ctx: CompilerContext, exp: ASTExpression) {
    let t = store.get(ctx, exp.id);
    if (!t) {
        throw Error('Expression ' + exp.id + ' not found');
    }
    return t;
}

export function resolveExpressionTypes(ctx: CompilerContext) {

    // Process all types
    function registerExpType(ctx: CompilerContext, exp: ASTExpression, name: string): CompilerContext {
        if (store.get(ctx, exp.id)) {
            throw Error('Expression ' + exp.id + ' already has a type');
        }
        return store.set(ctx, exp.id, getType(ctx, name));
    }
    function resolveExpression(ctx: CompilerContext, vctx: VariableCTX, exp: ASTExpression): CompilerContext {
        if (exp.kind === 'boolean') {
            return registerExpType(ctx, exp, 'Bool');
        } else if (exp.kind === 'number') {
            return registerExpType(ctx, exp, 'Int');
        } else if (exp.kind === 'op_binary') {
            ctx = resolveExpression(ctx, vctx, exp.left);
            ctx = resolveExpression(ctx, vctx, exp.right);
            let le = getExpType(ctx, exp.left);
            let re = getExpType(ctx, exp.right);
            if (le !== re) {
                throw Error('Type mistmatch');
            }
            return registerExpType(ctx, exp, le.name);
        } else if (exp.kind === 'op_unary') {
            ctx = resolveExpression(ctx, vctx, exp.right);
            return registerExpType(ctx, exp, getExpType(ctx, exp.right).name);
        } else if (exp.kind === 'id') {
            let v = vctx[exp.value];
            if (!v) {
                throw Error('Resolve expression');
            }
            return registerExpType(ctx, exp, v.name);
        } else if (exp.kind === 'op_field') {
            ctx = resolveExpression(ctx, vctx, exp.src);
            let src = getExpType(ctx, exp.src);
            let field = src.fields[exp.key];
            if (!field) {
                throw Error('Field ' + exp.key + ' not found');
            }
            return registerExpType(ctx, exp, field.type.name);
        }
        return ctx;
    }

    // Process all functions
    for (let t in ctx.astTypes) {
        let a = ctx.astTypes[t];
        if (a.kind === 'def_contract') {
            for (let f of a.declarations) {
                if (f.kind === 'def_function') {

                    // Function variables
                    let vctx: VariableCTX = {};
                    vctx['self'] = getType(ctx, a.name);
                    for (let arg of f.args) {
                        vctx[arg.name] = getType(ctx, arg.type);
                    }

                    // Resolve statements
                    for (let s of f.statements) {
                        if (s.kind === 'let') {
                            ctx = resolveExpression(ctx, vctx, s.expression);
                            vctx[s.name] = getType(ctx, s.type);
                        } else if (s.kind === 'return') {
                            ctx = resolveExpression(ctx, vctx, s.expression);
                        } else {
                            throw Error('Unknown statement');
                        }
                    }
                }
            }
        }
    }

    return ctx;
}