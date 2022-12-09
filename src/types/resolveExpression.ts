import { ABIFunctions, MapFunctions } from "../abi/AbiFunction";
import { ASTBoolean, ASTExpression, ASTLvalueRef, ASTNull, ASTNumber, ASTOpBinary, ASTOpCall, ASTOpCallStatic, ASTOpField, ASTOpNew, ASTOpUnary, throwError } from "../grammar/ast";
import { CompilerContext, createContextStore } from "../context";
import { getStaticFunction, getType, hasStaticFunction } from "./resolveDescriptors";
import { printTypeRef, TypeRef } from "./types";
import { StatementContext } from "./resolveStatements";

let store = createContextStore<{ ast: ASTExpression, description: TypeRef | null }>();

export function getExpType(ctx: CompilerContext, exp: ASTExpression) {
    let t = store.get(ctx, exp.id);
    if (!t) {
        throw Error('Expression ' + exp.id + ' not found');
    }
    return t.description;
}

function registerExpType(ctx: CompilerContext, exp: ASTExpression, description: TypeRef | null): CompilerContext {
    if (store.get(ctx, exp.id)) {
        throw Error('Expression ' + exp.id + ' already has a type');
    }
    return store.set(ctx, exp.id, { ast: exp, description });
}

function resolveBooleanLiteral(exp: ASTBoolean, sctx: StatementContext, ctx: CompilerContext): CompilerContext {
    return registerExpType(ctx, exp, { kind: 'ref', name: 'Bool', optional: false });
}

function resolveIntLiteral(exp: ASTNumber, sctx: StatementContext, ctx: CompilerContext): CompilerContext {
    return registerExpType(ctx, exp, { kind: 'ref', name: 'Int', optional: false });
}

function resolveNullLiteral(exp: ASTNull, sctx: StatementContext, ctx: CompilerContext): CompilerContext {
    return registerExpType(ctx, exp, null);
}

function resolveStructNew(exp: ASTOpNew, sctx: StatementContext, ctx: CompilerContext): CompilerContext {

    // Get type
    let tp = getType(ctx, exp.type);
    if (tp.kind !== 'struct') {
        throwError(`Invalid type "${exp.type}" for construction`, exp.ref);
    }

    let processed = new Set<string>();
    for (let e of exp.args) {

        // Check duplicates
        if (processed.has(e.name)) {
            throwError(`Duplicate argument "${e.name}"`, e.ref);
        }

        // Check existing
        let f = tp.fields.find((v) => v.name === e.name);
        if (!f) {
            throwError(`Unknown argument "${e.name}"`, e.ref);
        }

        // Resolve expression
        ctx = resolveExpression(e.exp, sctx, ctx);

        // TODO: Check expression type
    }

    // Register result
    return registerExpType(ctx, exp, { kind: 'ref', name: tp.name, optional: false });
}

