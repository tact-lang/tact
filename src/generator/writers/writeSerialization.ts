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
    let isSmall = type.fields.length <= SMALL_STRUCT_MAX_FIELDS;

    // Write to builder
    ctx.fun(ops.writer(type.name, ctx), () => {
        let modifier = (type.kind === 'struct' && !isSmall) ? 'inline_ref' : 'inline';
        ctx.append(`builder ${ops.writer(type.name, ctx)}(builder build_0, ${resolveFuncType(allocation.type, ctx)} v) ${modifier} {`);
        ctx.inIndent(() => {
            ctx.append(`var ${resolveFuncTypeUnpack(allocation.type, `v`, ctx)} = v;`)
            if (type.header) {
                ctx.append(`build_0 = store_uint(build_0, ${type.header}, 32);`);
            }
            writeSerializerCell(allocation.root, type, 0, 0, ctx);
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

function writeSerializerCell(cell: AllocationCell, type: TypeDescription, offset: number, gen: number, ctx: WriterContext) {

    // Write fields
    for (let f of cell.ops) {
        writeSerializerField(f, type, offset++, gen, ctx);
    }

    // Tail
    if (cell.next) {
        ctx.append(`var build_${gen + 1} = begin_cell();`);
        writeSerializerCell(cell.next, type, offset, gen + 1, ctx);
        ctx.append(`build_${gen} = store_ref(build_${gen}, build_${gen + 1}.end_cell());`);
    }
}

function writeSerializerField(f: AllocationOperation, type: TypeDescription, offset: number, gen: number, ctx: WriterContext) {
    let field = type.fields[offset];
    let fieldName = `v'${field.name}`;

    if (f.kind === 'int') {
        if (f.optional) {
            ctx.append(`build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_int(${fieldName}, ${f.bits}) : build_${gen}.store_int(false, 1);`);
        } else {
            ctx.append(`build_${gen} = build_${gen}.store_int(${fieldName}, ${f.bits});`);
        }
        return;
    }
    if (f.kind === 'uint') {
        if (f.optional) {
            ctx.append(`build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_uint(${fieldName}, ${f.bits}) : build_${gen}.store_int(false, 1);`);
        } else {
            ctx.append(`build_${gen} = build_${gen}.store_uint(${fieldName}, ${f.bits});`);
        }
        return;
    }
    if (f.kind === 'coins') {
        if (f.optional) {
            ctx.append(`build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_coins(${fieldName}) : build_${gen}.store_int(false, 1);`);
        } else {
            ctx.append(`build_${gen} = build_${gen}.store_coins(${fieldName});`);
        }
        return;
    }
    if (f.kind === 'boolean') {
        if (f.optional) {
            ctx.append(`build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_int(${fieldName}, 1) : build_${gen}.store_int(false, 1);`);
        } else {
            ctx.append(`build_${gen} = build_${gen}.store_int(${fieldName}, 1);`);
        }
        return;
    }
    if (f.kind === 'address') {
        if (f.optional) {
            ctx.used(`__tact_store_address_opt`);
            ctx.append(`build_${gen} = __tact_store_address_opt(build_${gen}, ${fieldName});`);
        } else {
            ctx.used(`__tact_store_address`);
            ctx.append(`build_${gen} = __tact_store_address(build_${gen}, ${fieldName});`);
        }
        return;
    }
    if (f.kind === 'cell') {
        if (f.format === 'default') {
            if (f.optional) {
                ctx.append(`build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_ref(${fieldName}) : build_${gen}.store_int(false, 1);`);
            } else {
                ctx.append(`build_${gen} = build_${gen}.store_ref(${fieldName});`);
            }
        } else if (f.format === 'remainder') {
            if (f.optional) {
                throw Error('Impossible');
            }
            ctx.append(`build_${gen} = build_${gen}.store_slice(${fieldName}.begin_parse());`);
        } else {
            throw Error('Impossible');
        }
        return;
    }
    if (f.kind === 'slice') {
        if (f.format === 'default') {
            if (f.optional) {
                ctx.append(`build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_ref(begin_cell().store_slice(${fieldName}).end_cell()) : build_${gen}.store_int(false, 1);`);
            } else {
                ctx.append(`build_${gen} = build_${gen}.store_ref(begin_cell().store_slice(${fieldName}).end_cell());`);
            }
        } else if (f.format === 'remainder') {
            if (f.optional) {
                throw Error('Impossible');
            }
            ctx.append(`build_${gen} = build_${gen}.store_slice(${fieldName});`);
        } else {
            throw Error('Impossible');
        }
        return;
    }
    if (f.kind === 'string') {
        if (f.optional) {
            ctx.append(`build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_ref(begin_cell().store_slice(${fieldName}).end_cell()) : build_${gen}.store_int(false, 1);`);
        } else {
            ctx.append(`build_${gen} = build_${gen}.store_ref(begin_cell().store_slice(${fieldName}).end_cell());`);
        }
        return;
    }
    if (f.kind === 'fixed-bytes') {
        if (f.optional) {
            ctx.append(`build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).store_slice(${fieldName}) : build_${gen}.store_int(false, 1);`);
        } else {
            ctx.append(`build_${gen} = build_${gen}.store_slice(${fieldName});`);
        }
        return;
    }
    if (f.kind === 'map') {
        ctx.append(`build_${gen} = build_${gen}.store_dict(${fieldName});`);
        return;
    }
    if (f.kind === 'struct') {
        if (f.ref) {
            throw Error('Not implemented');
        }
        if (f.optional) {
            ctx.used(`__gen_${f.type}_not_null`);
            ctx.append(`build_${gen} = ~ null?(${fieldName}) ? build_${gen}.store_int(true, 1).${ops.writer(f.type, ctx)}( __gen_${f.type}_not_null(${fieldName})) : build_${gen}.store_int(false, 1);`);
        } else {
            ctx.append(`build_${gen} = ${ops.writer(f.type, ctx)}(build_${gen}, ${resolveFuncTypeUnpack(f.type, fieldName, ctx)});`);
        }
        return;
    }

    throw Error('Unsupported field kind: ' + f.kind);
}

//
// Parser
//

export function writeParser(type: TypeDescription, allocation: StorageAllocation, ctx: WriterContext) {
    let isSmall = type.fields.length <= SMALL_STRUCT_MAX_FIELDS;

    ctx.fun(`__gen_read_${type.name}`, () => {
        let modifier = (type.kind === 'struct' && !isSmall) ? 'inline_ref' : 'inline';
        ctx.append(`(slice, (${resolveFuncType(allocation.type, ctx)})) __gen_read_${type.name}(slice sc_0) ${modifier} {`);
        ctx.inIndent(() => {

            // Check prefix
            if (type.header) {
                ctx.append(`throw_unless(${contractErrors.invalidPrefix.id}, sc_0~load_uint(32) == ${type.header});`);
            }

            // Write cell parser
            writeCellParser(allocation.root, type, 0, 0, ctx);

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

function writeCellParser(cell: AllocationCell, type: TypeDescription, offset: number, gen: number, ctx: WriterContext): number {

    // Write current fields
    for (let f of cell.ops) {
        writeFieldParser(f, type, offset++, gen, ctx);
    }

    // Handle next cell
    if (cell.next) {
        ctx.append(`slice sc_${gen + 1} = sc_${gen}~load_ref().begin_parse();`);
        return writeCellParser(cell.next, type, offset, gen + 1, ctx);
    } else {
        return gen;
    }
}

function writeFieldParser(f: AllocationOperation, type: TypeDescription, offset: number, gen: number, ctx: WriterContext) {
    let field = type.fields[offset];
    let varName = `var v'${field.name}`;

    // Handle int
    if (f.kind === 'int') {
        if (f.optional) {
            ctx.append(`${varName} = sc_${gen}~load_int(1) ? sc_${gen}~load_int(${f.bits}) : null();`);
        } else {
            ctx.append(`${varName} = sc_${gen}~load_int(${f.bits});`);
        }
        return;
    }
    if (f.kind === 'uint') {
        if (f.optional) {
            ctx.append(`${varName} = sc_${gen}~load_int(1) ? sc_${gen}~load_uint(${f.bits}) : null();`);
        } else {
            ctx.append(`${varName} = sc_${gen}~load_uint(${f.bits});`);
        }
        return;
    }
    if (f.kind === 'coins') {
        if (f.optional) {
            ctx.append(`${varName} = sc_${gen}~load_int(1) ? sc_${gen}~load_coins() : null();`);
        } else {
            ctx.append(`${varName} = sc_${gen}~load_coins();`);
        }
        return;
    }
    if (f.kind === 'boolean') {
        if (f.optional) {
            ctx.append(`${varName} = sc_${gen}~load_int(1) ? sc_${gen}~load_int(1) : null();`);
        } else {
            ctx.append(`${varName} = sc_${gen}~load_int(1);`);
        }
        return;
    }
    if (f.kind === 'address') {
        if (f.optional) {
            ctx.used(`__tact_load_address_opt`);
            ctx.append(`${varName} = sc_${gen}~__tact_load_address_opt();`);
        } else {
            ctx.used(`__tact_load_address`);
            ctx.append(`${varName} = sc_${gen}~__tact_load_address();`);
        }
        return;
    }
    if (f.kind === 'cell') {
        if (f.optional) {
            if (f.format !== 'default') {
                throw new Error(`Impossible`);
            }
            ctx.append(`${varName} = sc_${gen}~load_int(1) ? sc_${gen}~load_ref() : null();`);
        } else {
            if (f.format === 'default') {
                ctx.append(`${varName} = sc_${gen}~load_ref();`);
            } else if (f.format === 'remainder') {
                ctx.append(`${varName} = begin_cell().store_slice(sc_${gen}).end_cell();`);
            } else {
                throw new Error(`Impossible`);
            }
        }
        return;
    }
    if (f.kind === 'slice') {
        if (f.optional) {
            if (f.format !== 'default') {
                throw new Error(`Impossible`);
            }
            ctx.append(`${varName} = sc_${gen}~load_int(1) ? sc_${gen}~load_ref().begin_parse() : null();`);
        } else {
            if (f.format === 'default') {
                ctx.append(`${varName} = sc_${gen}~load_ref().begin_parse();`);
            } else if (f.format === 'remainder') {
                ctx.append(`${varName} = sc_${gen};`);
            } else {
                throw new Error(`Impossible`);
            }
        }
        return;
    }
    if (f.kind === 'string') {
        if (f.optional) {
            ctx.append(`${varName} = sc_${gen}~load_int(1) ? sc_${gen}~load_ref().begin_parse() : null();`);
        } else {
            ctx.append(`${varName} = sc_${gen}~load_ref().begin_parse();`);
        }
        return;
    }
    if (f.kind === 'fixed-bytes') {
        if (f.optional) {
            ctx.append(`${varName} = sc_${gen}~load_int(1) ? sc_${gen}~load_bits(${f.bytes * 8}) : null();`);
        } else {
            ctx.append(`${varName} = sc_${gen}~load_bits(${f.bytes * 8});`);
        }
        return;
    }
    if (f.kind === 'map') {
        ctx.append(`${varName} = sc_${gen}~load_dict();`);
        return;
    }
    if (f.kind === 'struct') {
        ctx.used(`__gen_read_${f.type}`);
        if (f.optional) {
            ctx.used(`__gen_${f.type}_as_optional`);
            if (f.ref) {
                // ctx.append(`${varName} = sc_${gen}~load_int(1) ? __gen_${f.type}_as_optional(second(__gen_read_${f.type}((sc_${gen}~load_ref().begin_parse()))) : null();`);
                throw Error('Not implemented');
            } else {
                ctx.append(`${varName} = sc_${gen}~load_int(1) ? __gen_${f.type}_as_optional(sc_${gen}~__gen_read_${f.type}()) : null();`);
            }
        } else {
            if (f.ref) {
                // ctx.append(`${varName} = second(__gen_read_${f.type}((sc_${gen}~load_ref().begin_parse()));`);
                throw Error('Not implemented');
            } else {
                ctx.append(`${varName} = sc_${gen}~__gen_read_${f.type}();`);
            }
        }
        return;
    }

    throw Error('Unsupported field kind: ' + f.kind);
}

//
// Storage
//

export function writeStorageOps(type: TypeDescription, ctx: WriterContext) {

    // Load function
    ctx.fun(`__gen_load_${type.name}`, () => {
        ctx.append(`${resolveFuncType(type, ctx)} __gen_load_${type.name}() inline_ref {`); // NOTE: Inline function
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
        ctx.append(`() __gen_store_${type.name}(${resolveFuncType(type, ctx)} v) impure inline_ref {`); // NOTE: Impure inline function
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