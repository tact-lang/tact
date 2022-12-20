import { fromNano, toNano } from "ton";
import { throwError } from "../grammar/ast";
import { AbiFunction } from "./AbiFunction";

export const GlobalFunctions: { [key: string]: AbiFunction } = {
    ton: {
        name: 'ton',
        resolve: (ctx, args, ref) => {
            if (args.length !== 1) {
                throwError('ton() expects single string argument', ref);
            }
            if (args[0].kind !== 'string') {
                throwError('ton() expects single string argument', ref);
            }
            try {
                toNano(args[0].value);
            } catch (e) {
                throwError('ton() invalid value string argument', ref);
            }
            return { kind: 'ref', name: 'Int', optional: false };
        },
        generate: (ctx, args, resolved, ref) => {
            if (args.length !== 1) {
                throwError('ton() expects single string argument', ref);
            }
            if (args[0].kind !== 'string') {
                throwError('ton() expects single string argument', ref);
            }
            return toNano(args[0].value).toString(10);
        }
    }
}