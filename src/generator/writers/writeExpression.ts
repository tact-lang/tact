import {
    idTextErr,
    TactConstEvalError,
    throwCompilationError,
    throwInternalCompilerError,
} from "@/error/errors";
import type * as Ast from "@/ast/ast";
import { getExpType } from "@/types/resolveExpression";
import {
    getStaticConstant,
    getStaticFunction,
    getType,
    hasStaticConstant,
} from "@/types/resolveDescriptors";
import type { FieldDescription, TypeDescription } from "@/types/types";
import { printTypeRef } from "@/types/types";
import type { TypeRef } from "@/types/types";
import type { WriterContext } from "@/generator/Writer";
import { resolveFuncTypeUnpack } from "@/generator/writers/resolveFuncTypeUnpack";
import { MapFunctions } from "@/abi/map";
import { GlobalFunctions } from "@/abi/global";
import { funcIdOf } from "@/generator/writers/id";
import { StructFunctions } from "@/abi/struct";
import { resolveFuncType } from "@/generator/writers/resolveFuncType";
import {
    writeAddress,
    writeCell,
    writeSlice,
    writeString,
} from "@/generator/writers/writeConstant";
import { ops } from "@/generator/writers/ops";
import { writeCastedExpression } from "@/generator/writers/writeFunction";
import { isLvalue } from "@/types/resolveStatements";
import { evalConstantExpression } from "@/optimizer/constEval";
import { getAstUtil } from "@/ast/util";
import {
    eqNames,
    getAstFactory,
    idText,
    tryExtractPath,
} from "@/ast/ast-helpers";
import { enabledDebug, enabledNullChecks } from "@/config/features";
import type { CompilerContext } from "@/context/context";
import {
    getKeyParser,
    getValueParser,
    mapSerializers,
} from "@/bindings/typescript/serializers";
import { getMapAbi } from "@/types/resolveABITypeRef";
import type { SrcInfo } from "@/grammar";
import { Cell } from "@ton/core";
import { makeVisitor } from "@/utils/tricks";

function isNull(wCtx: WriterContext, expr: Ast.Expression): boolean {
    return getExpType(wCtx.ctx, expr).kind === "null";
}

function handleStructNullTernary(
    wCtx: WriterContext,
    condition: Ast.Expression,
    structExpr: Ast.Expression,
    structType: TypeRef,
    isStructInThenBranch: boolean,
): string {
    if (structType.kind === "ref") {
        const type = getType(wCtx.ctx, structType.name);
        if (type.kind === "struct" || type.kind === "contract") {
            if (isStructInThenBranch) {
                return `(${writeExpressionInCondition(condition, wCtx)} ? ${ops.typeAsOptional(type.name, wCtx)}(${writeExpression(structExpr, wCtx)}) : null())`;
            } else {
                return `(${writeExpressionInCondition(condition, wCtx)} ? null() : ${ops.typeAsOptional(type.name, wCtx)}(${writeExpression(structExpr, wCtx)}))`;
            }
        }
    }
    return "";
}

function writeStructConstructor(
    type: TypeDescription,
    args: string[],
    ctx: WriterContext,
) {
    // Check for duplicates
    const name = ops.typeConstructor(type.name, args, ctx);
    const renderKey = "$constructor$" + type.name + "$" + args.join(",");
    if (ctx.isRendered(renderKey)) {
        return name;
    }
    ctx.markRendered(renderKey);

    // Generate constructor
    ctx.fun(name, () => {
        const funcType = resolveFuncType(type, ctx);
        // rename a struct constructor formal parameter to avoid
        // name clashes with FunC keywords, e.g. `struct Foo {type: Int}`
        // is a perfectly fine Tact structure, but its constructor would
        // have the wrong parameter name: `$Foo$_constructor_type(int type)`
        const avoidFunCKeywordNameClash = (p: string) => `$${p}`;
        const sig = `(${funcType}) ${name}(${args.map((v) => resolveFuncType(type.fields.find((v2) => v2.name === v)!.type, ctx) + " " + avoidFunCKeywordNameClash(v)).join(", ")})`;
        ctx.signature(sig);
        ctx.flag("inline");
        ctx.context("type:" + type.name);
        ctx.body(() => {
            // Create expressions
            const expressions = type.fields.map((v) => {
                const arg = args.find((v2) => v2 === v.name);
                if (arg) {
                    return avoidFunCKeywordNameClash(arg);
                } else if (v.default !== undefined) {
                    return writeValue(
                        v.default,
                        v.type.kind === "ref" ? v.type.optional : false,
                        ctx,
                    );
                } else {
                    throw Error(
                        `Missing argument for field "${v.name}" in struct "${type.name}"`,
                    ); // Must not happen
                }
            }, ctx);

            if (expressions.length === 0 && funcType === "tuple") {
                ctx.append(`return empty_tuple();`);
            } else {
                ctx.append(`return (${expressions.join(", ")});`);
            }
        });
    });
    return name;
}

