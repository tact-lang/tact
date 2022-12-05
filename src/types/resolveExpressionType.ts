import { ABIFunctions } from "../abi/AbiFunction";
import { ASTCondition, ASTExpression, ASTFunction, ASTNativeFunction, ASTOpCall, ASTOpCallStatic, ASTStatement, ASTSTatementAssign, ASTTypeRef, throwError } from "../ast/ast";
import { CompilerContext, createContextStore } from "../ast/context";
import { getStaticFunction, getType } from "./resolveTypeDescriptors";
import { printTypeRef, TypeDescription, TypeRef } from "./types";

let store = createContextStore<{ ast: ASTExpression, description: TypeRef | null }>();
let lValueStore = createContextStore<{ ast: ASTSTatementAssign, description: TypeRef[] }>();

type VariableCTX = { [key: string]: TypeRef };

export function getExpType(ctx: CompilerContext, exp: ASTExpression) {
    let t = store.get(ctx, exp.id);
    if (!t) {
        throw Error('Expression ' + exp.id + ' not found');
    }
    return t.description;
}

export function getLValuePaths(ctx: CompilerContext, exp: ASTSTatementAssign) {
    let lv = lValueStore.get(ctx, exp.id);
    if (!lv) {
        throw Error('LValue ' + exp.id + ' not found');
    }
    return lv.description;
}

function resolveTypeRef(ctx: CompilerContext, src: ASTTypeRef): TypeRef {
    let n = getType(ctx, src.name).name; // TODO: Check
    if (src.optional) {
        return {
            kind: 'optional',
            inner: {
                kind: 'direct',
                name: n
            }
        };
    } else {
        return {
            kind: 'direct',
            name: n
        }
    }
}

