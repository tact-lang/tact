import {
    ASTBoolean,
    ASTExpression,
    ASTInitOf,
    ASTNull,
    ASTNumber,
    ASTOpBinary,
    ASTOpCall,
    ASTOpCallStatic,
    ASTOpField,
    ASTOpNew,
    ASTOpUnary,
    ASTString,
    ASTConditional,
    eqNames,
    idText,
    isWildcard,
} from "../grammar/ast";
import { idTextErr, throwCompilationError } from "../errors";
import { CompilerContext, createContextStore } from "../context";
import {
    getStaticConstant,
    getStaticFunction,
    getType,
    hasStaticConstant,
    hasStaticFunction,
} from "./resolveDescriptors";
import {
    FieldDescription,
    printTypeRef,
    TypeRef,
    typeRefEquals,
} from "./types";
import { StatementContext } from "./resolveStatements";
import { MapFunctions } from "../abi/map";
import { GlobalFunctions } from "../abi/global";
import { isAssignable, moreGeneralType } from "./subtyping";
import { StructFunctions } from "../abi/struct";

const store = createContextStore<{
    ast: ASTExpression;
    description: TypeRef;
}>();

export function getExpType(ctx: CompilerContext, exp: ASTExpression) {
    const t = store.get(ctx, exp.id);
    if (!t) {
        throw Error("Expression " + exp.id + " not found");
    }
    return t.description;
}

function registerExpType(
    ctx: CompilerContext,
    exp: ASTExpression,
    description: TypeRef,
): CompilerContext {
    const ex = store.get(ctx, exp.id);
    if (ex) {
        if (typeRefEquals(ex.description, description)) {
            return ctx;
        }
        throw Error("Expression " + exp.id + " already has a type");
    }
    return store.set(ctx, exp.id, { ast: exp, description });
}

function resolveBooleanLiteral(
    exp: ASTBoolean,
    sctx: StatementContext,
    ctx: CompilerContext,
): CompilerContext {
    return registerExpType(ctx, exp, {
        kind: "ref",
        name: "Bool",
        optional: false,
    });
}

function resolveIntLiteral(
    exp: ASTNumber,
    sctx: StatementContext,
    ctx: CompilerContext,
): CompilerContext {
    return registerExpType(ctx, exp, {
        kind: "ref",
        name: "Int",
        optional: false,
    });
}

function resolveNullLiteral(
    exp: ASTNull,
    sctx: StatementContext,
    ctx: CompilerContext,
): CompilerContext {
    return registerExpType(ctx, exp, { kind: "null" });
}

function resolveStringLiteral(
    exp: ASTString,
    sctx: StatementContext,
    ctx: CompilerContext,
): CompilerContext {
    return registerExpType(ctx, exp, {
        kind: "ref",
        name: "String",
        optional: false,
    });
}

function resolveStructNew(
    exp: ASTOpNew,
    sctx: StatementContext,
    ctx: CompilerContext,
): CompilerContext {
    // Get type
    const tp = getType(ctx, exp.type);

    if (tp.kind !== "struct") {
        throwCompilationError(
            `Invalid type ${idTextErr(exp.type)} for construction`,
            exp.loc,
        );
    }

    // Process fields
    const processed = new Set<string>();
    for (const e of exp.args) {
        // Check duplicates
        if (processed.has(idText(e.name))) {
            throwCompilationError(
                `Duplicate fields ${idTextErr(e.name)}`,
                e.loc,
            );
        }
        processed.add(idText(e.name));

        // Check existing
        const f = tp.fields.find((v) => eqNames(v.name, e.name));
        if (!f) {
            throwCompilationError(
                `Unknown fields ${idTextErr(e.name)} in type ${idTextErr(tp.name)}`,
                e.loc,
            );
        }

        // Resolve expression
        ctx = resolveExpression(e.exp, sctx, ctx);

        // Check expression type
        const expressionType = getExpType(ctx, e.exp);
        if (!isAssignable(expressionType, f.type)) {
            throwCompilationError(
                `Invalid type "${printTypeRef(expressionType)}" for fields ${idTextErr(e.name)} with type "${printTypeRef(f.type)}" in type "${tp.name}"`,
                e.loc,
            );
        }
    }

    // Check missing fields
    for (const f of tp.fields) {
        if (f.default === undefined && !processed.has(f.name)) {
            throwCompilationError(
                `Missing fields "${f.name}" in type "${tp.name}"`,
                exp.loc,
            );
        }
    }

    // Register result
    return registerExpType(ctx, exp, {
        kind: "ref",
        name: tp.name,
        optional: false,
    });
}