export function writeValue(
    val: Ast.Literal,
    optional: boolean,
    wCtx: WriterContext,
): string {
    switch (val.kind) {
        case "number":
            return val.value.toString(10);
        case "string": {
            const id = writeString(val.value, wCtx);
            wCtx.used(id);
            return `${id}()`;
        }
        case "boolean":
            return val.value ? "true" : "false";
        case "address": {
            const res = writeAddress(val.value, wCtx);
            wCtx.used(res);
            return res + "()";
        }
        case "cell": {
            const res = writeCell(val.value, wCtx);
            wCtx.used(res);
            return `${res}()`;
        }
        case "slice": {
            const res = writeSlice(val.value, wCtx);
            wCtx.used(res);
            return `${res}()`;
        }
        case "null":
            return "null()";
        case "struct_value": {
            // Transform the struct fields into a map for lookup
            const valMap: Map<string, Ast.Literal> = new Map();
            for (const f of val.args) {
                valMap.set(idText(f.field), f.initializer);
            }

            const structDescription = getType(wCtx.ctx, val.type);
            const fields = structDescription.fields.map((field) => field.name);
            const id = writeStructConstructor(structDescription, fields, wCtx);
            wCtx.used(id);
            const fieldValues = structDescription.fields.map((field) => {
                if (valMap.has(field.name)) {
                    const v = valMap.get(field.name)!;
                    if (field.type.kind === "ref" && field.type.optional) {
                        const ft = getType(wCtx.ctx, field.type.name);
                        if (ft.kind === "struct" && v.kind !== "null") {
                            return writeValue(v, true, wCtx);
                        }
                    }
                    return writeValue(v, false, wCtx);
                } else {
                    throwInternalCompilerError(
                        `Struct value is missing a field: ${field.name}`,
                        val.loc,
                    );
                }
            });
            const value = `${id}(${fieldValues.join(", ")})`;
            if (optional) {
                return `${ops.typeAsOptional(structDescription.name, wCtx)}(${value})`;
            }
            return value;
        }
        case "map_value": {
            if (typeof val.bocHex === "undefined") {
                return "null()";
            }
            const res = writeCell(Cell.fromHex(val.bocHex), wCtx);
            wCtx.used(res);
            return `${res}()`;
        }
    }
}

export function writePathExpression(path: Ast.Id[]): string {
    return [funcIdOf(idText(path[0]!)), ...path.slice(1).map(idText)].join(`'`);
}

const writeIdExpr =
    (f: Ast.Id) =>
    (wCtx: WriterContext): string => {
        const t = getExpType(wCtx.ctx, f);

        // Handle packed type
        if (t.kind === "ref") {
            const tt = getType(wCtx.ctx, t.name);
            if (tt.kind === "contract" || tt.kind === "struct") {
                return resolveFuncTypeUnpack(t, funcIdOf(f.text), wCtx);
            }
        }

        if (t.kind === "ref_bounced") {
            const tt = getType(wCtx.ctx, t.name);
            if (tt.kind === "struct") {
                return resolveFuncTypeUnpack(
                    t,
                    funcIdOf(f.text),
                    wCtx,
                    false,
                    true,
                );
            }
        }

        // Handle constant
        if (hasStaticConstant(wCtx.ctx, f.text)) {
            const c = getStaticConstant(wCtx.ctx, f.text);
            return writeValue(
                c.value!,
                c.type.kind === "ref" ? c.type.optional : false,
                wCtx,
            );
        }

        return funcIdOf(f.text);
    };

/**
 * NOTE: We always wrap expressions in parentheses to avoid operator precedence issues
 */
