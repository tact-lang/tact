import { toNano } from "ton-core";
import { enabledDebug } from "../config";
import { writeExpression } from "../generator/writers/writeExpression";
import { throwError } from "../grammar/ast";
import { resolveConstantValue } from "../types/resolveConstantValue";
import { getErrorId } from "../types/resolveStrings";
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
            return `throw_unless(${getErrorId(str, ctx.ctx)}, ${writeExpression(resolved[0], ctx)})`;
        }
    },
    dump: {
        name: 'dump',
        resolve: (ctx, args, ref) => {
            if (args.length !== 1) {
                throwError('dump expects 1 argument', ref);
            }
            return { kind: 'void' };
        },
        generate: (ctx, args, resolved, ref) => {
            if (!enabledDebug(ctx.ctx)) {
                return `${ctx.used('__tact_nop')}()`;
            }
            let arg = args[0];
            if (arg.kind === 'map') {
                let exp = writeExpression(resolved[0], ctx);
                return `${ctx.used(`__tact_debug`)}(${exp})`;
            } else if (arg.kind === 'null') {
                return `${ctx.used(`__tact_debug_str`)}("null")`;
            } else if (arg.kind === 'void') {
                return `${ctx.used(`__tact_debug_str`)}("void")`;
            } else if (arg.kind === 'ref') {
                if (arg.name === 'Int' || arg.name === 'Builder' || arg.name === 'Slice' || arg.name === 'Cell' || arg.name === 'StringBuilder') {
                    let exp = writeExpression(resolved[0], ctx);
                    return `${ctx.used(`__tact_debug_str`)}(${ctx.used(`__tact_int_to_string`)}(${exp}))`;
                } else if (arg.name === 'Bool') {
                    let exp = writeExpression(resolved[0], ctx);
                    return `${ctx.used(`__tact_debug_bool`)}(${exp})`;
                } else if (arg.name === 'String') {
                    let exp = writeExpression(resolved[0], ctx);
                    return `${ctx.used(`__tact_debug_str`)}(${exp})`;
                }
                throwError('dump() not supported for type: ' + arg.name, ref);
            } else {
                throwError('dump() not supported for argument', ref);
            }
        }
    }
}