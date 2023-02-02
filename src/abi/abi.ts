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
            let arg = args[0];
            if (arg.kind === 'null' || arg.kind === 'map') {
                let exp = writeExpression(resolved[0], ctx);
                return ctx.used(`__tact_debug(${exp})`);
            } else if (arg.kind === 'void') {
                return ctx.used(`__tact_debug(null)`);
            } else if (arg.kind === 'ref') {
                if (arg.name === 'Int' || arg.name === 'Builder' || arg.name === 'Slice' || arg.name === 'Cell' || arg.name === 'StringBuilder') {
                    let exp = writeExpression(resolved[0], ctx);
                    return ctx.used(`__tact_debug(${exp})`);
                } else if (arg.name === 'Bool') {
                    let exp = writeExpression(resolved[0], ctx);
                    return ctx.used(`__tact_debug_bool(${exp})`);
                } else if (arg.name === 'String') {
                    let exp = writeExpression(resolved[0], ctx);
                    return ctx.used(`__tact_debug_str(${exp})`);
                }
                throwError('dump() not supported for type: ' + arg.name, ref);
            } else {
                throwError('dump() not supported for argument', ref);
            }
        }
    }
};