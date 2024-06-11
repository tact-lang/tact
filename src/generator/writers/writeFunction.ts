import { enabledInline } from "../../config/features";
import {
    ASTCondition,
    ASTExpression,
    ASTNativeFunction,
    ASTStatement,
} from "../../grammar/ast";
import { getType, resolveTypeRef } from "../../types/resolveDescriptors";
import { getExpType } from "../../types/resolveExpression";
import { FunctionDescription, TypeRef } from "../../types/types";
import { getMethodId } from "../../utils/utils";
import { WriterContext } from "../Writer";
import { resolveFuncPrimitive } from "./resolveFuncPrimitive";
import { resolveFuncType } from "./resolveFuncType";
import { resolveFuncTypeUnpack } from "./resolveFuncTypeUnpack";
import { id } from "./id";
import { writeExpression } from "./writeExpression";
import { cast } from "./cast";
import { resolveFuncTupleType } from "./resolveFuncTupleType";
import { ops } from "./ops";
import { freshIdentifier } from "./freshIdentifier";

export function writeCastedExpression(
    expression: ASTExpression,
    to: TypeRef,
    ctx: WriterContext,
) {
    const expr = getExpType(ctx.ctx, expression);
    return cast(expr, to, writeExpression(expression, ctx), ctx); // Cast for nullable
}