function resolveBinaryOp(
    exp: ASTOpBinary,
    sctx: StatementContext,
    ctx: CompilerContext,
): CompilerContext {
    // Resolve left and right expressions
    ctx = resolveExpression(exp.left, sctx, ctx);
    ctx = resolveExpression(exp.right, sctx, ctx);
    const le = getExpType(ctx, exp.left);
    const re = getExpType(ctx, exp.right);

    // Check operands
    let resolved: TypeRef;
    if (
        exp.op === "-" ||
        exp.op === "+" ||
        exp.op === "*" ||
        exp.op === "/" ||
        exp.op === "%" ||
        exp.op === ">>" ||
        exp.op === "<<" ||
        exp.op === "&" ||
        exp.op === "|" ||
        exp.op === "^"
    ) {
        if (le.kind !== "ref" || le.optional || le.name !== "Int") {
            throwCompilationError(
                `Invalid type "${printTypeRef(le)}" for binary operator "${exp.op}"`,
                exp.loc,
            );
        }
        if (re.kind !== "ref" || re.optional || re.name !== "Int") {
            throwCompilationError(
                `Invalid type "${printTypeRef(re)}" for binary operator "${exp.op}"`,
                exp.loc,
            );
        }
        resolved = { kind: "ref", name: "Int", optional: false };
    } else if (
        exp.op === "<" ||
        exp.op === "<=" ||
        exp.op === ">" ||
        exp.op === ">="
    ) {
        if (le.kind !== "ref" || le.optional || le.name !== "Int") {
            throwCompilationError(
                `Invalid type "${printTypeRef(le)}" for binary operator "${exp.op}"`,
                exp.loc,
            );
        }
        if (re.kind !== "ref" || re.optional || re.name !== "Int") {
            throwCompilationError(
                `Invalid type "${printTypeRef(re)}" for binary operator "${exp.op}"`,
                exp.loc,
            );
        }
        resolved = { kind: "ref", name: "Bool", optional: false };
    } else if (exp.op === "==" || exp.op === "!=") {
        // Check if types are compatible
        if (le.kind !== "null" && re.kind !== "null") {
            const l = le;
            const r = re;

            if (l.kind === "map" && r.kind === "map") {
                if (
                    l.key !== r.key ||
                    l.value !== r.value ||
                    l.keyAs !== r.keyAs ||
                    l.valueAs !== r.valueAs
                ) {
                    throwCompilationError(
                        `Incompatible types "${printTypeRef(le)}" and "${printTypeRef(re)}" for binary operator "${exp.op}"`,
                        exp.loc,
                    );
                }
            } else {
                if (l.kind === "ref_bounced" || r.kind === "ref_bounced") {
                    throwCompilationError(
                        "Bounced types are not supported in binary operators",
                        exp.loc,
                    );
                }
                if (l.kind == "void" || r.kind == "void") {
                    throwCompilationError(
                        `Expressions of "<void>" type cannot be used for (non)equality operator "${exp.op}"`,
                        exp.loc,
                    );
                }
                if (l.kind !== "ref" || r.kind !== "ref") {
                    throwCompilationError(
                        `Incompatible types "${printTypeRef(le)}" and "${printTypeRef(re)}" for binary operator "${exp.op}"`,
                        exp.loc,
                    );
                }
                if (l.name !== r.name) {
                    throwCompilationError(
                        `Incompatible types "${printTypeRef(le)}" and "${printTypeRef(re)}" for binary operator "${exp.op}"`,
                        exp.loc,
                    );
                }
                if (
                    r.name !== "Int" &&
                    r.name !== "Bool" &&
                    r.name !== "Address" &&
                    r.name !== "Cell" &&
                    r.name !== "Slice" &&
                    r.name !== "String"
                ) {
                    throwCompilationError(
                        `Invalid type "${r.name}" for binary operator "${exp.op}"`,
                        exp.loc,
                    );
                }
            }
        }

        resolved = { kind: "ref", name: "Bool", optional: false };
    } else if (exp.op === "&&" || exp.op === "||") {
        if (le.kind !== "ref" || le.optional || le.name !== "Bool") {
            throwCompilationError(
                `Invalid type "${printTypeRef(le)}" for binary operator "${exp.op}"`,
                exp.loc,
            );
        }
        if (re.kind !== "ref" || re.optional || re.name !== "Bool") {
            throwCompilationError(
                `Invalid type "${printTypeRef(re)}" for binary operator "${exp.op}"`,
                exp.loc,
            );
        }
        resolved = { kind: "ref", name: "Bool", optional: false };
    } else {
        throw Error(`Unsupported operator: ${exp.op}`);
    }

    // Register result
    return registerExpType(ctx, exp, resolved);
}

