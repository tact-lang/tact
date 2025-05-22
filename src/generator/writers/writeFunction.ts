import { enabledInline } from "@/config/features";
import type * as Ast from "@/ast/ast";
import { idOfText, idText, tryExtractPath } from "@/ast/ast-helpers";
import { getType, resolveTypeRef } from "@/types/resolveDescriptors";
import { getExpType } from "@/types/resolveExpression";
import type { FunctionDescription, TypeRef } from "@/types/types";
import type { WriterContext } from "@/generator/Writer";
import { resolveFuncPrimitive } from "@/generator/writers/resolveFuncPrimitive";
import { resolveFuncType } from "@/generator/writers/resolveFuncType";
import { resolveFuncTypeUnpack } from "@/generator/writers/resolveFuncTypeUnpack";
import { funcIdOf } from "@/generator/writers/id";
import {
    constEval,
    writeExpression,
    writeExpressionInCondition,
    writePathExpression,
} from "@/generator/writers/writeExpression";
import { cast } from "@/generator/writers/cast";
import { resolveFuncTupleType } from "@/generator/writers/resolveFuncTupleType";
import { ops } from "@/generator/writers/ops";
import { freshIdentifier } from "@/generator/writers/freshIdentifier";
import { idTextErr, throwInternalCompilerError } from "@/error/errors";
import { ppAsmShuffle } from "@/ast/ast-printer";
import { zip } from "@/utils/array";
import { binaryOperationFromAugmentedAssignOperation } from "@/ast/util";
import type { CompilerContext } from "@/context/context";

export function writeCastedExpression(
    expression: Ast.Expression,
    to: TypeRef,
    ctx: WriterContext,
) {
    const expr = getExpType(ctx.ctx, expression);
    return cast(expr, to, writeExpression(expression, ctx), ctx); // Cast for nullable
}

function unwrapExternal(
    targetName: string,
    sourceName: string,
    type: TypeRef,
    ctx: WriterContext,
) {
    if (type.kind === "ref") {
        const t = getType(ctx.ctx, type.name);
        if (t.kind === "struct" || t.kind === "contract") {
            if (type.optional) {
                ctx.append(
                    `${resolveFuncType(type, ctx)} ${targetName} = ${ops.typeFromOptTuple(t.name, ctx)}(${sourceName});`,
                );
            } else {
                ctx.append(
                    `${resolveFuncType(type, ctx)} ${targetName} = ${ops.typeFromTuple(t.name, ctx)}(${sourceName});`,
                );
            }
            return;
        } else if (t.kind === "primitive_type_decl" && t.name === "Address") {
            ctx.append(
                `${resolveFuncType(type, ctx)} ${targetName} = ${sourceName};`,
            );
            return;
        }
    }
    ctx.append(`${resolveFuncType(type, ctx)} ${targetName} = ${sourceName};`);
}

