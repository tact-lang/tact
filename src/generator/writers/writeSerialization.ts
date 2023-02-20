import { contractErrors } from "../../abi/errors";
import { AllocationCell, AllocationOperation } from "../../storage/operation";
import { StorageAllocation } from "../../storage/StorageAllocation";
import { TypeDescription } from "../../types/types";
import { WriterContext } from "../Writer";
import { ops } from "./ops";
import { resolveFuncType } from "./resolveFuncType";
import { resolveFuncTypeUnpack } from "./resolveFuncTypeUnpack";

const SMALL_STRUCT_MAX_FIELDS = 5;

//
// Serializer
//

export function writeSerializer(type: TypeDescription, allocation: StorageAllocation, ctx: WriterContext) {
    let isSmall = allocation.size.fields <= SMALL_STRUCT_MAX_FIELDS;

    // Write to builder
    ctx.fun(ops.writer(type.name, ctx), () => {
        let modifier = (type.kind === 'struct' && !isSmall) ? 'inline_ref' : 'inline';
        ctx.append(`builder ${ops.writer(type.name, ctx)}(builder build_0, ${resolveFuncType(allocation.type, ctx)} v) ${modifier} {`);
        ctx.inIndent(() => {
            ctx.append(`var ${resolveFuncTypeUnpack(allocation.type, `v`, ctx)} = v;`)
            if (type.header) {
                ctx.append(`build_0 = store_uint(build_0, ${type.header}, 32);`);
            }
            writeSerializerCell(allocation.root, 0, ctx);
            ctx.append(`return build_0;`);
        });
        ctx.append(`}`);
    });

    // Write to cell
    ctx.fun(ops.writerCell(type.name, ctx), () => {
        ctx.write(`
            cell ${ops.writerCell(type.name, ctx)}(${resolveFuncType(allocation.type, ctx)} v) inline_ref {
                return ${ops.writer(type.name, ctx)}(begin_cell(), v).end_cell();
            }
        `);
    });

    // Write to opt cell
    ctx.fun(ops.writerCellOpt(type.name, ctx), () => {
        ctx.write(`
            cell ${ops.writerCellOpt(type.name, ctx)}(tuple v) inline_ref {
                if (null?(v)) {
                    return null();
                }
                return ${ops.writerCell(type.name, ctx)}(${ctx.used(`__gen_${type.name}_not_null`)}(v));
            }
        `);
    });
}

function writeSerializerCell(cell: AllocationCell, gen: number, ctx: WriterContext) {

    // Write fields
    for (let f of cell.ops) {
        writeSerializerField(f, gen, ctx);
    }

    // Tail
    if (cell.next) {
        ctx.append(`var build_${gen + 1} = begin_cell();`);
        writeSerializerCell(cell.next, gen + 1, ctx);
        ctx.append(`build_${gen} = store_ref(build_${gen}, build_${gen + 1}.end_cell());`);
    }
}