const writeBinaryExpr =
    (f: Ast.OpBinary) =>
    (wCtx: WriterContext): string => {
        // Special case for non-integer types and nullable
        if (f.op === "==" || f.op === "!=") {
            if (isNull(wCtx, f.left) && isNull(wCtx, f.right)) {
                if (f.op === "==") {
                    return "true";
                } else {
                    return "false";
                }
            } else if (isNull(wCtx, f.left) && !isNull(wCtx, f.right)) {
                if (f.op === "==") {
                    return `null?(${writeExpression(f.right, wCtx)})`;
                } else {
                    return `(~ null?(${writeExpression(f.right, wCtx)}))`;
                }
            } else if (!isNull(wCtx, f.left) && isNull(wCtx, f.right)) {
                if (f.op === "==") {
                    return `null?(${writeExpression(f.left, wCtx)})`;
                } else {
                    return `(~ null?(${writeExpression(f.left, wCtx)}))`;
                }
            }
        }

        // Special case for address
        const lt = getExpType(wCtx.ctx, f.left);
        const rt = getExpType(wCtx.ctx, f.right);

        // Case for addresses equality
        if (
            lt.kind === "ref" &&
            rt.kind === "ref" &&
            lt.name === "Address" &&
            rt.name === "Address"
        ) {
            const prefix = f.op == "!=" ? "~ " : "";
            if (lt.optional && rt.optional) {
                wCtx.used(`__tact_slice_eq_bits_nullable`);
                return `( ${prefix}__tact_slice_eq_bits_nullable(${writeExpression(f.left, wCtx)}, ${writeExpression(f.right, wCtx)}) )`;
            }
            if (lt.optional && !rt.optional) {
                wCtx.used(`__tact_slice_eq_bits_nullable_one`);
                return `( ${prefix}__tact_slice_eq_bits_nullable_one(${writeExpression(f.left, wCtx)}, ${writeExpression(f.right, wCtx)}) )`;
            }
            if (!lt.optional && rt.optional) {
                wCtx.used(`__tact_slice_eq_bits_nullable_one`);
                return `( ${prefix}__tact_slice_eq_bits_nullable_one(${writeExpression(f.right, wCtx)}, ${writeExpression(f.left, wCtx)}) )`;
            }
            return `( ${prefix}equal_slices_bits(${writeExpression(f.right, wCtx)}, ${writeExpression(f.left, wCtx)}) )`;
        }

        // Case for cells equality
        if (
            lt.kind === "ref" &&
            rt.kind === "ref" &&
            lt.name === "Cell" &&
            rt.name === "Cell"
        ) {
            const op = f.op === "==" ? "eq" : "neq";
            if (lt.optional && rt.optional) {
                wCtx.used(`__tact_cell_${op}_nullable`);
                return `__tact_cell_${op}_nullable(${writeExpression(f.left, wCtx)}, ${writeExpression(f.right, wCtx)})`;
            }
            if (lt.optional && !rt.optional) {
                wCtx.used(`__tact_cell_${op}_nullable_one`);
                return `__tact_cell_${op}_nullable_one(${writeExpression(f.left, wCtx)}, ${writeExpression(f.right, wCtx)})`;
            }
            if (!lt.optional && rt.optional) {
                wCtx.used(`__tact_cell_${op}_nullable_one`);
                return `__tact_cell_${op}_nullable_one(${writeExpression(f.right, wCtx)}, ${writeExpression(f.left, wCtx)})`;
            }
            wCtx.used(`__tact_cell_${op}`);
            return `__tact_cell_${op}(${writeExpression(f.right, wCtx)}, ${writeExpression(f.left, wCtx)})`;
        }

        // Case for slices and strings equality
        if (
            lt.kind === "ref" &&
            rt.kind === "ref" &&
            lt.name === rt.name &&
            (lt.name === "Slice" || lt.name === "String")
        ) {
            const op = f.op === "==" ? "eq" : "neq";
            if (lt.optional && rt.optional) {
                wCtx.used(`__tact_slice_${op}_nullable`);
                return `__tact_slice_${op}_nullable(${writeExpression(f.left, wCtx)}, ${writeExpression(f.right, wCtx)})`;
            }
            if (lt.optional && !rt.optional) {
                wCtx.used(`__tact_slice_${op}_nullable_one`);
                return `__tact_slice_${op}_nullable_one(${writeExpression(f.left, wCtx)}, ${writeExpression(f.right, wCtx)})`;
            }
            if (!lt.optional && rt.optional) {
                wCtx.used(`__tact_slice_${op}_nullable_one`);
                return `__tact_slice_${op}_nullable_one(${writeExpression(f.right, wCtx)}, ${writeExpression(f.left, wCtx)})`;
            }
            wCtx.used(`__tact_slice_${op}`);
            return `__tact_slice_${op}(${writeExpression(f.right, wCtx)}, ${writeExpression(f.left, wCtx)})`;
        }

        // Case for maps equality
        if (lt.kind === "map" && rt.kind === "map") {
            const op = f.op === "==" ? "eq" : "neq";
            wCtx.used(`__tact_cell_${op}_nullable`);
            return `__tact_cell_${op}_nullable(${writeExpression(f.left, wCtx)}, ${writeExpression(f.right, wCtx)})`;
        }

        // Check for int or boolean types
        if (
            lt.kind !== "ref" ||
            rt.kind !== "ref" ||
            (lt.name !== "Int" && lt.name !== "Bool") ||
            (rt.name !== "Int" && rt.name !== "Bool")
        ) {
            const file = f.loc.file;
            const loc_info = f.loc.interval.getLineAndColumn();
            throw Error(
                `(Internal Compiler Error) Invalid types for binary operation: ${file}:${loc_info.lineNum}:${loc_info.colNum}`,
            ); // Should be unreachable
        }

        // Case for ints equality
        if (f.op === "==" || f.op === "!=") {
            const op = f.op === "==" ? "eq" : "neq";
            if (lt.optional && rt.optional) {
                wCtx.used(`__tact_int_${op}_nullable`);
                return `__tact_int_${op}_nullable(${writeExpression(f.left, wCtx)}, ${writeExpression(f.right, wCtx)})`;
            }
            if (lt.optional && !rt.optional) {
                wCtx.used(`__tact_int_${op}_nullable_one`);
                return `__tact_int_${op}_nullable_one(${writeExpression(f.left, wCtx)}, ${writeExpression(f.right, wCtx)})`;
            }
            if (!lt.optional && rt.optional) {
                wCtx.used(`__tact_int_${op}_nullable_one`);
                return `__tact_int_${op}_nullable_one(${writeExpression(f.right, wCtx)}, ${writeExpression(f.left, wCtx)})`;
            }
            if (f.op === "==") {
                return `(${writeExpression(f.left, wCtx)} == ${writeExpression(f.right, wCtx)})`;
            } else {
                return `(${writeExpression(f.left, wCtx)} != ${writeExpression(f.right, wCtx)})`;
            }
        }

        // Case for "&&" operator
        if (f.op === "&&") {
            return `( (${writeExpression(f.left, wCtx)}) ? (${writeExpression(f.right, wCtx)}) : (false) )`;
        }

        // Case for "||" operator
        if (f.op === "||") {
            return `( (${writeExpression(f.left, wCtx)}) ? (true) : (${writeExpression(f.right, wCtx)}) )`;
        }

        // Other ops
        return (
            "(" +
            writeExpression(f.left, wCtx) +
            " " +
            f.op +
            " " +
            writeExpression(f.right, wCtx) +
            ")"
        );
    };

