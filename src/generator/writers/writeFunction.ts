import { enabledInline } from "../../config/features";
import {
    AstAsmShuffle,
    AstCondition,
    AstExpression,
    AstStatement,
    idOfText,
    idText,
    isWildcard,
    tryExtractPath,
} from "../../grammar/ast";
import { getType, resolveTypeRef } from "../../types/resolveDescriptors";
import { getExpType } from "../../types/resolveExpression";
import { FunctionDescription, TypeRef } from "../../types/types";
import { getMethodId } from "../../utils/utils";
import { WriterContext } from "../Writer";
import { resolveFuncPrimitive } from "./resolveFuncPrimitive";
import { resolveFuncType } from "./resolveFuncType";
import { resolveFuncTypeUnpack } from "./resolveFuncTypeUnpack";
import { funcIdOf } from "./id";
import { writeExpression, writePathExpression } from "./writeExpression";
import { cast } from "./cast";
import { resolveFuncTupleType } from "./resolveFuncTupleType";
import { ops } from "./ops";
import { freshIdentifier } from "./freshIdentifier";
import { idTextErr, throwInternalCompilerError } from "../../errors";
import { prettyPrintAsmShuffle } from "../../prettyPrinter";

export function writeCastedExpression(
    expression: AstExpression,
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
            if (type.optional) {
                ctx.append(
                    `${resolveFuncType(type, ctx)} ${targetName} = null?(${sourceName}) ? null() : ${ctx.used(`__tact_verify_address`)}(${sourceName});`,
                );
            } else {
                ctx.append(
                    `${resolveFuncType(type, ctx)} ${targetName} = ${ctx.used(`__tact_verify_address`)}(${sourceName});`,
                );
            }
            return;
        }
    }
    ctx.append(`${resolveFuncType(type, ctx)} ${targetName} = ${sourceName};`);
}

