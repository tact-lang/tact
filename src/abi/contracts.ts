import type * as Ast from "@/ast/ast";
import { ops } from "@/generator/writers/ops";
import { writeExpression } from "@/generator/writers/writeExpression";
import { throwCompilationError } from "@/error/errors";
import type { AbiFunction } from "@/abi/AbiFunction";
import { getTypeOrUndefined } from "@/types/resolveDescriptors";
import { getExpType } from "@/types/resolveExpression";
import type { WriterContext } from "@/generator/Writer";

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

                const builder = lazyBitBuilder(resolved, ctx);
                return `${ops.writerCell(arg.name, ctx)}(${resolved.map((v) => writeExpression(v, ctx)).join(", ")}, ${builder})`;
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

                const builder = lazyBitBuilder(resolved, ctx);
                return `${ops.writerCell(arg.name, ctx)}(${resolved.map((v) => writeExpression(v, ctx)).join(", ")}, ${builder}).begin_parse()`;
            },
        },
    ],
]);

function lazyBitBuilder(
    resolved: readonly Ast.Expression[],
    ctx: WriterContext,
) {
    const arg = resolved[0]!;

    const type = getExpType(ctx.ctx, arg);
    if (type.kind === "ref") {
        const ty = getTypeOrUndefined(ctx.ctx, type.name);
        if (ty) {
            if (ty.init?.kind === "init-function") {
                return `begin_cell().store_uint(1, 1)`;
            }
        }
    }

    return `begin_cell()`;
}