/**
 * Unary operations: !, -, +, !!
 * NOTE: We always wrap expressions in parentheses to avoid operator precedence issues
 */
const writeUnaryExpr =
    (f: Ast.OpUnary) =>
    (wCtx: WriterContext): string => {
        // NOTE: Logical not is written as a bitwise not
        switch (f.op) {
            case "!": {
                return "(~ " + writeExpression(f.operand, wCtx) + ")";
            }

            case "~": {
                return "(~ " + writeExpression(f.operand, wCtx) + ")";
            }

            case "-": {
                return "(- " + writeExpression(f.operand, wCtx) + ")";
            }

            case "+": {
                // FunC doesn't support unary plus so we just skip it
                return writeExpression(f.operand, wCtx);
            }

            // NOTE: Assert function that ensures that the value is not null
            case "!!": {
                const t = getExpType(wCtx.ctx, f.operand);
                if (t.kind === "ref") {
                    const tt = getType(wCtx.ctx, t.name);
                    if (tt.kind === "struct") {
                        return `${ops.typeNotNull(tt.name, wCtx)}(${writeExpression(f.operand, wCtx)})`;
                    }
                }

                if (enabledNullChecks(wCtx.ctx) || enabledDebug(wCtx.ctx)) {
                    wCtx.used("__tact_not_null");
                    return `${wCtx.used("__tact_not_null")}(${writeExpression(f.operand, wCtx)})`;
                } else {
                    return writeExpression(f.operand, wCtx);
                }
            }
        }
    };

/**
 * Field Access
 * NOTE: this branch resolves "a.b", where "a" is an expression and "b" is a field name
 */
