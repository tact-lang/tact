import { Address, beginCell, Cell, toNano } from "@ton/core";
import { enabledDebug } from "@/config/features";
import {
    writeAddress,
    writeCell,
    writeSlice,
    writeString,
} from "@/generator/writers/writeConstant";
import { writeExpression } from "@/generator/writers/writeExpression";
import { idTextErr, throwCompilationError } from "@/error/errors";
import { evaluateRequireErrorString, getErrorId } from "@/types/resolveErrors";
import type { AbiFunction } from "@/abi/AbiFunction";
import path from "path";
import { cwd } from "process";
import { posixNormalize } from "@/utils/filePath";
import { ensureString } from "@/optimizer/interpreter";
import { getAstFactory, isLiteral } from "@/ast/ast-helpers";
import { sha256 } from "@/utils/sha256";
import { getAstUtil } from "@/ast/util";

export const GlobalFunctions: Map<string, AbiFunction> = new Map([
    [
        "ton",
        {
            name: "ton",
            isStatic: true,
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
                const resolved0 = resolved[0]!;
                const str = ensureString(resolved0).value;
                return toNano(str).toString(10);
            },
        },
    ],
    [
        "require",
        {
            name: "require",
            isStatic: true,
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
                const resolved1 = resolved[1]!;
                const evaluated = evaluateRequireErrorString(
                    resolved1,
                    ctx.ctx,
                    getAstUtil(getAstFactory()),
                );
                const str = ensureString(evaluated).value;
                return `throw_unless(${getErrorId(str, ctx.ctx)}, ${writeExpression(resolved[0]!, ctx)})`;
            },
        },
    ],
    [
        "address",
        {
            name: "address",
            isStatic: true,
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
                const resolved0 = resolved[0]!;
                const str = ensureString(resolved0).value;
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
            isStatic: true,
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
                const resolved0 = resolved[0]!;
                const str = ensureString(resolved0).value;
                let c: Cell;
                try {
                    c = Cell.fromBase64(str);
                } catch (_) {
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
            isStatic: true,
            resolve: (_ctx, args, ref) => {
                if (args.length !== 1) {
                    throwCompilationError(
                        "dump() expects 1 argument, see https://docs.tact-lang.org/ref/core-debug/#dump for more information",
                        ref,
                    );
                }

                const arg = args[0]!;

                if (!SUPPORTED_TYPES_KIND_IN_DUMP.has(arg.kind)) {
                    throwCompilationError(
                        "Cannot dump() this argument, see https://docs.tact-lang.org/ref/core-debug/#dump for more information",
                        ref,
                    );
                }

                if (
                    arg.kind === "ref" &&
                    !SUPPORTED_PRIMITIVE_TYPES_IN_DUMP.has(arg.name)
                ) {
                    throwCompilationError(
                        `Cannot dump() argument with ${idTextErr(arg.name)} type, see https://docs.tact-lang.org/ref/core-debug/#dump for more information`,
                        ref,
                    );
                }

                return { kind: "void" };
            },
            generate: (ctx, args, resolved, ref) => {
                if (!enabledDebug(ctx.ctx)) {
                    return ``;
                }
                const arg0 = args[0]!;

                const filePath = ref.file
                    ? posixNormalize(path.relative(cwd(), ref.file!))
                    : "unknown";
                const lineCol = ref.interval.getLineAndColumn();
                const debugPrint1 = `File ${filePath}:${lineCol.lineNum}:${lineCol.colNum}:`;
                const contentsId = writeString(ref.interval.contents, ctx);
                ctx.used(contentsId);
                const debugPrint2 = `${contentsId}()`;

                if (arg0.kind === "map") {
                    const exp = writeExpression(resolved[0]!, ctx);
                    return `${ctx.used(`__tact_dump`)}(${exp}, ${debugPrint2}, "${debugPrint1}")`;
                } else if (arg0.kind === "null") {
                    return `${ctx.used(`__tact_dump_str`)}("null", ${debugPrint2}, "${debugPrint1}")`;
                } else if (arg0.kind === "void") {
                    return `${ctx.used(`__tact_dump_str`)}("void", ${debugPrint2}, "${debugPrint1}")`;
                } else if (arg0.kind === "ref") {
                    if (arg0.name === "Int") {
                        const exp = writeExpression(resolved[0]!, ctx);
                        return `${ctx.used(`__tact_dump_int`)}(${exp}, ${debugPrint2}, "${debugPrint1}")`;
                    } else if (arg0.name === "Bool") {
                        const exp = writeExpression(resolved[0]!, ctx);
                        return `${ctx.used(`__tact_dump_bool`)}(${exp}, ${debugPrint2}, "${debugPrint1}")`;
                    } else if (arg0.name === "String") {
                        const exp = writeExpression(resolved[0]!, ctx);
                        return `${ctx.used(`__tact_dump_string`)}(${exp}, ${debugPrint2}, "${debugPrint1}")`;
                    } else if (arg0.name === "Address") {
                        const exp = writeExpression(resolved[0]!, ctx);
                        return `${ctx.used(`__tact_dump_address`)}(${exp}, ${debugPrint2}, "${debugPrint1}")`;
                    } else if (
                        arg0.name === "Builder" ||
                        arg0.name === "Slice" ||
                        arg0.name === "Cell"
                    ) {
                        const exp = writeExpression(resolved[0]!, ctx);
                        return `${ctx.used(`__tact_dump`)}(${exp}, ${debugPrint2}, "${debugPrint1}")`;
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
            isStatic: true,
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
                    return ``;
                }
                const filePath = ref.file
                    ? posixNormalize(path.relative(cwd(), ref.file!))
                    : "unknown";
                const lineCol = ref.interval.getLineAndColumn();
                const debugPrint1 = `File ${filePath}:${lineCol.lineNum}:${lineCol.colNum}:`;
                return `${ctx.used(`__tact_dump_stack`)}("dumpStack()", "${debugPrint1}")`;
            },
        },
    ],
    [
        "emptyMap",
        {
            name: "emptyMap",
            isStatic: true,
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
            isStatic: true,
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
                    const resolved0 = resolved[0]!;

                    if (isLiteral(resolved0)) {
                        // FIXME: This one does not need fixing, because it is carried out inside a "isLiteral" check.
                        // Remove this comment once the optimization step is added
                        const str = ensureString(resolved0).value;
                        return sha256(str).value.toString(10);
                    }

                    // Otherwise, revert back to runtime hash through HASHEXT_SHA256
                    const exp = writeExpression(resolved[0]!, ctx);
                    return `${ctx.used("__tact_sha256")}(${exp})`;
                }

                // Slice case
                if (arg0.name === "Slice") {
                    const exp = writeExpression(resolved[0]!, ctx);
                    return `${ctx.used("__tact_sha256")}(${exp})`;
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
            isStatic: true,
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
                const resolved0 = resolved[0]!;
                const str = ensureString(resolved0).value;
                let c: Cell;
                try {
                    c = Cell.fromBase64(str);
                } catch (_) {
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
            isStatic: true,
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
                const resolved0 = resolved[0]!;
                const str = ensureString(resolved0).value;
                let c: Cell;
                try {
                    c = beginCell().storeBuffer(Buffer.from(str)).endCell();
                } catch (_) {
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
            isStatic: true,
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
                const resolved0 = resolved[0]!;
                const str = ensureString(resolved0).value;
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
            isStatic: true,
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
                const resolved0 = resolved[0]!;
                const str = ensureString(resolved0).value;
                return `"${str}"c`;
            },
        },
    ],
]);

const SUPPORTED_TYPES_KIND_IN_DUMP = new Set(["ref", "void", "null", "map"]);

const SUPPORTED_PRIMITIVE_TYPES_IN_DUMP = new Set([
    "Cell",
    "Slice",
    "Builder",
    "Address",
    "String",
    "Bool",
    "Int",
]);