function resolveUnaryOp(
    exp: ASTOpUnary,
    sctx: StatementContext,
    ctx: CompilerContext,
): CompilerContext {
    // Resolve right side
    ctx = resolveExpression(exp.right, sctx, ctx);

    // Check right type dependent on operator
    let resolvedType = getExpType(ctx, exp.right);
    if (exp.op === "-" || exp.op === "+" || exp.op === "~") {
        if (
            resolvedType.kind !== "ref" ||
            resolvedType.optional ||
            resolvedType.name !== "Int"
        ) {
            throwCompilationError(
                `Invalid type "${printTypeRef(resolvedType)}" for unary operator "${exp.op}"`,
                exp.loc,
            );
        }
    } else if (exp.op === "!") {
        if (
            resolvedType.kind !== "ref" ||
            resolvedType.optional ||
            resolvedType.name !== "Bool"
        ) {
            throwCompilationError(
                `Invalid type "${printTypeRef(resolvedType)}" for unary operator "${exp.op}"`,
                exp.loc,
            );
        }
    } else if (exp.op === "!!") {
        if (resolvedType.kind !== "ref" || !resolvedType.optional) {
            throwCompilationError(
                `Type "${printTypeRef(resolvedType)}" is not optional`,
                exp.loc,
            );
        }
        resolvedType = {
            kind: "ref",
            name: resolvedType.name,
            optional: false,
        };
    } else {
        throwCompilationError(`Unknown operator: ${exp.op}`, exp.loc);
    }

    // Register result
    return registerExpType(ctx, exp, resolvedType);
}

