import { ops } from "../generator/writers/ops";
import { writeExpression } from "../generator/writers/writeExpression";
import { throwSyntaxError } from "../errors";
import { getType } from "../types/resolveDescriptors";
import { AbiFunction } from "./AbiFunction";

export const StructFunctions: Map<string, AbiFunction> = new Map([
    [
        "toCell",
        {
            name: "toCell",
            resolve: (ctx, args, ref) => {
                if (args.length !== 1) {
                    throwSyntaxError("toCell() expects no arguments", ref);
                }
                if (args[0].kind !== "ref") {
                    throwSyntaxError(
                        "toCell() is implemented only a struct type",
                        ref,
                    );
                }
                const tp = getType(ctx, args[0].name);
                if (tp.kind !== "struct") {
                    throwSyntaxError(
                        "toCell() is implemented only a struct type",
                        ref,
                    );
                }
                return { kind: "ref", name: "Cell", optional: false };
            },
            generate: (ctx, args, resolved, ref) => {
                if (resolved.length !== 1) {
                    throwSyntaxError("toCell() expects no arguments", ref);
                }
                if (args[0].kind !== "ref") {
                    throwSyntaxError(
                        "toCell() is implemented only a struct type",
                        ref,
                    );
                }
                return `${ops.writerCell(args[0].name, ctx)}(${resolved.map((v) => writeExpression(v, ctx)).join(", ")})`;
            },
        },
    ],
]);
