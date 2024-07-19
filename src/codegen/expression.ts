import {
    TactConstEvalError,
    throwCompilationError,
    idTextErr,
} from "../errors";
import { evalConstantExpression } from "../constEval";
import { resolveFuncTypeUnpack } from "./type";
import { MapFunctions, StructFunctions, GlobalFunctions } from "./abi";
import { getExpType } from "../types/resolveExpression";
import { FunctionGen, CodegenContext, LiteralGen } from ".";
import { cast, funcIdOf, ops } from "./util";
import { printTypeRef, TypeRef, Value, FieldDescription } from "../types/types";
import {
    getStaticConstant,
    getType,
    getStaticFunction,
    hasStaticConstant,
} from "../types/resolveDescriptors";
import {
    idText,
    AstExpression,
    AstId,
    eqNames,
    tryExtractPath,
} from "../grammar/ast";
import { FuncAstExpr, FuncAstUnaryOp, FuncAstIdExpr } from "../func/syntax";
import {
    id,
    call,
    binop,
    ternary,
    unop,
    bool,
} from "../func/syntaxConstructors";

function isNull(f: AstExpression): boolean {
    return f.kind === "null";
}

function addUnary(op: FuncAstUnaryOp, expr: FuncAstExpr): FuncAstExpr {
    return unop(op, expr);
}

function negate(expr: FuncAstExpr): FuncAstExpr {
    return addUnary("~", expr);
}

/**
 * Creates a Func identifier in the following format: a'b'c.
 * TODO: make it a static method
 */
export function writePathExpression(path: AstId[]): FuncAstIdExpr {
    return id(
        [funcIdOf(idText(path[0]!)), ...path.slice(1).map(idText)].join(`'`),
    );
}

/**
 * Encapsulates generation of Func expressions from the Tact expression.
 */
export class ExpressionGen {
    /**
     * @param tactExpr Expression to translate.
     */
    private constructor(
        private ctx: CodegenContext,
        private tactExpr: AstExpression,
    ) {}

    static fromTact(
        ctx: CodegenContext,
        tactExpr: AstExpression,
    ): ExpressionGen {
        return new ExpressionGen(ctx, tactExpr);
    }