const writeFieldExpr =
    (f: Ast.FieldAccess) =>
    (wCtx: WriterContext): string => {
        // Optimize Context().sender to sender()
        // This is a special case to improve gas efficiency
        if (
            f.aggregate.kind === "static_call" &&
            f.aggregate.function.text === "context" &&
            f.aggregate.args.length === 0 &&
            f.field.text === "sender"
        ) {
            // Use sender() directly instead of context().sender
            wCtx.used("__tact_context_get_sender");
            return `__tact_context_get_sender()`;
        }

        // Resolve the type of the expression
        const src = getExpType(wCtx.ctx, f.aggregate);
        if (
            (src.kind !== "ref" || src.optional) &&
            src.kind !== "ref_bounced"
        ) {
            throwCompilationError(
                `Cannot access field of non-struct type: "${printTypeRef(src)}"`,
                f.loc,
            );
        }
        const srcT = getType(wCtx.ctx, src.name);

        // Resolve field
        let fields: FieldDescription[];

        fields = srcT.fields;
        if (src.kind === "ref_bounced") {
            fields = fields.slice(0, srcT.partialFieldCount);
        }

        const field = fields.find((v) => eqNames(v.name, f.field));
        const cst = srcT.constants.find((v) => eqNames(v.name, f.field));
        if (!field && !cst) {
            throwCompilationError(
                `Cannot find field ${idTextErr(f.field)} in struct ${idTextErr(srcT.name)}`,
                f.field.loc,
            );
        }

        if (field) {
            // Trying to resolve field as a path
            const path = tryExtractPath(f);
            if (path) {
                // Prepare path
                const idd = writePathExpression(path);

                // Special case for structs
                if (field.type.kind === "ref") {
                    const ft = getType(wCtx.ctx, field.type.name);
                    if (ft.kind === "struct" || ft.kind === "contract") {
                        return resolveFuncTypeUnpack(field.type, idd, wCtx);
                    }
                }

                return idd;
            }

            // Getter instead of direct field access
            return `${ops.typeField(srcT.name, field.name, wCtx)}(${writeExpression(f.aggregate, wCtx)})`;
        } else {
            return writeValue(
                cst!.value!,
                cst!.type.kind === "ref" ? cst!.type.optional : false,
                wCtx,
            );
        }
    };

const writeStaticCall =
    (f: Ast.StaticCall) =>
    (wCtx: WriterContext): string => {
        // Check global functions
        if (GlobalFunctions.has(idText(f.function))) {
            return GlobalFunctions.get(idText(f.function))!.generate(
                wCtx,
                f.args.map((v) => getExpType(wCtx.ctx, v)),
                f.args,
                f.loc,
            );
        }

        const sf = getStaticFunction(wCtx.ctx, idText(f.function));
        let n = ops.global(idText(f.function));
        if (sf.ast.kind === "native_function_decl") {
            n = idText(sf.ast.nativeName);
            if (n.startsWith("__tact")) {
                wCtx.used(n);
            }
        } else {
            wCtx.used(n);
        }
        return (
            n +
            "(" +
            f.args
                .map((a, i) =>
                    writeCastedExpression(a, sf.params[i]!.type, wCtx),
                )
                .join(", ") +
            ")"
        );
    };

const writeStructInstance =
    (f: Ast.StructInstance) =>
    (wCtx: WriterContext): string => {
        const src = getType(wCtx.ctx, f.type);

        // Write a constructor
        const id = writeStructConstructor(
            src,
            f.args.map((v) => idText(v.field)),
            wCtx,
        );
        wCtx.used(id);

        // Write an expression
        const expressions = f.args.map(
            (v) =>
                writeCastedExpression(
                    v.initializer,
                    src.fields.find((v2) => eqNames(v2.name, v.field))!.type,
                    wCtx,
                ),
            wCtx,
        );
        return `${id}(${expressions.join(", ")})`;
    };

