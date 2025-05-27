import { ops } from "@/generator/writers/ops";
import { writeExpression } from "@/generator/writers/writeExpression";
import { throwCompilationError } from "@/error/errors";
import type { AbiFunction } from "@/abi/AbiFunction";

export const ContractFunctions: Map<string, AbiFunction> = new Map([
    [
        "toCell",
        {
            name: "toCell",
            isStatic: false,
            resolve: (_ctx, args, ref) => {
                if (args.length !== 1) {
                    throwCompilationError("toCell() expects no arguments", ref);
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
        "toSlice",
        {
            name: "toSlice",
            isStatic: false,
            resolve: (ctx, args, ref) => {
                if (args.length !== 1) {
                    throwCompilationError(
                        "toSlice() expects no arguments",
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
]);
