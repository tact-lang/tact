import { ops } from "../generator/writers/ops";
import { writeExpression } from "../generator/writers/writeExpression";
import { throwCompilationError } from "../errors";
import { getType } from "../types/resolveDescriptors";
import { AbiFunction } from "./AbiFunction";

export const MapFunctions: Map<string, AbiFunction> = new Map([
    [
        "set",
        {
            name: "set",
            resolve(ctx, args, ref) {
                // Check arguments
                if (args.length !== 3) {
                    throwCompilationError("set expects two arguments", ref); // Should not happen
                }
                const self = args[0];
                if (!self || self.kind !== "map") {
                    throwCompilationError(
                        "set expects a map as self argument",
                        ref,
                    ); // Should not happen
                }

                // Resolve map types
                if (self.key !== "Int" && self.key !== "Address") {
                    throwCompilationError(
                        "set expects a map with Int or Address keys",
                        ref,
                    );
                }

                // Check key type
                if (args[1].kind !== "ref" || args[1].optional) {
                    throwCompilationError(
                        "set expects a direct type as first argument",
                        ref,
                    );
                }
                if (args[1].name !== self.key) {
                    throwCompilationError(
                        `set expects a "${self.key}" as first argument`,
                        ref,
                    );
                }

                // Check value type
                if (args[2].kind !== "null" && args[2].kind !== "ref") {
                    throwCompilationError(
                        "set expects a direct type as second argument",
                        ref,
                    );
                }
                if (args[2].kind !== "null" && args[2].name !== self.value) {
                    throwCompilationError(
                        `set expects a "${self.value}" as second argument`,
                        ref,
                    );
                }

                // Returns nothing
                return { kind: "void" };
            },
            generate: (ctx, args, exprs, ref) => {
                // Check arguments
                if (args.length !== 3) {
                    throwCompilationError("set expects two arguments", ref); // Ignore self argument
                }
                const self = args[0];
                if (!self || self.kind !== "map") {
                    throwCompilationError(
                        "set expects a map as self argument",
                        ref,
                    ); // Should not happen
                }

                // Render expressions
                const resolved = exprs.map((v) => writeExpression(v, ctx));

                // Handle Int key
                if (self.key === "Int") {
                    let bits = 257;
                    let kind = "int";
                    if (self.keyAs && self.keyAs.startsWith("int")) {
                        bits = parseInt(self.keyAs.slice(3), 10);
                    } else if (self.keyAs && self.keyAs.startsWith("uint")) {
                        bits = parseInt(self.keyAs.slice(4), 10);
                        kind = "uint";
                    }
                    if (self.value === "Int") {
                        let vBits = 257;
                        let vKind = "int";
                        if (self.valueAs && self.valueAs.startsWith("int")) {
                            vBits = parseInt(self.valueAs.slice(3), 10);
                        } else if (
                            self.valueAs &&
                            self.valueAs.startsWith("uint")
                        ) {
                            vBits = parseInt(self.valueAs.slice(4), 10);
                            vKind = "uint";
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
                            ctx.used(`__tact_dict_set_${kind}_cell`);
                            if (args[2].kind === "ref" && !args[2].optional) {
                                return `${resolved[0]}~__tact_dict_set_${kind}_cell(${bits}, ${resolved[1]}, ${ops.writerCell(t.name, ctx)}(${resolved[2]}))`;
                            } else {
                                return `${resolved[0]}~__tact_dict_set_${kind}_cell(${bits}, ${resolved[1]}, ${ops.writerCellOpt(t.name, ctx)}(${resolved[2]}))`;
                            }
                        } else {
                            throwCompilationError(
                                `"${t.name}" can't be value of a map`,
                                ref,
                            );
                        }
                    }
                }

                // Handle address key
                if (self.key === "Address") {
                    if (self.value === "Int") {
                        let vBits = 257;
                        let vKind = "int";
                        if (self.valueAs && self.valueAs.startsWith("int")) {
                            vBits = parseInt(self.valueAs.slice(3), 10);
                        } else if (
                            self.valueAs &&
                            self.valueAs.startsWith("uint")
                        ) {
                            vBits = parseInt(self.valueAs.slice(4), 10);
                            vKind = "uint";
                        }
                        ctx.used(`__tact_dict_set_slice_${vKind}`);
                        return `${resolved[0]}~__tact_dict_set_slice_${vKind}(267, ${resolved[1]}, ${resolved[2]}, ${vBits})`;
                    } else if (self.value === "Bool") {
                        ctx.used(`__tact_dict_set_slice_int`);
                        return `${resolved[0]}~__tact_dict_set_slice_int(267, ${resolved[1]}, ${resolved[2]}, 1)`;
                    } else if (self.value === "Cell") {
                        ctx.used(`__tact_dict_set_slice_cell`);
                        return `${resolved[0]}~__tact_dict_set_slice_cell(267, ${resolved[1]}, ${resolved[2]})`;
                    } else if (self.value === "Address") {
                        ctx.used(`__tact_dict_set_slice_slice`);
                        return `${resolved[0]}~__tact_dict_set_slice_slice(267, ${resolved[1]}, ${resolved[2]})`;
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
                            ctx.used(`__tact_dict_set_slice_cell`);
                            if (args[2].kind === "ref" && !args[2].optional) {
                                return `${resolved[0]}~__tact_dict_set_slice_cell(267, ${resolved[1]}, ${ops.writerCell(t.name, ctx)}(${resolved[2]}))`;
                            } else {
                                return `${resolved[0]}~__tact_dict_set_slice_cell(267, ${resolved[1]}, ${ops.writerCellOpt(t.name, ctx)}(${resolved[2]}))`;
                            }
                        } else {
                            throwCompilationError(
                                `"${t.name}" can't be value of a map`,
                                ref,
                            );
                        }
                    }
                }

                throwCompilationError(
                    `set expects a map with Int or Address keys`,
                    ref,
                );
            },
        },
    ],
    [
        "get",
        {
            name: "get",
            resolve(ctx, args, ref) {
                // Check arguments
                if (args.length !== 2) {
                    throwCompilationError("set expects one argument", ref); // Ignore self argument
                }
                const self = args[0];
                if (!self || self.kind !== "map") {
                    throwCompilationError(
                        "set expects a map as self argument",
                        ref,
                    ); // Should not happen
                }

                // Check key type
                if (args[1].kind !== "ref" || args[1].optional) {
                    throwCompilationError(
                        "set expects a direct type as first argument",
                        ref,
                    );
                }
                if (args[1].name !== self.key) {
                    throwCompilationError(
                        `set expects a "${self.key}" as first argument`,
                        ref,
                    );
                }

                return { kind: "ref", name: self.value, optional: true };
            },
            generate: (ctx, args, exprs, ref) => {
                if (args.length !== 2) {
                    throwCompilationError("set expects one argument", ref); // Ignore self argument
                }
                const self = args[0];
                if (!self || self.kind !== "map") {
                    throwCompilationError(
                        "set expects a map as self argument",
                        ref,
                    ); // Should not happen
                }

                // Render expressions
                const resolved = exprs.map((v) => writeExpression(v, ctx));

                // Handle Int key
                if (self.key === "Int") {
                    let bits = 257;
                    let kind = "int";
                    if (self.keyAs && self.keyAs.startsWith("int")) {
                        bits = parseInt(self.keyAs.slice(3), 10);
                    } else if (self.keyAs && self.keyAs.startsWith("uint")) {
                        bits = parseInt(self.keyAs.slice(4), 10);
                        kind = "uint";
                    }
                    if (self.value === "Int") {
                        let vBits = 257;
                        let vKind = "int";
                        if (self.valueAs && self.valueAs.startsWith("int")) {
                            vBits = parseInt(self.valueAs.slice(3), 10);
                        } else if (
                            self.valueAs &&
                            self.valueAs.startsWith("uint")
                        ) {
                            vBits = parseInt(self.valueAs.slice(4), 10);
                            vKind = "uint";
                        }
                        ctx.used(`__tact_dict_get_${kind}_${vKind}`);
                        return `__tact_dict_get_${kind}_${vKind}(${resolved[0]}, ${bits}, ${resolved[1]}, ${vBits})`;
                    } else if (self.value === "Bool") {
                        ctx.used(`__tact_dict_get_${kind}_int`);
                        return `__tact_dict_get_int_int(${resolved[0]}, ${bits}, ${resolved[1]}, 1)`;
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
                        } else {
                            throwCompilationError(
                                `"${t.name}" can't be value of a map`,
                                ref,
                            );
                        }
                    }
                }

                // Handle Address key
                if (self.key === "Address") {
                    if (self.value === "Int") {
                        let vBits = 257;
                        let vKind = "int";
                        if (self.valueAs && self.valueAs.startsWith("int")) {
                            vBits = parseInt(self.valueAs.slice(3), 10);
                        } else if (
                            self.valueAs &&
                            self.valueAs.startsWith("uint")
                        ) {
                            vBits = parseInt(self.valueAs.slice(4), 10);
                            vKind = "uint";
                        }
                        ctx.used(`__tact_dict_get_slice_${vKind}`);
                        return `__tact_dict_get_slice_${vKind}(${resolved[0]}, 267, ${resolved[1]}, ${vBits})`;
                    } else if (self.value === "Bool") {
                        ctx.used(`__tact_dict_get_slice_int`);
                        return `__tact_dict_get_slice_int(${resolved[0]}, 267, ${resolved[1]}, 1)`;
                    } else if (self.value === "Cell") {
                        ctx.used(`__tact_dict_get_slice_cell`);
                        return `__tact_dict_get_slice_cell(${resolved[0]}, 267, ${resolved[1]})`;
                    } else if (self.value === "Address") {
                        ctx.used(`__tact_dict_get_slice_slice`);
                        return `__tact_dict_get_slice_slice(${resolved[0]}, 267, ${resolved[1]})`;
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
                            ctx.used(`__tact_dict_get_slice_cell`);
                            return `${ops.readerOpt(t.name, ctx)}(__tact_dict_get_slice_cell(${resolved[0]}, 267, ${resolved[1]}))`;
                        } else {
                            throwCompilationError(
                                `"${t.name}" can't be value of a map`,
                                ref,
                            );
                        }
                    }
                }

                throwCompilationError(`set expects a map with Int keys`, ref);
            },
        },
    ],
    [
        "del",
        {
            name: "del",
            resolve(ctx, args, ref) {
                // Check arguments
                if (args.length !== 2) {
                    throwCompilationError("del expects one argument", ref); // Ignore self argument
                }
                const self = args[0];
                if (!self || self.kind !== "map") {
                    throwCompilationError(
                        "del expects a map as self argument",
                        ref,
                    ); // Should not happen
                }

                // Check key type
                if (args[1].kind !== "ref" || args[1].optional) {
                    throwCompilationError(
                        "del expects a direct type as first argument",
                        ref,
                    );
                }
                if (args[1].name !== self.key) {
                    throwCompilationError(
                        `del expects a "${self.key}" as first argument`,
                        ref,
                    );
                }

                // Returns boolean
                return { kind: "ref", name: "Bool", optional: false };
            },
            generate: (ctx, args, exprs, ref) => {
                if (args.length !== 2) {
                    throwCompilationError("del expects one argument", ref); // Ignore self argument
                }
                const self = args[0];
                if (!self || self.kind !== "map") {
                    throwCompilationError(
                        "del expects a map as self argument",
                        ref,
                    ); // Should not happen
                }

                // Render expressions
                const resolved = exprs.map((v) => writeExpression(v, ctx));

                // Handle Int key
                if (self.key === "Int") {
                    let bits = 257;
                    let kind = "int";
                    if (self.keyAs && self.keyAs.startsWith("int")) {
                        bits = parseInt(self.keyAs.slice(3), 10);
                    } else if (self.keyAs && self.keyAs.startsWith("uint")) {
                        bits = parseInt(self.keyAs.slice(4), 10);
                        kind = "uint";
                    }
                    ctx.used(`__tact_dict_delete_${kind}`);
                    return `${resolved[0]}~__tact_dict_delete_${kind}(${bits}, ${resolved[1]})`;
                }

                // Handle Address key
                if (self.key === "Address") {
                    ctx.used(`__tact_dict_delete`);
                    return `${resolved[0]}~__tact_dict_delete(267, ${resolved[1]})`;
                }

                throwCompilationError(`del expects a map with Int keys`, ref);
            },
        },
    ],
    [
        "asCell",
        {
            name: "asCell",
            resolve(ctx, args, ref) {
                // Check arguments
                if (args.length !== 1) {
                    throwCompilationError("asCell expects one argument", ref); // Ignore self argument
                }
                const self = args[0];
                if (!self || self.kind !== "map") {
                    throwCompilationError(
                        "asCell expects a map as self argument",
                        ref,
                    ); // Should not happen
                }

                return { kind: "ref", name: "Cell", optional: true };
            },
            generate: (ctx, args, exprs, ref) => {
                if (args.length !== 1) {
                    throwCompilationError("asCell expects one argument", ref); // Ignore self argument
                }
                const self = args[0];
                if (!self || self.kind !== "map") {
                    throwCompilationError(
                        "asCell expects a map as self argument",
                        ref,
                    ); // Should not happen
                }

                return writeExpression(exprs[0], ctx);
            },
        },
    ],
    [
        "isEmpty",
        {
            name: "isEmpty",
            resolve(ctx, args, ref) {
                // Check arguments
                if (args.length !== 1) {
                    throwCompilationError("isEmpty expects one argument", ref); // Ignore self argument
                }
                const self = args[0];
                if (!self || self.kind !== "map") {
                    throwCompilationError(
                        "isEmpty expects a map as self argument",
                        ref,
                    ); // Should not happen
                }

                return { kind: "ref", name: "Bool", optional: false };
            },
            generate: (ctx, args, exprs, ref) => {
                if (args.length !== 1) {
                    throwCompilationError("isEmpty expects one argument", ref); // Ignore self argument
                }
                const self = args[0];
                if (!self || self.kind !== "map") {
                    throwCompilationError(
                        "isEmpty expects a map as self argument",
                        ref,
                    ); // Should not happen
                }

                return `null?(${writeExpression(exprs[0], ctx)})`;
            },
        },
    ],
]);
