import { CompilerContext } from "../context";
import { TactConstEvalError, throwCompilationError } from "../errors";
import { evalConstantExpression } from "../constEval";
import { resolveFuncTypeUnpack } from "./type";
import { MapFunctions, StructFunctions, GlobalFunctions } from "./abi";
import { getExpType } from "../types/resolveExpression";
import { cast, funcIdOf, ops } from "./util";
import { printTypeRef, TypeRef, Value } from "../types/types";
import {
    getStaticConstant,
    getType,
    getStaticFunction,
    hasStaticConstant,
} from "../types/resolveDescriptors";
import { idText, AstExpression } from "../grammar/ast";
import { FuncAstExpr, FuncAstIdExpr, FuncAstCallExpr } from "../func/syntax";

function isNull(f: AstExpression): boolean {
    return f.kind === "null";
}

/**
 * Encapsulates generation of Func expressions from the Tact expression.
 */
export class ExpressionGen {
    /**
     * @param tactExpr Expression to translate.
     */
    private constructor(
        private ctx: CompilerContext,
        private tactExpr: AstExpression,
    ) {}

    static fromTact(
        ctx: CompilerContext,
        tactExpr: AstExpression,
    ): ExpressionGen {
        return new ExpressionGen(ctx, tactExpr);
    }

    /***
     * Generates FunC literals from Tact ones.
     */
    private writeValue(val: Value): FuncAstExpr {
        if (typeof val === "bigint") {
            return { kind: "number_expr", value: val };
        }
        // if (typeof val === "string") {
        //     const id = writeString(val, wCtx);
        //     wCtx.used(id);
        //     return `${id}()`;
        // }
        if (typeof val === "boolean") {
            return { kind: "bool_expr", value: val };
        }
        // if (Address.isAddress(val)) {
        //     const res = writeAddress(val, wCtx);
        //     wCtx.used(res);
        //     return res + "()";
        // }
        // if (val instanceof Cell) {
        //     const res = writeCell(val, wCtx);
        //     wCtx.used(res);
        //     return `${res}()`;
        // }
        if (val === null) {
            return { kind: "nil_expr" };
        }
        // if (val instanceof CommentValue) {
        //     const id = writeComment(val.comment, wCtx);
        //     wCtx.used(id);
        //     return `${id}()`;
        // }
        // if (typeof val === "object" && "$tactStruct" in val) {
        //     // this is a struct value
        //     const structDescription = getType(
        //         wCtx.ctx,
        //         val["$tactStruct"] as string,
        //     );
        //     const fields = structDescription.fields.map((field) => field.name);
        //     const id = writeStructConstructor(structDescription, fields, wCtx);
        //     wCtx.used(id);
        //     const fieldValues = structDescription.fields.map((field) => {
        //         if (field.name in val) {
        //             return writeValue(val[field.name]!, wCtx);
        //         } else {
        //             throw Error(
        //                 `Struct value is missing a field: ${field.name}`,
        //                 val,
        //             );
        //         }
        //     });
        //     return `${id}(${fieldValues.join(", ")})`;
        // }
        throw Error(`Invalid value: ${val}`);
    }