export function unwrapExternal(
    targetName: string,
    sourceName: string,
    type: TypeRef,
    ctx: WriterContext,
) {
    if (type.kind === "ref") {
        const t = getType(ctx.ctx, type.name);
        if (t.kind === "struct") {
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
        } else if (t.kind === "primitive" && t.name === "Address") {
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
    f: ASTStatement,
    self: string | null,
    returns: TypeRef | null,
    ctx: WriterContext,
) {
    if (f.kind === "statement_return") {
        if (f.expression) {
            // Format expression
            const result = writeCastedExpression(f.expression, returns!, ctx);

            // Return
            if (self) {
                ctx.append(`return (${self}, ${result});`);
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
    } else if (f.kind === "statement_let") {
        // Underscore name case
        if (f.name === "_") {
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
                        `tuple ${id(f.name)} = ${writeCastedExpression(f.expression, t, ctx)};`,
                    );
                } else {
                    ctx.append(
                        `var ${resolveFuncTypeUnpack(t, id(f.name), ctx)} = ${writeCastedExpression(f.expression, t, ctx)};`,
                    );
                }
                return;
            }
        }

        ctx.append(
            `${resolveFuncType(t, ctx)} ${id(f.name)} = ${writeCastedExpression(f.expression, t, ctx)};`,
        );
        return;
    } else if (f.kind === "statement_assign") {
        // Prepare lvalue
        const path = f.path
            .map((v, i) => (i === 0 ? id(v.name) : v.name))
            .join(`'`);

        // Contract/struct case
        const t = getExpType(ctx.ctx, f.path[f.path.length - 1]);
        if (t.kind === "ref") {
            const tt = getType(ctx.ctx, t.name);
            if (tt.kind === "contract" || tt.kind === "struct") {
                ctx.append(
                    `${resolveFuncTypeUnpack(t, `${path}`, ctx)} = ${writeCastedExpression(f.expression, t, ctx)};`,
                );
                return;
            }
        }

        ctx.append(`${path} = ${writeCastedExpression(f.expression, t, ctx)};`);
        return;
    } else if (f.kind === "statement_augmentedassign") {
        const path = f.path
            .map((v, i) => (i === 0 ? id(v.name) : v.name))
            .join(`'`);
        const t = getExpType(ctx.ctx, f.path[f.path.length - 1]);
        ctx.append(
            `${path} = ${cast(t, t, `${path} ${f.op} ${writeExpression(f.expression, ctx)}`, ctx)};`,
        );
        return;
    } else if (f.kind === "statement_condition") {
        writeCondition(f, self, false, returns, ctx);
        return;
    } else if (f.kind === "statement_expression") {
        const exp = writeExpression(f.expression, ctx);
        ctx.append(`${exp};`);
        return;
    } else if (f.kind === "statement_while") {
        ctx.append(`while (${writeExpression(f.condition, ctx)}) {`);
        ctx.inIndent(() => {
            for (const s of f.statements) {
                writeStatement(s, self, returns, ctx);
            }
        });
        ctx.append(`}`);
        return;
    } else if (f.kind === "statement_until") {
        ctx.append(`do {`);
        ctx.inIndent(() => {
            for (const s of f.statements) {
                writeStatement(s, self, returns, ctx);
            }
        });
        ctx.append(`} until (${writeExpression(f.condition, ctx)});`);
        return;
    } else if (f.kind === "statement_repeat") {
        ctx.append(`repeat (${writeExpression(f.iterations, ctx)}) {`);
        ctx.inIndent(() => {
            for (const s of f.statements) {
                writeStatement(s, self, returns, ctx);
            }
        });
        ctx.append(`}`);
        return;
    } else if (f.kind === "statement_try") {
        ctx.append(`try {`);
        ctx.inIndent(() => {
            for (const s of f.statements) {
                writeStatement(s, self, returns, ctx);
            }
        });
        ctx.append("} catch (_) { }");
        return;
    } else if (f.kind === "statement_try_catch") {
        ctx.append(`try {`);
        ctx.inIndent(() => {
            for (const s of f.statements) {
                writeStatement(s, self, returns, ctx);
            }
        });
        if (f.catchName == "_") {
            ctx.append(`} catch (_) {`);
        } else {
            ctx.append(`} catch (_, ${id(f.catchName)}) {`);
        }
        ctx.inIndent(() => {
            for (const s of f.catchStatements) {
                writeStatement(s, self, returns, ctx);
            }
        });
        ctx.append(`}`);
        return;
    } else if (f.kind === "statement_foreach") {
        // Prepare lvalue
        const path = f.map
            .map((v, i) => (i === 0 ? id(v.name) : v.name))
            .join(`'`);

        const t = getExpType(ctx.ctx, f.map[f.map.length - 1]);
        if (t.kind !== "map") {
            throw Error("Unknown map type");
        }

        const flag = freshIdentifier("flag");
        const key =
            f.keyName == "_" ? freshIdentifier("underscore") : id(f.keyName);
        const value =
            f.valueName == "_"
                ? freshIdentifier("underscore")
                : id(f.valueName);

        // Handle Int key
        if (t.key === "Int") {
            let bits = 257;
            let kind = "int";
            if (t.keyAs && t.keyAs.startsWith("int")) {
                bits = parseInt(t.keyAs.slice(3), 10);
            } else if (t.keyAs && t.keyAs.startsWith("uint")) {
                bits = parseInt(t.keyAs.slice(4), 10);
                kind = "uint";
            }
            if (t.value === "Int") {
                let vBits = 257;
                let vKind = "int";
                if (t.valueAs && t.valueAs.startsWith("int")) {
                    vBits = parseInt(t.valueAs.slice(3), 10);
                } else if (t.valueAs && t.valueAs.startsWith("uint")) {
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
                        `var ${resolveFuncTypeUnpack(t.value, id(f.valueName), ctx)} = ${ops.typeNotNull(t.value, ctx)}(${ops.readerOpt(t.value, ctx)}(${value}));`,
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
                if (t.valueAs && t.valueAs.startsWith("int")) {
                    vBits = parseInt(t.valueAs.slice(3), 10);
                } else if (t.valueAs && t.valueAs.startsWith("uint")) {
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
                        `var ${resolveFuncTypeUnpack(t.value, id(f.valueName), ctx)} = ${ops.typeNotNull(t.value, ctx)}(${ops.readerOpt(t.value, ctx)}(${value}));`,
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

    throw Error("Unknown statement kind");
}

function writeCondition(
    f: ASTCondition,
    self: string | null,
    elseif: boolean,
    returns: TypeRef | null,
    ctx: WriterContext,
) {
    ctx.append(
        `${elseif ? "} else" : ""}if (${writeExpression(f.expression, ctx)}) {`,
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
    const fd = f.ast;

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
        returnsStr = resolveFuncTypeUnpack(self, id("self"), ctx);
    }

    // Resolve function descriptor
    const args: string[] = [];
    if (self) {
        args.push(resolveFuncType(self, ctx) + " " + id("self"));
    }
    for (const a of f.args) {
        args.push(resolveFuncType(a.type, ctx) + " " + id(a.name));
    }

    // Do not write native functions
    if (f.ast.kind === "def_native_function") {
        if (f.isMutating) {
            // Write same function in non-mutating form
            const nonMutName = ops.nonModifying(f.ast.nativeName);
            ctx.fun(nonMutName, () => {
                ctx.signature(
                    `${returnsOriginal} ${nonMutName}(${args.join(", ")})`,
                );
                ctx.flag("impure");
                if (enabledInline(ctx.ctx) || f.isInline) {
                    ctx.flag("inline");
                }
                if (f.origin === "stdlib") {
                    ctx.context("stdlib");
                }
                ctx.body(() => {
                    ctx.append(
                        `return ${id("self")}~${(f.ast as ASTNativeFunction).nativeName}(${fd.args
                            .slice(1)
                            .map((arg) => id(arg.name))
                            .join(", ")});`,
                    );
                });
            });
        }
        return;
    }

    if (fd.kind !== "def_function") {
        // should never happen, just to satisfy typescript
        throw new Error("Unknown function kind");
    }

    const name = self ? ops.extension(self.name, f.name) : ops.global(f.name);

    // Write function body
    ctx.fun(name, () => {
        ctx.signature(`${returns} ${name}(${args.join(", ")})`);
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
                    `var (${resolveFuncTypeUnpack(self, id("self"), ctx)}) = ${id("self")};`,
                );
            }
            for (const a of fd.args) {
                if (
                    !resolveFuncPrimitive(resolveTypeRef(ctx.ctx, a.type), ctx)
                ) {
                    ctx.append(
                        `var (${resolveFuncTypeUnpack(resolveTypeRef(ctx.ctx, a.type), id(a.name), ctx)}) = ${id(a.name)};`,
                    );
                }
            }

            // Process statements
            for (const s of fd.statements!) {
                writeStatement(s, returnsStr, f.returns, ctx);
            }

            // Auto append return
            if (f.self && f.returns.kind === "void" && f.isMutating) {
                if (
                    fd.statements!.length === 0 ||
                    fd.statements![fd.statements!.length - 1].kind !==
                        "statement_return"
                ) {
                    ctx.append(`return (${returnsStr}, ());`);
                }
            }
        });
    });

    if (f.isMutating) {
        // Write same function in non-mutating form
        const nonMutName = ops.nonModifying(name);
        ctx.fun(nonMutName, () => {
            ctx.signature(
                `${returnsOriginal} ${nonMutName}(${args.join(", ")})`,
            );
            ctx.flag("impure");
            if (enabledInline(ctx.ctx) || f.isInline) {
                ctx.flag("inline");
            }
            if (f.origin === "stdlib") {
                ctx.context("stdlib");
            }
            ctx.body(() => {
                ctx.append(
                    `return ${id("self")}~${ctx.used(name)}(${fd.args
                        .slice(1)
                        .map((arg) => id(arg.name))
                        .join(", ")});`,
                );
            });
        });
    }
}

export function writeGetter(f: FunctionDescription, ctx: WriterContext) {
    // Render tensors
    const self = f.self ? getType(ctx.ctx, f.self) : null;
    if (!self) {
        throw new Error(`No self type for getter "${f.name}"`); // Impossible
    }
    ctx.append(
        `_ %${f.name}(${f.args.map((v) => resolveFuncTupleType(v.type, ctx) + " " + id("$" + v.name)).join(", ")}) method_id(${getMethodId(f.name)}) {`,
    );
    ctx.inIndent(() => {
        // Unpack arguments
        for (const arg of f.args) {
            unwrapExternal(id(arg.name), id("$" + arg.name), arg.type, ctx);
        }

        // Load contract state
        ctx.append(`var self = ${ops.contractLoad(self.name, ctx)}();`);

        // Execute get method
        ctx.append(
            `var res = self~${ctx.used(ops.extension(self.name, f.name))}(${f.args.map((v) => id(v.name)).join(", ")});`,
        );

        // Pack if needed
        if (f.returns.kind === "ref") {
            const t = getType(ctx.ctx, f.returns.name);
            if (t.kind === "struct") {
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