export function writeStatement(
    f: Ast.Statement,
    self: string | null,
    returns: TypeRef | null | string,
    ctx: WriterContext,
) {
    switch (f.kind) {
        case "statement_return": {
            if (f.expression) {
                if (typeof returns === "string" || returns === null) {
                    throwInternalCompilerError(
                        `Void return statement is not allowed in this context`,
                        f.loc,
                    );
                }
                // Format expression
                const result = writeCastedExpression(
                    f.expression,
                    returns,
                    ctx,
                );

                // Return
                if (self) {
                    // we introduce an intermediate return variable here
                    // to treat the case of a contract method call which
                    // can modify "self", otherwise the "self" below would
                    // contain the old state of contract, not the one
                    // updated in the "result" expression
                    const retVar = freshIdentifier("ret");
                    ctx.append(`var ${retVar} = ${result};`);
                    ctx.append(`return (${self}, ${retVar});`);
                } else {
                    ctx.append(`return ${result};`);
                }
            } else {
                if (self) {
                    ctx.append(`return (${self}, ());`);
                } else {
                    if (typeof returns === "string" && returns !== "") {
                        // save contract state
                        ctx.append(returns);
                    }
                    ctx.append(`return ();`);
                }
            }
            return;
        }
        case "statement_let": {
            // Underscore name case
            if (f.name.kind === "wildcard") {
                ctx.append(`${writeExpression(f.expression, ctx)};`);
                return;
            }

            // Contract/struct case
            const t =
                f.type === undefined
                    ? getExpType(ctx.ctx, f.expression)
                    : resolveTypeRef(ctx.ctx, f.type);

            if (t.kind === "ref") {
                const tt = getType(ctx.ctx, t.name);
                if (tt.kind === "contract" || tt.kind === "struct") {
                    if (t.optional) {
                        ctx.append(
                            `tuple ${funcIdOf(f.name)} = ${writeCastedExpression(f.expression, t, ctx)};`,
                        );
                    } else {
                        ctx.append(
                            `var ${resolveFuncTypeUnpack(t, funcIdOf(f.name), ctx)} = ${writeCastedExpression(f.expression, t, ctx)};`,
                        );
                    }
                    return;
                }
            }

            ctx.append(
                `${resolveFuncType(t, ctx)} ${funcIdOf(f.name)} = ${writeCastedExpression(f.expression, t, ctx)};`,
            );
            return;
        }
        case "statement_assign": {
            // Prepare lvalue
            const lvaluePath = tryExtractPath(f.path);
            if (lvaluePath === null) {
                // typechecker is supposed to catch this
                throwInternalCompilerError(
                    `Assignments are allowed only into path expressions, i.e. identifiers, or sequences of direct contract/struct/message accesses, like "self.foo" or "self.structure.field"`,
                    f.path.loc,
                );
            }
            const path = writePathExpression(lvaluePath);

            // Contract/struct case
            const t = getExpType(ctx.ctx, f.path);
            if (t.kind === "ref") {
                const tt = getType(ctx.ctx, t.name);
                if (tt.kind === "contract" || tt.kind === "struct") {
                    ctx.append(
                        `${resolveFuncTypeUnpack(t, path, ctx)} = ${writeCastedExpression(f.expression, t, ctx)};`,
                    );
                    return;
                }
            }

            ctx.append(
                `${path} = ${writeCastedExpression(f.expression, t, ctx)};`,
            );
            return;
        }
        case "statement_augmentedassign": {
            const lvaluePath = tryExtractPath(f.path);
            if (lvaluePath === null) {
                // typechecker is supposed to catch this
                throwInternalCompilerError(
                    `Assignments are allowed only into path expressions, i.e. identifiers, or sequences of direct contract/struct/message accesses, like "self.foo" or "self.structure.field"`,
                    f.path.loc,
                );
            }
            const path = writePathExpression(lvaluePath);
            const t = getExpType(ctx.ctx, f.path);

            if (f.op === "&&=" || f.op === "||=") {
                const rendered =
                    f.op === "&&="
                        ? `(${path} ? ${writeExpression(f.expression, ctx)} : (false))`
                        : `(${path} ? (true) : ${writeExpression(f.expression, ctx)})`;

                ctx.append(`${path} = ${cast(t, t, rendered, ctx)};`);
                return;
            }

            const op = binaryOperationFromAugmentedAssignOperation(f.op);
            ctx.append(
                `${path} = ${cast(t, t, `${path} ${op} ${writeExpression(f.expression, ctx)}`, ctx)};`,
            );
            return;
        }
        case "statement_condition": {
            writeCondition(f, self, false, returns, ctx);
            return;
        }
        case "statement_expression": {
            const exp = writeExpression(f.expression, ctx);
            if (exp === "") {
                return;
            }
            ctx.append(`${exp};`);
            return;
        }
        case "statement_while": {
            ctx.append(
                `while (${writeExpressionInCondition(f.condition, ctx)}) {`,
            );
            ctx.inIndent(() => {
                for (const s of f.statements) {
                    writeStatement(s, self, returns, ctx);
                }
            });
            ctx.append(`}`);
            return;
        }
        case "statement_until": {
            ctx.append(`do {`);
            ctx.inIndent(() => {
                for (const s of f.statements) {
                    writeStatement(s, self, returns, ctx);
                }
            });
            ctx.append(
                `} until (${writeExpressionInCondition(f.condition, ctx)});`,
            );
            return;
        }
        case "statement_repeat": {
            ctx.append(`repeat (${writeExpression(f.iterations, ctx)}) {`);
            ctx.inIndent(() => {
                for (const s of f.statements) {
                    writeStatement(s, self, returns, ctx);
                }
            });
            ctx.append(`}`);
            return;
        }
        case "statement_try": {
            ctx.append(`try {`);
            ctx.inIndent(() => {
                for (const s of f.statements) {
                    writeStatement(s, self, returns, ctx);
                }
            });

            const catchBlock = f.catchBlock;
            if (catchBlock !== undefined) {
                if (catchBlock.catchName.kind === "wildcard") {
                    ctx.append(`} catch (_) {`);
                } else {
                    ctx.append(
                        `} catch (_, ${funcIdOf(catchBlock.catchName)}) {`,
                    );
                }
                ctx.inIndent(() => {
                    for (const s of catchBlock.catchStatements!) {
                        writeStatement(s, self, returns, ctx);
                    }
                });
            } else {
                ctx.append("} catch (_) { ");
            }

            ctx.append(`}`);
            return;
        }
        case "statement_foreach": {
            const mapPath = tryExtractPath(f.map);
            if (mapPath === null) {
                // typechecker is supposed to catch this
                throwInternalCompilerError(
                    `foreach is only allowed over maps that are path expressions, i.e. identifiers, or sequences of direct contract/struct/message accesses, like "self.foo" or "self.structure.field"`,
                    f.map.loc,
                );
            }
            const path = writePathExpression(mapPath);

            const t = getExpType(ctx.ctx, f.map);
            if (t.kind !== "map") {
                throw Error("Unknown map type");
            }

            const flag = freshIdentifier("flag");
            const key =
                f.keyName.kind === "wildcard"
                    ? freshIdentifier("underscore")
                    : funcIdOf(f.keyName);
            const value =
                f.valueName.kind === "wildcard"
                    ? freshIdentifier("underscore")
                    : funcIdOf(f.valueName);

            // Handle Int key
            if (t.key === "Int") {
                let bits = 257;
                let kind = "int";
                if (t.keyAs?.startsWith("int")) {
                    bits = parseInt(t.keyAs.slice(3), 10);
                } else if (t.keyAs?.startsWith("uint")) {
                    bits = parseInt(t.keyAs.slice(4), 10);
                    kind = "uint";
                }
                if (t.value === "Int") {
                    let vBits = ", 257";
                    let vKind = "int";
                    if (t.valueAs?.startsWith("int")) {
                        vBits = `, ${parseInt(t.valueAs.slice(3), 10)}`;
                    } else if (t.valueAs?.startsWith("uint")) {
                        vBits = `, ${parseInt(t.valueAs.slice(4), 10)}`;
                        vKind = "uint";
                    } else if (t.valueAs?.startsWith("coins")) {
                        vBits = "";
                        vKind = "coins";
                    } else if (t.valueAs?.startsWith("var")) {
                        vBits = "";
                        vKind = t.valueAs;
                    }

                    ctx.append(
                        `var (${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_min_${kind}_${vKind}`)}(${path}, ${bits}${vBits});`,
                    );
                    ctx.append(`while (${flag}) {`);
                    ctx.inIndent(() => {
                        for (const s of f.statements) {
                            writeStatement(s, self, returns, ctx);
                        }
                        ctx.append(
                            `(${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_next_${kind}_${vKind}`)}(${path}, ${bits}, ${key}${vBits});`,
                        );
                    });
                    ctx.append(`}`);
                } else if (t.value === "Bool") {
                    ctx.append(
                        `var (${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_min_${kind}_int`)}(${path}, ${bits}, 1);`,
                    );
                    ctx.append(`while (${flag}) {`);
                    ctx.inIndent(() => {
                        for (const s of f.statements) {
                            writeStatement(s, self, returns, ctx);
                        }
                        ctx.append(
                            `(${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_next_${kind}_int`)}(${path}, ${bits}, ${key}, 1);`,
                        );
                    });
                    ctx.append(`}`);
                } else if (t.value === "Cell") {
                    ctx.append(
                        `var (${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_min_${kind}_cell`)}(${path}, ${bits});`,
                    );
                    ctx.append(`while (${flag}) {`);
                    ctx.inIndent(() => {
                        for (const s of f.statements) {
                            writeStatement(s, self, returns, ctx);
                        }
                        ctx.append(
                            `(${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_next_${kind}_cell`)}(${path}, ${bits}, ${key});`,
                        );
                    });
                    ctx.append(`}`);
                } else if (t.value === "Address") {
                    ctx.append(
                        `var (${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_min_${kind}_slice`)}(${path}, ${bits});`,
                    );
                    ctx.append(`while (${flag}) {`);
                    ctx.inIndent(() => {
                        for (const s of f.statements) {
                            writeStatement(s, self, returns, ctx);
                        }
                        ctx.append(
                            `(${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_next_${kind}_slice`)}(${path}, ${bits}, ${key});`,
                        );
                    });
                    ctx.append(`}`);
                } else {
                    // value is struct
                    ctx.append(
                        `var (${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_min_${kind}_cell`)}(${path}, ${bits});`,
                    );
                    ctx.append(`while (${flag}) {`);
                    ctx.inIndent(() => {
                        ctx.append(
                            `var ${resolveFuncTypeUnpack(t.value, funcIdOf(f.valueName), ctx)} = ${ops.typeNotNull(t.value, ctx)}(${ops.readerOpt(t.value, ctx)}(${value}));`,
                        );
                        for (const s of f.statements) {
                            writeStatement(s, self, returns, ctx);
                        }
                        ctx.append(
                            `(${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_next_${kind}_cell`)}(${path}, ${bits}, ${key});`,
                        );
                    });
                    ctx.append(`}`);
                }
            }

            // Handle address key
            if (t.key === "Address") {
                if (t.value === "Int") {
                    let vBits = ", 257";
                    let vKind = "int";
                    if (t.valueAs?.startsWith("int")) {
                        vBits = `, ${parseInt(t.valueAs.slice(3), 10)}`;
                    } else if (t.valueAs?.startsWith("uint")) {
                        vBits = `, ${parseInt(t.valueAs.slice(4), 10)}`;
                        vKind = "uint";
                    } else if (t.valueAs?.startsWith("coins")) {
                        vBits = "";
                        vKind = "coins";
                    } else if (t.valueAs?.startsWith("var")) {
                        vBits = "";
                        vKind = t.valueAs;
                    }
                    ctx.append(
                        `var (${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_min_slice_${vKind}`)}(${path}, 267${vBits});`,
                    );
                    ctx.append(`while (${flag}) {`);
                    ctx.inIndent(() => {
                        for (const s of f.statements) {
                            writeStatement(s, self, returns, ctx);
                        }
                        ctx.append(
                            `(${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_next_slice_${vKind}`)}(${path}, 267, ${key}${vBits});`,
                        );
                    });
                    ctx.append(`}`);
                } else if (t.value === "Bool") {
                    ctx.append(
                        `var (${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_min_slice_int`)}(${path}, 267, 1);`,
                    );
                    ctx.append(`while (${flag}) {`);
                    ctx.inIndent(() => {
                        for (const s of f.statements) {
                            writeStatement(s, self, returns, ctx);
                        }
                        ctx.append(
                            `(${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_next_slice_int`)}(${path}, 267, ${key}, 1);`,
                        );
                    });
                    ctx.append(`}`);
                } else if (t.value === "Cell") {
                    ctx.append(
                        `var (${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_min_slice_cell`)}(${path}, 267);`,
                    );
                    ctx.append(`while (${flag}) {`);
                    ctx.inIndent(() => {
                        for (const s of f.statements) {
                            writeStatement(s, self, returns, ctx);
                        }
                        ctx.append(
                            `(${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_next_slice_cell`)}(${path}, 267, ${key});`,
                        );
                    });
                    ctx.append(`}`);
                } else if (t.value === "Address") {
                    ctx.append(
                        `var (${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_min_slice_slice`)}(${path}, 267);`,
                    );
                    ctx.append(`while (${flag}) {`);
                    ctx.inIndent(() => {
                        for (const s of f.statements) {
                            writeStatement(s, self, returns, ctx);
                        }
                        ctx.append(
                            `(${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_next_slice_slice`)}(${path}, 267, ${key});`,
                        );
                    });
                    ctx.append(`}`);
                } else {
                    // value is struct
                    ctx.append(
                        `var (${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_min_slice_cell`)}(${path}, 267);`,
                    );
                    ctx.append(`while (${flag}) {`);
                    ctx.inIndent(() => {
                        ctx.append(
                            `var ${resolveFuncTypeUnpack(t.value, funcIdOf(f.valueName), ctx)} = ${ops.typeNotNull(t.value, ctx)}(${ops.readerOpt(t.value, ctx)}(${value}));`,
                        );
                        for (const s of f.statements) {
                            writeStatement(s, self, returns, ctx);
                        }
                        ctx.append(
                            `(${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_next_slice_cell`)}(${path}, 267, ${key});`,
                        );
                    });
                    ctx.append(`}`);
                }
            }

            return;
        }
        case "statement_destruct": {
            const t = getExpType(ctx.ctx, f.expression);
            if (t.kind !== "ref") {
                throwInternalCompilerError(
                    `invalid destruct expression kind: ${t.kind}`,
                    f.expression.loc,
                );
            }
            const ty = getType(ctx.ctx, t.name);

            const fields = ty.fields.map((field) => {
                const identifiers = f.identifiers.get(field.name);
                if (!identifiers) return undefined;
                return {
                    field,
                    // FIXME
                    ...identifiers,
                };
            });

            const leftHands = fields.map((field) => {
                const id =
                    field === undefined || field[1].kind === "wildcard"
                        ? "_"
                        : funcIdOf(field[1]);

                const fieldTy = field?.field.type;
                if (fieldTy?.kind === "ref") {
                    const fieldTyDescription = getType(ctx.ctx, fieldTy.name);
                    if (
                        fieldTyDescription.kind === "contract" ||
                        fieldTyDescription.kind === "struct"
                    ) {
                        // `(arg'field1, arg'field2)`
                        return resolveFuncTypeUnpack(
                            fieldTyDescription,
                            id,
                            ctx,
                        );
                    }
                }

                // just `arg`
                return id;
            });

            ctx.append(
                `var (${leftHands.join(", ")}) = ${writeCastedExpression(f.expression, t, ctx)};`,
            );
            return;
        }
        case "statement_block": {
            for (const s of f.statements) {
                writeStatement(s, self, returns, ctx);
            }
            return;
        }
    }

    throw Error("Unknown statement kind");
}