function writeSerializerField(f: AllocationOperation, gen: number, ctx: WriterContext) {
    const fieldName = `v'${f.name}`;
    const op = f.op;

    if (op.kind === 'int') {
        if (op.optional) {
            ctx.append(`build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_int(${fieldName}, ${op.bits}) : build_${gen}.store_int(false, 1);`);
        } else {
            ctx.append(`build_${gen} = build_${gen}.store_int(${fieldName}, ${op.bits});`);
        }
        return;
    }
    if (op.kind === 'uint') {
        if (op.optional) {
            ctx.append(`build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_uint(${fieldName}, ${op.bits}) : build_${gen}.store_int(false, 1);`);
        } else {
            ctx.append(`build_${gen} = build_${gen}.store_uint(${fieldName}, ${op.bits});`);
        }
        return;
    }
    if (op.kind === 'coins') {
        if (op.optional) {
            ctx.append(`build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_coins(${fieldName}) : build_${gen}.store_int(false, 1);`);
        } else {
            ctx.append(`build_${gen} = build_${gen}.store_coins(${fieldName});`);
        }
        return;
    }
    if (op.kind === 'boolean') {
        if (op.optional) {
            ctx.append(`build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_int(${fieldName}, 1) : build_${gen}.store_int(false, 1);`);
        } else {
            ctx.append(`build_${gen} = build_${gen}.store_int(${fieldName}, 1);`);
        }
        return;
    }
    if (op.kind === 'address') {
        if (op.optional) {
            ctx.used(`__tact_store_address_opt`);
            ctx.append(`build_${gen} = __tact_store_address_opt(build_${gen}, ${fieldName});`);
        } else {
            ctx.used(`__tact_store_address`);
            ctx.append(`build_${gen} = __tact_store_address(build_${gen}, ${fieldName});`);
        }
        return;
    }
    if (op.kind === 'cell') {
        if (op.format === 'default') {
            if (op.optional) {
                ctx.append(`build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_ref(${fieldName}) : build_${gen}.store_int(false, 1);`);
            } else {
                ctx.append(`build_${gen} = build_${gen}.store_ref(${fieldName});`);
            }
        } else if (op.format === 'remainder') {
            if (op.optional) {
                throw Error('Impossible');
            }
            ctx.append(`build_${gen} = build_${gen}.store_slice(${fieldName}.begin_parse());`);
        } else {
            throw Error('Impossible');
        }
        return;
    }
    if (op.kind === 'slice') {
        if (op.format === 'default') {
            if (op.optional) {
                ctx.append(`build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_ref(begin_cell().store_slice(${fieldName}).end_cell()) : build_${gen}.store_int(false, 1);`);
            } else {
                ctx.append(`build_${gen} = build_${gen}.store_ref(begin_cell().store_slice(${fieldName}).end_cell());`);
            }
        } else if (op.format === 'remainder') {
            if (op.optional) {
                throw Error('Impossible');
            }
            ctx.append(`build_${gen} = build_${gen}.store_slice(${fieldName});`);
        } else {
            throw Error('Impossible');
        }
        return;
    }
    if (op.kind === 'string') {
        if (op.optional) {
            ctx.append(`build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_ref(begin_cell().store_slice(${fieldName}).end_cell()) : build_${gen}.store_int(false, 1);`);
        } else {
            ctx.append(`build_${gen} = build_${gen}.store_ref(begin_cell().store_slice(${fieldName}).end_cell());`);
        }
        return;
    }
    if (op.kind === 'fixed-bytes') {
        if (op.optional) {
            ctx.append(`build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_slice(${fieldName}) : build_${gen}.store_int(false, 1);`);
        } else {
            ctx.append(`build_${gen} = build_${gen}.store_slice(${fieldName});`);
        }
        return;
    }
    if (op.kind === 'map') {
        ctx.append(`build_${gen} = build_${gen}.store_dict(${fieldName});`);
        return;
    }
    if (op.kind === 'struct') {
        if (op.ref) {
            throw Error('Not implemented');
        }
        if (op.optional) {
            ctx.used(`__gen_${op.type}_not_null`);
            ctx.append(`build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).${ops.writer(op.type, ctx)}( __gen_${op.type}_not_null(${fieldName})) : build_${gen}.store_int(false, 1);`);
        } else {
            ctx.append(`build_${gen} = ${ops.writer(op.type, ctx)}(build_${gen}, ${resolveFuncTypeUnpack(op.type, fieldName, ctx)});`);
        }
        return;
    }

    throw Error('Unsupported field kind: ' + op.kind);
}

//
// Parser
//