    public writeExpression(): FuncAstExpr {
        // literals and constant expressions are covered here
        try {
            const value = evalConstantExpression(this.tactExpr, this.ctx.ctx);
            return this.makeValue(value);
        } catch (error) {
            if (!(error instanceof TactConstEvalError) || error.fatal)
                throw error;
        }

        //
        // ID Reference
        //
        if (this.tactExpr.kind === "id") {
            const t = getExpType(this.ctx.ctx, this.tactExpr);

            // Handle packed type
            if (t.kind === "ref") {
                const tt = getType(this.ctx.ctx, t.name);
                if (tt.kind === "contract" || tt.kind === "struct") {
                    const value = resolveFuncTypeUnpack(
                        this.ctx.ctx,
                        t,
                        funcIdOf(this.tactExpr.text),
                    );
                    return id(value);
                }
            }

            if (t.kind === "ref_bounced") {
                const tt = getType(this.ctx.ctx, t.name);
                if (tt.kind === "struct") {
                    const value = resolveFuncTypeUnpack(
                        this.ctx.ctx,
                        t,
                        funcIdOf(this.tactExpr.text),
                        false,
                        true,
                    );
                }
            }

            // Handle constant
            if (hasStaticConstant(this.ctx.ctx, this.tactExpr.text)) {
                const c = getStaticConstant(this.ctx.ctx, this.tactExpr.text);
                return this.makeValue(c.value!);
            }

            return id(funcIdOf(this.tactExpr.text));
        }

        // NOTE: We always wrap in parentheses to avoid operator precedence issues
        if (this.tactExpr.kind === "op_binary") {
            // Special case for non-integer types and nullable
            if (this.tactExpr.op === "==" || this.tactExpr.op === "!=") {
                if (isNull(this.tactExpr.left) && isNull(this.tactExpr.right)) {
                    return bool(this.tactExpr.op === "==");
                } else if (
                    isNull(this.tactExpr.left) &&
                    !isNull(this.tactExpr.right)
                ) {
                    const callExpr = call("null?", [
                        this.makeExpr(this.tactExpr.right),
                    ]);
                    return this.tactExpr.op === "=="
                        ? callExpr
                        : negate(callExpr);
                } else if (
                    !isNull(this.tactExpr.left) &&
                    isNull(this.tactExpr.right)
                ) {
                    const callExpr = call("null?", [
                        this.makeExpr(this.tactExpr.left),
                    ]);
                    return this.tactExpr.op === "=="
                        ? callExpr
                        : negate(callExpr);
                }
            }

            // Special case for address
            const lt = getExpType(this.ctx.ctx, this.tactExpr.left);
            const rt = getExpType(this.ctx.ctx, this.tactExpr.right);

            // Case for addresses equality
            if (
                lt.kind === "ref" &&
                rt.kind === "ref" &&
                lt.name === "Address" &&
                rt.name === "Address"
            ) {
                const maybeNegate = (call: any): any => {
                    if (this.tactExpr.kind !== "op_binary") {
                        throw new Error("Impossible");
                    }
                    return this.tactExpr.op == "!=" ? negate(call) : call;
                };
                if (lt.optional && rt.optional) {
                    return maybeNegate(
                        call("__tact_slice_eq_bits_nullable", [
                            this.makeExpr(this.tactExpr.left),
                            this.makeExpr(this.tactExpr.right),
                        ]),
                    );
                }
                if (lt.optional && !rt.optional) {
                    return maybeNegate(
                        call("__tact_slice_eq_bits_nullable_one", [
                            this.makeExpr(this.tactExpr.left),
                            this.makeExpr(this.tactExpr.right),
                        ]),
                    );
                }
                if (!lt.optional && rt.optional) {
                    return maybeNegate(
                        call("__tact_slice_eq_bits_nullable_one", [
                            this.makeExpr(this.tactExpr.right),
                            this.makeExpr(this.tactExpr.left),
                        ]),
                    );
                }
                return maybeNegate(
                    call("__tact_slice_eq_bits", [
                        this.makeExpr(this.tactExpr.right),
                        this.makeExpr(this.tactExpr.left),
                    ]),
                );
            }

            // Case for cells equality
            if (
                lt.kind === "ref" &&
                rt.kind === "ref" &&
                lt.name === "Cell" &&
                rt.name === "Cell"
            ) {
                const op = this.tactExpr.op === "==" ? "eq" : "neq";
                if (lt.optional && rt.optional) {
                    return call(`__tact_cell_${op}_nullable`, [
                        this.makeExpr(this.tactExpr.left),
                        this.makeExpr(this.tactExpr.right),
                    ]);
                }
                if (lt.optional && !rt.optional) {
                    return call(`__tact_cell_${op}_nullable_one`, [
                        this.makeExpr(this.tactExpr.left),
                        this.makeExpr(this.tactExpr.right),
                    ]);
                }
                if (!lt.optional && rt.optional) {
                    return call(`__tact_cell_${op}_nullable_one`, [
                        this.makeExpr(this.tactExpr.right),
                        this.makeExpr(this.tactExpr.left),
                    ]);
                }
                return call(`__tact_cell_${op}`, [
                    this.makeExpr(this.tactExpr.right),
                    this.makeExpr(this.tactExpr.left),
                ]);
            }

            // Case for slices and strings equality
            if (
                lt.kind === "ref" &&
                rt.kind === "ref" &&
                lt.name === rt.name &&
                (lt.name === "Slice" || lt.name === "String")
            ) {
                const op = this.tactExpr.op === "==" ? "eq" : "neq";
                if (lt.optional && rt.optional) {
                    return call(`__tact_slice_${op}_nullable`, [
                        this.makeExpr(this.tactExpr.left),
                        this.makeExpr(this.tactExpr.right),
                    ]);
                }
                if (lt.optional && !rt.optional) {
                    return call(`__tact_slice_${op}_nullable_one`, [
                        this.makeExpr(this.tactExpr.left),
                        this.makeExpr(this.tactExpr.right),
                    ]);
                }
                if (!lt.optional && rt.optional) {
                    return call(`__tact_slice_${op}_nullable_one`, [
                        this.makeExpr(this.tactExpr.right),
                        this.makeExpr(this.tactExpr.left),
                    ]);
                }
                return call(`__tact_slice_${op}`, [
                    this.makeExpr(this.tactExpr.right),
                    this.makeExpr(this.tactExpr.left),
                ]);
            }

            // Case for maps equality
            if (lt.kind === "map" && rt.kind === "map") {
                const op = this.tactExpr.op === "==" ? "eq" : "neq";
                return call(`__tact_cell_${op}_nullable`, [
                    this.makeExpr(this.tactExpr.left),
                    this.makeExpr(this.tactExpr.right),
                ]);
            }

            // Check for int or boolean types
            if (
                lt.kind !== "ref" ||
                rt.kind !== "ref" ||
                (lt.name !== "Int" && lt.name !== "Bool") ||
                (rt.name !== "Int" && rt.name !== "Bool")
            ) {
                const file = this.tactExpr.loc.file;
                const loc_info = this.tactExpr.loc.interval.getLineAndColumn();
                throw Error(
                    `(Internal Compiler Error) Invalid types for binary operation: ${file}:${loc_info.lineNum}:${loc_info.colNum}`,
                ); // Should be unreachable
            }

            // Case for ints equality
            if (this.tactExpr.op === "==" || this.tactExpr.op === "!=") {
                const op = this.tactExpr.op === "==" ? "eq" : "neq";
                if (lt.optional && rt.optional) {
                    return call(`__tact_int_${op}_nullable`, [
                        this.makeExpr(this.tactExpr.left),
                        this.makeExpr(this.tactExpr.right),
                    ]);
                }
                if (lt.optional && !rt.optional) {
                    return call(`__tact_int_${op}_nullable_one`, [
                        this.makeExpr(this.tactExpr.left),
                        this.makeExpr(this.tactExpr.right),
                    ]);
                }
                if (!lt.optional && rt.optional) {
                    return call(`__tact_int_${op}_nullable_one`, [
                        this.makeExpr(this.tactExpr.right),
                        this.makeExpr(this.tactExpr.left),
                    ]);
                }
                return binop(
                    this.makeExpr(this.tactExpr.left),
                    this.tactExpr.op === "==" ? "==" : "!=",
                    this.makeExpr(this.tactExpr.right),
                );
            }

            // Case for "&&" operator
            if (this.tactExpr.op === "&&") {
                const cond = this.makeExpr(this.tactExpr.left);
                const trueExpr = this.makeExpr(this.tactExpr.right);
                return ternary(cond, trueExpr, bool(false));
            }

            // Case for "||" operator
            if (this.tactExpr.op === "||") {
                const cond = this.makeExpr(this.tactExpr.left);
                const falseExpr = this.makeExpr(this.tactExpr.right);
                return ternary(cond, bool(true), falseExpr);
            }

            // Other ops
            return binop(
                this.makeExpr(this.tactExpr.left),
                this.tactExpr.op,
                this.makeExpr(this.tactExpr.right),
            );
        }

        // Unary operations: !, -, +, !!
        // NOTE: We always wrap in parenthesis to avoid operator precedence issues
        if (this.tactExpr.kind === "op_unary") {
            // NOTE: Logical not is written as a bitwise not
            switch (this.tactExpr.op) {
                case "!":
                case "~": {
                    const expr = this.makeExpr(this.tactExpr.operand);
                    return negate(expr);
                }
                case "-": {
                    const expr = this.makeExpr(this.tactExpr.operand);
                    return addUnary("-", expr);
                }
                case "+": {
                    const expr = this.makeExpr(this.tactExpr.operand);
                    return addUnary("+", expr);
                }

                // NOTE: Assert function that ensures that the value is not null
                case "!!": {
                    const t = getExpType(this.ctx.ctx, this.tactExpr.operand);
                    if (t.kind === "ref") {
                        const tt = getType(this.ctx.ctx, t.name);
                        if (tt.kind === "struct") {
                            return call(ops.typeNotNull(tt.name), [
                                this.makeExpr(this.tactExpr.operand),
                            ]);
                        }
                    }
                    return call("__tact_not_null", [
                        this.makeExpr(this.tactExpr.operand),
                    ]);
                }
            }
        }

        //
        // Field Access
        // NOTE: this branch resolves "a.b", where "a" is an expression and "b" is a field name
        //
        if (this.tactExpr.kind === "field_access") {
            // Resolve the type of the expression
            const src = getExpType(this.ctx.ctx, this.tactExpr.aggregate);
            if (
                (src.kind !== "ref" || src.optional) &&
                src.kind !== "ref_bounced"
            ) {
                throwCompilationError(
                    `Cannot access field of non-struct type: "${printTypeRef(src)}"`,
                    this.tactExpr.loc,
                );
            }
            const srcT = getType(this.ctx.ctx, src.name);

            // Resolve field
            let fields: FieldDescription[];

            fields = srcT.fields;
            if (src.kind === "ref_bounced") {
                fields = fields.slice(0, srcT.partialFieldCount);
            }

            const fieldExpr = this.tactExpr.field;
            const field = fields.find((v) => eqNames(v.name, fieldExpr));
            const cst = srcT.constants.find((v) => eqNames(v.name, fieldExpr));
            if (!field && !cst) {
                throwCompilationError(
                    `Cannot find field ${idTextErr(this.tactExpr.field)} in struct ${idTextErr(srcT.name)}`,
                    this.tactExpr.field.loc,
                );
            }

            if (field) {
                // Trying to resolve field as a path
                const path = tryExtractPath(this.tactExpr);
                if (path) {
                    // Prepare path
                    const idd = writePathExpression(path);

                    // Special case for structs
                    if (field.type.kind === "ref") {
                        const ft = getType(this.ctx.ctx, field.type.name);
                        if (ft.kind === "struct" || ft.kind === "contract") {
                            return id(
                                resolveFuncTypeUnpack(
                                    this.ctx.ctx,
                                    field.type,
                                    idd.value,
                                ),
                            );
                        }
                    }
                    return idd;
                }

                // Getter instead of direct field access
                return call(ops.typeField(srcT.name, field.name), [
                    this.makeExpr(this.tactExpr.aggregate),
                ]);
            } else {
                return this.makeValue(cst!.value!);
            }
        }

        //
        // Static Function Call
        //
        if (this.tactExpr.kind === "static_call") {
            // Check global functions
            if (GlobalFunctions.has(idText(this.tactExpr.function))) {
                return GlobalFunctions.get(
                    idText(this.tactExpr.function),
                )!.generate(
                    this.tactExpr.args.map((v) => getExpType(this.ctx.ctx, v)),
                    this.tactExpr.args,
                    this.tactExpr.loc,
                );
            }

            const sf = getStaticFunction(
                this.ctx.ctx,
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
            const fun = id(ops.global(idText(this.tactExpr.function)));
            const args = this.tactExpr.args.map((argAst, i) =>
                this.makeCastedExpr(argAst, sf.params[i]!.type),
            );
            return call(fun, args);
        }

        //
        // Struct Constructor
        //
        if (this.tactExpr.kind === "struct_instance") {
            const src = getType(this.ctx.ctx, this.tactExpr.type);

            // Write a constructor
            const constructor = FunctionGen.fromTact(
                this.ctx,
            ).writeStructConstructor(
                src,
                this.tactExpr.args.map((v) => v.field.text),
            );
            this.ctx.add("function", constructor);

            // Write an expression
            const args = this.tactExpr.args.map((v) =>
                this.makeCastedExpr(
                    v.initializer,
                    src.fields.find((v2) => eqNames(v2.name, v.field))!.type,
                ),
            );
            return call(constructor.name, args);
        }

        //
        // Object-based function call
        //
        if (this.tactExpr.kind === "method_call") {
            // Resolve source type
            const src = getExpType(this.ctx.ctx, this.tactExpr.self);

            // Reference type
            if (src.kind === "ref") {
                if (src.optional) {
                    throwCompilationError(
                        `Cannot call function of non - direct type: "${printTypeRef(src)}"`,
                        this.tactExpr.loc,
                    );
                }

                // Render function call
                const methodTy = getType(this.ctx.ctx, src.name);

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
                        //         ...this.tactExpr.args.map((v) => getExpType(this.ctx.ctx, v)),
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
                    this.makeCastedExpr(a, methodFun.params[i]!.type),
                );

                // Hack to replace a single struct argument to a tensor wrapper since otherwise
                // func would convert (int) type to just int and break mutating functions
                if (methodFun.isMutating) {
                    if (this.tactExpr.args.length === 1) {
                        const t = getExpType(
                            this.ctx.ctx,
                            this.tactExpr.args[0]!,
                        );
                        if (t.kind === "ref") {
                            const tt = getType(this.ctx.ctx, t.name);
                            if (
                                (tt.kind === "contract" ||
                                    tt.kind === "struct") &&
                                methodFun.params[0]!.type.kind === "ref" &&
                                !methodFun.params[0]!.type.optional
                            ) {
                                argExprs = [
                                    call(ops.typeTensorCast(tt.name), [
                                        argExprs[0]!,
                                    ]),
                                ];
                            }
                        }
                    }
                }

                // Generate function call
                const selfExpr = this.makeExpr(this.tactExpr.self);
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
                        return call(`${selfExpr.value}~${name}`, argExprs);
                    } else {
                        return call(ops.nonModifying(name), [
                            selfExpr,
                            ...argExprs,
                        ]);
                    }
                } else {
                    return call(name, [selfExpr, ...argExprs]);
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
                            getExpType(this.ctx.ctx, v),
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
        // Init of
        //
        if (this.tactExpr.kind === "init_of") {
            const type = getType(this.ctx.ctx, this.tactExpr.contract);
            return call(ops.contractInitChild(idText(this.tactExpr.contract)), [
                id("__tact_context_sys"),
                ...this.tactExpr.args.map((a, i) =>
                    this.makeCastedExpr(a, type.init!.params[i]!.type),
                ),
            ]);
        }

        //
        // Ternary operator
        //
        if (this.tactExpr.kind === "conditional") {
            return ternary(
                this.makeExpr(this.tactExpr.condition),
                this.makeExpr(this.tactExpr.thenBranch),
                this.makeExpr(this.tactExpr.elseBranch),
            );
        }

        //
        // Unreachable
        //
        throw Error(`Unknown expression: ${this.tactExpr.kind}`);
    }

    private makeValue(val: Value): FuncAstExpr {
        return LiteralGen.fromTact(this.ctx, val).writeValue();
    }

    private makeExpr(src: AstExpression): FuncAstExpr {
        return ExpressionGen.fromTact(this.ctx, src).writeExpression();
    }

    public writeCastedExpression(to: TypeRef): FuncAstExpr {
        const expr = getExpType(this.ctx.ctx, this.tactExpr);
        return cast(this.ctx.ctx, expr, to, this.writeExpression());
    }

    private makeCastedExpr(src: AstExpression, to: TypeRef): FuncAstExpr {
        return ExpressionGen.fromTact(this.ctx, src).writeCastedExpression(to);
    }
}