function resolveBinaryOp(exp: ASTOpBinary, sctx: StatementContext, ctx: CompilerContext): CompilerContext {

    // Resolve left and right expressions
    ctx = resolveExpression(exp.left, sctx, ctx);
    ctx = resolveExpression(exp.right, sctx, ctx);
    let le = getExpType(ctx, exp.left);
    let re = getExpType(ctx, exp.right);

    // Check operands
    let resolved: TypeRef;
    if (exp.op === '-' || exp.op === '+' || exp.op === '*' || exp.op === '/') {
        if (le === null || le.kind !== 'ref' || le.optional || le.name !== 'Int') {
            throwError(`Invalid type "${printTypeRef(le)}" for binary operator "${exp.op}"`, exp.ref);
        }
        if (re === null || re.kind !== 'ref' || re.optional || re.name !== 'Int') {
            throwError(`Invalid type "${printTypeRef(re)}" for binary operator "${exp.op}"`, exp.ref);
        }
        resolved = { kind: 'ref', name: 'Int', optional: false };
    } else if (exp.op === '<' || exp.op === '<=' || exp.op === '>' || exp.op === '>=') {
        if (le === null || le.kind !== 'ref' || le.optional || le.name !== 'Int') {
            throwError(`Invalid type "${printTypeRef(le)}" for binary operator "${exp.op}"`, exp.ref);
        }
        if (re === null || re.kind !== 'ref' || re.optional || re.name !== 'Int') {
            throwError(`Invalid type "${printTypeRef(re)}" for binary operator "${exp.op}"`, exp.ref);
        }
        resolved = { kind: 'ref', name: 'Bool', optional: false };
    } else if (exp.op === '==' || exp.op === '!=') {

        // Check if types are compatible
        if (le !== null && re !== null) {
            let l = le;
            let r = re;
            if (l.kind !== 'ref' || r.kind !== 'ref') {
                throwError(`Incompatible types "${printTypeRef(le)}" and "${printTypeRef(re)}" for binary operator "${exp.op}"`, exp.ref);
            }
            if (r.name !== r.name) {
                throwError(`Incompatible types "${printTypeRef(le)}" and "${printTypeRef(re)}" for binary operator "${exp.op}"`, exp.ref);
            }
            if (r.name !== 'Int' && r.name !== 'Bool' && r.name !== 'Address') {
                throwError(`Invalid type "${r.name}" for binary operator "${exp.op}"`, exp.ref);
            }
        }

        resolved = { kind: 'ref', name: 'Bool', optional: false };
    } else if (exp.op === '&&' || exp.op === '||') {
        if (le === null || le.kind !== 'ref' || le.optional || le.name !== 'Bool') {
            throwError(`Invalid type "${printTypeRef(le)}" for binary operator "${exp.op}"`, exp.ref);
        }
        if (re === null || re.kind !== 'ref' || re.optional || re.name !== 'Bool') {
            throwError(`Invalid type "${printTypeRef(re)}" for binary operator "${exp.op}"`, exp.ref);
        }
        resolved = { kind: 'ref', name: 'Bool', optional: false };
    } else {
        throw Error('Unsupported operator: ' + exp.op);
    }

    // Register result
    return registerExpType(ctx, exp, resolved);
}

function resolveUnaryOp(exp: ASTOpUnary, sctx: StatementContext, ctx: CompilerContext): CompilerContext {

    // Resolve right side
    ctx = resolveExpression(exp.right, sctx, ctx);

    // Check right type dependent on operator
    let resolvedType = getExpType(ctx, exp.right);
    if (exp.op === '-' || exp.op === '+') {
        if (resolvedType === null || resolvedType.kind !== 'ref' || resolvedType.optional || resolvedType.name !== 'Int') {
            throwError(`Invalid type "${printTypeRef(resolvedType)}" for unary operator "${exp.op}"`, exp.ref);
        }
    } else if (exp.op === '!') {
        if (resolvedType === null || resolvedType.kind !== 'ref' || resolvedType.optional || resolvedType.name !== 'Bool') {
            throwError(`Invalid type "${printTypeRef(resolvedType)}" for unary operator "${exp.op}"`, exp.ref);
        }
    } else if (exp.op === '!!') {
        if (resolvedType === null || resolvedType.kind !== 'ref' || !resolvedType.optional) {
            throwError(`Type "${printTypeRef(resolvedType)}" is not optional`, exp.ref);
        }
        resolvedType = { kind: 'ref', name: resolvedType.name, optional: false };
    } else {
        throwError('Unknown operator ' + exp.op, exp.ref);
    }

    // Register result
    return registerExpType(ctx, exp, resolvedType);
}

function resolveField(exp: ASTOpField, sctx: StatementContext, ctx: CompilerContext): CompilerContext {

    // Resolve expression
    ctx = resolveExpression(exp.src, sctx, ctx);

    // Find target type and check for type
    let src = getExpType(ctx, exp.src);
    if (src === null || src.kind !== 'ref' || src.optional) {
        throwError(`Invalid type "${printTypeRef(src)}" for field access`, exp.ref);
    }

    // Find field
    let srcT = getType(ctx, src.name);
    let field = srcT.fields.find((v) => v.name === exp.name);
    if (!field) {
        throwError(`Type "${src.name}" does not have a field named "${exp.name}"`, exp.ref);
    }

    // Register result type
    return registerExpType(ctx, exp, field.type);
}

function resolveStaticCall(exp: ASTOpCallStatic, sctx: StatementContext, ctx: CompilerContext): CompilerContext {

    // CHeck if function exists
    if (!hasStaticFunction(ctx, exp.name)) {
        throwError(`Static function "${exp.name}" does not exist`, exp.ref);
    }

    // Get static function
    let f = getStaticFunction(ctx, exp.name);

    // Resolve call arguments
    for (let e of exp.args) {
        ctx = resolveExpression(e, sctx, ctx);
    }

    // Resolve return type
    if (!f.returns) {
        return registerExpType(ctx, exp, null);
    }
    return registerExpType(ctx, exp, f.returns);
}

