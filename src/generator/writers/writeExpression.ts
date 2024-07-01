import {
    ASTExpression,
    AstId,
    eqNames,
    idText,
    tryExtractPath,
} from "../../grammar/ast";
import { TactConstEvalError, throwCompilationError } from "../../errors";
import { getExpType } from "../../types/resolveExpression";
import {
    getStaticConstant,
    getStaticFunction,
    getType,
    hasStaticConstant,
} from "../../types/resolveDescriptors";
import {
    FieldDescription,
    printTypeRef,
    TypeDescription,
    CommentValue,
    Value,
} from "../../types/types";
import { WriterContext } from "../Writer";
import { resolveFuncTypeUnpack } from "./resolveFuncTypeUnpack";
import { MapFunctions } from "../../abi/map";
import { GlobalFunctions } from "../../abi/global";
import { funcIdOf } from "./id";
import { StructFunctions } from "../../abi/struct";
import { resolveFuncType } from "./resolveFuncType";
import { Address, Cell } from "@ton/core";
import {
    writeAddress,
    writeCell,
    writeComment,
    writeString,
} from "./writeConstant";
import { ops } from "./ops";
import { writeCastedExpression } from "./writeFunction";
import { evalConstantExpression } from "../../constEval";

function isNull(f: ASTExpression): boolean {
    return f.kind === "null";
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
                    return writeValue(v.default, ctx);
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

export function writeValue(val: Value, wCtx: WriterContext): string {
    if (typeof val === "bigint") {
        return val.toString(10);
    }
    if (typeof val === "string") {
        const id = writeString(val, wCtx);
        wCtx.used(id);
        return `${id}()`;
    }
    if (typeof val === "boolean") {
        return val ? "true" : "false";
    }
    if (Address.isAddress(val)) {
        const res = writeAddress(val, wCtx);
        wCtx.used(res);
        return res + "()";
    }
    if (val instanceof Cell) {
        const res = writeCell(val, wCtx);
        wCtx.used(res);
        return `${res}()`;
    }
    if (val === null) {
        return "null()";
    }
    if (val instanceof CommentValue) {
        const id = writeComment(val.comment, wCtx);
        wCtx.used(id);
        return `${id}()`;
    }
    if (typeof val === "object" && val !== null && "$tactStruct" in val) {
        // this is a struct value
        const structDescription = getType(
            wCtx.ctx,
            val["$tactStruct"] as string,
        );
        const fields = structDescription.fields.map((field) => field.name);
        const id = writeStructConstructor(structDescription, fields, wCtx);
        wCtx.used(id);
        const fieldValues = structDescription.fields.map((field) => {
            if (field.name in val) {
                return writeValue(val[field.name], wCtx);
            } else {
                throw Error(
                    `Struct value is missing a field: ${field.name}`,
                    val,
                );
            }
        });
        return `${id}(${fieldValues.join(", ")})`;
    }
    throw Error("Invalid value", val);
}

export function writePathExpression(path: AstId[]): string {
    return [funcIdOf(path[0].text), ...path.slice(1).map((id) => id.text)].join(
        `'`,
    );
}

export function writeExpression(f: ASTExpression, wCtx: WriterContext): string {
    // literals and constant expressions are covered here
    try {
        const value = evalConstantExpression(f, wCtx.ctx);
        return writeValue(value, wCtx);
    } catch (error) {
        if (!(error instanceof TactConstEvalError) || error.fatal) throw error;
    }

    //
    // ID Reference
    //

    if (f.kind === "id") {
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
            return writeValue(c.value!, wCtx);
        }

        return funcIdOf(f.text);
    }

    // NOTE: We always wrap in parentheses to avoid operator precedence issues
    if (f.kind === "op_binary") {
        // Special case for non-integer types and nullable
        if (f.op === "==" || f.op === "!=") {
            if (isNull(f.left) && isNull(f.right)) {
                if (f.op === "==") {
                    return "true";
                } else {
                    return "false";
                }
            } else if (isNull(f.left) && !isNull(f.right)) {
                if (f.op === "==") {
                    return `null?(${writeExpression(f.right, wCtx)})`;
                } else {
                    return `(~ null?(${writeExpression(f.right, wCtx)}))`;
                }
            } else if (!isNull(f.left) && isNull(f.right)) {
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
            let prefix = "";
            if (f.op == "!=") {
                prefix = "~ ";
            }
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
            wCtx.used(`__tact_slice_eq_bits`);
            return `( ${prefix}__tact_slice_eq_bits(${writeExpression(f.right, wCtx)}, ${writeExpression(f.left, wCtx)}) )`;
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
            const file = f.ref.file;
            const loc_info = f.ref.interval.getLineAndColumn();
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
        let op: string;
        if (f.op === "*") {
            op = "*";
        } else if (f.op === "/") {
            op = "/";
        } else if (f.op === "%") {
            op = "%";
        } else if (f.op === "+") {
            op = "+";
        } else if (f.op === "-") {
            op = "-";
        } else if (f.op === "<") {
            op = "<";
        } else if (f.op === "<=") {
            op = "<=";
        } else if (f.op === ">") {
            op = ">";
        } else if (f.op === ">=") {
            op = ">=";
        } else if (f.op === "<<") {
            op = "<<";
        } else if (f.op === ">>") {
            op = ">>";
        } else if (f.op === "&") {
            op = "&";
        } else if (f.op === "|") {
            op = "|";
        } else if (f.op === "^") {
            op = "^";
        } else {
            throwCompilationError(`Unknown binary operator: ${f.op}`, f.ref);
        }
        return (
            "(" +
            writeExpression(f.left, wCtx) +
            " " +
            op +
            " " +
            writeExpression(f.right, wCtx) +
            ")"
        );
    }

    //
    // Unary operations: !, -, +, !!
    // NOTE: We always wrap in parenthesis to avoid operator precedence issues
    //

    if (f.kind === "op_unary") {
        // NOTE: Logical not is written as a bitwise not
        if (f.op === "!") {
            return "(~ " + writeExpression(f.right, wCtx) + ")";
        }

        if (f.op === "~") {
            return "(~ " + writeExpression(f.right, wCtx) + ")";
        }

        if (f.op === "-") {
            return "(- " + writeExpression(f.right, wCtx) + ")";
        }

        if (f.op === "+") {
            return "(+ " + writeExpression(f.right, wCtx) + ")";
        }

        // NOTE: Assert function that ensures that the value is not null
        if (f.op === "!!") {
            const t = getExpType(wCtx.ctx, f.right);
            if (t.kind === "ref") {
                const tt = getType(wCtx.ctx, t.name);
                if (tt.kind === "struct") {
                    return `${ops.typeNotNull(tt.name, wCtx)}(${writeExpression(f.right, wCtx)})`;
                }
            }

            wCtx.used("__tact_not_null");
            return `${wCtx.used("__tact_not_null")}(${writeExpression(f.right, wCtx)})`;
        }

        throwCompilationError(`Unknown unary operator: ${f.op}`, f.ref);
    }

    //
    // Field Access
    // NOTE: this branch resolves "a.b", where "a" is an expression and "b" is a field name
    //

    if (f.kind === "op_field") {
        // Resolve the type of the expression
        const src = getExpType(wCtx.ctx, f.src);
        if (
            src === null ||
            ((src.kind !== "ref" || src.optional) && src.kind !== "ref_bounced")
        ) {
            throwCompilationError(
                `Cannot access field of non-struct type: "${printTypeRef(src)}"`,
                f.ref,
            );
        }
        const srcT = getType(wCtx.ctx, src.name);

        // Resolve field
        let fields: FieldDescription[];

        fields = srcT.fields;
        if (src.kind === "ref_bounced") {
            fields = fields.slice(0, srcT.partialFieldCount);
        }

        const field = fields.find((v) => v.name === f.name.text)!;
        const cst = srcT.constants.find((v) => v.name === f.name.text)!;
        if (!field && !cst) {
            throwCompilationError(
                `Cannot find field "${f.name.text}" in struct "${srcT.name}"`,
                f.name.ref,
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
            return `${ops.typeField(srcT.name, field.name, wCtx)}(${writeExpression(f.src, wCtx)})`;
        } else {
            return writeValue(cst.value!, wCtx);
        }
    }

    //
    // Static Function Call
    //

    if (f.kind === "op_static_call") {
        // Check global functions
        if (GlobalFunctions.has(idText(f.name))) {
            return GlobalFunctions.get(idText(f.name))!.generate(
                wCtx,
                f.args.map((v) => getExpType(wCtx.ctx, v)),
                f.args,
                f.ref,
            );
        }

        const sf = getStaticFunction(wCtx.ctx, idText(f.name));
        let n = ops.global(idText(f.name));
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
                    writeCastedExpression(a, sf.params[i].type, wCtx),
                )
                .join(", ") +
            ")"
        );
    }

    //
    // Struct Constructor
    //

    if (f.kind === "op_new") {
        const src = getType(wCtx.ctx, f.type);

        // Write a constructor
        const id = writeStructConstructor(
            src,
            f.args.map((v) => idText(v.name)),
            wCtx,
        );
        wCtx.used(id);

        // Write an expression
        const expressions = f.args.map(
            (v) =>
                writeCastedExpression(
                    v.exp,
                    src.fields.find((v2) => eqNames(v2.name, v.name))!.type,
                    wCtx,
                ),
            wCtx,
        );
        return `${id}(${expressions.join(", ")})`;
    }

    //
    // Object-based function call
    //

    if (f.kind === "op_call") {
        // Resolve source type
        const src = getExpType(wCtx.ctx, f.src);
        if (src === null) {
            throwCompilationError(
                `Cannot call function of non - direct type: "${printTypeRef(src)}"`,
                f.ref,
            );
        }

        // Reference type
        if (src.kind === "ref") {
            if (src.optional) {
                throwCompilationError(
                    `Cannot call function of non - direct type: "${printTypeRef(src)}"`,
                    f.ref,
                );
            }

            // Render function call
            const t = getType(wCtx.ctx, src.name);

            // Check struct ABI
            if (t.kind === "struct") {
                if (StructFunctions.has(idText(f.name))) {
                    const abi = StructFunctions.get(idText(f.name))!;
                    return abi.generate(
                        wCtx,
                        [src, ...f.args.map((v) => getExpType(wCtx.ctx, v))],
                        [f.src, ...f.args],
                        f.ref,
                    );
                }
            }

            // Resolve function
            const ff = t.functions.get(idText(f.name))!;
            let name = ops.extension(src.name, idText(f.name));
            if (ff.ast.kind === "function_def") {
                wCtx.used(name);
            } else {
                name = idText(ff.ast.nativeName);
                if (name.startsWith("__tact")) {
                    wCtx.used(name);
                }
            }

            // Render arguments
            let renderedArguments = f.args.map((a, i) =>
                writeCastedExpression(a, ff.params[i].type, wCtx),
            );

            // Hack to replace a single struct argument to a tensor wrapper since otherwise
            // func would convert (int) type to just int and break mutating functions
            if (ff.isMutating) {
                if (f.args.length === 1) {
                    const t = getExpType(wCtx.ctx, f.args[0]);
                    if (t.kind === "ref") {
                        const tt = getType(wCtx.ctx, t.name);
                        if (
                            (tt.kind === "contract" || tt.kind === "struct") &&
                            ff.params[0].type.kind === "ref" &&
                            !ff.params[0].type.optional
                        ) {
                            renderedArguments = [
                                `${ops.typeTensorCast(tt.name, wCtx)}(${renderedArguments[0]})`,
                            ];
                        }
                    }
                }
            }

            // Render
            const s = writeExpression(f.src, wCtx);
            if (ff.isMutating) {
                if (f.src.kind === "id" || f.src.kind === "op_field") {
                    return `${s}~${name}(${renderedArguments.join(", ")})`;
                } else {
                    return `${wCtx.used(ops.nonModifying(name))}(${[s, ...renderedArguments].join(", ")})`;
                }
            } else {
                return `${name}(${[s, ...renderedArguments].join(", ")})`;
            }
        }

        // Map types
        if (src.kind === "map") {
            if (!MapFunctions.has(idText(f.name))) {
                throwCompilationError(
                    `Map function "${idText(f.name)}" not found`,
                    f.ref,
                );
            }
            const abf = MapFunctions.get(idText(f.name))!;
            return abf.generate(
                wCtx,
                [src, ...f.args.map((v) => getExpType(wCtx.ctx, v))],
                [f.src, ...f.args],
                f.ref,
            );
        }

        if (src.kind === "ref_bounced") {
            throw Error("Unimplemented");
        }

        throwCompilationError(
            `Cannot call function of non - direct type: "${printTypeRef(src)}"`,
            f.ref,
        );
    }

    //
    // Init of
    //

    if (f.kind === "init_of") {
        const type = getType(wCtx.ctx, f.name);
        return `${ops.contractInitChild(idText(f.name), wCtx)}(${["__tact_context_sys", ...f.args.map((a, i) => writeCastedExpression(a, type.init!.params[i].type, wCtx))].join(", ")})`;
    }

    //
    // Ternary operator
    //

    if (f.kind === "conditional") {
        return `(${writeExpression(f.condition, wCtx)} ? ${writeExpression(f.thenBranch, wCtx)} : ${writeExpression(f.elseBranch, wCtx)})`;
    }

    //
    // Unreachable
    //

    throw Error("Unknown expression");
}