export function writeStatement(
    f: AstStatement,
    self: string | null,
    returns: TypeRef | null,
    ctx: WriterContext,
) {
    switch (f.kind) {
        case "statement_return": {
            if (f.expression) {
                // Format expression
                const result = writeCastedExpression(
                    f.expression,
                    returns!,
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
                    ctx.append(`return ();`);
                }
            }
            return;
        }
        case "statement_let": {
            // Underscore name case
            if (isWildcard(f.name)) {
                ctx.append(`${writeExpression(f.expression, ctx)};`);
                return;
            }

            // Contract/struct case
            const t =
                f.type === null
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
            ctx.append(
                `${path} = ${cast(t, t, `${path} ${f.op} ${writeExpression(f.expression, ctx)}`, ctx)};`,
            );
            return;
        }
        case "statement_condition": {
            writeCondition(f, self, false, returns, ctx);
            return;
        }
        case "statement_expression": {
            const exp = writeExpression(f.expression, ctx);
            ctx.append(`${exp};`);
            return;
        }
        case "statement_while": {
            ctx.append(`while (${writeExpression(f.condition, ctx)}) {`);
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
            ctx.append(`} until (${writeExpression(f.condition, ctx)});`);
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
            ctx.append("} catch (_) { }");
            return;
        }
        case "statement_try_catch": {
            ctx.append(`try {`);
            ctx.inIndent(() => {
                for (const s of f.statements) {
                    writeStatement(s, self, returns, ctx);
                }
            });
            if (isWildcard(f.catchName)) {
                ctx.append(`} catch (_) {`);
            } else {
                ctx.append(`} catch (_, ${funcIdOf(f.catchName)}) {`);
            }
            ctx.inIndent(() => {
                for (const s of f.catchStatements) {
                    writeStatement(s, self, returns, ctx);
                }
            });
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
            const key = isWildcard(f.keyName)
                ? freshIdentifier("underscore")
                : funcIdOf(f.keyName);
            const value = isWildcard(f.valueName)
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
                    let vBits = 257;
                    let vKind = "int";
                    if (t.valueAs?.startsWith("int")) {
                        vBits = parseInt(t.valueAs.slice(3), 10);
                    } else if (t.valueAs?.startsWith("uint")) {
                        vBits = parseInt(t.valueAs.slice(4), 10);
                        vKind = "uint";
                    }

                    ctx.append(
                        `var (${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_min_${kind}_${vKind}`)}(${path}, ${bits}, ${vBits});`,
                    );
                    ctx.append(`while (${flag}) {`);
                    ctx.inIndent(() => {
                        for (const s of f.statements) {
                            writeStatement(s, self, returns, ctx);
                        }
                        ctx.append(
                            `(${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_next_${kind}_${vKind}`)}(${path}, ${bits}, ${key}, ${vBits});`,
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
                    let vBits = 257;
                    let vKind = "int";
                    if (t.valueAs?.startsWith("int")) {
                        vBits = parseInt(t.valueAs.slice(3), 10);
                    } else if (t.valueAs?.startsWith("uint")) {
                        vBits = parseInt(t.valueAs.slice(4), 10);
                        vKind = "uint";
                    }
                    ctx.append(
                        `var (${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_min_slice_${vKind}`)}(${path}, 267, ${vBits});`,
                    );
                    ctx.append(`while (${flag}) {`);
                    ctx.inIndent(() => {
                        for (const s of f.statements) {
                            writeStatement(s, self, returns, ctx);
                        }
                        ctx.append(
                            `(${key}, ${value}, ${flag}) = ${ctx.used(`__tact_dict_next_slice_${vKind}`)}(${path}, 267, ${key}, ${vBits});`,
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
    }

    throw Error("Unknown statement kind");
}

function writeCondition(
    f: AstCondition,
    self: string | null,
    elseif: boolean,
    returns: TypeRef | null,
    ctx: WriterContext,
) {
    ctx.append(
        `${elseif ? "} else" : ""}if (${writeExpression(f.condition, ctx)}) {`,
    );
    ctx.inIndent(() => {
        for (const s of f.trueStatements) {
            writeStatement(s, self, returns, ctx);
        }
    });
    if (f.falseStatements && f.falseStatements.length > 0) {
        ctx.append(`} else {`);
        ctx.inIndent(() => {
            for (const s of f.falseStatements!) {
                writeStatement(s, self, returns, ctx);
            }
        });
        ctx.append(`}`);
    } else if (f.elseif) {
        writeCondition(f.elseif, self, true, returns, ctx);
    } else {
        ctx.append(`}`);
    }
}

export function writeFunction(f: FunctionDescription, ctx: WriterContext) {
    // Resolve self
    const self = f.self ? getType(ctx.ctx, f.self) : null;

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
        params.push(resolveFuncType(self, ctx) + " " + funcIdOf("self"));
    }
    for (const a of f.params) {
        params.push(resolveFuncType(a.type, ctx) + " " + funcIdOf(a.name));
    }

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
                ctx.signature(`${returns} ${name}(${params.join(", ")})`);
                ctx.flag("impure");
                if (f.origin === "stdlib") {
                    ctx.context("stdlib");
                }
                // we need to do some renames (prepending $ to identifiers)
                const asmShuffleEscaped: AstAsmShuffle = {
                    ...fAst.shuffle,
                    args: fAst.shuffle.args.map((id) => idOfText(funcIdOf(id))),
                };
                ctx.asm(
                    prettyPrintAsmShuffle(asmShuffleEscaped),
                    fAst.instructions.join(" "),
                );
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
                    if (self) {
                        ctx.append(
                            `var (${resolveFuncTypeUnpack(self, funcIdOf("self"), ctx)}) = ${funcIdOf("self")};`,
                        );
                    }
                    for (const a of f.ast.params) {
                        if (
                            !resolveFuncPrimitive(
                                resolveTypeRef(ctx.ctx, a.type),
                                ctx,
                            )
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
            ctx.append(
                `return ${funcIdOf("self")}~${markUsedName ? ctx.used(name) : name}(${f.ast.params
                    .slice(1)
                    .map((arg) => funcIdOf(arg.name))
                    .join(", ")});`,
            );
        });
    });
}

export function writeGetter(f: FunctionDescription, ctx: WriterContext) {
    // Render tensors
    const self = f.self !== null ? getType(ctx.ctx, f.self) : null;
    if (!self) {
        throw new Error(`No self type for getter ${idTextErr(f.name)}`); // Impossible
    }
    ctx.append(
        `_ %${f.name}(${f.params.map((v) => resolveFuncTupleType(v.type, ctx) + " " + funcIdOf(v.name)).join(", ")}) method_id(${getMethodId(f.name)}) {`,
    );
    ctx.inIndent(() => {
        // Unpack parameters
        for (const param of f.params) {
            unwrapExternal(
                funcIdOf(param.name),
                funcIdOf(param.name),
                param.type,
                ctx,
            );
        }

        // Load contract state
        ctx.append(`var self = ${ops.contractLoad(self.name, ctx)}();`);

        // Execute get method
        ctx.append(
            `var res = self~${ctx.used(ops.extension(self.name, f.name))}(${f.params.map((v) => funcIdOf(v.name)).join(", ")});`,
        );

        // Pack if needed
        if (f.returns.kind === "ref") {
            const t = getType(ctx.ctx, f.returns.name);
            if (t.kind === "struct" || t.kind === "contract") {
                if (f.returns.optional) {
                    ctx.append(
                        `return ${ops.typeToOptExternal(t.name, ctx)}(res);`,
                    );
                } else {
                    ctx.append(
                        `return ${ops.typeToExternal(t.name, ctx)}(res);`,
                    );
                }
                return;
            }
        }

        // Return result
        ctx.append(`return res;`);
    });
    ctx.append(`}`);
    ctx.append();
}