const isZero = (expr: Ast.Expression): boolean => {
    return expr.kind === "number" && expr.value === 0n;
};

const rewriteWithIfNot = (
    expr: Ast.Expression,
    ctx: CompilerContext,
): ["if" | "ifnot", Ast.Expression] => {
    if (expr.kind === "op_unary" && expr.op === "!") {
        // `if (~ cond)` => `ifnot (cond)`
        return ["ifnot", expr.operand];
    }

    if (expr.kind === "op_binary" && (expr.op === "==" || expr.op === "!=")) {
        const left = constEval(expr.left, ctx);
        const right = constEval(expr.right, ctx);

        if (expr.op === "==") {
            if (isZero(right)) {
                // if (a == 0) => ifnot (a)
                return ["ifnot", expr.left];
            }
            if (isZero(left)) {
                // if (0 == a) => ifnot (a)
                return ["ifnot", expr.right];
            }
        }

        if (expr.op === "!=") {
            if (isZero(right)) {
                // if (a != 0) => if (a)
                return ["if", expr.left];
            }
            if (isZero(left)) {
                // if (0 != a) => if (a)
                return ["if", expr.right];
            }
        }
    }

    return ["if", expr];
};

// HACK ALERT: if `returns` is a string, it contains the code to invoke before returning from a receiver
// this is used to save the contract state before returning
function writeCondition(
    f: Ast.StatementCondition,
    self: string | null,
    elseif: boolean,
    returns: TypeRef | null | string,
    ctx: WriterContext,
) {
    const [ifKind, condition] = rewriteWithIfNot(f.condition, ctx.ctx);

    ctx.append(
        `${elseif ? "} else" : ""}${ifKind} (${writeExpressionInCondition(condition, ctx)}) {`,
    );
    ctx.inIndent(() => {
        for (const s of f.trueStatements) {
            writeStatement(s, self, returns, ctx);
        }
    });
    if (f.falseStatements && f.falseStatements.length > 0) {
        const [head, ...tail] = f.falseStatements;
        // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition -- eslint bug
        if (head && tail.length === 0 && head.kind === "statement_condition") {
            writeCondition(head, self, true, returns, ctx);
        } else {
            ctx.append(`} else {`);
            ctx.inIndent(() => {
                for (const s of f.falseStatements!) {
                    writeStatement(s, self, returns, ctx);
                }
            });
            ctx.append(`}`);
        }
    } else {
        ctx.append(`}`);
    }
}