function resolveCall(exp: ASTOpCall, sctx: StatementContext, ctx: CompilerContext): CompilerContext {

    // Resolve expression
    ctx = resolveExpression(exp.src, sctx, ctx);

    // Resolve args
    for (let e of exp.args) {
        ctx = resolveExpression(e, sctx, ctx);
    }

    // Resolve return value
    let src = getExpType(ctx, exp.src);
    if (src === null) {
        throwError(`Invalid type "${printTypeRef(src)}" for function call`, exp.ref);
    }

    // Handle ref
    if (src.kind === 'ref') {

        if (src.optional) {
            throwError(`Invalid type "${printTypeRef(src)}" for function call`, exp.ref);
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
        let f = srcT.functions[exp.name]!;
        if (!f.returns) {
            return registerExpType(ctx, exp, null);
        }
        return registerExpType(ctx, exp, f.returns);
    }

    // Handle map
    if (src.kind === 'map') {
        let abf = MapFunctions[exp.name];
        if (!abf) {
            throwError(`Map function "${exp.name}" not found`, exp.ref);
        }
        let resolved = abf.resolve(ctx, [src, ...exp.args.map((v) => getExpType(ctx, v))], exp.ref);
        return registerExpType(ctx, exp, resolved);
    }

    throwError(`Invalid type "${printTypeRef(src)}" for function call`, exp.ref);
}

export function resolveLValueRef(path: ASTLvalueRef[], sctx: StatementContext, ctx: CompilerContext): CompilerContext {
    let paths: ASTLvalueRef[] = path;
    let t = sctx.vars[paths[0].name];
    ctx = registerExpType(ctx, paths[0], t);

    // Paths
    for (let i = 1; i < paths.length; i++) {
        if (t.kind !== 'ref' || t.optional) {
            throwError(`Invalid type "${printTypeRef(t)}" for field access`, path[i].ref);
        }
        let srcT = getType(ctx, t.name);
        let ex = srcT.fields.find((v) => v.name === paths[i].name);
        if (!ex) {
            throw Error('Field ' + paths[i] + ' not found');
        }
        ctx = registerExpType(ctx, paths[i], t);
        t = ex.type;
    }

    return ctx;
}

export function resolveExpression(exp: ASTExpression, sctx: StatementContext, ctx: CompilerContext) {

    //
    // Literals
    //

    if (exp.kind === 'boolean') {
        return resolveBooleanLiteral(exp, sctx, ctx);
    }
    if (exp.kind === 'number') {
        return resolveIntLiteral(exp, sctx, ctx);
    }
    if (exp.kind === 'null') {
        return resolveNullLiteral(exp, sctx, ctx);
    }

    //
    // Constructors
    //

    if (exp.kind === 'op_new') {
        return resolveStructNew(exp, sctx, ctx);
    }

    //
    // Binary, unary and suffix operations
    //

    if (exp.kind === 'op_binary') {
        return resolveBinaryOp(exp, sctx, ctx);
    }

    if (exp.kind === 'op_unary') {
        return resolveUnaryOp(exp, sctx, ctx);
    }

    //
    // References
    //

    if (exp.kind === 'id') {

        // Work-around for "ABI"
        if (exp.value === 'abi') {
            return registerExpType(ctx, exp, { kind: 'ref', name: '$ABI', optional: false });
        }

        // Find variable
        let v = sctx.vars[exp.value];
        if (!v) {
            throwError('Unabe to resolve id ' + exp.value, exp.ref);
        }
        return registerExpType(ctx, exp, v);
    }

    if (exp.kind === 'op_field') {
        return resolveField(exp, sctx, ctx);
    }

    //
    // Function calls
    //

    if (exp.kind === 'op_static_call') {
        return resolveStaticCall(exp, sctx, ctx);
    }

    if (exp.kind === 'op_call') {
        return resolveCall(exp, sctx, ctx);
    }

    throw Error('Unknown expression'); // Unreachable
}

export function getAllExpressionTypes(ctx: CompilerContext) {
    let res: [string, string][] = [];
    let a = store.all(ctx);
    for (let e in a) {
        res.push([a[e].ast.ref.contents, printTypeRef(a[e].description)]);
    }
    return res;
}