    public writeExpression(): FuncAstExpr {
        // literals and constant expressions are covered here
        try {
            const value = evalConstantExpression(this.tactExpr, this.ctx);
            return this.writeValue(value);
        } catch (error) {
            if (!(error instanceof TactConstEvalError) || error.fatal)
                throw error;
        }

        //
        // ID Reference
        //
        if (this.tactExpr.kind === "id") {
            const t = getExpType(this.ctx, this.tactExpr);

            // Handle packed type
            if (t.kind === "ref") {
                const tt = getType(this.ctx, t.name);
                if (tt.kind === "contract" || tt.kind === "struct") {
                    const value = resolveFuncTypeUnpack(
                        this.ctx,
                        t,
                        funcIdOf(this.tactExpr.text),
                    );
                    return { kind: "id_expr", value };
                }
            }

            if (t.kind === "ref_bounced") {
                const tt = getType(this.ctx, t.name);
                if (tt.kind === "struct") {
                    const value = resolveFuncTypeUnpack(
                        this.ctx,
                        t,
                        funcIdOf(this.tactExpr.text),
                        false,
                        true,
                    );
                }
            }

            // Handle constant
            if (hasStaticConstant(this.ctx, this.tactExpr.text)) {
                const c = getStaticConstant(this.ctx, this.tactExpr.text);
                return this.writeValue(c.value!);
            }

            const value = funcIdOf(this.tactExpr.text);
            return { kind: "id_expr", value };
        }

        // NOTE: We always wrap in parentheses to avoid operator precedence issues
        if (this.tactExpr.kind === "op_binary") {
            const negate: (expr: FuncAstExpr) => FuncAstExpr = (expr) => ({
                kind: "unary_expr",
                op: "~",
                value: expr,
            });

            // Special case for non-integer types and nullable
            if (this.tactExpr.op === "==" || this.tactExpr.op === "!=") {
                // TODO: Simplify.
                if (isNull(this.tactExpr.left) && isNull(this.tactExpr.right)) {
                    return {
                        kind: "bool_expr",
                        value: this.tactExpr.op === "==",
                    };
                } else if (
                    isNull(this.tactExpr.left) &&
                    !isNull(this.tactExpr.right)
                ) {
                    const fun = { kind: "id_expr", value: "null?" };
                    const args = [
                        ExpressionGen.fromTact(
                            this.ctx,
                            this.tactExpr.right,
                        ).writeExpression(),
                    ];
                    const call = {
                        kind: "call_expr",
                        fun,
                        args,
                    } as FuncAstCallExpr;
                    return this.tactExpr.op === "==" ? call : negate(call);
                } else if (
                    !isNull(this.tactExpr.left) &&
                    isNull(this.tactExpr.right)
                ) {
                    const fun = { kind: "id_expr", value: "null?" };
                    const args = [
                        ExpressionGen.fromTact(
                            this.ctx,
                            this.tactExpr.left,
                        ).writeExpression(),
                    ];
                    const call = {
                        kind: "call_expr",
                        fun,
                        args,
                    } as FuncAstCallExpr;
                    return this.tactExpr.op === "==" ? call : negate(call);
                }
            }

            // Special case for address
            const lt = getExpType(this.ctx, this.tactExpr.left);
            const rt = getExpType(this.ctx, this.tactExpr.right);

            // Case for addresses equality
            if (
                lt.kind === "ref" &&
                rt.kind === "ref" &&
                lt.name === "Address" &&
                rt.name === "Address"
            ) {
                if (lt.optional && rt.optional) {
                    // wCtx.used(`__tact_slice_eq_bits_nullable`);
                    const fun = {
                        kind: "id_expr",
                        value: "__tact_slice_eq_bits_nullable",
                    };
                    const args = [
                        ExpressionGen.fromTact(
                            this.ctx,
                            this.tactExpr.left,
                        ).writeExpression(),
                        ExpressionGen.fromTact(
                            this.ctx,
                            this.tactExpr.right,
                        ).writeExpression(),
                    ];
                    const call = {
                        kind: "call_expr",
                        fun,
                        args,
                    } as FuncAstCallExpr;
                    return this.tactExpr.op == "!=" ? negate(call) : call;
                }
                //     if (lt.optional && !rt.optional) {
                //         // wCtx.used(`__tact_slice_eq_bits_nullable_one`);
                //         return `( ${prefix}__tact_slice_eq_bits_nullable_one(${writeExpression(f.left, wCtx)}, ${writeExpression(f.right, wCtx)}) )`;
                //     }
                //     if (!lt.optional && rt.optional) {
                //         // wCtx.used(`__tact_slice_eq_bits_nullable_one`);
                //         return `( ${prefix}__tact_slice_eq_bits_nullable_one(${writeExpression(f.right, wCtx)}, ${writeExpression(f.left, wCtx)}) )`;
                //     }
                //     // wCtx.used(`__tact_slice_eq_bits`);
                //     return `( ${prefix}__tact_slice_eq_bits(${writeExpression(f.right, wCtx)}, ${writeExpression(f.left, wCtx)}) )`;
                // }
                //
                // // Case for cells equality
                // if (
                //     lt.kind === "ref" &&
                //     rt.kind === "ref" &&
                //     lt.name === "Cell" &&
                //     rt.name === "Cell"
                // ) {
                //     const op = f.op === "==" ? "eq" : "neq";
                //     if (lt.optional && rt.optional) {
                //         wCtx.used(`__tact_cell_${op}_nullable`);
                //         return `__tact_cell_${op}_nullable(${writeExpression(f.left, wCtx)}, ${writeExpression(f.right, wCtx)})`;
                //     }
                //     if (lt.optional && !rt.optional) {
                //         wCtx.used(`__tact_cell_${op}_nullable_one`);
                //         return `__tact_cell_${op}_nullable_one(${writeExpression(f.left, wCtx)}, ${writeExpression(f.right, wCtx)})`;
                //     }
                //     if (!lt.optional && rt.optional) {
                //         wCtx.used(`__tact_cell_${op}_nullable_one`);
                //         return `__tact_cell_${op}_nullable_one(${writeExpression(f.right, wCtx)}, ${writeExpression(f.left, wCtx)})`;
                //     }
                //     wCtx.used(`__tact_cell_${op}`);
                //     return `__tact_cell_${op}(${writeExpression(f.right, wCtx)}, ${writeExpression(f.left, wCtx)})`;
                // }
                //
                // // Case for slices and strings equality
                // if (
                //     lt.kind === "ref" &&
                //     rt.kind === "ref" &&
                //     lt.name === rt.name &&
                //     (lt.name === "Slice" || lt.name === "String")
                // ) {
                //     const op = f.op === "==" ? "eq" : "neq";
                //     if (lt.optional && rt.optional) {
                //         wCtx.used(`__tact_slice_${op}_nullable`);
                //         return `__tact_slice_${op}_nullable(${writeExpression(f.left, wCtx)}, ${writeExpression(f.right, wCtx)})`;
                //     }
                //     if (lt.optional && !rt.optional) {
                //         wCtx.used(`__tact_slice_${op}_nullable_one`);
                //         return `__tact_slice_${op}_nullable_one(${writeExpression(f.left, wCtx)}, ${writeExpression(f.right, wCtx)})`;
                //     }
                //     if (!lt.optional && rt.optional) {
                //         wCtx.used(`__tact_slice_${op}_nullable_one`);
                //         return `__tact_slice_${op}_nullable_one(${writeExpression(f.right, wCtx)}, ${writeExpression(f.left, wCtx)})`;
                //     }
                //     wCtx.used(`__tact_slice_${op}`);
                //     return `__tact_slice_${op}(${writeExpression(f.right, wCtx)}, ${writeExpression(f.left, wCtx)})`;
                // }
                //
                // // Case for maps equality
                // if (lt.kind === "map" && rt.kind === "map") {
                //     const op = f.op === "==" ? "eq" : "neq";
                //     wCtx.used(`__tact_cell_${op}_nullable`);
                //     return `__tact_cell_${op}_nullable(${writeExpression(f.left, wCtx)}, ${writeExpression(f.right, wCtx)})`;
                // }
                //
                // // Check for int or boolean types
                // if (
                //     lt.kind !== "ref" ||
                //     rt.kind !== "ref" ||
                //     (lt.name !== "Int" && lt.name !== "Bool") ||
                //     (rt.name !== "Int" && rt.name !== "Bool")
                // ) {
                //     const file = f.loc.file;
                //     const loc_info = f.loc.interval.getLineAndColumn();
                //     throw Error(
                //         `(Internal Compiler Error) Invalid types for binary operation: ${file}:${loc_info.lineNum}:${loc_info.colNum}`,
                //     ); // Should be unreachable
                // }
                //
                // // Case for ints equality
                // if (f.op === "==" || f.op === "!=") {
                //     const op = f.op === "==" ? "eq" : "neq";
                //     if (lt.optional && rt.optional) {
                //         wCtx.used(`__tact_int_${op}_nullable`);
                //         return `__tact_int_${op}_nullable(${writeExpression(f.left, wCtx)}, ${writeExpression(f.right, wCtx)})`;
                //     }
                //     if (lt.optional && !rt.optional) {
                //         wCtx.used(`__tact_int_${op}_nullable_one`);
                //         return `__tact_int_${op}_nullable_one(${writeExpression(f.left, wCtx)}, ${writeExpression(f.right, wCtx)})`;
                //     }
                //     if (!lt.optional && rt.optional) {
                //         wCtx.used(`__tact_int_${op}_nullable_one`);
                //         return `__tact_int_${op}_nullable_one(${writeExpression(f.right, wCtx)}, ${writeExpression(f.left, wCtx)})`;
                //     }
                //     if (f.op === "==") {
                //         return `(${writeExpression(f.left, wCtx)} == ${writeExpression(f.right, wCtx)})`;
                //     } else {
                //         return `(${writeExpression(f.left, wCtx)} != ${writeExpression(f.right, wCtx)})`;
                //     }
                // }
                //
                // // Case for "&&" operator
                // if (f.op === "&&") {
                //     return `( (${writeExpression(f.left, wCtx)}) ? (${writeExpression(f.right, wCtx)}) : (false) )`;
                // }
                //
                // // Case for "||" operator
                // if (f.op === "||") {
                //     return `( (${writeExpression(f.left, wCtx)}) ? (true) : (${writeExpression(f.right, wCtx)}) )`;
                // }
                //
                // // Other ops
                // return (
                //     "(" +
                //     writeExpression(f.left, wCtx) +
                //     " " +
                //     f.op +
                //     " " +
                //     writeExpression(f.right, wCtx) +
                //     ")"
                // );
                throw new Error("NYI");
            }
        }

        //     //
        //     // Unary operations: !, -, +, !!
        //     // NOTE: We always wrap in parenthesis to avoid operator precedence issues
        //     //
        //
        //     if (f.kind === "op_unary") {
        //         // NOTE: Logical not is written as a bitwise not
        //         switch (f.op) {
        //             case "!": {
        //                 return "(~ " + writeExpression(f.operand, wCtx) + ")";
        //             }
        //
        //             case "~": {
        //                 return "(~ " + writeExpression(f.operand, wCtx) + ")";
        //             }
        //
        //             case "-": {
        //                 return "(- " + writeExpression(f.operand, wCtx) + ")";
        //             }
        //
        //             case "+": {
        //                 return "(+ " + writeExpression(f.operand, wCtx) + ")";
        //             }
        //
        //             // NOTE: Assert function that ensures that the value is not null
        //             case "!!": {
        //                 const t = getExpType(wCtx.ctx, f.operand);
        //                 if (t.kind === "ref") {
        //                     const tt = getType(wCtx.ctx, t.name);
        //                     if (tt.kind === "struct") {
        //                         return `${ops.typeNotNull(tt.name, wCtx)}(${writeExpression(f.operand, wCtx)})`;
        //                     }
        //                 }
        //
        //                 wCtx.used("__tact_not_null");
        //                 return `${wCtx.used("__tact_not_null")}(${writeExpression(f.operand, wCtx)})`;
        //             }
        //         }
        //     }
        //
        //     //
        //     // Field Access
        //     // NOTE: this branch resolves "a.b", where "a" is an expression and "b" is a field name
        //     //
        //
        //     if (f.kind === "field_access") {
        //         // Resolve the type of the expression
        //         const src = getExpType(wCtx.ctx, f.aggregate);
        //         if (
        //             (src.kind !== "ref" || src.optional) &&
        //             src.kind !== "ref_bounced"
        //         ) {
        //             throwCompilationError(
        //                 `Cannot access field of non-struct type: "${printTypeRef(src)}"`,
        //                 f.loc,
        //             );
        //         }
        //         const srcT = getType(wCtx.ctx, src.name);
        //
        //         // Resolve field
        //         let fields: FieldDescription[];
        //
        //         fields = srcT.fields;
        //         if (src.kind === "ref_bounced") {
        //             fields = fields.slice(0, srcT.partialFieldCount);
        //         }
        //
        //         const field = fields.find((v) => eqNames(v.name, f.field));
        //         const cst = srcT.constants.find((v) => eqNames(v.name, f.field));
        //         if (!field && !cst) {
        //             throwCompilationError(
        //                 `Cannot find field ${idTextErr(f.field)} in struct ${idTextErr(srcT.name)}`,
        //                 f.field.loc,
        //             );
        //         }
        //
        //         if (field) {
        //             // Trying to resolve field as a path
        //             const path = tryExtractPath(f);
        //             if (path) {
        //                 // Prepare path
        //                 const idd = writePathExpression(path);
        //
        //                 // Special case for structs
        //                 if (field.type.kind === "ref") {
        //                     const ft = getType(wCtx.ctx, field.type.name);
        //                     if (ft.kind === "struct" || ft.kind === "contract") {
        //                         return resolveFuncTypeUnpack(field.type, idd, wCtx);
        //                     }
        //                 }
        //
        //                 return idd;
        //             }
        //
        //             // Getter instead of direct field access
        //             return `${ops.typeField(srcT.name, field.name, wCtx)}(${writeExpression(f.aggregate, wCtx)})`;
        //         } else {
        //             return writeValue(cst!.value!, wCtx);
        //         }
        //     }
        //

        //
        // Static Function Call
        //
        if (this.tactExpr.kind === "static_call") {
            // Check global functions
            if (GlobalFunctions.has(idText(this.tactExpr.function))) {
                return GlobalFunctions.get(
                    idText(this.tactExpr.function),
                )!.generate(
                    this.tactExpr.args.map((v) => getExpType(this.ctx, v)),
                    this.tactExpr.args,
                    this.tactExpr.loc,
                );
            }

            const sf = getStaticFunction(
                this.ctx,
                idText(this.tactExpr.function),
            );
            // if (sf.ast.kind === "native_function_decl") {
            //     n = idText(sf.ast.nativeName);
            //     if (n.startsWith("__tact")) {
            //         // wCtx.used(n);
            //     }
            // } else {
            //     // wCtx.used(n);
            // }
            const fun = {
                kind: "id_expr",
                value: ops.global(idText(this.tactExpr.function)),
            } as FuncAstIdExpr;
            const args = this.tactExpr.args.map((argAst, i) =>
                ExpressionGen.fromTact(this.ctx, argAst).writeCastedExpression(
                    sf.params[i]!.type,
                ),
            );
            return { kind: "call_expr", fun, args };
        }

        //
        //     //
        //     // Struct Constructor
        //     //
        //
        //     if (f.kind === "struct_instance") {
        //         const src = getType(wCtx.ctx, f.type);
        //
        //         // Write a constructor
        //         const id = writeStructConstructor(
        //             src,
        //             f.args.map((v) => idText(v.field)),
        //             wCtx,
        //         );
        //         wCtx.used(id);
        //
        //         // Write an expression
        //         const expressions = f.args.map(
        //             (v) =>
        //                 writeCastedExpression(
        //                     v.initializer,
        //                     src.fields.find((v2) => eqNames(v2.name, v.field))!
        //                         .type,
        //                     wCtx,
        //                 ),
        //             wCtx,
        //         );
        //         return `${id}(${expressions.join(", ")})`;
        //     }
        //
        //
        // Object-based function call
        //
        if (this.tactExpr.kind === "method_call") {
            // Resolve source type
            const src = getExpType(this.ctx, this.tactExpr.self);

            // Reference type
            if (src.kind === "ref") {
                if (src.optional) {
                    throwCompilationError(
                        `Cannot call function of non - direct type: "${printTypeRef(src)}"`,
                        this.tactExpr.loc,
                    );
                }

                // Render function call
                const methodTy = getType(this.ctx, src.name);

                // Check struct ABI
                if (methodTy.kind === "struct") {
                    if (StructFunctions.has(idText(this.tactExpr.method))) {
                        console.log(`getting ${idText(this.tactExpr.method)}`);
                        const abi = StructFunctions.get(
                            idText(this.tactExpr.method),
                        )!;
                        // return abi.generate(
                        //     wCtx,
                        //     [
                        //         src,
                        //         ...this.tactExpr.args.map((v) => getExpType(this.ctx, v)),
                        //     ],
                        //     [this.tactExpr.self, ...this.tactExpr.args],
                        //     this.tactExpr.loc,
                        // );
                    }
                }

                // Resolve function
                const methodFun = methodTy.functions.get(
                    idText(this.tactExpr.method),
                )!;
                let name = ops.extension(
                    src.name,
                    idText(this.tactExpr.method),
                );
                if (
                    methodFun.ast.kind === "function_def" ||
                    methodFun.ast.kind === "function_decl"
                ) {
                    // wCtx.used(name);
                } else {
                    name = idText(methodFun.ast.nativeName);
                    if (name.startsWith("__tact")) {
                        // wCtx.used(name);
                    }
                }

                // Translate arguments
                let argExprs = this.tactExpr.args.map((a, i) =>
                    ExpressionGen.fromTact(this.ctx, a).writeCastedExpression(
                        methodFun.params[i]!.type,
                    ),
                );

                // Hack to replace a single struct argument to a tensor wrapper since otherwise
                // func would convert (int) type to just int and break mutating functions
                if (methodFun.isMutating) {
                    if (this.tactExpr.args.length === 1) {
                        const t = getExpType(this.ctx, this.tactExpr.args[0]!);
                        if (t.kind === "ref") {
                            const tt = getType(this.ctx, t.name);
                            if (
                                (tt.kind === "contract" ||
                                    tt.kind === "struct") &&
                                methodFun.params[0]!.type.kind === "ref" &&
                                !methodFun.params[0]!.type.optional
                            ) {
                                const fun = {
                                    kind: "id_expr",
                                    value: ops.typeTensorCast(tt.name),
                                } as FuncAstIdExpr;
                                argExprs = [
                                    {
                                        kind: "call_expr",
                                        fun,
                                        args: [argExprs[0]!],
                                    },
                                ];
                            }
                        }
                    }
                }

                // Generate function call
                const selfExpr = ExpressionGen.fromTact(
                    this.ctx,
                    this.tactExpr.self,
                ).writeExpression();
                if (methodFun.isMutating) {
                    if (
                        this.tactExpr.self.kind === "id" ||
                        this.tactExpr.self.kind === "field_access"
                    ) {
                        if (selfExpr.kind !== "id_expr") {
                            throw new Error(
                                `Impossible self kind: ${selfExpr.kind}`,
                            );
                        }
                        const fun = {
                            kind: "id_expr",
                            value: `${selfExpr}~${name}`,
                        } as FuncAstIdExpr;
                        return { kind: "call_expr", fun, args: argExprs };
                    } else {
                        const fun = {
                            kind: "id_expr",
                            value: ops.nonModifying(name),
                        } as FuncAstIdExpr;
                        return {
                            kind: "call_expr",
                            fun,
                            args: [selfExpr, ...argExprs],
                        };
                    }
                } else {
                    const fun = {
                        kind: "id_expr",
                        value: name,
                    } as FuncAstIdExpr;
                    return {
                        kind: "call_expr",
                        fun,
                        args: [selfExpr, ...argExprs],
                    };
                }
            }

            // Map types
            if (src.kind === "map") {
                if (!MapFunctions.has(idText(this.tactExpr.method))) {
                    throwCompilationError(
                        `Map function "${idText(this.tactExpr.method)}" not found`,
                        this.tactExpr.loc,
                    );
                }
                const abf = MapFunctions.get(idText(this.tactExpr.method))!;
                return abf.generate(
                    [
                        src,
                        ...this.tactExpr.args.map((v) =>
                            getExpType(this.ctx, v),
                        ),
                    ],
                    [this.tactExpr.self, ...this.tactExpr.args],
                    this.tactExpr.loc,
                );
            }

            if (src.kind === "ref_bounced") {
                throw Error("Unimplemented");
            }

            throwCompilationError(
                `Cannot call function of non - direct type: "${printTypeRef(src)}"`,
                this.tactExpr.loc,
            );
        }

        //
        //     //
        //     // Init of
        //     //
        //
        //     if (f.kind === "init_of") {
        //         const type = getType(wCtx.ctx, f.contract);
        //         return `${ops.contractInitChild(idText(f.contract), wCtx)}(${["__tact_context_sys", ...f.args.map((a, i) => writeCastedExpression(a, type.init!.params[i]!.type, wCtx))].join(", ")})`;
        //     }
        //
        //     //
        //     // Ternary operator
        //     //
        //
        //     if (f.kind === "conditional") {
        //         return `(${writeExpression(f.condition, wCtx)} ? ${writeExpression(f.thenBranch, wCtx)} : ${writeExpression(f.elseBranch, wCtx)})`;
        //     }
        //
        //     //
        //     // Unreachable
        //     //
        //
        throw Error(`Unknown expression: ${this.tactExpr.kind}`);
    }

    public writeCastedExpression(to: TypeRef): FuncAstExpr {
        const expr = getExpType(this.ctx, this.tactExpr);
        return cast(this.ctx, expr, to, this.writeExpression());
    }
}
