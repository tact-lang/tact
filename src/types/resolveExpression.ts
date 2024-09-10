import {
    AstBoolean,
    AstExpression,
    AstInitOf,
    AstNull,
    AstNumber,
    AstOpBinary,
    AstMethodCall,
    AstStaticCall,
    AstFieldAccess,
    AstStructInstance,
    AstOpUnary,
    AstString,
    AstConditional,
    eqNames,
    idText,
    isWildcard,
} from "../grammar/ast";
import { idTextErr, throwCompilationError } from "../errors";
import { CompilerContext, createContextStore } from "../context";
import {
    getAllTypes,
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
import { throwInternalCompilerError } from "../errors";
import { StructFunctions } from "../abi/struct";

const store = createContextStore<{
    ast: AstExpression;
    description: TypeRef;
}>();

export function getExpType(ctx: CompilerContext, exp: AstExpression) {
    const t = store.get(ctx, exp.id);
    if (!t) {
        throwInternalCompilerError(`Expression ${exp.id} not found`);
    }
    return t.description;
}

function registerExpType(
    ctx: CompilerContext,
    exp: AstExpression,
    description: TypeRef,
): CompilerContext {
    const ex = store.get(ctx, exp.id);
    if (ex) {
        if (typeRefEquals(ex.description, description)) {
            return ctx;
        }
        throwInternalCompilerError(`Expression ${exp.id} already has a type`);
    }
    return store.set(ctx, exp.id, { ast: exp, description });
}

function resolveBooleanLiteral(
    exp: AstBoolean,
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
    exp: AstNumber,
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
    exp: AstNull,
    sctx: StatementContext,
    ctx: CompilerContext,
): CompilerContext {
    return registerExpType(ctx, exp, { kind: "null" });
}

function resolveStringLiteral(
    exp: AstString,
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
    exp: AstStructInstance,
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
    const processed: Set<string> = new Set();
    for (const e of exp.args) {
        // Check duplicates
        if (processed.has(idText(e.field))) {
            throwCompilationError(
                `Duplicate fields ${idTextErr(e.field)}`,
                e.loc,
            );
        }
        processed.add(idText(e.field));

        // Check existing
        const f = tp.fields.find((v) => eqNames(v.name, e.field));
        if (!f) {
            throwCompilationError(
                `Unknown fields ${idTextErr(e.field)} in type ${idTextErr(tp.name)}`,
                e.loc,
            );
        }

        // Resolve expression
        ctx = resolveExpression(e.initializer, sctx, ctx);

        // Check expression type
        const expressionType = getExpType(ctx, e.initializer);
        if (!isAssignable(expressionType, f.type)) {
            throwCompilationError(
                `Invalid type "${printTypeRef(expressionType)}" for field ${idTextErr(e.field)} with type "${printTypeRef(f.type)}" in type "${tp.name}"`,
                e.loc,
            );
        }
    }

    // Check missing fields
    for (const f of tp.fields) {
        if (
            !processed.has(f.name) &&
            f.ast.initializer === null &&
            !(f.type.kind === "ref" && f.type.optional)
        ) {
            throwCompilationError(
                `Missing field "${f.name}" in type "${tp.name}"`,
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
    exp: AstOpBinary,
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
    switch (exp.op) {
        case "-":
        case "+":
        case "*":
        case "/":
        case "%":
        case ">>":
        case "<<":
        case "&":
        case "|":
        case "^":
            {
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
            }
            break;
        case "<":
        case "<=":
        case ">":
        case ">=":
            {
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
            }
            break;
        case "==":
        case "!=":
            {
                // any inhabitant of an optional type can be compared to null
                if (
                    (le.kind === "ref" && le.optional && re.kind === "null") ||
                    (re.kind === "ref" && re.optional && le.kind === "null")
                ) {
                    resolved = { kind: "ref", name: "Bool", optional: false };
                    break;
                }
                if (!isEqualityType(ctx, le)) {
                    throwCompilationError(
                        `Expressions of "${printTypeRef(le)}" type cannot be used for (non)equality operator "${exp.op}"\n See https://docs.tact-lang.org/book/operators#binary-equality`,
                        exp.loc,
                    );
                }
                if (!isEqualityType(ctx, re)) {
                    throwCompilationError(
                        `Expressions of "${printTypeRef(re)}" type cannot be used for (non)equality operator "${exp.op}"\nSee https://docs.tact-lang.org/book/operators#binary-equality`,
                        exp.loc,
                    );
                }
                if (!isAssignable(le, re) && !isAssignable(re, le)) {
                    throwCompilationError(
                        `Incompatible types "${printTypeRef(le)}" and "${printTypeRef(re)}" for binary operator "${exp.op}"`,
                        exp.loc,
                    );
                }
                resolved = { kind: "ref", name: "Bool", optional: false };
            }
            break;
        case "&&":
        case "||": {
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
        }
    }

    // Register result
    return registerExpType(ctx, exp, resolved);
}

function isEqualityType(ctx: CompilerContext, ty: TypeRef): boolean {
    switch (ty.kind) {
        case "ref": {
            const type = getType(ctx, ty.name);
            if (type.kind === "primitive_type_decl") {
                return (
                    ty.name === "Int" ||
                    ty.name === "Bool" ||
                    ty.name === "Address" ||
                    ty.name === "Cell" ||
                    ty.name === "Slice" ||
                    ty.name === "String"
                );
            } else {
                return false;
            }
        }
        case "null":
        case "map":
            return true;
        case "void":
        case "ref_bounced":
            return false;
    }
}

function resolveUnaryOp(
    exp: AstOpUnary,
    sctx: StatementContext,
    ctx: CompilerContext,
): CompilerContext {
    // Resolve right side
    ctx = resolveExpression(exp.operand, sctx, ctx);

    // Check right type dependent on operator
    let resolvedType = getExpType(ctx, exp.operand);
    switch (exp.op) {
        case "-":
        case "+":
        case "~":
            {
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
            }
            break;
        case "!":
            {
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
            }
            break;
        case "!!": {
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
        }
    }

    // Register result
    return registerExpType(ctx, exp, resolvedType);
}

function resolveFieldAccess(
    exp: AstFieldAccess,
    sctx: StatementContext,
    ctx: CompilerContext,
): CompilerContext {
    // Resolve expression
    ctx = resolveExpression(exp.aggregate, sctx, ctx);

    // Find target type and check for type
    const src = getExpType(ctx, exp.aggregate);

    if ((src.kind !== "ref" || src.optional) && src.kind !== "ref_bounced") {
        throwCompilationError(
            `Invalid type "${printTypeRef(src)}" for field access`,
            exp.loc,
        );
    }

    // Check if field initialized
    if (
        sctx.requiredFields.length > 0 &&
        exp.aggregate.kind === "id" &&
        exp.aggregate.text === "self"
    ) {
        if (sctx.requiredFields.find((v) => eqNames(v, exp.field))) {
            throwCompilationError(
                `Field ${idTextErr(exp.field)} is not initialized`,
                exp.field.loc,
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

    const field = fields.find((v) => eqNames(v.name, exp.field));
    const cst = srcT.constants.find((v) => eqNames(v.name, exp.field));
    if (!field && !cst) {
        const typeStr =
            src.kind === "ref_bounced"
                ? `bounced<${idTextErr(src.name)}>`
                : idTextErr(src.name);

        if (src.kind === "ref" && !src.optional) {
            // Check for struct methods
            if (
                (srcT.kind === "struct" &&
                    StructFunctions.has(idText(exp.field))) ||
                srcT.functions.has(idText(exp.field))
            ) {
                throwCompilationError(
                    `Type ${typeStr} does not have a field named "${exp.field.text}", did you mean "${exp.field.text}()" instead?`,
                    exp.loc,
                );
            }
        }

        throwCompilationError(
            `Type ${typeStr} does not have a field named ${idTextErr(exp.field)}`,
            exp.field.loc,
        );
    }

    // Register result type
    if (field) {
        return registerExpType(ctx, exp, field.type);
    } else {
        return registerExpType(ctx, exp, cst!.type);
    }
}

function resolveStaticCall(
    exp: AstStaticCall,
    sctx: StatementContext,
    ctx: CompilerContext,
): CompilerContext {
    // Check if abi global function
    if (GlobalFunctions.has(idText(exp.function))) {
        const f = GlobalFunctions.get(idText(exp.function))!;

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
    if (!hasStaticFunction(ctx, idText(exp.function))) {
        // check if there is a method with the same name
        if (
            getAllTypes(ctx).find(
                (ty) => ty.functions.get(idText(exp.function)) !== undefined,
            ) !== undefined
        ) {
            throwCompilationError(
                `Static function ${idTextErr(exp.function)} does not exist. Perhaps you meant to call ".${idText(exp.function)}(...)" extension function?`,
                exp.loc,
            );
        }

        throwCompilationError(
            `Static function ${idTextErr(exp.function)} does not exist`,
            exp.loc,
        );
    }

    // Get static function
    const f = getStaticFunction(ctx, idText(exp.function));

    // Resolve call arguments
    for (const e of exp.args) {
        ctx = resolveExpression(e, sctx, ctx);
    }

    // Check arguments
    if (f.params.length !== exp.args.length) {
        throwCompilationError(
            `Function ${idTextErr(exp.function)} expects ${f.params.length} arguments, got ${exp.args.length}`,
            exp.loc,
        );
    }
    for (const [i, a] of f.params.entries()) {
        const e = exp.args[i]!;
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
    exp: AstMethodCall,
    sctx: StatementContext,
    ctx: CompilerContext,
): CompilerContext {
    // Resolve expression
    ctx = resolveExpression(exp.self, sctx, ctx);

    // Check if self is initialized
    if (
        exp.self.kind === "id" &&
        exp.self.text === "self" &&
        sctx.requiredFields.length > 0
    ) {
        throwCompilationError("Cannot access self before init", exp.loc);
    }

    // Resolve args
    for (const e of exp.args) {
        ctx = resolveExpression(e, sctx, ctx);
    }

    // Resolve return value
    const src = getExpType(ctx, exp.self);

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
            if (StructFunctions.has(idText(exp.method))) {
                const abi = StructFunctions.get(idText(exp.method))!;
                const resolved = abi.resolve(
                    ctx,
                    [src, ...exp.args.map((v) => getExpType(ctx, v))],
                    exp.loc,
                );
                return registerExpType(ctx, exp, resolved);
            }
        }

        const f = srcT.functions.get(idText(exp.method));
        if (f) {
            // Check arguments
            if (f.params.length !== exp.args.length) {
                throwCompilationError(
                    `Function ${idTextErr(exp.method)} expects ${f.params.length} arguments, got ${exp.args.length}`,
                    exp.loc,
                );
            }
            for (const [i, a] of f.params.entries()) {
                const e = exp.args[i]!;
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

        // Check if a field with the same name exists
        const field = srcT.fields.find((v) => eqNames(v.name, exp.method));
        if (field) {
            throwCompilationError(
                `Type "${src.name}" does not have a function named "${exp.method.text}()", did you mean field "${exp.method.text}" instead?`,
                exp.loc,
            );
        }

        throwCompilationError(
            `Type "${src.name}" does not have a function named ${idTextErr(exp.method)}`,
            exp.loc,
        );
    }

    // Handle map
    if (src.kind === "map") {
        if (!MapFunctions.has(idText(exp.method))) {
            throwCompilationError(
                `Map function ${idTextErr(exp.method)} not found`,
                exp.loc,
            );
        }
        const abf = MapFunctions.get(idText(exp.method))!;
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

function resolveInitOf(
    ast: AstInitOf,
    sctx: StatementContext,
    ctx: CompilerContext,
): CompilerContext {
    // Resolve type
    const type = getType(ctx, ast.contract);
    if (type.kind !== "contract") {
        throwCompilationError(
            `Type ${idTextErr(ast.contract)} is not a contract`,
            ast.loc,
        );
    }
    if (!type.init) {
        throwCompilationError(
            `Contract ${idTextErr(ast.contract)} does not have an init function`,
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
    for (const [i, a] of type.init.params.entries()) {
        const e = ast.args[i]!;
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

function resolveConditional(
    ast: AstConditional,
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
    exp: AstExpression,
    sctx: StatementContext,
    ctx: CompilerContext,
) {
    switch (exp.kind) {
        case "boolean": {
            return resolveBooleanLiteral(exp, sctx, ctx);
        }
        case "number": {
            return resolveIntLiteral(exp, sctx, ctx);
        }
        case "null": {
            return resolveNullLiteral(exp, sctx, ctx);
        }
        case "string": {
            return resolveStringLiteral(exp, sctx, ctx);
        }
        case "struct_instance": {
            return resolveStructNew(exp, sctx, ctx);
        }
        case "op_binary": {
            return resolveBinaryOp(exp, sctx, ctx);
        }
        case "op_unary": {
            return resolveUnaryOp(exp, sctx, ctx);
        }
        case "id": {
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

                    // Handle possible field access and suggest to use self.field instead
                    const self = sctx.vars.get("self");
                    if (self && self.kind === "ref") {
                        const t = getType(ctx, self.name);
                        if (t.kind === "contract" || t.kind === "trait") {
                            const field = t.fields.find(
                                (f) => f.name == exp.text,
                            );
                            if (field) {
                                throwCompilationError(
                                    `Unable to resolve id '${exp.text}', did you mean 'self.${exp.text}'?`,
                                    exp.loc,
                                );
                            }
                        }
                    }

                    throwCompilationError(
                        `Unable to resolve id '${exp.text}'`,
                        exp.loc,
                    );
                } else {
                    const cc = getStaticConstant(ctx, exp.text);
                    return registerExpType(ctx, exp, cc.type);
                }
            }

            return registerExpType(ctx, exp, v);
        }
        case "field_access": {
            return resolveFieldAccess(exp, sctx, ctx);
        }
        case "static_call": {
            return resolveStaticCall(exp, sctx, ctx);
        }
        case "method_call": {
            return resolveCall(exp, sctx, ctx);
        }
        case "init_of": {
            return resolveInitOf(exp, sctx, ctx);
        }
        case "conditional": {
            return resolveConditional(exp, sctx, ctx);
        }
    }
}

export function getAllExpressionTypes(ctx: CompilerContext) {
    const res: [string, string][] = [];
    store.all(ctx).forEach((val, _key) => {
        res.push([val.ast.loc.contents, printTypeRef(val.description)]);
    });
    return res;
}
