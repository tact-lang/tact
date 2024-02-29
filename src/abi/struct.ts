import { ops } from "../generator/writers/ops";
import { writeExpression } from "../generator/writers/writeExpression";
import { throwError } from "../grammar/ast";
import { getType } from "../types/resolveDescriptors";
import { AbiFunction } from "./AbiFunction";

export const StructFunctions: { [key: string]: AbiFunction } = {
    toCell: {
        name: 'toCell',
        resolve: (ctx, args, ref) => {
            if (args.length !== 1) {
                throwError('toCell() expects no arguments', ref);
            }
            if (args[0].kind !== 'ref') {
                throwError('toCell() is implemented only a struct type', ref);
            }
            const tp = getType(ctx, args[0].name);
            if (tp.kind !== 'struct') {
                throwError('toCell() is implemented only a struct type', ref);
            }
            return { kind: 'ref', name: 'Cell', optional: false };
        },
        generate: (ctx, args, resolved, ref) => {
            if (resolved.length !== 1) {
                throwError('toCell() expects no arguments', ref);
            }
            if (args[0].kind !== 'ref') {
                throwError('toCell() is implemented only a struct type', ref);
            }
            return `${ops.writerCell(args[0].name, ctx)}(${resolved.map((v) => writeExpression(v, ctx)).join(', ')})`;
        }
    }
}