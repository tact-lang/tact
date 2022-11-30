import { ASTExpression, ASTFunction, ASTOpCall, ASTOpCallStatic } from "../ast/ast";
import { CompilerContext, createContextStore } from "../ast/context";
import { getStaticFunction, getType } from "./resolveTypeDescriptors";
import { TypeDescription } from "./TypeDescription";

let store = createContextStore<{ ast: ASTExpression, description: TypeDescription }>();

type VariableCTX = { [key: string]: TypeDescription };

export function getExpType(ctx: CompilerContext, exp: ASTExpression) {
    let t = store.get(ctx, exp.id);
    if (!t) {
        throw Error('Expression ' + exp.id + ' not found');
    }
    return t.description;
}

export function resolveExpressionTypes(ctx: CompilerContext) {

    // Process all types
    function registerExpType(ctx: CompilerContext, exp: ASTExpression, name: string): CompilerContext {
        if (store.get(ctx, exp.id)) {
            throw Error('Expression ' + exp.id + ' already has a type');
        }
        return store.set(ctx, exp.id, { ast: exp, description: getType(ctx, name) });
    }
    function resolveCall(ctx: CompilerContext, vctx: VariableCTX, exp: ASTOpCall): CompilerContext {
        ctx = resolveExpression(ctx, vctx, exp.src);
        let src = getExpType(ctx, exp.src);
        let f = src.functions[exp.name];
        if (!f) {
            throw Error('Function ' + exp.name + ' not found at type ' + src.name);
        }
        for (let e of exp.args) {
            ctx = resolveExpression(ctx, vctx, e);
        }
        return ctx;
    }
    function resolveStaticCall(ctx: CompilerContext, vctx: VariableCTX, exp: ASTOpCallStatic): CompilerContext {
        for (let e of exp.args) {
            ctx = resolveExpression(ctx, vctx, e);
        }
        return ctx;
    }
    function resolveExpression(ctx: CompilerContext, vctx: VariableCTX, exp: ASTExpression): CompilerContext {
        if (exp.kind === 'boolean') {
            return registerExpType(ctx, exp, 'Bool');
        } else if (exp.kind === 'number') {
            return registerExpType(ctx, exp, 'Int');
        } else if (exp.kind === 'op_binary') {

            // Resolve left and right expressions
            ctx = resolveExpression(ctx, vctx, exp.left);
            ctx = resolveExpression(ctx, vctx, exp.right);
            let le = getExpType(ctx, exp.left).name;
            let re = getExpType(ctx, exp.right).name;

            // Check operands
            let tp: string;
            if (exp.op === '-' || exp.op === '+' || exp.op === '*' || exp.op === '/') {
                if (le !== 'Int') {
                    throw Error('Unsupported type: ' + le);
                }
                if (re !== 'Int') {
                    throw Error('Unsupported type: ' + le);
                }
                tp = 'Int';
            } else if (exp.op === '==' || exp.op === '!=' || exp.op === '<' || exp.op === '<=' || exp.op === '>' || exp.op === '>=') {
                if (le !== 'Int') {
                    throw Error('Unsupported type: ' + le);
                }
                if (re !== 'Int') {
                    throw Error('Unsupported type: ' + le);
                }
                tp = 'Bool';
            } else if (exp.op === '&&' || exp.op === '||') {
                if (le !== 'Bool') {
                    throw Error('Unsupported type: ' + le);
                }
                if (re !== 'Bool') {
                    throw Error('Unsupported type: ' + le);
                }
                tp = 'Bool';
            } else {
                throw Error('Unsupported operator: ' + exp.op);
            }

            // Register result
            return registerExpType(ctx, exp, tp);
        } else if (exp.kind === 'op_unary') {

            // Resolve right side
            ctx = resolveExpression(ctx, vctx, exp.right);

            // Check right type dependent on operator
            let rightType = getExpType(ctx, exp.right).name;
            if (exp.op === '-' || exp.op === '+') {
                if (rightType !== 'Int') {
                    throw Error('Type mistmatch');
                }
            } else if (exp.op === '!') {
                if (rightType !== 'Bool') {
                    throw Error('Type mistmatch');
                }
            } else {
                throw Error('Unknown operator');
            }

            // Register result
            return registerExpType(ctx, exp, rightType);
        } else if (exp.kind === 'id') {
            let v = vctx[exp.value];
            if (!v) {
                throw Error('Resolve expression');
            }
            return registerExpType(ctx, exp, v.name);
        } else if (exp.kind === 'op_field') {
            ctx = resolveExpression(ctx, vctx, exp.src);
            let src = getExpType(ctx, exp.src);
            let field = src.fields[exp.name];
            if (!field) {
                throw Error('Field ' + exp.name + ' not found');
            }
            return registerExpType(ctx, exp, field.type.name);
        } else if (exp.kind === 'op_call') {

            // Resolve call with arguments
            ctx = resolveCall(ctx, vctx, exp);

            // Resolve return value
            let src = getExpType(ctx, exp.src);
            let f = src.functions[exp.name]!;
            if (!f.returns) {
                throw Error('Function ' + exp.name + ' does not return a value');
            }
            return registerExpType(ctx, exp, f.returns.name);
        } else if (exp.kind === 'op_static_call') {

            // Resolve call with arguments
            ctx = resolveStaticCall(ctx, vctx, exp);

            // Resolve static
            let f = getStaticFunction(ctx, exp.name);
            if (!f.returns) {
                throw Error('Function ' + exp.name + ' does not return a value');
            }
            return registerExpType(ctx, exp, f.returns.name);
        }
        throw Error('Unknown expression');
    }
    function resolveFunction(ctx: CompilerContext, vctx: VariableCTX, f: ASTFunction) {
        for (let s of f.statements) {
            if (s.kind === 'statement_let') {
                ctx = resolveExpression(ctx, vctx, s.expression);
                vctx[s.name] = getType(ctx, s.type);
            } else if (s.kind === 'statement_return') {
                ctx = resolveExpression(ctx, vctx, s.expression);
            } else if (s.kind === 'statement_call') {
                if (s.expression.kind === 'op_call') {
                    ctx = resolveCall(ctx, vctx, s.expression);
                } else if (s.expression.kind === 'op_static_call') {
                    ctx = resolveStaticCall(ctx, vctx, s.expression);
                } else {
                    throw Error('Unknown expression');
                }
            } else {
                throw Error('Unknown statement');
            }
        }
        return ctx;
    }


    // Process all contracts
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

                    // Process function
                    ctx = resolveFunction(ctx, vctx, f);
                }
            }
        }
    }

    // Process all functions
    for (let t in ctx.astFunctionStatic) {
        let f = ctx.astFunctionStatic[t];

        // Function variables
        let vctx: VariableCTX = {};
        for (let arg of f.args) {
            vctx[arg.name] = getType(ctx, arg.type);
        }

        // Process function
        ctx = resolveFunction(ctx, vctx, f);
    }

    return ctx;
}

export function getAllExpressionTypes(ctx: CompilerContext) {
    let res: [string, string][] = [];
    let a = store.all(ctx);
    for (let e in a) {
        res.push([e, a[e].description.name]);
    }
    return res;
}