function resolveFieldAccess(
    exp: ASTOpField,
    sctx: StatementContext,
    ctx: CompilerContext,
): CompilerContext {
    // Resolve expression
    ctx = resolveExpression(exp.src, sctx, ctx);

    // Find target type and check for type
    const src = getExpType(ctx, exp.src);

    if (
        src === null ||
        ((src.kind !== "ref" || src.optional) && src.kind !== "ref_bounced")
    ) {
        throwCompilationError(
            `Invalid type "${printTypeRef(src)}" for field access`,
            exp.loc,
        );
    }

    // Check if field initialized
    if (
        sctx.requiredFields.length > 0 &&
        exp.src.kind === "id" &&
        exp.src.text === "self"
    ) {
        if (sctx.requiredFields.find((v) => v === exp.name.text)) {
            throwCompilationError(
                `Field "${exp.name.text}" is not initialized`,
                exp.name.loc,
            );
        }
    }

    // Find field
    let fields: FieldDescription[];

    const srcT = getType(ctx, src.name);

    fields = srcT.fields;
    if (src.kind === "ref_bounced") {
        fields = fields.slice(0, srcT.partialFieldCount);
    }

    const field = fields.find((v) => v.name === exp.name.text);
    const cst = srcT.constants.find((v) => v.name === exp.name.text);
    if (!field && !cst) {
        if (src.kind === "ref_bounced") {
            throwCompilationError(
                `Type bounced<"${src.name}"> does not have a field named "${exp.name.text}"`,
                exp.name.loc,
            );
        } else {
            throwCompilationError(
                `Type ${idTextErr(src.name)} does not have a field named ${idTextErr(exp.name)}`,
                exp.loc,
            );
        }
    }

    // Register result type
    if (field) {
        return registerExpType(ctx, exp, field.type);
    } else {
        return registerExpType(ctx, exp, cst!.type);
    }
}

function resolveStaticCall(
    exp: ASTOpCallStatic,
    sctx: StatementContext,
    ctx: CompilerContext,
): CompilerContext {
    // Check if abi global function
    if (GlobalFunctions.has(idText(exp.name))) {
        const f = GlobalFunctions.get(idText(exp.name))!;

        // Resolve arguments
        for (const e of exp.args) {
            ctx = resolveExpression(e, sctx, ctx);
        }

        // Resolve return type
        const resolved = f.resolve(
            ctx,
            exp.args.map((v) => getExpType(ctx, v)),
            exp.loc,
        );

        // Register return type
        return registerExpType(ctx, exp, resolved);
    }

    // Check if function exists
    if (!hasStaticFunction(ctx, idText(exp.name))) {
        throwCompilationError(
            `Static function ${idTextErr(exp.name)} does not exist`,
            exp.loc,
        );
    }

    // Get static function
    const f = getStaticFunction(ctx, idText(exp.name));

    // Resolve call arguments
    for (const e of exp.args) {
        ctx = resolveExpression(e, sctx, ctx);
    }

    // Check arguments
    if (f.params.length !== exp.args.length) {
        throwCompilationError(
            `Function ${idTextErr(exp.name)} expects ${f.params.length} arguments, got ${exp.args.length}`,
            exp.loc,
        );
    }
    for (let i = 0; i < f.params.length; i++) {
        const a = f.params[i];
        const e = exp.args[i];
        const t = getExpType(ctx, e);
        if (!isAssignable(t, a.type)) {
            throwCompilationError(
                `Invalid type "${printTypeRef(t)}" for argument ${idTextErr(a.name)}`,
                e.loc,
            );
        }
    }

    // Resolve return type
    return registerExpType(ctx, exp, f.returns);
}