export function writeFunction(f: FunctionDescription, ctx: WriterContext) {
    const [self, isSelfOpt] =
        f.self?.kind === "ref"
            ? [getType(ctx.ctx, f.self.name), f.self.optional]
            : [null, false];

    // Write function header
    let returns: string = resolveFuncType(f.returns, ctx);
    const returnsOriginal = returns;
    let returnsStr: string | null;
    if (self && f.isMutating) {
        if (f.returns.kind !== "void") {
            returns = `(${resolveFuncType(self, ctx)}, ${returns})`;
        } else {
            returns = `(${resolveFuncType(self, ctx)}, ())`;
        }
        returnsStr = resolveFuncTypeUnpack(self, funcIdOf("self"), ctx);
    }

    // Resolve function descriptor
    const params: string[] = [];
    if (self) {
        params.push(
            resolveFuncType(self, ctx, isSelfOpt) + " " + funcIdOf("self"),
        );
    }

    f.params.forEach((a, index) => {
        const name =
            a.name.kind === "wildcard" ? `_${index}` : funcIdOf(a.name);
        params.push(resolveFuncType(a.type, ctx) + " " + name);
    });

    const fAst = f.ast;
    switch (fAst.kind) {
        case "native_function_decl": {
            const name = idText(fAst.nativeName);
            if (f.isMutating && !ctx.isRendered(name)) {
                writeNonMutatingFunction(
                    f,
                    name,
                    params,
                    returnsOriginal,
                    false,
                    ctx,
                );
                ctx.markRendered(name);
            }
            return;
        }

        case "asm_function_def": {
            const name = self
                ? ops.extension(self.name, f.name)
                : ops.global(f.name);
            ctx.fun(name, () => {
                const { functionParams, shuffle } = getAsmFunctionSignature(
                    f,
                    fAst,
                    params,
                );

                ctx.signature(
                    `${returns} ${name}(${functionParams.join(", ")})`,
                );
                ctx.flag("impure");
                if (f.origin === "stdlib") {
                    ctx.context("stdlib");
                }

                if (
                    fAst.instructions.length > 1 ||
                    fAst.instructions[0] !== ""
                ) {
                    ctx.asm(shuffle, fAst.instructions.join(" "));
                } else {
                    ctx.asm(shuffle, "NOP", true);
                }
            });
            if (f.isMutating) {
                writeNonMutatingFunction(
                    f,
                    name,
                    params,
                    returnsOriginal,
                    true,
                    ctx,
                );
            }
            return;
        }

        case "function_def": {
            const name = self
                ? ops.extension(self.name, f.name)
                : ops.global(f.name);

            ctx.fun(name, () => {
                ctx.signature(`${returns} ${name}(${params.join(", ")})`);
                ctx.flag("impure");
                if (enabledInline(ctx.ctx) || f.isInline) {
                    ctx.flag("inline");
                }
                if (f.origin === "stdlib") {
                    ctx.context("stdlib");
                }
                ctx.body(() => {
                    // Unpack self
                    if (self && !isSelfOpt) {
                        ctx.append(
                            `var (${resolveFuncTypeUnpack(self, funcIdOf("self"), ctx)}) = ${funcIdOf("self")};`,
                        );
                    }
                    for (const a of f.ast.params) {
                        if (
                            !resolveFuncPrimitive(
                                resolveTypeRef(ctx.ctx, a.type),
                                ctx,
                            ) &&
                            a.name.kind !== "wildcard"
                        ) {
                            ctx.append(
                                `var (${resolveFuncTypeUnpack(resolveTypeRef(ctx.ctx, a.type), funcIdOf(a.name), ctx)}) = ${funcIdOf(a.name)};`,
                            );
                        }
                    }

                    // Process statements
                    for (const s of fAst.statements) {
                        writeStatement(s, returnsStr, f.returns, ctx);
                    }

                    // Auto append return
                    if (f.self && f.returns.kind === "void" && f.isMutating) {
                        if (
                            fAst.statements.length === 0 ||
                            fAst.statements[fAst.statements.length - 1]!
                                .kind !== "statement_return"
                        ) {
                            ctx.append(`return (${returnsStr}, ());`);
                        }
                    }
                });
            });

            if (f.isMutating) {
                writeNonMutatingFunction(
                    f,
                    name,
                    params,
                    returnsOriginal,
                    true,
                    ctx,
                );
            }
            return;
        }
        default: {
            throwInternalCompilerError(
                `Unknown function kind: ${idTextErr(fAst.name)}`,
                fAst.loc,
            );
        }
    }
}

