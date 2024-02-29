import { Address, Cell, toNano } from "@ton/core";
import { enabledDebug, enabledMasterchain } from "../config/features";
import { writeAddress, writeCell } from "../generator/writers/writeConstant";
import { writeExpression } from "../generator/writers/writeExpression";
import { throwError } from "../grammar/ast";
import { resolveConstantValue } from "../types/resolveConstantValue";
import { getErrorId } from "../types/resolveErrors";
import { AbiFunction } from "./AbiFunction";
import { sha256_sync } from "@ton/crypto";

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
            const str = resolveConstantValue({ kind: 'ref', name: 'String', optional: false }, resolved[0], ctx.ctx) as string;
            return toNano(str).toString(10);
        }
    },
    pow: {
        name: 'pow',
        resolve: (ctx, args, ref) => {
            if (args.length !== 2) {
                throwError('pow() expects two integer arguments', ref);
            }
            if (args[0].kind !== 'ref') {
                throwError('pow() expects two integer arguments', ref);
            }
            if (args[0].name !== 'Int') {
                throwError('pow() expects two integer arguments', ref);
            }
            if (args[1].kind !== 'ref') {
                throwError('pow() expects two integer arguments', ref);
            }
            if (args[1].name !== 'Int') {
                throwError('pow() expects two integer arguments', ref);
            }
            return { kind: 'ref', name: 'Int', optional: false };
        },
        generate: (ctx, args, resolved, ref) => {
            if (resolved.length !== 2) {
                throwError('pow() expects two integer arguments', ref);
            }
            const a = resolveConstantValue({ kind: 'ref', name: 'Int', optional: false }, resolved[0], ctx.ctx) as bigint;
            const b = resolveConstantValue({ kind: 'ref', name: 'Int', optional: false }, resolved[1], ctx.ctx) as bigint;
            return (a ** b).toString(10);
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
            const str = resolveConstantValue({ kind: 'ref', name: 'String', optional: false }, resolved[1], ctx.ctx) as string;
            return `throw_unless(${getErrorId(str, ctx.ctx)}, ${writeExpression(resolved[0], ctx)})`;
        }
    },
    address: {
        name: 'address',
        resolve: (ctx, args, ref) => {
            if (args.length !== 1) {
                throwError('address() expects one argument', ref);
            }
            if (args[0].kind !== 'ref') {
                throwError('address() expects string argument', ref);
            }
            if (args[0].name !== 'String') {
                throwError('address() expects string argument', ref);
            }
            return { kind: 'ref', name: 'Address', optional: false };
        },
        generate: (ctx, args, resolved, ref) => {
            if (resolved.length !== 1) {
                throwError('address() expects one argument', ref);
            }
            const str = resolveConstantValue({ kind: 'ref', name: 'String', optional: false }, resolved[0], ctx.ctx) as string;
            const address = Address.parse(str);
            if (address.workChain !== 0 && address.workChain !== -1) {
                throwError(`Address ${str} invalid address`, ref);
            }
            if (!enabledMasterchain(ctx.ctx)) {
                if (address.workChain !== 0) {
                    throwError(`Address ${str} from masterchain are not enabled for this contract`, ref);
                }
            }

            // Generate address
            const res = writeAddress(address, ctx);
            ctx.used(res);
            return res + '()';
        }
    },
    cell: {
        name: 'cell',
        resolve: (ctx, args, ref) => {
            if (args.length !== 1) {
                throwError('cell() expects one argument', ref);
            }
            if (args[0].kind !== 'ref') {
                throwError('cell() expects string argument', ref);
            }
            if (args[0].name !== 'String') {
                throwError('cell() expects string argument', ref);
            }
            return { kind: 'ref', name: 'Cell', optional: false };
        },
        generate: (ctx, args, resolved, ref) => {
            if (resolved.length !== 1) {
                throwError('cell() expects one argument', ref);
            }

            // Load cell data
            const str = resolveConstantValue({ kind: 'ref', name: 'String', optional: false }, resolved[0], ctx.ctx) as string;
            let c: Cell;
            try {
                c = Cell.fromBase64(str);
            } catch (e) {
                throwError(`Invalid cell ${str}`, ref);
            }

            // Generate address
            const res = writeCell(c, ctx);
            ctx.used(res);
            return `${res}()`;
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
            const arg = args[0];
            if (arg.kind === 'map') {
                const exp = writeExpression(resolved[0], ctx);
                return `${ctx.used(`__tact_debug`)}(${exp})`;
            } else if (arg.kind === 'null') {
                return `${ctx.used(`__tact_debug_str`)}("null")`;
            } else if (arg.kind === 'void') {
                return `${ctx.used(`__tact_debug_str`)}("void")`;
            } else if (arg.kind === 'ref') {
                if (arg.name === 'Int' || arg.name === 'Builder' || arg.name === 'Slice' || arg.name === 'Cell' || arg.name === 'StringBuilder') {
                    const exp = writeExpression(resolved[0], ctx);
                    return `${ctx.used(`__tact_debug_str`)}(${ctx.used(`__tact_int_to_string`)}(${exp}))`;
                } else if (arg.name === 'Bool') {
                    const exp = writeExpression(resolved[0], ctx);
                    return `${ctx.used(`__tact_debug_bool`)}(${exp})`;
                } else if (arg.name === 'String') {
                    const exp = writeExpression(resolved[0], ctx);
                    return `${ctx.used(`__tact_debug_str`)}(${exp})`;
                }
                throwError('dump() not supported for type: ' + arg.name, ref);
            } else {
                throwError('dump() not supported for argument', ref);
            }
        }
    },
    emptyMap: {
        name: 'emptyMap',
        resolve: (ctx, args, ref) => {
            if (args.length !== 0) {
                throwError('emptyMap expects no arguments', ref);
            }
            return { kind: 'null' };
        },
        generate: (_ctx, _args, _resolved, _ref) => {
            return 'null()';
        }
    },
    sha256: {
        name: 'sha256',
        resolve: (ctx, args, ref) => {
            if (args.length !== 1) {
                throwError('sha256 expects 1 argument', ref);
            }
            if (args[0].kind !== 'ref') {
                throwError('sha256 expects string argument', ref);
            }
            if (args[0].name !== 'String' && args[0].name !== 'Slice') {
                throwError('sha256 expects string or slice argument', ref);
            }
            return { kind: 'ref', name: 'Int', optional: false };
        },
        generate: (ctx, args, resolved, ref) => {
            if (args.length !== 1) {
                throwError('sha256 expects 1 argument', ref);
            }
            if (args[0].kind !== 'ref') {
                throwError('sha256 expects string argument', ref);
            }

            // String case
            if (args[0].name === 'String') {
                try {
                    const str = resolveConstantValue({ kind: 'ref', name: 'String', optional: false }, resolved[0], ctx.ctx) as string;
                    if (Buffer.from(str).length > 128) {
                        throwError('sha256 expects string argument with byte length <= 128', ref);
                    }
                    return BigInt('0x' + sha256_sync(str).toString('hex')).toString(10);
                } catch (e) {
                    // Not a constant
                }
                const exp = writeExpression(resolved[0], ctx);
                return `string_hash(${exp})`;
            }

            // Slice case
            if (args[0].name === 'Slice') {
                const exp = writeExpression(resolved[0], ctx);
                return `string_hash(${exp})`;
            }

            throwError('sha256 expects string or slice argument', ref);
        }
    }
}