function resolveCall(
    exp: ASTOpCall,
    sctx: StatementContext,
    ctx: CompilerContext,
): CompilerContext {
    // Resolve expression
    ctx = resolveExpression(exp.src, sctx, ctx);

    // Check if self is initialized
    if (
        exp.src.kind === "id" &&
        exp.src.text === "self" &&
        sctx.requiredFields.length > 0
    ) {
        throwCompilationError("Cannot access self before init", exp.loc);
    }

    // Resolve args
    for (const e of exp.args) {
        ctx = resolveExpression(e, sctx, ctx);
    }

    // Resolve return value
    const src = getExpType(ctx, exp.src);
    if (src === null) {
        throwCompilationError(
            `Invalid type "${printTypeRef(src)}" for function call`,
            exp.loc,
        );
    }

    // Handle ref
    if (src.kind === "ref") {
        if (src.optional) {
            throwCompilationError(
                `Invalid type "${printTypeRef(src)}" for function call`,
                exp.loc,
            );
        }

        // Register return type
        const srcT = getType(ctx, src.name);

        // Check struct ABI
        if (srcT.kind === "struct") {
            if (StructFunctions.has(idText(exp.name))) {
                const abi = StructFunctions.get(idText(exp.name))!;
                const resolved = abi.resolve(
                    ctx,
                    [src, ...exp.args.map((v) => getExpType(ctx, v))],
                    exp.loc,
                );
                return registerExpType(ctx, exp, resolved);
            }
        }

        const f = srcT.functions.get(idText(exp.name))!;
        if (!f) {
            throwCompilationError(
                `Type "${src.name}" does not have a function named ${idTextErr(exp.name)}`,
                exp.loc,
            );
        }

        // Check arguments
        if (f.params.length !== exp.args.length) {
            throwCompilationError(
                `Function ${idTextErr(exp.name)} expects ${f.params.length} arguments, got ${exp.args.length}`,
                exp.loc,
            );
        }
        for (let i = 0; i < f.params.length; i++) {
            const a = f.params[i];
            const e = exp.args[i];
            const t = getExpType(ctx, e);
            if (!isAssignable(t, a.type)) {
                throwCompilationError(
                    `Invalid type "${printTypeRef(t)}" for argument ${idTextErr(a.name)}`,
                    e.loc,
                );
            }
        }

        return registerExpType(ctx, exp, f.returns);
    }

    // Handle map
    if (src.kind === "map") {
        if (!MapFunctions.has(idText(exp.name))) {
            throwCompilationError(
                `Map function ${idTextErr(exp.name)} not found`,
                exp.loc,
            );
        }
        const abf = MapFunctions.get(idText(exp.name))!;
        const resolved = abf.resolve(
            ctx,
            [src, ...exp.args.map((v) => getExpType(ctx, v))],
            exp.loc,
        );
        return registerExpType(ctx, exp, resolved);
    }

    if (src.kind === "ref_bounced") {
        throwCompilationError(`Cannot call function on bounced value`, exp.loc);
    }

    throwCompilationError(
        `Invalid type "${printTypeRef(src)}" for function call`,
        exp.loc,
    );
}

export function resolveInitOf(
    ast: ASTInitOf,
    sctx: StatementContext,
    ctx: CompilerContext,
): CompilerContext {
    // Resolve type
    const type = getType(ctx, ast.name);
    if (type.kind !== "contract") {
        throwCompilationError(
            `Type ${idTextErr(ast.name)} is not a contract`,
            ast.loc,
        );
    }
    if (!type.init) {
        throwCompilationError(
            `Contract ${idTextErr(ast.name)} does not have an init function`,
            ast.loc,
        );
    }

    // Resolve args
    for (const e of ast.args) {
        ctx = resolveExpression(e, sctx, ctx);
    }

    // Check arguments
    if (type.init.params.length !== ast.args.length) {
        throwCompilationError(
            `Init function of "${type.name}" expects ${type.init.params.length} arguments, got ${ast.args.length}`,
            ast.loc,
        );
    }
    for (let i = 0; i < type.init.params.length; i++) {
        const a = type.init.params[i];
        const e = ast.args[i];
        const t = getExpType(ctx, e);
        if (!isAssignable(t, a.type)) {
            throwCompilationError(
                `Invalid type "${printTypeRef(t)}" for argument ${idTextErr(a.name)}`,
                e.loc,
            );
        }
    }

    // Register return type
    return registerExpType(ctx, ast, {
        kind: "ref",
        name: "StateInit",
        optional: false,
    });
}