const writeMethodCall =
    (f: Ast.MethodCall) =>
    (wCtx: WriterContext): string => {
        // Resolve source type
        const selfTyRef = getExpType(wCtx.ctx, f.self);

        // Reference type
        if (selfTyRef.kind === "ref") {
            // Render function call
            const selfTy = getType(wCtx.ctx, selfTyRef.name);

            // Check struct ABI
            if (selfTy.kind === "struct") {
                if (StructFunctions.has(idText(f.method))) {
                    const abi = StructFunctions.get(idText(f.method))!;
                    return abi.generate(
                        wCtx,
                        [
                            selfTyRef,
                            ...f.args.map((v) => getExpType(wCtx.ctx, v)),
                        ],
                        [f.self, ...f.args],
                        f.loc,
                    );
                }
            }

            // Resolve function
            const methodDescr = selfTy.functions.get(idText(f.method))!;
            let name = ops.extension(selfTyRef.name, idText(f.method));
            if (
                methodDescr.ast.kind === "function_def" ||
                methodDescr.ast.kind === "function_decl" ||
                methodDescr.ast.kind === "asm_function_def"
            ) {
                wCtx.used(name);
            } else {
                name = idText(methodDescr.ast.nativeName);
                if (name.startsWith("__tact")) {
                    wCtx.used(name);
                }
            }

            // Render arguments
            let renderedArguments = f.args.map((a, i) =>
                writeCastedExpression(a, methodDescr.params[i]!.type, wCtx),
            );

            // Hack to replace a single struct argument to a tensor wrapper since otherwise
            // func would convert (int) type to just int and break mutating functions
            if (methodDescr.isMutating) {
                if (f.args.length === 1) {
                    const t = getExpType(wCtx.ctx, f.args[0]!);
                    if (t.kind === "ref") {
                        const tt = getType(wCtx.ctx, t.name);
                        if (
                            (tt.kind === "contract" || tt.kind === "struct") &&
                            methodDescr.params[0]!.type.kind === "ref" &&
                            !methodDescr.params[0]!.type.optional
                        ) {
                            renderedArguments = [
                                `${ops.typeTensorCast(tt.name, wCtx)}(${renderedArguments[0]})`,
                            ];
                        }
                    }
                }
            }

            const s = writeCastedExpression(f.self, methodDescr.self!, wCtx);
            if (methodDescr.isMutating) {
                // check if it's an l-value
                const path = tryExtractPath(f.self);
                if (path !== null && isLvalue(path, wCtx.ctx)) {
                    return `${s}~${name}(${renderedArguments.join(", ")})`;
                } else {
                    return `${wCtx.used(ops.nonModifying(name))}(${[s, ...renderedArguments].join(", ")})`;
                }
            } else {
                // Rearranges the arguments in the order described in Asm Shuffle
                //
                // For example:
                // `asm(other self) fun foo(self: Type, other: Type2)` and
                // `foo(10, 20)` generates as
                // `foo(20, 10)`
                if (
                    methodDescr.ast.kind === "asm_function_def" &&
                    methodDescr.self &&
                    methodDescr.ast.shuffle.args.length > 1 &&
                    methodDescr.ast.shuffle.ret.length === 0 &&
                    methodDescr.ast.params.length === 2 // apply only for `fun foo(self: T1, param: T2)`
                ) {
                    const renderedSelfAndArguments = [s, ...renderedArguments];
                    const selfAndParameters = [
                        "self",
                        ...methodDescr.params.map((p) => {
                            if (p.name.kind === "wildcard") {
                                throwInternalCompilerError(
                                    "Wildcard parameters in asm shuffle must be discarded on earlier compilation stages",
                                );
                            }
                            return p.name.text;
                        }),
                    ];
                    const shuffledArgs = methodDescr.ast.shuffle.args.map(
                        (shuffleArg) => {
                            const i = selfAndParameters.indexOf(
                                idText(shuffleArg),
                            );
                            return renderedSelfAndArguments[i];
                        },
                    );
                    return `${name}(${shuffledArgs.join(", ")})`;
                }

                return `${name}(${[s, ...renderedArguments].join(", ")})`;
            }
        }

        // Map types
        if (selfTyRef.kind === "map") {
            if (!MapFunctions.has(idText(f.method))) {
                throwCompilationError(
                    `Map function "${idText(f.method)}" not found`,
                    f.loc,
                );
            }
            const abf = MapFunctions.get(idText(f.method))!;
            return abf.generate(
                wCtx,
                [selfTyRef, ...f.args.map((v) => getExpType(wCtx.ctx, v))],
                [f.self, ...f.args],
                f.loc,
            );
        }

        if (selfTyRef.kind === "ref_bounced") {
            throw Error("Unimplemented");
        }

        throwCompilationError(
            `Cannot call function of non - direct type: "${printTypeRef(selfTyRef)}"`,
            f.loc,
        );
    };

const writeInitOf =
    (f: Ast.InitOf) =>
    (wCtx: WriterContext): string => {
        const type = getType(wCtx.ctx, f.contract);
        const initArgs = f.args.map((a, i) =>
            writeCastedExpression(a, type.init!.params[i]!.type, wCtx),
        );
        return `${ops.contractInitChild(idText(f.contract), wCtx)}(${initArgs.join(", ")})`;
    };

const writeCodeOf =
    (f: Ast.CodeOf) =>
    (wCtx: WriterContext): string => {
        // In case of using `codeOf T` in contract `T`, we simply use MYCODE.
        if (wCtx.name === f.contract.text) {
            return `my_code()`;
        }

        return `${ops.contractCodeChild(idText(f.contract), wCtx)}()`;
    };