export function writeParser(type: TypeDescription, allocation: StorageAllocation, ctx: WriterContext) {
    let isSmall = allocation.size.fields <= SMALL_STRUCT_MAX_FIELDS;

    ctx.fun(`__gen_read_${type.name}`, () => {
        let modifier = (type.kind === 'struct' && !isSmall) ? 'inline_ref' : 'inline';
        ctx.append(`(slice, (${resolveFuncType(allocation.type, ctx)})) __gen_read_${type.name}(slice sc_0) ${modifier} {`);
        ctx.inIndent(() => {

            // Check prefix
            if (type.header) {
                ctx.append(`throw_unless(${contractErrors.invalidPrefix.id}, sc_0~load_uint(32) == ${type.header});`);
            }

            // Write cell parser
            writeCellParser(allocation.root, 0, ctx);

            // Compile tuple
            ctx.append(`return (sc_0, (${type.fields.map((v) => `v'${v.name}`).join(', ')}));`);
        });
        ctx.append("}");
    });

    ctx.fun(`__gen_readopt_${type.name}`, () => {
        ctx.write(`
            tuple __gen_readopt_${type.name}(cell cl) inline_ref {
                if (null?(cl)) {
                    return null();
                }
                var sc = cl.begin_parse();
                return ${ctx.used(`__gen_${type.name}_as_optional`)}(sc~${ctx.used(`__gen_read_${type.name}`)}());
            }
        `);
    });
}

function writeCellParser(cell: AllocationCell, gen: number, ctx: WriterContext): number {

    // Write current fields
    for (let f of cell.ops) {
        writeFieldParser(f, gen, ctx);
    }

    // Handle next cell
    if (cell.next) {
        ctx.append(`slice sc_${gen + 1} = sc_${gen}~load_ref().begin_parse();`);
        return writeCellParser(cell.next, gen + 1, ctx);
    } else {
        return gen;
    }
}

function writeFieldParser(f: AllocationOperation, gen: number, ctx: WriterContext) {
    const op = f.op;
    const varName = `var v'${f.name}`;

    // Handle int
    if (op.kind === 'int') {
        if (op.optional) {
            ctx.append(`${varName} = sc_${gen}~load_int(1) ? sc_${gen}~load_int(${op.bits}) : null();`);
        } else {
            ctx.append(`${varName} = sc_${gen}~load_int(${op.bits});`);
        }
        return;
    }
    if (op.kind === 'uint') {
        if (op.optional) {
            ctx.append(`${varName} = sc_${gen}~load_int(1) ? sc_${gen}~load_uint(${op.bits}) : null();`);
        } else {
            ctx.append(`${varName} = sc_${gen}~load_uint(${op.bits});`);
        }
        return;
    }
    if (op.kind === 'coins') {
        if (op.optional) {
            ctx.append(`${varName} = sc_${gen}~load_int(1) ? sc_${gen}~load_coins() : null();`);
        } else {
            ctx.append(`${varName} = sc_${gen}~load_coins();`);
        }
        return;
    }
    if (op.kind === 'boolean') {
        if (op.optional) {
            ctx.append(`${varName} = sc_${gen}~load_int(1) ? sc_${gen}~load_int(1) : null();`);
        } else {
            ctx.append(`${varName} = sc_${gen}~load_int(1);`);
        }
        return;
    }
    if (op.kind === 'address') {
        if (op.optional) {
            ctx.used(`__tact_load_address_opt`);
            ctx.append(`${varName} = sc_${gen}~__tact_load_address_opt();`);
        } else {
            ctx.used(`__tact_load_address`);
            ctx.append(`${varName} = sc_${gen}~__tact_load_address();`);
        }
        return;
    }
    if (op.kind === 'cell') {
        if (op.optional) {
            if (op.format !== 'default') {
                throw new Error(`Impossible`);
            }
            ctx.append(`${varName} = sc_${gen}~load_int(1) ? sc_${gen}~load_ref() : null();`);
        } else {
            if (op.format === 'default') {
                ctx.append(`${varName} = sc_${gen}~load_ref();`);
            } else if (op.format === 'remainder') {
                ctx.append(`${varName} = begin_cell().store_slice(sc_${gen}).end_cell();`);
            } else {
                throw new Error(`Impossible`);
            }
        }
        return;
    }
    if (op.kind === 'slice') {
        if (op.optional) {
            if (op.format !== 'default') {
                throw new Error(`Impossible`);
            }
            ctx.append(`${varName} = sc_${gen}~load_int(1) ? sc_${gen}~load_ref().begin_parse() : null();`);
        } else {
            if (op.format === 'default') {
                ctx.append(`${varName} = sc_${gen}~load_ref().begin_parse();`);
            } else if (op.format === 'remainder') {
                ctx.append(`${varName} = sc_${gen};`);
            } else {
                throw new Error(`Impossible`);
            }
        }
        return;
    }
    if (op.kind === 'string') {
        if (op.optional) {
            ctx.append(`${varName} = sc_${gen}~load_int(1) ? sc_${gen}~load_ref().begin_parse() : null();`);
        } else {
            ctx.append(`${varName} = sc_${gen}~load_ref().begin_parse();`);
        }
        return;
    }
    if (op.kind === 'fixed-bytes') {
        if (op.optional) {
            ctx.append(`${varName} = sc_${gen}~load_int(1) ? sc_${gen}~load_bits(${op.bytes * 8}) : null();`);
        } else {
            ctx.append(`${varName} = sc_${gen}~load_bits(${op.bytes * 8});`);
        }
        return;
    }
    if (op.kind === 'map') {
        ctx.append(`${varName} = sc_${gen}~load_dict();`);
        return;
    }
    if (op.kind === 'struct') {
        ctx.used(`__gen_read_${op.type}`);
        if (op.optional) {
            ctx.used(`__gen_${op.type}_as_optional`);
            if (op.ref) {
                // ctx.append(`${varName} = sc_${gen}~load_int(1) ? __gen_${f.type}_as_optional(second(__gen_read_${f.type}((sc_${gen}~load_ref().begin_parse()))) : null();`);
                throw Error('Not implemented');
            } else {
                ctx.append(`${varName} = sc_${gen}~load_int(1) ? __gen_${op.type}_as_optional(sc_${gen}~__gen_read_${op.type}()) : null();`);
            }
        } else {
            if (op.ref) {
                // ctx.append(`${varName} = second(__gen_read_${f.type}((sc_${gen}~load_ref().begin_parse()));`);
                throw Error('Not implemented');
            } else {
                ctx.append(`${varName} = sc_${gen}~__gen_read_${op.type}();`);
            }
        }
        return;
    }

    throw Error('Unsupported field kind: ' + op.kind);
}

//
// Storage
//

export function writeStorageOps(type: TypeDescription, ctx: WriterContext) {

    // Load function
    ctx.fun(`__gen_load_${type.name}`, () => {
        ctx.append(`${resolveFuncType(type, ctx)} __gen_load_${type.name}() inline {`); // NOTE: Inline function
        ctx.inIndent(() => {

            // Load data slice
            ctx.append(`slice sc = get_data().begin_parse();`);

            // Load context
            ctx.used(`__tact_context`);
            ctx.append(`__tact_context_sys = sc~load_ref();`);

            // Load data
            ctx.used(`__gen_read_${type.name}`);
            ctx.append(`return sc~__gen_read_${type.name}();`);
        });
        ctx.append(`}`);
    });

    // Store function
    ctx.fun(`__gen_store_${type.name}`, () => {
        ctx.append(`() __gen_store_${type.name}(${resolveFuncType(type, ctx)} v) impure inline {`); // NOTE: Impure inline function
        ctx.inIndent(() => {
            ctx.append(`builder b = begin_cell();`);

            // Persist system cell
            ctx.used(`__tact_context`);
            ctx.append(`b = b.store_ref(__tact_context_sys);`);

            // Build data
            ctx.append(`b = ${ops.writer(type.name, ctx)}(b, v);`);

            // Persist data
            ctx.append(`set_data(b.end_cell());`);
        });
        ctx.append(`}`);
    });
}