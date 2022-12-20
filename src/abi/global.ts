import { toNano } from "ton";
import { throwError } from "../grammar/ast";
import { resolveConstantValue } from "../types/resolveConstantValue";
import { AbiFunction } from "./AbiFunction";

export const GlobalFunctions: { [key: string]: AbiFunction } = {
    ton: {
        name: 'ton',
        resolve: (ctx, args, ref) => {
            if (args.length !== 1) {
                throwError('ton() expects single string argument', ref);
            }
            if (args[0].kind !== 'ref') {
                throwError('ton() expects single string argument', ref);
            }
            if (args[0].name !== 'String') {
                throwError('ton() expects single string argument', ref);
            }
            return { kind: 'ref', name: 'Int', optional: false };
        },
        generate: (ctx, args, resolved, ref) => {
            if (resolved.length !== 1) {
                throwError('ton() expects single string argument', ref);
            }
            let str = resolveConstantValue({ kind: 'ref', name: 'String', optional: false }, resolved[0]) as string;
            return toNano(str).toString(10);
        }
    }
}