const writeConditional =
    (f: Ast.Conditional) =>
    (wCtx: WriterContext): string => {
        const thenType = getExpType(wCtx.ctx, f.thenBranch);
        const elseType = getExpType(wCtx.ctx, f.elseBranch);

        // Handle special case when one branch is null and the other is a struct
        if (
            isNull(wCtx, f.thenBranch) &&
            thenType.kind === "null" &&
            elseType.kind === "ref" &&
            !elseType.optional
        ) {
            // When the "then" branch is null and "else" is a non-optional struct
            const result = handleStructNullTernary(
                wCtx,
                f.condition,
                f.elseBranch,
                elseType,
                false,
            );
            if (result) return result;
        } else if (
            isNull(wCtx, f.elseBranch) &&
            elseType.kind === "null" &&
            thenType.kind === "ref" &&
            !thenType.optional
        ) {
            // When the "else" branch is null and "then" is a non-optional struct
            const result = handleStructNullTernary(
                wCtx,
                f.condition,
                f.thenBranch,
                thenType,
                true,
            );
            if (result) return result;
        }

        // Default case
        return `(${writeExpressionInCondition(f.condition, wCtx)} ? ${writeExpression(f.thenBranch, wCtx)} : ${writeExpression(f.elseBranch, wCtx)})`;
    };

const cannotHappen =
    (_f: Ast.Expression) =>
    (_wCtx: WriterContext): string => {
        return throwInternalCompilerError(
            "Const evaluator must have handled these cases before",
        );
    };
const unsupported =
    (_f: Ast.Expression) =>
    (_wCtx: WriterContext): string => {
        return throwInternalCompilerError("Set literals are not supported");
    };

const writeMapLiteral =
    (node: Ast.MapLiteral) =>
    (_ctx: WriterContext): string => {
        throwCompilationError(
            "Only constant map literals are supported",
            node.loc,
        );
        // const { fields, loc } = node;

        // const fnName = freshIdentifier(`map_literal_`);
        // const varName = freshIdentifier(`$fresh`);

        // const mapType = getExpType(ctx.ctx, node);
        // if (mapType.kind !== 'map') {
        //     throwInternalCompilerError("Map literal doesn't have map type");
        // }

        // const used: Set<string> = new Set();
        // const params: string[] = [];
        // const args: string[] = [];
        // traverseAndCheck(node, (child) => {
        //     if (child.kind === 'static_call' || child.kind === 'struct_instance') {
        //         return false;
        //     }
        //     if (child.kind !== 'id') {
        //         return true;
        //     }
        //     if (used.has(child.text)) {
        //         return false;
        //     }
        //     used.add(child.text);
        //     const type = resolveFuncType(
        //         getExpType(ctx.ctx, child),
        //         ctx,
        //     );
        //     const name = funcIdOf(child.text);
        //     params.push(`${type} ${name}`);
        //     args.push(name);
        //     return false;
        // });

        // ctx.fun(fnName, () => {
        //     ctx.signature(`cell ${fnName}(${params.join(', ')})`);
        //     ctx.flag("impure");
        //     ctx.flag("inline");
        //     ctx.body(() => {
        //         ctx.append(`cell ${varName} = null();`);
        //         for (const field of fields) {
        //             const callCode = generateSet(
        //                 ctx,
        //                 loc,
        //                 mapType,
        //                 getExpType(ctx.ctx, field.value),
        //                 [
        //                     varName,
        //                     writeExpression(field.key, ctx),
        //                     writeExpression(field.value, ctx),
        //                 ],
        //             );
        //             ctx.append(`${callCode};`);
        //         }
        //         ctx.append(`return ${varName};`);
        //     });
        // });

        // ctx.used(fnName);

        // return `${fnName}(${args.join(', ')})`;
    };

const writeExpressionAux: (
    f: Ast.Expression,
) => (wCtx: WriterContext) => string = makeVisitor<Ast.Expression>()({
    id: writeIdExpr,
    op_binary: writeBinaryExpr,
    op_unary: writeUnaryExpr,
    field_access: writeFieldExpr,
    static_call: writeStaticCall,
    struct_instance: writeStructInstance,
    method_call: writeMethodCall,
    init_of: writeInitOf,
    code_of: writeCodeOf,
    conditional: writeConditional,
    map_literal: writeMapLiteral,
    string: cannotHappen,
    number: cannotHappen,
    boolean: cannotHappen,
    null: cannotHappen,
    address: cannotHappen,
    cell: cannotHappen,
    slice: cannotHappen,
    map_value: cannotHappen,
    struct_value: cannotHappen,
    set_literal: unsupported,
});

