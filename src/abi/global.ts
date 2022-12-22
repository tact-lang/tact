import { toNano } from "ton";
import { writeExpression } from "../generator/writers/writeExpression";
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
    },
    require: {
        name: 'require',
        resolve: (ctx, args, ref) => {
            if (args.length !== 2) {
                throwError('require() expects two arguments', ref);
            }
            if (args[0].kind !== 'ref') {
                throwError('require() expects first Bool argument', ref);
            }
            if (args[0].name !== 'Bool') {
                throwError('require() expects first Bool argument', ref);
            }
            if (args[1].kind !== 'ref') {
                throwError('require() expects second string argument', ref);
            }
            if (args[1].name !== 'String') {
                throwError('require() expects second string argument', ref);
            }
            return { kind: 'void' };
        },
        generate: (ctx, args, resolved, ref) => {
            if (resolved.length !== 2) {
                throwError('require() expects two arguments', ref);
            }
            let str = resolveConstantValue({ kind: 'ref', name: 'String', optional: false }, resolved[1]) as string;
            return `throw_unless(131, ${writeExpression(resolved[0], ctx)})`;
        }
    }
}