function getAsmFunctionSignature(
    f: FunctionDescription,
    fAst: Ast.AsmFunctionDef,
    params: string[],
) {
    const isMutable = fAst.attributes.some((a) => a.type === "mutates");
    const firstParam = fAst.params.at(0)?.name;
    const hasSelfParam =
        firstParam?.kind === "id" && firstParam.text === "self";
    const needRearrange =
        fAst.shuffle.ret.length === 0 &&
        fAst.shuffle.args.length > 1 &&
        fAst.params.length === 2 && // apply only for `fun foo(self: T1, param: T2)`
        hasSelfParam &&
        !isMutable;

    if (!needRearrange) {
        const asmShuffleEscaped: Ast.AsmShuffle = {
            ...fAst.shuffle,
            args: fAst.shuffle.args.map((id) => idOfText(funcIdOf(id))),
        };

        return {
            functionParams: params,
            shuffle: ppAsmShuffle(asmShuffleEscaped),
        };
    }

    // Rearranges the parameters in the order described in Asm Shuffle
    //
    // For example:
    // `asm(other self) extends fun foo(self: Type, other: Type2)`
    // generates as
    // `extends fun foo(other: Type2, self: Type)`
    const [headParam, ...tailParams] = params;
    const paramsDict = Object.fromEntries([
        ["self", headParam],
        ...zip(f.params, tailParams).map(([a, b]) => {
            return [a.name.kind === "id" ? a.name.text : "_", b] as const;
        }),
    ]);

    return {
        functionParams: fAst.shuffle.args.map((arg) => paramsDict[arg.text]!),
        shuffle: "",
    };
}

