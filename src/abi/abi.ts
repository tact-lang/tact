import { writeExpression } from "../generator/writers/writeExpression";
import { throwError } from "../grammar/ast";
import { AbiFunction } from "./AbiFunction";

export const abi: { [key: string]: AbiFunction } = {
    dump: {
        name: 'dump',
        resolve: (ctx, args, ref) => {
            if (args.length !== 1) {
                throwError('dump expects 1 argument', ref);
            }
            return { kind: 'void' };
        },
        generate: (ctx, args, resolved, ref) => {
            return `${writeExpression(resolved[0], ctx)}~dump()`;
        }
    }
};