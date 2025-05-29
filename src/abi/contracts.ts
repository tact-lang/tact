import type * as Ast from "@/ast/ast";
import { ops } from "@/generator/writers/ops";
import { writeExpression } from "@/generator/writers/writeExpression";
import { throwCompilationError } from "@/error/errors";
import type { AbiFunction } from "@/abi/AbiFunction";
import { getType, getTypeOrUndefined } from "@/types/resolveDescriptors";
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
    [
        "fromCell",
        {
            name: "fromCell",
            isStatic: true,
            resolve: (ctx, args, ref) => {
                if (args.length !== 2) {
                    throwCompilationError(
                        "fromCell() expects one argument",
                        ref,
                    );
                }
                const contract = args[0]!;
                const cell = args[1]!;
                if (contract.kind !== "ref") {
                    throwCompilationError(
                        "fromCell() is implemented only for struct/contract types",
                        ref,
                    );
                }
                const contractTy = getType(ctx, contract.name);
                if (contractTy.kind !== "contract") {
                    throwCompilationError(
                        "fromCell() is implemented only for struct/contract types",
                        ref,
                    );
                }
                if (cell.kind !== "ref" || cell.name !== "Cell") {
                    throwCompilationError(
                        "fromCell() expects a Cell as an argument",
                        ref,
                    );
                }
                return { kind: "ref", name: contract.name, optional: false };
            },
            generate: (ctx, args, resolved, ref) => {
                if (resolved.length !== 2) {
                    throwCompilationError(
                        "fromCell() expects one argument",
                        ref,
                    );
                }
                const contract = args[0]!;
                const cell = args[1]!;
                if (contract.kind !== "ref") {
                    throwCompilationError(
                        "fromCell() is implemented only for struct/contract types",
                        ref,
                    );
                }
                if (cell.kind !== "ref" || cell.name !== "Cell") {
                    throwCompilationError(
                        "fromCell() expects a Cell as an argument",
                        ref,
                    );
                }
                const skip = skipLazyBit(contract.name, ctx);
                return `${ops.readerNonModifying(contract.name, ctx)}(${writeExpression(resolved[1]!, ctx)}.begin_parse()${skip})`;
            },
        },
    ],
    [
        "fromSlice",
        {
            name: "fromSlice",
            isStatic: true,
            resolve: (ctx, args, ref) => {
                if (args.length !== 2) {
                    throwCompilationError(
                        "fromSlice() expects one argument",
                        ref,
                    );
                }
                const contract = args[0]!;
                const slice = args[1]!;
                if (contract.kind !== "ref") {
                    throwCompilationError(
                        "fromSlice() is implemented only for struct/contract types",
                        ref,
                    );
                }
                const contractTy = getType(ctx, contract.name);
                if (contractTy.kind !== "contract") {
                    throwCompilationError(
                        "fromSlice() is implemented only for struct/contract types",
                        ref,
                    );
                }
                if (slice.kind !== "ref" || slice.name !== "Slice") {
                    throwCompilationError(
                        "fromSlice() expects a Slice as an argument",
                        ref,
                    );
                }
                return { kind: "ref", name: contract.name, optional: false };
            },
            generate: (ctx, args, resolved, ref) => {
                if (resolved.length !== 2) {
                    throwCompilationError(
                        "fromSlice() expects one argument",
                        ref,
                    );
                }
                const contract = args[0]!;
                const slice = args[1]!;
                if (contract.kind !== "ref") {
                    throwCompilationError(
                        "fromSlice() is implemented only for struct/contract types",
                        ref,
                    );
                }
                if (slice.kind !== "ref" || slice.name !== "Slice") {
                    throwCompilationError(
                        "fromSlice() expects a Slice as an argument",
                        ref,
                    );
                }
                const skip = skipLazyBit(contract.name, ctx);
                return `${ops.readerNonModifying(contract.name, ctx)}(${writeExpression(resolved[1]!, ctx)}${skip})`;
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

function skipLazyBit(contractName: string, ctx: WriterContext): string {
    const ty = getType(ctx.ctx, contractName);
    return ty.init?.kind === "init-function" ? ".skip_bits(1)" : "";
}
