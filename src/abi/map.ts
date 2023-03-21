import { ops } from "../generator/writers/ops";
import { writeExpression } from "../generator/writers/writeExpression";
import { throwError } from "../grammar/ast";
import { getType } from "../types/resolveDescriptors";
import { AbiFunction } from "./AbiFunction";

export const MapFunctions: { [key: string]: AbiFunction } = {
    set: {
        name: 'set',
        resolve(ctx, args, ref) {

            // Check arguments
            if (args.length !== 3) {
                throwError('set expects two arguments', ref); // Should not happen
            }
            let self = args[0];
            if (!self || self.kind !== 'map') {
                throwError('set expects a map as self argument', ref); // Should not happen
            }

            // Resolve map types
            if (self.key !== 'Int' && self.key !== 'Address') {
                throwError('set expects a map with Int or Address keys', ref);
            }

            // Check key type
            if (args[1].kind !== 'ref' || args[1].optional) {
                throwError('set expects a direct type as first argument', ref);
            }
            if (args[1].name !== self.key) {
                throwError(`set expects a ${self.key} as first argument`, ref);
            }

            // Check value type
            if (args[2].kind !== 'null' && args[2].kind !== 'ref') {
                throwError('set expects a direct type as second argument', ref);
            }
            if (args[2].kind !== 'null' && args[2].name !== self.value) {
                throwError(`set expects a ${self.value} as second argument`, ref);
            }

            // Returns nothing
            return { kind: 'void' };
        },
        generate: (ctx, args, exprs, ref) => {

            // Check arguments
            if (args.length !== 3) {
                throwError('set expects two arguments', ref); // Ignore self argument
            }
            let self = args[0];
            if (!self || self.kind !== 'map') {
                throwError('set expects a map as self argument', ref); // Should not happen
            }

            // Render expressions
            let resolved = exprs.map((v) => writeExpression(v, ctx));

            // Handle Int key
            if (self.key === 'Int') {
                if (self.value === 'Int') {
                    ctx.used(`__tact_dict_set_int_int`);
                    return `${resolved[0]}~__tact_dict_set_int_int(257, ${resolved[1]}, ${resolved[2]}, 257)`;
                } else if (self.value === 'Bool') {
                    ctx.used(`__tact_dict_set_int_int`);
                    return `${resolved[0]}~__tact_dict_set_int_int(257, ${resolved[1]}, ${resolved[2]}, 1)`;
                } else if (self.value === 'Cell') {
                    ctx.used(`__tact_dict_set_int_cell`);
                    return `${resolved[0]}~__tact_dict_set_int_cell(257, ${resolved[1]}, ${resolved[2]})`;
                } else if (self.value === 'Address') {
                    ctx.used(`__tact_dict_set_int_slice`);
                    return `${resolved[0]}~__tact_dict_set_int_slice(257, ${resolved[1]}, ${resolved[2]})`;
                } else {
                    let t = getType(ctx.ctx, self.value);
                    if (t.kind === 'contract') {
                        throwError(`Contract can't be value of a map`, ref);
                    }
                    if (t.kind === 'trait') {
                        throwError(`Trait can't be value of a map`, ref);
                    }
                    if (t.kind === 'struct') {
                        ctx.used(`__tact_dict_set_int_cell`);
                        if (args[2].kind === 'ref' && !args[2].optional) {
                            return `${resolved[0]}~__tact_dict_set_int_cell(257, ${resolved[1]}, ${ops.writerCell(t.name, ctx)}(${resolved[2]}))`;
                        } else {
                            return `${resolved[0]}~__tact_dict_set_int_cell(257, ${resolved[1]}, ${ops.writerCellOpt(t.name, ctx)}(${resolved[2]}))`;
                        }
                    } else {
                        throwError(`${t.name} can't be value of a map`, ref);
                    }
                }
            }

            // Handle address key
            if (self.key === 'Address') {
                if (self.value === 'Int') {
                    ctx.used(`__tact_dict_set_slice_int`);
                    return `${resolved[0]}~__tact_dict_set_slice_int(267, ${resolved[1]}, ${resolved[2]}, 257)`;
                } else if (self.value === 'Bool') {
                    ctx.used(`__tact_dict_set_slice_int`);
                    return `${resolved[0]}~__tact_dict_set_slice_int(267, ${resolved[1]}, ${resolved[2]}, 1)`;
                } else if (self.value === 'Cell') {
                    ctx.used(`__tact_dict_set_slice_cell`);
                    return `${resolved[0]}~__tact_dict_set_slice_cell(267, ${resolved[1]}, ${resolved[2]})`;
                } else if (self.value === 'Address') {
                    ctx.used(`__tact_dict_set_slice_slice`);
                    return `${resolved[0]}~__tact_dict_set_slice_slice(267, ${resolved[1]}, ${resolved[2]})`;
                } else {
                    let t = getType(ctx.ctx, self.value);
                    if (t.kind === 'contract') {
                        throwError(`Contract can't be value of a map`, ref);
                    }
                    if (t.kind === 'trait') {
                        throwError(`Trait can't be value of a map`, ref);
                    }
                    if (t.kind === 'struct') {
                        ctx.used(`__tact_dict_set_slice_cell`);
                        if (args[2].kind === 'ref' && !args[2].optional) {
                            return `${resolved[0]}~__tact_dict_set_slice_cell(267, ${resolved[1]}, ${ops.writerCell(t.name, ctx)}(${resolved[2]}))`;
                        } else {
                            return `${resolved[0]}~__tact_dict_set_slice_cell(267, ${resolved[1]}, ${ops.writerCellOpt(t.name, ctx)}(${resolved[2]}))`;
                        }
                    } else {
                        throwError(`${t.name} can't be value of a map`, ref);
                    }
                }
            }

            throwError(`set expects a map with Int keys`, ref);
        }
    },
    get: {
        name: 'get',
        resolve(ctx, args, ref) {

            // Check arguments
            if (args.length !== 2) {
                throwError('set expects one argument', ref); // Ignore self argument
            }
            let self = args[0];
            if (!self || self.kind !== 'map') {
                throwError('set expects a map as self argument', ref); // Should not happen
            }

            // Check key type
            if (args[1].kind !== 'ref' || args[1].optional) {
                throwError('set expects a direct type as first argument', ref);
            }
            if (args[1].name !== self.key) {
                throwError(`set expects a ${self.key} as first argument`, ref);
            }

            return { kind: 'ref', name: self.value, optional: true };
        },
        generate: (ctx, args, exprs, ref) => {

            if (args.length !== 2) {
                throwError('set expects one argument', ref); // Ignore self argument
            }
            let self = args[0];
            if (!self || self.kind !== 'map') {
                throwError('set expects a map as self argument', ref); // Should not happen
            }

            // Render expressions
            let resolved = exprs.map((v) => writeExpression(v, ctx));

            // Handle Int key
            if (self.key === 'Int') {
                if (self.value === 'Int') {
                    ctx.used(`__tact_dict_get_int_int`);
                    return `__tact_dict_get_int_int(${resolved[0]}, 257, ${resolved[1]}, 257)`;
                } else if (self.value === 'Bool') {
                    ctx.used(`__tact_dict_get_int_int`);
                    return `__tact_dict_get_int_int(${resolved[0]}, 257, ${resolved[1]}, 1)`;
                } else if (self.value === 'Cell') {
                    ctx.used(`__tact_dict_get_int_cell`);
                    return `__tact_dict_get_int_cell(${resolved[0]}, 257, ${resolved[1]})`;
                } else if (self.value === 'Address') {
                    ctx.used(`__tact_dict_get_int_slice`);
                    return `__tact_dict_get_int_slice(${resolved[0]}, 257, ${resolved[1]})`;
                } else {
                    let t = getType(ctx.ctx, self.value);
                    if (t.kind === 'contract') {
                        throwError(`Contract can't be value of a map`, ref);
                    }
                    if (t.kind === 'trait') {
                        throwError(`Trait can't be value of a map`, ref);
                    }
                    if (t.kind === 'struct') {
                        ctx.used(`__tact_dict_get_int_cell`);                        
                        return `${ops.readerOpt(t.name, ctx)}(__tact_dict_get_int_cell(${resolved[0]}, 257, ${resolved[1]}))`;
                    } else {
                        throwError(`${t.name} can't be value of a map`, ref);
                    }
                }
            }

            // Handle Address key
            if (self.key === 'Address') {
                if (self.value === 'Int') {
                    ctx.used(`__tact_dict_get_slice_int`);
                    return `__tact_dict_get_slice_int(${resolved[0]}, 267, ${resolved[1]}, 257)`;
                } else if (self.value === 'Bool') {
                    ctx.used(`__tact_dict_get_slice_int`);
                    return `__tact_dict_get_slice_int(${resolved[0]}, 267, ${resolved[1]}, 1)`;
                } else if (self.value === 'Cell') {
                    ctx.used(`__tact_dict_get_slice_cell`);
                    return `__tact_dict_get_slice_cell(${resolved[0]}, 267, ${resolved[1]})`;
                } else {
                    let t = getType(ctx.ctx, self.value);
                    if (t.kind === 'contract') {
                        throwError(`Contract can't be value of a map`, ref);
                    }
                    if (t.kind === 'trait') {
                        throwError(`Trait can't be value of a map`, ref);
                    }
                    if (t.kind === 'struct') {
                        ctx.used(`__tact_dict_get_slice_cell`);
                        return `${ops.readerOpt(t.name, ctx)}(__tact_dict_get_slice_cell(${resolved[0]}, 267, ${resolved[1]}))`;
                    } else {
                        throwError(`${t.name} can't be value of a map`, ref);
                    }
                }
            }

            throwError(`set expects a map with Int keys`, ref);
        }
    }
}