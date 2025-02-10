import { CompilerContext } from "../context/context";
import { SrcInfo } from "../grammar";
import { printTypeRef, TypeRef } from "../types/types";
import { WriterContext } from "../generator/Writer";
import { ops } from "../generator/writers/ops";
import { writeExpression } from "../generator/writers/writeExpression";
import { throwCompilationError } from "../error/errors";
import { getType } from "../types/resolveDescriptors";
import { AbiFunction } from "./AbiFunction";
import { AstExpression } from "../ast/ast";
import { isAssignable } from "../types/subtyping";

// Helper functions to avoid redundancy
function checkArgumentsLength(
    args: readonly (TypeRef | undefined)[],
    expected: number,
    message: string,
    ref: SrcInfo,
): void {
    if (args.length !== expected || args.some((arg) => arg === undefined)) {
        throwCompilationError(message, ref);
    }
}

function checkMapType(
    self: TypeRef | undefined,
    ref: SrcInfo,
): asserts self is {
    kind: "map";
    key: string;
    keyAs: string | null;
    value: string;
    valueAs: string | null;
} {
    if (!self || self.kind !== "map") {
        throwCompilationError("expects a map as self argument", ref);
    }
    if (self.key !== "Int" && self.key !== "Address") {
        throwCompilationError("expects a map with Int or Address keys", ref);
    }
}

function checkKeyType(
    key: TypeRef | undefined,
    expectedType: string,
    ref: SrcInfo,
): void {
    if (
        !key ||
        key.kind !== "ref" ||
        key.optional ||
        key.name !== expectedType
    ) {
        throwCompilationError(
            `expects a "${expectedType}" as first argument`,
            ref,
        );
    }
}

function checkValueType(
    value: TypeRef | undefined,
    expectedType: string,
    ref: SrcInfo,
): void {
    if (!value || (value.kind !== "null" && value.kind !== "ref")) {
        throwCompilationError("expects a direct type as second argument", ref);
    }
    if (value.kind !== "null" && value.name !== expectedType) {
        throwCompilationError(
            `expects a "${expectedType}" as second argument`,
            ref,
        );
    }
}

function resolveMapKeyBits(
    type: { key: string; keyAs: string | null },
    loc: SrcInfo,
): { bits: number; kind: string } {
    if (type.key === "Int") {
        if (type.keyAs === null) {
            return { bits: 257, kind: "int" }; // Default for "Int" keys
        }
        if (type.keyAs.startsWith("int")) {
            return { bits: parseInt(type.keyAs.slice(3), 10), kind: "int" };
        }
        if (type.keyAs.startsWith("uint")) {
            return { bits: parseInt(type.keyAs.slice(4), 10), kind: "uint" };
        }
        throwCompilationError(
            `Unsupported integer map key type storage annotation: ${type.keyAs}`,
            loc,
        );
    } else if (type.key === "Address") {
        return { bits: 267, kind: "slice" };
    }
    throwCompilationError(`Unsupported key type: ${type.key}`, loc);
}

function handleStructOrOtherValue(
    self: { value: string; valueAs: string | null },
    value: TypeRef,
    resolved: string[],
    ctx: WriterContext,
    ref: SrcInfo,
    bits: number,
    kind: string,
    operation: string = "set",
): string {
    const t = getType(ctx.ctx, self.value);
    if (["contract", "trait"].includes(t.kind)) {
        throwCompilationError(`"${t.name}" can't be value of a map`, ref);
    }
    if (t.kind === "struct") {
        const funcName = `__tact_dict_${operation}_${kind}_cell`;
        ctx.used(funcName);
        const writerFunc =
            value.kind === "ref" && !value.optional
                ? ops.writerCell(t.name, ctx)
                : ops.writerCellOpt(t.name, ctx);
        return `${resolved[0]}~${funcName}(${bits}, ${resolved[1]}, ${writerFunc}(${resolved[2]}))`;
    }
    throwCompilationError(`"${t.name}" can't be value of a map`, ref);
}