// Write a function in non-mutating form
function writeNonMutatingFunction(
    f: FunctionDescription,
    name: string,
    params: string[],
    returnsOriginal: string,
    markUsedName: boolean,
    ctx: WriterContext,
) {
    const nonMutName = ops.nonModifying(name);
    ctx.fun(nonMutName, () => {
        ctx.signature(`${returnsOriginal} ${nonMutName}(${params.join(", ")})`);
        ctx.flag("impure");
        if (enabledInline(ctx.ctx) || f.isInline) {
            ctx.flag("inline");
        }
        if (f.origin === "stdlib") {
            ctx.context("stdlib");
        }
        ctx.body(() => {
            const params = f.ast.params;
            const firstParam = params.at(0)?.name;
            const withoutSelfParams =
                params.length > 0 &&
                firstParam?.kind === "id" &&
                firstParam.text === "self"
                    ? params.slice(1)
                    : params;
            ctx.append(
                `return ${funcIdOf("self")}~${markUsedName ? ctx.used(name) : name}(${withoutSelfParams
                    .map((arg) => funcIdOf(arg.name))
                    .join(", ")});`,
            );
        });
    });
}

export function writeGetter(f: FunctionDescription, wCtx: WriterContext) {
    // Render tensors
    const self = f.self?.kind === "ref" ? getType(wCtx.ctx, f.self.name) : null;
    if (!self) {
        throw new Error(`No self type for getter ${idTextErr(f.name)}`); // Impossible
    }
    wCtx.append(
        `_ %${f.name}(${f.params.map((v) => resolveFuncTupleType(v.type, wCtx) + " " + funcIdOf(v.name)).join(", ")}) method_id(${f.methodId!}) {`,
    );
    wCtx.inIndent(() => {
        // Unpack parameters
        for (const param of f.params) {
            unwrapExternal(
                funcIdOf(param.name),
                funcIdOf(param.name),
                param.type,
                wCtx,
            );
        }

        // Load contract state
        wCtx.append(`var self = ${ops.contractLoad(self.name, wCtx)}();`);

        // Execute get method
        wCtx.append(
            `var res = self~${wCtx.used(ops.extension(self.name, f.name))}(${f.params.map((v) => funcIdOf(v.name)).join(", ")});`,
        );

        // Pack if needed
        if (f.returns.kind === "ref") {
            const t = getType(wCtx.ctx, f.returns.name);
            if (t.kind === "struct" || t.kind === "contract") {
                if (f.returns.optional) {
                    wCtx.append(
                        `return ${ops.typeToOptExternal(t.name, wCtx)}(res);`,
                    );
                } else {
                    wCtx.append(
                        `return ${ops.typeToExternal(t.name, wCtx)}(res);`,
                    );
                }
                return;
            }
        }

        // Return result
        wCtx.append(`return res;`);
    });
    wCtx.append(`}`);
    wCtx.append();
}
