import { ops } from "@/generator/writers/ops";
import { writeExpression } from "@/generator/writers/writeExpression";
import {
    throwCompilationError,
    throwInternalCompilerError,
} from "@/error/errors";
import { getType } from "@/types/resolveDescriptors";
import type { AbiFunction } from "@/abi/AbiFunction";
import { messageOpcode } from "@/generator/writers/writeRouter";

export const StructFunctions: Map<string, AbiFunction> = new Map([
    [
        "toCell",
        {
            name: "toCell",
            resolve: (ctx, args, ref) => {
                if (args.length !== 1) {
                    throwCompilationError("toCell() expects no arguments", ref);
                }
                const arg = args[0]!;
                if (arg.kind !== "ref") {
                    throwCompilationError(
                        `toCell() is not implemented for type '${arg.kind}'`,
                        ref,
                    );
                }
                const tp = getType(ctx, arg.name);
                if (tp.kind !== "struct") {
                    throwCompilationError(
                        `toCell() is not implemented for type '${arg.kind}'`,
                        ref,
                    );
                }
                return { kind: "ref", name: "Cell", optional: false };
            },
            generate: (ctx, args, resolved, ref) => {
                if (resolved.length !== 1) {
                    throwCompilationError("toCell() expects no arguments", ref);
                }
                const arg = args[0]!;
                if (arg.kind !== "ref") {
                    throwCompilationError(
                        `toCell() is not implemented for type '${arg.kind}'`,
                        ref,
                    );
                }
                return `${ops.writerCell(arg.name, ctx)}(${resolved.map((v) => writeExpression(v, ctx)).join(", ")})`;
            },
        },
    ],
    [
        "fromCell",
        {
            name: "fromCell",
            resolve: (ctx, args, ref) => {
                if (args.length !== 2) {
                    throwCompilationError(
                        "fromCell() expects one argument",
                        ref,
                    );
                }
                const arg0 = args[0]!;
                const arg1 = args[1]!;
                if (arg0.kind !== "ref") {
                    throwCompilationError(
                        "fromCell() is implemented only for struct types",
                        ref,
                    );
                }
                const tp = getType(ctx, arg0.name);
                if (tp.kind !== "struct") {
                    throwCompilationError(
                        "fromCell() is implemented only for struct types",
                        ref,
                    );
                }
                if (arg1.kind !== "ref" || arg1.name !== "Cell") {
                    throwCompilationError(
                        "fromCell() expects a Cell as an argument",
                        ref,
                    );
                }
                return { kind: "ref", name: arg0.name, optional: false };
            },
            generate: (ctx, args, resolved, ref) => {
                if (resolved.length !== 2) {
                    throwCompilationError(
                        "fromCell() expects one argument",
                        ref,
                    );
                }
                const arg0 = args[0]!;
                const arg1 = args[1]!;
                if (arg0.kind !== "ref") {
                    throwCompilationError(
                        "fromCell() is implemented only for struct types",
                        ref,
                    );
                }
                if (arg1.kind !== "ref" || arg1.name !== "Cell") {
                    throwCompilationError(
                        "fromCell() expects a Cell as an argument",
                        ref,
                    );
                }
                return `${ops.readerNonModifying(arg0.name, ctx)}(${writeExpression(resolved[1]!, ctx)}.begin_parse())`;
            },
        },
    ],
    [
        "opcode",
        {
            name: "opcode",
            resolve: (_ctx, args, ref) => {
                if (args.length !== 1) {
                    throwCompilationError("opcode() expects no arguments", ref);
                }
                return { kind: "ref", name: "Int", optional: false };
            },
            generate: (ctx, args, _resolved, ref) => {
                if (args.length !== 1) {
                    throwCompilationError("opcode() expects no arguments", ref);
                }
                const arg = args[0]!;
                if (arg.kind !== "ref") {
                    throwCompilationError(
                        `opcode() is not implemented for type '${arg.kind}'`,
                        ref,
                    );
                }
                const type = getType(ctx.ctx, arg.name);
                if (type.kind !== "struct") {
                    throwCompilationError(
                        `opcode() is not implemented for type '${arg.kind}'`,
                        ref,
                    );
                }

                if (!type.header) {
                    throwInternalCompilerError(
                        `Invalid allocation: ${type.name}`,
                        type.ast.name.loc,
                    );
                }

                return messageOpcode(type.header);
            },
        },
    ],
    [
        "toSlice",
        {
            name: "toSlice",
            resolve: (ctx, args, ref) => {
                if (args.length !== 1) {
                    throwCompilationError(
                        "toSlice() expects no arguments",
                        ref,
                    );
                }
                const arg = args[0]!;
                if (arg.kind !== "ref") {
                    throwCompilationError(
                        `toSlice() is not implemented for type '${arg.kind}'`,
                        ref,
                    );
                }
                const tp = getType(ctx, arg.name);
                if (tp.kind !== "struct") {
                    throwCompilationError(
                        `toSlice() is not implemented for type '${arg.kind}'`,
                        ref,
                    );
                }
                return { kind: "ref", name: "Slice", optional: false };
            },
            generate: (ctx, args, resolved, ref) => {
                if (resolved.length !== 1) {
                    throwCompilationError(
                        "toSlice() expects no arguments",
                        ref,
                    );
                }
                const arg = args[0]!;
                if (arg.kind !== "ref") {
                    throwCompilationError(
                        `toSlice() is not implemented for type '${arg.kind}'`,
                        ref,
                    );
                }
                return `${ops.writerCell(arg.name, ctx)}(${resolved.map((v) => writeExpression(v, ctx)).join(", ")}).begin_parse()`;
            },
        },
    ],
    [
        "fromSlice",
        {
            name: "fromSlice",
            resolve: (ctx, args, ref) => {
                if (args.length !== 2) {
                    throwCompilationError(
                        "fromSlice() expects one argument",
                        ref,
                    );
                }
                const arg0 = args[0]!;
                const arg1 = args[1]!;
                if (arg0.kind !== "ref") {
                    throwCompilationError(
                        "fromSlice() is implemented only for struct types",
                        ref,
                    );
                }
                const tp = getType(ctx, arg0.name);
                if (tp.kind !== "struct") {
                    throwCompilationError(
                        "fromSlice() is implemented only for struct types",
                        ref,
                    );
                }
                if (arg1.kind !== "ref" || arg1.name !== "Slice") {
                    throwCompilationError(
                        "fromSlice() expects a Slice as an argument",
                        ref,
                    );
                }
                return { kind: "ref", name: arg0.name, optional: false };
            },
            generate: (ctx, args, resolved, ref) => {
                if (resolved.length !== 2) {
                    throwCompilationError(
                        "fromSlice() expects one argument",
                        ref,
                    );
                }
                const arg0 = args[0]!;
                const arg1 = args[1]!;
                if (arg0.kind !== "ref") {
                    throwCompilationError(
                        "fromSlice() is implemented only for struct types",
                        ref,
                    );
                }
                if (arg1.kind !== "ref" || arg1.name !== "Slice") {
                    throwCompilationError(
                        "fromSlice() expects a Slice as an argument",
                        ref,
                    );
                }
                return `${ops.readerNonModifying(arg0.name, ctx)}(${writeExpression(resolved[1]!, ctx)})`;
            },
        },
    ],
]);