export function resolveConditional(
    ast: ASTConditional,
    sctx: StatementContext,
    ctx: CompilerContext,
): CompilerContext {
    ctx = resolveExpression(ast.condition, sctx, ctx);
    const conditionType = getExpType(ctx, ast.condition);
    if (
        conditionType.kind !== "ref" ||
        conditionType.optional ||
        conditionType.name !== "Bool"
    ) {
        throwCompilationError(
            `Invalid type "${printTypeRef(conditionType)}" for ternary condition`,
            ast.condition.loc,
        );
    }

    ctx = resolveExpression(ast.thenBranch, sctx, ctx);
    ctx = resolveExpression(ast.elseBranch, sctx, ctx);
    const thenType = getExpType(ctx, ast.thenBranch);
    const elseType = getExpType(ctx, ast.elseBranch);

    const resultType = moreGeneralType(thenType, elseType);
    if (resultType) {
        if (resultType.kind == "void") {
            throwCompilationError(
                `Expressions of "<void>" type cannot be used for conditional expression`,
                ast.loc,
            );
        }
        return registerExpType(ctx, ast, resultType);
    }

    throwCompilationError(
        `Non-matching types "${printTypeRef(thenType)}" and "${printTypeRef(elseType)}" for ternary branches`,
        ast.elseBranch.loc,
    );
}

export function resolveExpression(
    exp: ASTExpression,
    sctx: StatementContext,
    ctx: CompilerContext,
) {
    //
    // Literals
    //

    if (exp.kind === "boolean") {
        return resolveBooleanLiteral(exp, sctx, ctx);
    }
    if (exp.kind === "number") {
        return resolveIntLiteral(exp, sctx, ctx);
    }
    if (exp.kind === "null") {
        return resolveNullLiteral(exp, sctx, ctx);
    }
    if (exp.kind === "string") {
        return resolveStringLiteral(exp, sctx, ctx);
    }

    //
    // Constructors
    //

    if (exp.kind === "op_new") {
        return resolveStructNew(exp, sctx, ctx);
    }

    //
    // Binary, unary and suffix operations
    //

    if (exp.kind === "op_binary") {
        return resolveBinaryOp(exp, sctx, ctx);
    }

    if (exp.kind === "op_unary") {
        return resolveUnaryOp(exp, sctx, ctx);
    }

    //
    // References
    //

    if (exp.kind === "id") {
        // Find variable
        const v = sctx.vars.get(exp.text);
        if (!v) {
            if (!hasStaticConstant(ctx, exp.text)) {
                if (isWildcard(exp)) {
                    throwCompilationError(
                        "Wildcard variable name '_' cannot be accessed",
                        exp.loc,
                    );
                }
                // Handle static struct method calls
                try {
                    const t = getType(ctx, exp.text);
                    if (t.kind === "struct") {
                        return registerExpType(ctx, exp, {
                            kind: "ref",
                            name: t.name,
                            optional: false,
                        });
                    }
                } catch {
                    // Ignore
                }

                throwCompilationError(
                    "Unable to resolve id " + exp.text,
                    exp.loc,
                );
            } else {
                const cc = getStaticConstant(ctx, exp.text);
                return registerExpType(ctx, exp, cc.type);
            }
        }

        return registerExpType(ctx, exp, v);
    }

    if (exp.kind === "op_field") {
        return resolveFieldAccess(exp, sctx, ctx);
    }

    //
    // Function calls
    //

    if (exp.kind === "op_static_call") {
        return resolveStaticCall(exp, sctx, ctx);
    }

    if (exp.kind === "op_call") {
        return resolveCall(exp, sctx, ctx);
    }

    if (exp.kind === "init_of") {
        return resolveInitOf(exp, sctx, ctx);
    }

    if (exp.kind === "conditional") {
        return resolveConditional(exp, sctx, ctx);
    }

    throw Error("Unknown expression"); // Unreachable
}

export function getAllExpressionTypes(ctx: CompilerContext) {
    const res: [string, string][] = [];
    const a = store.all(ctx);
    for (const e in a) {
        res.push([a[e].ast.loc.contents, printTypeRef(a[e].description)]);
    }
    return res;
}
