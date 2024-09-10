import { Address, beginCell, Cell, toNano } from "@ton/core";
import { enabledDebug, enabledMasterchain } from "../config/features";
import {
    writeAddress,
    writeCell,
    writeSlice,
} from "../generator/writers/writeConstant";
import {
    writeExpression,
    writeValue,
} from "../generator/writers/writeExpression";
import { throwCompilationError } from "../errors";
import { evalConstantExpression } from "../constEval";
import { getErrorId } from "../types/resolveErrors";
import { AbiFunction } from "./AbiFunction";
import { sha256_sync } from "@ton/crypto";
import path from "path";
import { cwd } from "process";
import { posixNormalize } from "../utils/filePath";

export const GlobalFunctions: Map<string, AbiFunction> = new Map([
    [
        "ton",
        {
            name: "ton",
            resolve: (ctx, args, ref) => {
                if (args.length !== 1) {
                    throwCompilationError(
                        "ton() expects single string argument",
                        ref,
                    );
                }
                const arg0 = args[0]!;
                if (arg0.kind !== "ref") {
                    throwCompilationError(
                        "ton() expects single string argument",
                        ref,
                    );
                }
                if (arg0.name !== "String") {
                    throwCompilationError(
                        "ton() expects single string argument",
                        ref,
                    );
                }
                return { kind: "ref", name: "Int", optional: false };
            },
            generate: (ctx, args, resolved, ref) => {
                if (resolved.length !== 1) {
                    throwCompilationError(
                        "ton() expects single string argument",
                        ref,
                    );
                }
                const str = evalConstantExpression(
                    resolved[0]!,
                    ctx.ctx,
                ) as string;
                return toNano(str).toString(10);
            },
        },
    ],
    [
        "require",
        {
            name: "require",
            resolve: (ctx, args, ref) => {
                if (args.length !== 2) {
                    throwCompilationError(
                        "require() expects two arguments",
                        ref,
                    );
                }
                const arg0 = args[0]!;
                const arg1 = args[1]!;
                if (arg0.kind !== "ref") {
                    throwCompilationError(
                        "require() expects first Bool argument",
                        ref,
                    );
                }
                if (arg0.name !== "Bool") {
                    throwCompilationError(
                        "require() expects first Bool argument",
                        ref,
                    );
                }
                if (arg1.kind !== "ref") {
                    throwCompilationError(
                        "require() expects second string argument",
                        ref,
                    );
                }
                if (arg1.name !== "String") {
                    throwCompilationError(
                        "require() expects second string argument",
                        ref,
                    );
                }
                return { kind: "void" };
            },
            generate: (ctx, args, resolved, ref) => {
                if (resolved.length !== 2) {
                    throwCompilationError(
                        "require() expects two arguments",
                        ref,
                    );
                }
                const str = evalConstantExpression(
                    resolved[1]!,
                    ctx.ctx,
                ) as string;
                return `throw_unless(${getErrorId(str, ctx.ctx)}, ${writeExpression(resolved[0]!, ctx)})`;
            },
        },
    ],
    [
        "address",
        {
            name: "address",
            resolve: (ctx, args, ref) => {
                if (args.length !== 1) {
                    throwCompilationError(
                        "address() expects one argument",
                        ref,
                    );
                }
                const arg0 = args[0]!;
                if (arg0.kind !== "ref") {
                    throwCompilationError(
                        "address() expects string argument",
                        ref,
                    );
                }
                if (arg0.name !== "String") {
                    throwCompilationError(
                        "address() expects string argument",
                        ref,
                    );
                }
                return { kind: "ref", name: "Address", optional: false };
            },
            generate: (ctx, args, resolved, ref) => {
                if (resolved.length !== 1) {
                    throwCompilationError(
                        "address() expects one argument",
                        ref,
                    );
                }
                const str = evalConstantExpression(
                    resolved[0]!,
                    ctx.ctx,
                ) as string;
                let address: Address;
                try {
                    address = Address.parse(str);
                } catch {
                    throwCompilationError(`${str} is not a valid address`, ref);
                }
                if (address.workChain !== 0 && address.workChain !== -1) {
                    throwCompilationError(
                        `Address ${str} invalid address`,
                        ref,
                    );
                }
                if (!enabledMasterchain(ctx.ctx)) {
                    if (address.workChain !== 0) {
                        throwCompilationError(
                            `Address ${str} from masterchain are not enabled for this contract`,
                            ref,
                        );
                    }
                }

                // Generate address
                const res = writeAddress(address, ctx);
                ctx.used(res);
                return res + "()";
            },
        },
    ],
    [
        "cell",
        {
            name: "cell",
            resolve: (ctx, args, ref) => {
                if (args.length !== 1) {
                    throwCompilationError("cell() expects one argument", ref);
                }
                const arg0 = args[0]!;
                if (arg0.kind !== "ref") {
                    throwCompilationError(
                        "cell() expects string argument",
                        ref,
                    );
                }
                if (arg0.name !== "String") {
                    throwCompilationError(
                        "cell() expects string argument",
                        ref,
                    );
                }
                return { kind: "ref", name: "Cell", optional: false };
            },
            generate: (ctx, args, resolved, ref) => {
                if (resolved.length !== 1) {
                    throwCompilationError("cell() expects one argument", ref);
                }

                // Load cell data
                const str = evalConstantExpression(
                    resolved[0]!,
                    ctx.ctx,
                ) as string;
                let c: Cell;
                try {
                    c = Cell.fromBase64(str);
                } catch (e) {
                    throwCompilationError(`Invalid cell ${str}`, ref);
                }

                // Generate address
                const res = writeCell(c, ctx);
                ctx.used(res);
                return `${res}()`;
            },
        },
    ],
    [
        "dump",
        {
            name: "dump",
            resolve: (ctx, args, ref) => {
                if (args.length !== 1) {
                    throwCompilationError("dump expects 1 argument", ref);
                }
                return { kind: "void" };
            },
            generate: (ctx, args, resolved, ref) => {
                if (!enabledDebug(ctx.ctx)) {
                    return `${ctx.used("__tact_nop")}()`;
                }
                const arg0 = args[0]!;

                const filePath = ref.file
                    ? posixNormalize(path.relative(cwd(), ref.file!))
                    : "unknown";
                const lineCol = ref.interval.getLineAndColumn();
                const debugPrint1 = `File ${filePath}:${lineCol.lineNum}:${lineCol.colNum}:`;
                const debugPrint2 = writeValue(ref.interval.contents, ctx);

                if (arg0.kind === "map") {
                    const exp = writeExpression(resolved[0]!, ctx);
                    return `${ctx.used(`__tact_debug`)}(${exp}, ${debugPrint2}, "${debugPrint1}")`;
                } else if (arg0.kind === "null") {
                    return `${ctx.used(`__tact_debug_str`)}("null", ${debugPrint2}, "${debugPrint1}")`;
                } else if (arg0.kind === "void") {
                    return `${ctx.used(`__tact_debug_str`)}("void", ${debugPrint2}, "${debugPrint1}")`;
                } else if (arg0.kind === "ref") {
                    if (arg0.name === "Int") {
                        const exp = writeExpression(resolved[0]!, ctx);
                        return `${ctx.used(`__tact_debug_str`)}(${ctx.used(`__tact_int_to_string`)}(${exp}), ${debugPrint2}, "${debugPrint1}")`;
                    } else if (arg0.name === "Bool") {
                        const exp = writeExpression(resolved[0]!, ctx);
                        return `${ctx.used(`__tact_debug_bool`)}(${exp}, ${debugPrint2}, "${debugPrint1}")`;
                    } else if (arg0.name === "String") {
                        const exp = writeExpression(resolved[0]!, ctx);
                        return `${ctx.used(`__tact_debug_str`)}(${exp}, ${debugPrint2}, "${debugPrint1}")`;
                    } else if (arg0.name === "Address") {
                        const exp = writeExpression(resolved[0]!, ctx);
                        return `${ctx.used(`__tact_debug_address`)}(${exp}, ${debugPrint2}, "${debugPrint1}")`;
                    } else if (
                        arg0.name === "Builder" ||
                        arg0.name === "Slice" ||
                        arg0.name === "Cell"
                    ) {
                        const exp = writeExpression(resolved[0]!, ctx);
                        return `${ctx.used(`__tact_debug`)}(${exp}, ${debugPrint2}, "${debugPrint1}")`;
                    }
                    throwCompilationError(
                        "dump() not supported for type: " + arg0.name,
                        ref,
                    );
                } else {
                    throwCompilationError(
                        "dump() not supported for argument",
                        ref,
                    );
                }
            },
        },
    ],
    [
        "dumpStack",
        {
            name: "dumpStack",
            resolve: (_ctx, args, ref) => {
                if (args.length !== 0) {
                    throwCompilationError(
                        "dumpStack expects no arguments",
                        ref,
                    );
                }
                return { kind: "void" };
            },
            generate: (ctx, _args, _resolved, ref) => {
                if (!enabledDebug(ctx.ctx)) {
                    return `${ctx.used("__tact_nop")}()`;
                }
                const filePath = ref.file
                    ? posixNormalize(path.relative(cwd(), ref.file!))
                    : "unknown";
                const lineCol = ref.interval.getLineAndColumn();
                const debugPrint1 = `File ${filePath}:${lineCol.lineNum}:${lineCol.colNum}:`;
                return `${ctx.used(`__tact_debug_stack`)}("dumpStack()", "${debugPrint1}")`;
            },
        },
    ],
    [
        "emptyMap",
        {
            name: "emptyMap",
            resolve: (ctx, args, ref) => {
                if (args.length !== 0) {
                    throwCompilationError("emptyMap expects no arguments", ref);
                }
                return { kind: "null" };
            },
            generate: (_ctx, _args, _resolved, _ref) => {
                return "null()";
            },
        },
    ],
    [
        "sha256",
        {
            name: "sha256",
            resolve: (ctx, args, ref) => {
                if (args.length !== 1) {
                    throwCompilationError("sha256 expects 1 argument", ref);
                }
                const arg0 = args[0]!;
                if (arg0.kind !== "ref") {
                    throwCompilationError(
                        "sha256 expects string argument",
                        ref,
                    );
                }
                if (arg0.name !== "String" && arg0.name !== "Slice") {
                    throwCompilationError(
                        "sha256 expects string or slice argument",
                        ref,
                    );
                }
                return { kind: "ref", name: "Int", optional: false };
            },
            generate: (ctx, args, resolved, ref) => {
                if (args.length !== 1) {
                    throwCompilationError("sha256 expects 1 argument", ref);
                }
                const arg0 = args[0]!;
                if (arg0.kind !== "ref") {
                    throwCompilationError(
                        "sha256 expects string argument",
                        ref,
                    );
                }

                // String case
                if (arg0.name === "String") {
                    try {
                        const str = evalConstantExpression(
                            resolved[0]!,
                            ctx.ctx,
                        ) as string;
                        if (Buffer.from(str).length > 128) {
                            throwCompilationError(
                                "sha256 expects string argument with byte length <= 128",
                                ref,
                            );
                        }
                        return BigInt(
                            "0x" + sha256_sync(str).toString("hex"),
                        ).toString(10);
                    } catch (e) {
                        // Not a constant
                    }
                    const exp = writeExpression(resolved[0]!, ctx);
                    return `string_hash(${exp})`;
                }

                // Slice case
                if (arg0.name === "Slice") {
                    const exp = writeExpression(resolved[0]!, ctx);
                    return `string_hash(${exp})`;
                }

                throwCompilationError(
                    "sha256 expects string or slice argument",
                    ref,
                );
            },
        },
    ],
    [
        "slice",
        {
            name: "slice",
            resolve: (ctx, args, ref) => {
                if (args.length !== 1) {
                    throwCompilationError("slice() expects one argument", ref);
                }
                const arg0 = args[0]!;
                if (arg0.kind !== "ref") {
                    throwCompilationError(
                        "slice() expects string argument",
                        ref,
                    );
                }
                if (arg0.name !== "String") {
                    throwCompilationError(
                        "slice() expects string argument",
                        ref,
                    );
                }
                return { kind: "ref", name: "Slice", optional: false };
            },
            generate: (ctx, args, resolved, ref) => {
                if (resolved.length !== 1) {
                    throwCompilationError("slice() expects one argument", ref);
                }

                // Load slice data
                const str = evalConstantExpression(
                    resolved[0]!,
                    ctx.ctx,
                ) as string;
                let c: Cell;
                try {
                    c = Cell.fromBase64(str);
                } catch (e) {
                    throwCompilationError(`Invalid slice ${str}`, ref);
                }

                const res = writeSlice(c.asSlice(), ctx);
                ctx.used(res);
                return `${res}()`;
            },
        },
    ],
    [
        "rawSlice",
        {
            name: "rawSlice",
            resolve: (ctx, args, ref) => {
                if (args.length !== 1) {
                    throwCompilationError(
                        "rawSlice() expects one argument",
                        ref,
                    );
                }
                const arg0 = args[0]!;
                if (arg0.kind !== "ref") {
                    throwCompilationError(
                        "rawSlice() expects string argument",
                        ref,
                    );
                }
                if (arg0.name !== "String") {
                    throwCompilationError(
                        "rawSlice() expects string argument",
                        ref,
                    );
                }
                return { kind: "ref", name: "Slice", optional: false };
            },
            generate: (ctx, args, resolved, ref) => {
                if (resolved.length !== 1) {
                    throwCompilationError(
                        "rawSlice() expects one argument",
                        ref,
                    );
                }

                // Load slice data
                const str = evalConstantExpression(
                    resolved[0]!,
                    ctx.ctx,
                ) as string;
                let c: Cell;
                try {
                    c = beginCell().storeBuffer(Buffer.from(str)).endCell();
                } catch (e) {
                    throwCompilationError(`Invalid slice data ${str}`, ref);
                }

                const res = writeSlice(c.asSlice(), ctx);
                ctx.used(res);
                return `${res}()`;
            },
        },
    ],
    [
        "ascii",
        {
            name: "ascii",
            resolve: (ctx, args, ref) => {
                if (args.length !== 1) {
                    throwCompilationError("ascii() expects one argument", ref);
                }
                const arg0 = args[0]!;
                if (arg0.kind !== "ref") {
                    throwCompilationError(
                        "ascii() expects string argument",
                        ref,
                    );
                }
                if (arg0.name !== "String") {
                    throwCompilationError(
                        "ascii() expects string argument",
                        ref,
                    );
                }
                return { kind: "ref", name: "Int", optional: false };
            },
            generate: (ctx, args, resolved, ref) => {
                if (resolved.length !== 1) {
                    throwCompilationError("ascii() expects one argument", ref);
                }

                // Load slice data
                const str = evalConstantExpression(
                    resolved[0]!,
                    ctx.ctx,
                ) as string;

                if (str.length > 32) {
                    throwCompilationError(
                        `ascii() expects string argument with length <= 32`,
                        ref,
                    );
                }

                return `"${str}"u`;
            },
        },
    ],
    [
        "crc32",
        {
            name: "crc32",
            resolve: (ctx, args, ref) => {
                if (args.length !== 1) {
                    throwCompilationError("crc32() expects one argument", ref);
                }
                const arg0 = args[0]!;
                if (arg0.kind !== "ref") {
                    throwCompilationError(
                        "crc32() expects string argument",
                        ref,
                    );
                }
                if (arg0.name !== "String") {
                    throwCompilationError(
                        "crc32() expects string argument",
                        ref,
                    );
                }
                return { kind: "ref", name: "Int", optional: false };
            },
            generate: (ctx, args, resolved, ref) => {
                if (resolved.length !== 1) {
                    throwCompilationError("crc32() expects one argument", ref);
                }

                // Load slice data
                const str = evalConstantExpression(
                    resolved[0]!,
                    ctx.ctx,
                ) as string;

                return `"${str}"c`;
            },
        },
    ],
]);