export function writeExpression(
    f: Ast.Expression,
    wCtx: WriterContext,
): string {
    // literals and constant expressions are covered here

    // FIXME: Once optimization step is added, remove this try and replace it with this
    // conditional:
    // if (isLiteral(f)) {
    //    return writeValue(f, wCtx);
    // }
    try {
        const util = getAstUtil(getAstFactory());
        // Let us put a limit of 2 ^ 12 = 4096 iterations on loops to increase compiler responsiveness.
        // If a loop takes more than such number of iterations, the interpreter will fail evaluation.
        // I think maxLoopIterations should be a command line option in case a user wants to wait more
        // during evaluation.
        const value = evalConstantExpression(f, wCtx.ctx, util, {
            maxLoopIterations: 2n ** 12n,
        });
        return writeValue(value, false, wCtx);
    } catch (error) {
        if (!(error instanceof TactConstEvalError) || error.fatal) throw error;
    }

    return writeExpressionAux(f)(wCtx);
}

// Evaluate the `expr` expression and return the resulting literal,
// or the original expression if the evaluation fails.
export function constEval(
    expr: Ast.Expression,
    ctx: CompilerContext,
): Ast.Literal | Ast.Expression {
    try {
        const util = getAstUtil(getAstFactory());
        const value = evalConstantExpression(expr, ctx, util, {
            maxLoopIterations: 2n ** 12n,
        });
        return value;
    } catch (error) {
        if (!(error instanceof TactConstEvalError) || error.fatal) throw error;
        return expr;
    }
}

// This performs various boolean-related optimizations in conditional expressions
// in `if`, `do-until`, and `while` statements, which consider any non-zero integer as true,
// and also in the conditional expression (ternary operator).
export function writeExpressionInCondition(
    expr: Ast.Expression,
    wCtx: WriterContext,
): string {
    if (expr.kind === "op_binary") {
        const leftTy = getExpType(wCtx.ctx, expr.left);
        const rightTy = getExpType(wCtx.ctx, expr.right);
        const left = constEval(expr.left, wCtx.ctx);
        const right = constEval(expr.right, wCtx.ctx);

        // Zero inequality comparison optimization for non-optional integers
        if (
            leftTy.kind === "ref" &&
            leftTy.name === "Int" &&
            !leftTy.optional &&
            rightTy.kind === "ref" &&
            rightTy.name === "Int" &&
            !rightTy.optional
        ) {
            if (expr.op === "!=") {
                if (right.kind === "number" && right.value === 0n) {
                    // left != 0
                    return `(${writeExpression(left, wCtx)})`;
                } else if (left.kind === "number" && left.value === 0n) {
                    // 0 != right
                    return `(${writeExpression(right, wCtx)})`;
                }
            }
        }
    }
    // fallback: no optimization found
    return writeExpression(expr, wCtx);
}

export function writeTypescriptValue(
    ctx: CompilerContext,
    val: Ast.Literal | undefined,
    type: TypeRef,
    loc: SrcInfo,
): string | undefined {
    if (typeof val === "undefined") return undefined;

    switch (val.kind) {
        case "number":
            return val.value.toString(10) + "n";
        case "string":
            return JSON.stringify(val.value);
        case "boolean":
            return val.value ? "true" : "false";
        case "address":
            return `address("${val.value.toString()}")`;
        case "cell":
            return `Cell.fromHex("${val.value.toBoc().toString("hex")}")`;
        case "slice":
            return `Cell.fromHex("${val.value.asCell().toBoc().toString("hex")}").beginParse()`;
        case "null":
            return "null";
        case "struct_value": {
            if (type.kind !== "ref") {
                throwInternalCompilerError("Map value must have map type");
            }
            const typeName = val.type.text;
            const structType = getType(ctx, type.name);
            const args = val.args
                .map((it) => {
                    const field = structType.fields.find(
                        (field) => field.name === it.field.text,
                    );
                    if (typeof field === "undefined") {
                        throwInternalCompilerError(
                            `Field "${it.field.text}" not found in type`,
                        );
                    }
                    return (
                        it.field.text +
                        ": " +
                        writeTypescriptValue(
                            ctx,
                            it.initializer,
                            field.type,
                            field.loc,
                        )
                    );
                })
                .join(", ");
            return `{ $$type: "${typeName}" as const, ${args} }`;
        }
        case "map_value": {
            if (type.kind !== "map") {
                throwInternalCompilerError("Map value must have map type");
            }
            const res = mapSerializers.abiMatcher(getMapAbi(type, loc));
            if (res === null) {
                throwInternalCompilerError("Wrong map ABI");
            }
            const keyType = getKeyParser(res.key);
            const valueType = getValueParser(res.value);
            return `Dictionary.loadDirect(${keyType}, ${valueType}, Cell.fromHex("${val.bocHex}").beginParse())`;
        }
    }
}