// The fully refactored MapFunctions object
export const MapFunctions: ReadonlyMap<string, AbiFunction> = new Map([
    [
        "set",
        {
            name: "set",
            resolve(
                ctx: CompilerContext,
                args: readonly (TypeRef | undefined)[],
                ref: SrcInfo,
            ) {
                checkArgumentsLength(args, 3, "set expects two arguments", ref);

                const [self, key, value] = args;
                checkMapType(self, ref);
                checkKeyType(key, self.key, ref);
                checkValueType(value, self.value, ref);

                // Returns nothing
                return { kind: "void" };
            },
            generate(
                ctx: WriterContext,
                args: readonly (TypeRef | undefined)[],
                exprs: readonly AstExpression[],
                ref: SrcInfo,
            ) {
                checkArgumentsLength(args, 3, "set expects two arguments", ref);

                const [self, , value] = args;
                checkMapType(self, ref);

                const resolved = exprs.map((v) => writeExpression(v, ctx));
                const { bits, kind } = resolveMapKeyBits(self, ref);

                if (self.value === "Int") {
                    let vBits = 257;
                    let vKind = "int";
                    if (self.valueAs?.startsWith("int")) {
                        vBits = parseInt(self.valueAs.slice(3), 10);
                    } else if (self.valueAs?.startsWith("uint")) {
                        vBits = parseInt(self.valueAs.slice(4), 10);
                        vKind = "uint";
                    } else if (self.valueAs?.startsWith("coins")) {
                        vKind = "coins";
                        ctx.used(`__tact_dict_set_${kind}_${vKind}`);
                        return `${resolved[0]}~__tact_dict_set_${kind}_${vKind}(${bits}, ${resolved[1]}, ${resolved[2]})`;
                    } else if (self.valueAs?.startsWith("var")) {
                        vKind = self.valueAs;
                        ctx.used(`__tact_dict_set_${kind}_${vKind}`);
                        return `${resolved[0]}~__tact_dict_set_${kind}_${vKind}(${bits}, ${resolved[1]}, ${resolved[2]})`;
                    }
                    ctx.used(`__tact_dict_set_${kind}_${vKind}`);
                    return `${resolved[0]}~__tact_dict_set_${kind}_${vKind}(${bits}, ${resolved[1]}, ${resolved[2]}, ${vBits})`;
                } else if (self.value === "Bool") {
                    ctx.used(`__tact_dict_set_${kind}_int`);
                    return `${resolved[0]}~__tact_dict_set_${kind}_int(${bits}, ${resolved[1]}, ${resolved[2]}, 1)`;
                } else if (self.value === "Cell") {
                    ctx.used(`__tact_dict_set_${kind}_cell`);
                    return `${resolved[0]}~__tact_dict_set_${kind}_cell(${bits}, ${resolved[1]}, ${resolved[2]})`;
                } else if (self.value === "Address") {
                    ctx.used(`__tact_dict_set_${kind}_slice`);
                    return `${resolved[0]}~__tact_dict_set_${kind}_slice(${bits}, ${resolved[1]}, ${resolved[2]})`;
                } else {
                    return handleStructOrOtherValue(
                        self,
                        value!,
                        resolved,
                        ctx,
                        ref,
                        bits,
                        kind,
                        "set",
                    );
                }
            },
        },
    ],
    [
        "get",
        {
            name: "get",
            resolve(
                ctx: CompilerContext,
                args: readonly (TypeRef | undefined)[],
                ref: SrcInfo,
            ) {
                checkArgumentsLength(args, 2, "get expects one argument", ref);

                const [self, key] = args;
                checkMapType(self, ref);
                checkKeyType(key, self.key, ref);

                return { kind: "ref", name: self.value, optional: true };
            },
            generate(
                ctx: WriterContext,
                args: readonly (TypeRef | undefined)[],
                exprs: readonly AstExpression[],
                ref: SrcInfo,
            ) {
                checkArgumentsLength(args, 2, "get expects one argument", ref);

                const [self] = args;
                checkMapType(self, ref);

                const resolved = exprs.map((v) => writeExpression(v, ctx));
                const { bits, kind } = resolveMapKeyBits(self, ref);

                if (self.value === "Int") {
                    let vBits = 257;
                    let vKind = "int";
                    if (self.valueAs?.startsWith("int")) {
                        vBits = parseInt(self.valueAs.slice(3), 10);
                    } else if (self.valueAs?.startsWith("uint")) {
                        vBits = parseInt(self.valueAs.slice(4), 10);
                        vKind = "uint";
                    } else if (self.valueAs?.startsWith("coins")) {
                        vKind = "coins";
                        ctx.used(`__tact_dict_get_${kind}_${vKind}`);
                        return `__tact_dict_get_${kind}_${vKind}(${resolved[0]}, ${bits}, ${resolved[1]})`;
                    } else if (self.valueAs?.startsWith("var")) {
                        vKind = self.valueAs;
                        ctx.used(`__tact_dict_get_${kind}_${vKind}`);
                        return `__tact_dict_get_${kind}_${vKind}(${resolved[0]}, ${bits}, ${resolved[1]})`;
                    }
                    ctx.used(`__tact_dict_get_${kind}_${vKind}`);
                    return `__tact_dict_get_${kind}_${vKind}(${resolved[0]}, ${bits}, ${resolved[1]}, ${vBits})`;
                } else if (self.value === "Bool") {
                    ctx.used(`__tact_dict_get_${kind}_int`);
                    return `__tact_dict_get_${kind}_int(${resolved[0]}, ${bits}, ${resolved[1]}, 1)`;
                } else if (self.value === "Cell") {
                    ctx.used(`__tact_dict_get_${kind}_cell`);
                    return `__tact_dict_get_${kind}_cell(${resolved[0]}, ${bits}, ${resolved[1]})`;
                } else if (self.value === "Address") {
                    ctx.used(`__tact_dict_get_${kind}_slice`);
                    return `__tact_dict_get_${kind}_slice(${resolved[0]}, ${bits}, ${resolved[1]})`;
                } else {
                    const t = getType(ctx.ctx, self.value);
                    if (t.kind === "contract") {
                        throwCompilationError(
                            `Contract can't be value of a map`,
                            ref,
                        );
                    }
                    if (t.kind === "trait") {
                        throwCompilationError(
                            `Trait can't be value of a map`,
                            ref,
                        );
                    }
                    if (t.kind === "struct") {
                        ctx.used(`__tact_dict_get_${kind}_cell`);
                        return `${ops.readerOpt(t.name, ctx)}(__tact_dict_get_${kind}_cell(${resolved[0]}, ${bits}, ${resolved[1]}))`;
                    }
                    throwCompilationError(
                        `"${t.name}" can't be value of a map`,
                        ref,
                    );
                }
            },
        },
    ],
    [
        "del",
        {
            name: "del",
            resolve(
                ctx: CompilerContext,
                args: readonly (TypeRef | undefined)[],
                ref: SrcInfo,
            ) {
                checkArgumentsLength(args, 2, "del expects one argument", ref);

                const [self, key] = args;
                checkMapType(self, ref);
                checkKeyType(key, self.key, ref);

                // Returns boolean
                return { kind: "ref", name: "Bool", optional: false };
            },
            generate(
                ctx: WriterContext,
                args: readonly (TypeRef | undefined)[],
                exprs: readonly AstExpression[],
                ref: SrcInfo,
            ) {
                checkArgumentsLength(args, 2, "del expects one argument", ref);

                const [self] = args;
                checkMapType(self, ref);

                const resolved = exprs.map((v) => writeExpression(v, ctx));
                const { bits, kind } = resolveMapKeyBits(self, ref);

                if (self.key === "Int") {
                    ctx.used(`__tact_dict_delete_${kind}`);
                    return `${resolved[0]}~__tact_dict_delete_${kind}(${bits}, ${resolved[1]})`;
                } else if (self.key === "Address") {
                    ctx.used(`__tact_dict_delete`);
                    return `${resolved[0]}~__tact_dict_delete(267, ${resolved[1]})`;
                }

                throwCompilationError(
                    `del expects a map with Int or Address keys`,
                    ref,
                );
            },
        },
    ],
    [
        "asCell",
        {
            name: "asCell",
            resolve(
                ctx: CompilerContext,
                args: readonly (TypeRef | undefined)[],
                ref: SrcInfo,
            ) {
                checkArgumentsLength(
                    args,
                    1,
                    "asCell expects one argument",
                    ref,
                );

                const [self] = args;
                checkMapType(self, ref);

                return { kind: "ref", name: "Cell", optional: false };
            },
            generate(
                ctx: WriterContext,
                args: readonly (TypeRef | undefined)[],
                exprs: readonly AstExpression[],
                ref: SrcInfo,
            ) {
                checkArgumentsLength(
                    args,
                    1,
                    "asCell expects one argument",
                    ref,
                );

                const [self] = args;
                checkMapType(self, ref);

                return writeExpression(exprs[0]!, ctx);
            },
        },
    ],
    [
        "isEmpty",
        {
            name: "isEmpty",
            resolve(
                ctx: CompilerContext,
                args: readonly (TypeRef | undefined)[],
                ref: SrcInfo,
            ) {
                checkArgumentsLength(
                    args,
                    1,
                    "isEmpty expects one argument",
                    ref,
                );

                const [self] = args;
                checkMapType(self, ref);

                return { kind: "ref", name: "Bool", optional: false };
            },
            generate(
                ctx: WriterContext,
                args: readonly (TypeRef | undefined)[],
                exprs: readonly AstExpression[],
                ref: SrcInfo,
            ) {
                checkArgumentsLength(
                    args,
                    1,
                    "isEmpty expects one argument",
                    ref,
                );

                const [self] = args;
                checkMapType(self, ref);

                return `null?(${writeExpression(exprs[0]!, ctx)})`;
            },
        },
    ],
    [
        "exists",
        {
            name: "exists",
            resolve(
                ctx: CompilerContext,
                args: readonly (TypeRef | undefined)[],
                ref: SrcInfo,
            ) {
                checkArgumentsLength(
                    args,
                    2,
                    "exists expects one argument",
                    ref,
                );

                const [self, key] = args;
                checkMapType(self, ref);
                checkKeyType(key, self.key, ref);

                // Returns boolean
                return { kind: "ref", name: "Bool", optional: false };
            },
            generate(
                ctx: WriterContext,
                args: readonly (TypeRef | undefined)[],
                exprs: readonly AstExpression[],
                ref: SrcInfo,
            ) {
                checkArgumentsLength(
                    args,
                    2,
                    "exists expects one argument",
                    ref,
                );

                const [self] = args;
                checkMapType(self, ref);

                const resolved = exprs.map((v) => writeExpression(v, ctx));
                const { bits, kind } = resolveMapKeyBits(self, ref);

                if (self.key === "Int") {
                    ctx.used(`__tact_dict_exists_${kind}`);
                    return `__tact_dict_exists_${kind}(${resolved[0]}, ${bits}, ${resolved[1]})`;
                } else if (self.key === "Address") {
                    ctx.used(`__tact_dict_exists_slice`);
                    return `__tact_dict_exists_slice(${resolved[0]}, 267, ${resolved[1]})`;
                }

                throwCompilationError(
                    `exists expects a map with Int or Address keys`,
                    ref,
                );
            },
        },
    ],
    [
        "deepEquals",
        {
            name: "deepEquals",
            resolve(
                ctx: CompilerContext,
                args: readonly (TypeRef | undefined)[],
                ref: SrcInfo,
            ) {
                checkArgumentsLength(
                    args,
                    2,
                    "deepEquals expects two arguments",
                    ref,
                );

                const [self, other] = args;
                checkMapType(self, ref);
                checkMapType(other, ref);

                if (!isAssignable(self, other)) {
                    throwCompilationError(
                        `Type mismatch: cannot pass argument of type "${printTypeRef(other)}" to parameter of type "${printTypeRef(self)}"`,
                        ref,
                    );
                }

                return { kind: "ref", name: "Bool", optional: false };
            },
            generate(
                ctx: WriterContext,
                args: readonly (TypeRef | undefined)[],
                exprs: readonly AstExpression[],
                ref: SrcInfo,
            ) {
                checkArgumentsLength(
                    args,
                    2,
                    "deepEquals expects two arguments",
                    ref,
                );

                const [self, other] = args;
                checkMapType(self, ref);
                checkMapType(other, ref);

                // Determine key length based on key type
                let keyLength: number;
                if (self.key === "Int") {
                    if (self.keyAs) {
                        if (self.keyAs.startsWith("int")) {
                            keyLength = parseInt(self.keyAs.slice(3), 10);
                        } else if (self.keyAs.startsWith("uint")) {
                            keyLength = parseInt(self.keyAs.slice(4), 10);
                        } else {
                            throwCompilationError(
                                "Invalid key serialization type",
                                ref,
                            );
                        }
                    } else {
                        keyLength = 257;
                    }
                } else if (self.key === "Address") {
                    keyLength = 267;
                } else {
                    throwCompilationError(
                        `Unsupported key type: ${self.key}`,
                        ref,
                    );
                }

                ctx.used("__tact_dict_eq");
                return `__tact_dict_eq(${writeExpression(exprs[0]!, ctx)}, ${writeExpression(exprs[1]!, ctx)}, ${keyLength})`;
            },
        },
    ],
    [
        "replace",
        {
            name: "replace",
            resolve(
                ctx: CompilerContext,
                args: readonly (TypeRef | undefined)[],
                ref: SrcInfo,
            ) {
                checkArgumentsLength(
                    args,
                    3,
                    "replace expects two arguments",
                    ref,
                );

                const [self, key, value] = args;
                checkMapType(self, ref);
                checkKeyType(key, self.key, ref);
                checkValueType(value, self.value, ref);

                // Returns boolean indicating if the key was replaced
                return { kind: "ref", name: "Bool", optional: false };
            },
            generate(
                ctx: WriterContext,
                args: readonly (TypeRef | undefined)[],
                exprs: readonly AstExpression[],
                ref: SrcInfo,
            ) {
                checkArgumentsLength(
                    args,
                    3,
                    "replace expects two arguments",
                    ref,
                );

                const [self, , value] = args;
                checkMapType(self, ref);

                const resolved = exprs.map((v) => writeExpression(v, ctx));
                const { bits, kind } = resolveMapKeyBits(self, ref);

                if (self.value === "Int") {
                    let vBits = 257;
                    let vKind = "int";
                    if (self.valueAs?.startsWith("int")) {
                        vBits = parseInt(self.valueAs.slice(3), 10);
                    } else if (self.valueAs?.startsWith("uint")) {
                        vBits = parseInt(self.valueAs.slice(4), 10);
                        vKind = "uint";
                    } else if (self.valueAs?.startsWith("coins")) {
                        vKind = "coins";
                        ctx.used(`__tact_dict_replace_${kind}_${vKind}`);
                        return `${resolved[0]}~__tact_dict_replace_${kind}_${vKind}(${bits}, ${resolved[1]}, ${resolved[2]})`;
                    } else if (self.valueAs?.startsWith("var")) {
                        vKind = self.valueAs;
                        ctx.used(`__tact_dict_replace_${kind}_${vKind}`);
                        return `${resolved[0]}~__tact_dict_replace_${kind}_${vKind}(${bits}, ${resolved[1]}, ${resolved[2]})`;
                    }
                    ctx.used(`__tact_dict_replace_${kind}_${vKind}`);
                    return `${resolved[0]}~__tact_dict_replace_${kind}_${vKind}(${bits}, ${resolved[1]}, ${resolved[2]}, ${vBits})`;
                } else if (self.value === "Bool") {
                    ctx.used(`__tact_dict_replace_${kind}_int`);
                    return `${resolved[0]}~__tact_dict_replace_${kind}_int(${bits}, ${resolved[1]}, ${resolved[2]}, 1)`;
                } else if (self.value === "Cell") {
                    ctx.used(`__tact_dict_replace_${kind}_cell`);
                    return `${resolved[0]}~__tact_dict_replace_${kind}_cell(${bits}, ${resolved[1]}, ${resolved[2]})`;
                } else if (self.value === "Address") {
                    ctx.used(`__tact_dict_replace_${kind}_slice`);
                    return `${resolved[0]}~__tact_dict_replace_${kind}_slice(${bits}, ${resolved[1]}, ${resolved[2]})`;
                } else {
                    return handleStructOrOtherValue(
                        self,
                        value!,
                        resolved,
                        ctx,
                        ref,
                        bits,
                        kind,
                        "replace",
                    );
                }
            },
        },
    ],
    [
        "replaceGet",
        {
            name: "replaceGet",
            resolve(
                ctx: CompilerContext,
                args: readonly (TypeRef | undefined)[],
                ref: SrcInfo,
            ) {
                checkArgumentsLength(
                    args,
                    3,
                    "replaceGet expects two arguments",
                    ref,
                );

                const [self, key, value] = args;
                checkMapType(self, ref);
                checkKeyType(key, self.key, ref);
                checkValueType(value, self.value, ref);

                // Returns the previous value if it exists
                return { kind: "ref", name: self.value, optional: true };
            },
            generate(
                ctx: WriterContext,
                args: readonly (TypeRef | undefined)[],
                exprs: readonly AstExpression[],
                ref: SrcInfo,
            ) {
                checkArgumentsLength(
                    args,
                    3,
                    "replaceGet expects two arguments",
                    ref,
                );

                const [self, , value] = args;
                checkMapType(self, ref);

                const resolved = exprs.map((v) => writeExpression(v, ctx));
                const { bits, kind } = resolveMapKeyBits(self, ref);

                if (self.value === "Int") {
                    let vBits = 257;
                    let vKind = "int";
                    if (self.valueAs?.startsWith("int")) {
                        vBits = parseInt(self.valueAs.slice(3), 10);
                    } else if (self.valueAs?.startsWith("uint")) {
                        vBits = parseInt(self.valueAs.slice(4), 10);
                        vKind = "uint";
                    } else if (self.valueAs?.startsWith("coins")) {
                        vKind = "coins";
                        ctx.used(`__tact_dict_replaceget_${kind}_${vKind}`);
                        return `${resolved[0]}~__tact_dict_replaceget_${kind}_${vKind}(${bits}, ${resolved[1]}, ${resolved[2]})`;
                    } else if (self.valueAs?.startsWith("var")) {
                        vKind = self.valueAs;
                        ctx.used(`__tact_dict_replaceget_${kind}_${vKind}`);
                        return `${resolved[0]}~__tact_dict_replaceget_${kind}_${vKind}(${bits}, ${resolved[1]}, ${resolved[2]})`;
                    }
                    ctx.used(`__tact_dict_replaceget_${kind}_${vKind}`);
                    return `${resolved[0]}~__tact_dict_replaceget_${kind}_${vKind}(${bits}, ${resolved[1]}, ${resolved[2]}, ${vBits})`;
                } else if (self.value === "Bool") {
                    ctx.used(`__tact_dict_replaceget_${kind}_int`);
                    return `${resolved[0]}~__tact_dict_replaceget_${kind}_int(${bits}, ${resolved[1]}, ${resolved[2]}, 1)`;
                } else if (self.value === "Cell") {
                    ctx.used(`__tact_dict_replaceget_${kind}_cell`);
                    return `${resolved[0]}~__tact_dict_replaceget_${kind}_cell(${bits}, ${resolved[1]}, ${resolved[2]})`;
                } else if (self.value === "Address") {
                    ctx.used(`__tact_dict_replaceget_${kind}_slice`);
                    return `${resolved[0]}~__tact_dict_replaceget_${kind}_slice(${bits}, ${resolved[1]}, ${resolved[2]})`;
                } else {
                    const t = getType(ctx.ctx, self.value);
                    if (t.kind === "contract") {
                        throwCompilationError(
                            `Contract can't be value of a map`,
                            ref,
                        );
                    }
                    if (t.kind === "trait") {
                        throwCompilationError(
                            `Trait can't be value of a map`,
                            ref,
                        );
                    }
                    if (t.kind === "struct") {
                        const writerFunc =
                            value!.kind === "ref" && !value!.optional
                                ? ops.writerCell(t.name, ctx)
                                : ops.writerCellOpt(t.name, ctx);
                        ctx.used(`__tact_dict_replaceget_${kind}_cell`);
                        return `${ops.readerOpt(t.name, ctx)}(${resolved[0]}~__tact_dict_replaceget_${kind}_cell(${bits}, ${resolved[1]}, ${writerFunc}(${resolved[2]})))`;
                    }
                    throwCompilationError(
                        `"${t.name}" can't be value of a map`,
                        ref,
                    );
                }
            },
        },
    ],
]);