export function resolveExpressionTypes(ctx: CompilerContext) {

    // Process all types
    function registerExpType(ctx: CompilerContext, exp: ASTExpression, description: TypeRef | null): CompilerContext {
        if (store.get(ctx, exp.id)) {
            throw Error('Expression ' + exp.id + ' already has a type');
        }
        return store.set(ctx, exp.id, { ast: exp, description });
    }
    function resolveCall(ctx: CompilerContext, vctx: VariableCTX, exp: ASTOpCall): CompilerContext {

        // Resolve source
        ctx = resolveExpression(ctx, vctx, exp.src);
        let src = getExpType(ctx, exp.src);
        if (!src || src.kind !== 'direct') {
            throwError(`Invalid type "${printTypeRef(src)}" for function call`, exp.ref);
        }

        // Resolve expressions
        for (let e of exp.args) {
            ctx = resolveExpression(ctx, vctx, e);
        }

        // Check ABI
        if (src.name === '$ABI') {
            let abf = ABIFunctions[exp.name];
            if (!abf) {
                throwError(`ABI function "${exp.name}" not found`, exp.ref);
            }
            abf.resolve(ctx, exp.args.map((v) => getExpType(ctx, v)), exp.ref);
            return ctx;
        }

        // Check types;
        let srcT = getType(ctx, src.name);
        let f = srcT.functions.find((v) => v.name === exp.name);
        if (!f) {
            throwError(`Function ${exp.name} not found in ${printTypeRef(src)}'`, exp.ref);
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
            return registerExpType(ctx, exp, { kind: 'direct', name: 'Bool' });
        } else if (exp.kind === 'number') {
            return registerExpType(ctx, exp, { kind: 'direct', name: 'Int' });
        } else if (exp.kind === 'op_binary') {

            // Resolve left and right expressions
            ctx = resolveExpression(ctx, vctx, exp.left);
            ctx = resolveExpression(ctx, vctx, exp.right);
            let le = getExpType(ctx, exp.left);
            let re = getExpType(ctx, exp.right);

            // Check operands
            let resolved: TypeRef;
            if (exp.op === '-' || exp.op === '+' || exp.op === '*' || exp.op === '/') {
                if (le === null || le.kind !== 'direct' || le.name !== 'Int') {
                    throwError(`Invalid type "${printTypeRef(le)}" for binary operator "${exp.op}"`, exp.ref);
                }
                if (re === null || re.kind !== 'direct' || re.name !== 'Int') {
                    throwError(`Invalid type "${printTypeRef(re)}" for binary operator "${exp.op}"`, exp.ref);
                }
                resolved = { kind: 'direct', name: 'Int' };
            } else if (exp.op === '<' || exp.op === '<=' || exp.op === '>' || exp.op === '>=') {
                if (le === null || le.kind !== 'direct' || le.name !== 'Int') {
                    throwError(`Invalid type "${printTypeRef(le)}" for binary operator "${exp.op}"`, exp.ref);
                }
                if (re === null || re.kind !== 'direct' || re.name !== 'Int') {
                    throwError(`Invalid type "${printTypeRef(re)}" for binary operator "${exp.op}"`, exp.ref);
                }
                resolved = { kind: 'direct', name: 'Bool' };
            } else if (exp.op === '==' || exp.op === '!=') {

                // Check if types are compatible
                if (le !== null && re !== null) {
                    let l = le;
                    let r = re;
                    while (l.kind === 'optional') {
                        l = l.inner;
                    }
                    while (r.kind === 'optional') {
                        r = r.inner;
                    }
                    if (r.name !== r.name) {
                        throwError(`Incompatible types "${printTypeRef(le)}" and "${printTypeRef(re)}" for binary operator "${exp.op}"`, exp.ref);
                    }
                }

                resolved = { kind: 'direct', name: 'Bool' };
            } else if (exp.op === '&&' || exp.op === '||') {
                if (le === null || le.kind !== 'direct' || le.name !== 'Bool') {
                    throwError(`Invalid type "${printTypeRef(le)}" for binary operator "${exp.op}"`, exp.ref);
                }
                if (re === null || re.kind !== 'direct' || re.name !== 'Bool') {
                    throwError(`Invalid type "${printTypeRef(re)}" for binary operator "${exp.op}"`, exp.ref);
                }
                resolved = { kind: 'direct', name: 'Bool' };
            } else {
                throw Error('Unsupported operator: ' + exp.op);
            }

            // Register result
            return registerExpType(ctx, exp, resolved);
        } else if (exp.kind === 'op_unary') {

            // Resolve right side
            ctx = resolveExpression(ctx, vctx, exp.right);

            // Check right type dependent on operator
            let resolvedType = getExpType(ctx, exp.right);
            if (exp.op === '-' || exp.op === '+') {
                if (resolvedType === null || resolvedType.kind !== 'direct' || resolvedType.name !== 'Int') {
                    throwError(`Invalid type "${printTypeRef(resolvedType)}" for unary operator "${exp.op}"`, exp.ref);
                }
            } else if (exp.op === '!') {
                if (resolvedType === null || resolvedType.kind !== 'direct' || resolvedType.name !== 'Bool') {
                    throwError(`Invalid type "${printTypeRef(resolvedType)}" for unary operator "${exp.op}"`, exp.ref);
                }
            } else if (exp.op === '!!') {
                if (resolvedType === null || resolvedType.kind !== 'optional') {
                    throwError(`Type "${printTypeRef(resolvedType)}" is not optional`, exp.ref);
                }
                resolvedType = resolvedType.inner;
            } else {
                throwError('Unknown operator ' + exp.op, exp.ref);
            }

            // Register result
            return registerExpType(ctx, exp, resolvedType);
        } else if (exp.kind === 'id') {

            // Work-around for "ABI"
            if (exp.value === 'abi') {
                return registerExpType(ctx, exp, { kind: 'direct', name: '$ABI' });
            }

            // Find variable
            let v = vctx[exp.value];
            if (!v) {
                throwError('Unabe to resolve id ' + exp.value, exp.ref);
            }
            return registerExpType(ctx, exp, v);
        } else if (exp.kind === 'op_field') {
            ctx = resolveExpression(ctx, vctx, exp.src);
            let src = getExpType(ctx, exp.src);
            if (src === null || src.kind !== 'direct') {
                throwError(`Invalid type "${printTypeRef(src)}" for field access`, exp.ref);
            }
            let srcT = getType(ctx, src.name);
            let field = srcT.fields.find((v) => v.name === exp.name);
            if (!field) {
                throw Error('Field ' + exp.name + ' not found');
            }
            return registerExpType(ctx, exp, field.type);
        } else if (exp.kind === 'op_call') {

            // Resolve call with arguments
            ctx = resolveCall(ctx, vctx, exp);

            // Resolve return value
            let src = getExpType(ctx, exp.src);
            if (src === null || src.kind !== 'direct') {
                throwError(`Invalid type "${printTypeRef(src)}" for field access`, exp.ref);
            }

            // Check ABI type
            if (src.name === '$ABI') {
                let abf = ABIFunctions[exp.name];
                if (!abf) {
                    throwError(`ABI function "${exp.name}" not found`, exp.ref);
                }
                let resolved = abf.resolve(ctx, exp.args.map((v) => getExpType(ctx, v)), exp.ref);
                return registerExpType(ctx, exp, resolved);
            }

            let srcT = getType(ctx, src.name);
            let f = srcT.functions.find((v) => v.name === exp.name)!;
            if (!f.returns) {
                throw Error('Function ' + exp.name + ' does not return a value');
            }
            return registerExpType(ctx, exp, f.returns);
        } else if (exp.kind === 'op_static_call') {

            // Resolve call with arguments
            ctx = resolveStaticCall(ctx, vctx, exp);

            // Resolve static
            let f = getStaticFunction(ctx, exp.name);
            if (!f.returns) {
                throw Error('Function ' + exp.name + ' does not return a value');
            }
            return registerExpType(ctx, exp, f.returns);
        } else if (exp.kind === 'op_new') {
            for (let e of exp.args) {
                ctx = resolveExpression(ctx, vctx, e.exp);
            }
            return registerExpType(ctx, exp, { kind: 'direct', name: exp.type });
        } else if (exp.kind === 'null') {
            return registerExpType(ctx, exp, null);
        }
        throw Error('Unknown expression');
    }
    function resolveCondition(ctx: CompilerContext, vctx: VariableCTX, s: ASTCondition): CompilerContext {
        ctx = resolveExpression(ctx, vctx, s.expression);
        if (s.trueStatements.length > 0) {
            ctx = resolveStatements(ctx, vctx, s.trueStatements);
        }
        if (s.falseStatements.length > 0) {
            ctx = resolveStatements(ctx, vctx, s.falseStatements);
        }
        if (s.elseif) {
            ctx = resolveCondition(ctx, vctx, s.elseif);
        }
        return ctx;
    }
    function resolveStatements(ctx: CompilerContext, vctx: VariableCTX, statements: ASTStatement[]) {

        for (let s of statements) {
            if (s.kind === 'statement_let') {
                ctx = resolveExpression(ctx, vctx, s.expression);
                vctx[s.name] = resolveTypeRef(ctx, s.type);
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
            } else if (s.kind === 'statement_assign') {
                ctx = resolveExpression(ctx, vctx, s.expression);

                // Resolve LValue
                let paths: string[] = s.path;
                let pathTypes: TypeRef[] = [];
                let t = vctx[paths[0]];
                pathTypes.push(t);

                // Paths
                for (let i = 1; i < paths.length; i++) {
                    if (t.kind !== 'direct') {
                        throwError(`Invalid type "${printTypeRef(t)}" for field access`, s.ref);
                    }
                    let srcT = getType(ctx, t.name);
                    let ex = srcT.fields.find((v) => v.name === paths[i]);
                    if (!ex) {
                        throw Error('Field ' + paths[i] + ' not found');
                    }
                    pathTypes.push(ex.type);
                    t = ex.type;
                }

                // Persist LValue
                ctx = lValueStore.set(ctx, s.id, { ast: s, description: pathTypes });
            } else if (s.kind === 'statement_condition') {
                ctx = resolveCondition(ctx, vctx, s);
            } else if (s.kind === 'statement_while' || s.kind === 'statement_repeat' || s.kind === 'statement_until') {
                ctx = resolveExpression(ctx, vctx, s.condition);
                ctx = resolveStatements(ctx, vctx, s.statements);
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
                if (f.kind === 'def_function' || f.kind === 'def_init_function') {

                    // Function variables
                    let vctx: VariableCTX = {};
                    vctx['self'] = { kind: 'direct', name: getType(ctx, a.name).name };
                    for (let arg of f.args) {
                        vctx[arg.name] = resolveTypeRef(ctx, arg.type);
                    }

                    // Process function
                    ctx = resolveStatements(ctx, vctx, f.statements);
                }

                if (f.kind === 'def_receive') {

                    // Receiver variables
                    let vctx: VariableCTX = {};
                    vctx['self'] = { kind: 'direct', name: getType(ctx, a.name).name };
                    vctx[f.arg.name] = resolveTypeRef(ctx, f.arg.type);

                    // Resolve statements
                    ctx = resolveStatements(ctx, vctx, f.statements);
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
            vctx[arg.name] = resolveTypeRef(ctx, arg.type);
        }

        // Process function
        if (f.kind === 'def_function') {
            ctx = resolveStatements(ctx, vctx, f.statements);
        }
    }

    return ctx;
}

export function getAllExpressionTypes(ctx: CompilerContext) {
    let res: [string, string][] = [];
    let a = store.all(ctx);
    for (let e in a) {
        res.push([a[e].ast.ref.contents, printTypeRef(a[e].description)]);
    }
    return res;
}