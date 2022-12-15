import { contractErrors } from "../../abi/errors";
import { StorageAllocation, StorageCell, StorageField } from "../../storage/StorageAllocation";
import { TypeDescription } from "../../types/types";
import { WriterContext } from "../Writer";
import { resolveFuncType } from "./resolveFuncType";
import { resolveFuncTypeUnpack } from "./resolveFuncTypeUnpack";

//
// Serializer
//

function writeSerializerField(f: StorageField, index: number, ctx: WriterContext, optional: boolean = false) {

    // Handle optional

    if (f.kind === 'optional') {
        ctx.append(`if (null?(v'${f.name})) {`);
        ctx.inIndent(() => {
            ctx.append(`build_${index} = store_int(build_${index}, false, 1);`);
        });
        ctx.append(`} else {`);
        ctx.inIndent(() => {
            ctx.append(`build_${index} = store_int(build_${index}, true, 1);`);
            writeSerializerField(f.inner, index, ctx, true);
        });
        ctx.append(`}`);
        return;
    }

    // Handle primitives

    if (f.kind === 'int') {
        ctx.append(`build_${index} = store_int(build_${index}, v'${f.name}, ${f.bits});`);
        return;
    }

    if (f.kind === 'uint') {
        ctx.append(`build_${index} = store_uint(build_${index}, v'${f.name}, ${f.bits});`);
        return;
    }

    if (f.kind === 'coins') {
        ctx.append(`build_${index} = store_coins(build_${index}, v'${f.name});`);
        return;
    }

    if (f.kind === 'slice') {
        ctx.append(`build_${index} = store_ref(build_${index}, v'${f.name}.end_cell());`);
        return;
    }

    if (f.kind === 'cell') {
        ctx.append(`build_${index} = store_ref(build_${index}, v'${f.name});`);
        return;
    }

    if (f.kind === 'address') {
        ctx.used(`__tact_store_address`);
        ctx.append(`build_${index} = __tact_store_address(build_${index}, v'${f.name});`);
        return;
    }

    if (f.kind === 'map') {
        ctx.append(`build_${index} = store_dict(build_${index}, v'${f.name});`);
        return;
    }

    if (f.kind === 'remaining') {
        ctx.append(`build_${index} = store_slice(build_${index}, v'${f.name});`);
        return;
    }

    if (f.kind === 'bytes') {
        ctx.append(`build_${index} = store_slice(build_${index}, v'${f.name});`);
        return;
    }

    // Handle structs

    if (f.kind === 'struct') {
        if (optional) {
            ctx.used(`__gen_write_${f.type.name}`);
            ctx.used(`__gen_${f.type.name}_not_null`);
            ctx.append(`build_${index} = __gen_write_${f.type.name}(build_${index}, __gen_${f.type.name}_not_null(v'${f.name}));`);
        } else {
            ctx.used(`__gen_write_${f.type.name}`);
            ctx.append(`build_${index} = __gen_write_${f.type.name}(build_${index}, ${resolveFuncTypeUnpack(f.type, `v'${f.name}`, ctx)});`);
        }
        return;
    }

    throw Error('Unsupported field kind: ' + f.kind);
}

function writeSerializerCell(cell: StorageCell, index: number, ctx: WriterContext) {

    // Write fields
    for (let f of cell.fields) {
        writeSerializerField(f, index, ctx);
    }

    // Tail
    if (cell.next) {
        ctx.append(`var build_${index + 1} = begin_cell();`);
        writeSerializerCell(cell.next!, index + 1, ctx);
        ctx.append(`build_${index} = store_ref(build_${index}, build_${index + 1}.end_cell());`);
    }
}

export function writeSerializer(name: string, allocation: StorageAllocation, ctx: WriterContext) {

    // Write to builder
    ctx.fun(`__gen_write_${name}`, () => {
        ctx.append(`builder __gen_write_${name}(builder build_0, ${resolveFuncType(allocation.type, ctx)} v) inline {`);
        ctx.inIndent(() => {
            ctx.append(`var ${resolveFuncTypeUnpack(allocation.type, `v`, ctx)} = v;`)
            if (allocation.prefix) {
                ctx.append(`build_0 = store_uint(build_0, ${allocation.prefix}, 32);`);
            }
            if (allocation.fields.length > 0) {
                writeSerializerCell(allocation.root, 0, ctx);
            }
            ctx.append(`return build_0;`);
        });
        ctx.append(`}`);
    });

    // Write to cell
    ctx.fun(`__gen_writecell_${name}`, () => {
        ctx.append(`cell __gen_writecell_${name}(${resolveFuncType(allocation.type, ctx)} v) inline {`);
        ctx.inIndent(() => {
            ctx.used(`__gen_write_${name}`);
            ctx.append(`return __gen_write_${name}(begin_cell(), v).end_cell();`);
        });
        ctx.append(`}`);
    });

    // Write to slice
    ctx.fun(` __gen_writeslice_${name}`, () => {
        ctx.append(`slice __gen_writeslice_${name}(${resolveFuncType(allocation.type, ctx)} v}) inline {`);
        ctx.inIndent(() => {
            ctx.used(`__gen_writecell_${name}`);
            ctx.append(`return __gen_writecell_${name}(v).begin_parse();`);
        });
        ctx.append(`}`);
    });

    // Write to opt cell
    ctx.fun(`__gen_writecellopt_${name}`, () => {
        ctx.append(`cell __gen_writecellopt_${name}(tuple v) inline {`);
        ctx.inIndent(() => {

            // If null
            ctx.append(`if (null?(v)) {`);
            ctx.inIndent(() => {
                ctx.append(`return null();`);
            });
            ctx.append(`}`);

            // If not null
            ctx.used(`__gen_writecell_${name}`);
            ctx.append(`return __gen_writecell_${name}(v);`);
        });
        ctx.append(`}`);
    });
}

//
// Parser
//

function writeFieldParser(f: StorageField, index: number, ctx: WriterContext, optional: boolean = false) {
    let varName = optional ? `v'${f.name}` : `var v'${f.name}`;

    // Handle optional

    if (f.kind === 'optional') {
        ctx.append(`${varName} = null();`);
        ctx.append(`if (sc_${index}~load_int(1)) {`);
        ctx.inIndent(() => {
            writeFieldParser(f.inner, index, ctx, true);
        });
        ctx.append('}');
        return;
    }

    // Handle primitive values

    if (f.kind === 'int') {
        ctx.append(`${varName} = sc_${index}~load_int(${f.bits});`);
        return;
    }

    if (f.kind === 'uint') {
        ctx.append(`${varName} = sc_${index}~load_uint(${f.bits});`);
        return;
    }

    if (f.kind === 'coins') {
        ctx.append(`${varName} = sc_${index}~load_coins();`);
        return;
    }

    if (f.kind === 'slice') {
        ctx.append(`${varName} = sc_${index}~load_ref().begin_parse();`);
        return;
    }

    if (f.kind === 'cell') {
        ctx.append(`${varName} = sc_${index}~load_ref();`);
        return;
    }

    if (f.kind === 'address') {
        ctx.used(`__tact_load_address`);
        ctx.append(`${varName} = sc_${index}~__tact_load_address();`);
        return;
    }

    if (f.kind === 'map') {
        ctx.append(`${varName} = sc_${index}~load_dict();`);
        return;
    }

    if (f.kind === 'remaining') {
        ctx.append(`${varName} = sc_${index};`);
        return;
    }

    if (f.kind === 'bytes') {
        ctx.append(`${varName} = sc_${index}~load_bits(${f.bytes * 8});`);
        return;
    }

    // Handle structs

    if (f.kind === 'struct') {
        if (optional) {
            ctx.used(`__gen_read_${f.type.name}`);
            ctx.used(`__gen_${f.type.name}_as_optional`);
            ctx.append(`${varName} = __gen_${f.type.name}_as_optional(sc_${index}~__gen_read_${f.type.name}());`);
        } else {
            ctx.used(`__gen_read_${f.type.name}`);
            ctx.append(`${varName} = sc_${index}~__gen_read_${f.type.name}();`);
        }
        return;
    }

    throw Error('Unsupported field kind: ' + f.kind);
}

function writeCellParser(cell: StorageCell, index: number, ctx: WriterContext): number {

    // Write current fields
    for (let f of cell.fields) {
        writeFieldParser(f, index, ctx);
    }

    // Handle next cell
    if (cell.next) {
        ctx.append(`slice sc_${index + 1} = preload_ref(sc_${index}).begin_parse();`);
        return writeCellParser(cell.next, index + 1, ctx);
    } else {
        return index;
    }
}

export function writeParser(name: string, allocation: StorageAllocation, ctx: WriterContext) {
    ctx.fun(`__gen_read_${name}`, () => {
        ctx.append(`(slice, (${resolveFuncType(allocation.type, ctx)})) __gen_read_${name}(slice sc_0) inline {`);
        ctx.inIndent(() => {

            // Check prefix
            if (allocation.prefix) {
                ctx.append(`throw_unless(${contractErrors.invalidPrefix.id}, sc_0~load_uint(32) == ${allocation.prefix});`);
            }

            // Write cell parser
            let out = writeCellParser(allocation.root, 0, ctx);

            // Compile tuple
            ctx.append(`return (sc_${out}, (${allocation.fields.map((v) => `v'${v.name}`).join(', ')}));`);
        });
        ctx.append("}");
    });

    ctx.fun(`__gen_readopt_${name}`, () => {
        ctx.append(`tuple __gen_readopt_${name}(cell cl) inline {`);
        ctx.inIndent(() => {
            ctx.debug(`Invoke __gen_readopt_${name}`);

            // Handle null
            ctx.append(`if (null?(cl)) {`);
            ctx.inIndent(() => {
                ctx.append(`return null();`);
            });
            ctx.append(`}`);
            ctx.append(`var sc_0 = cl.begin_parse();`);

            // Check prefix
            if (allocation.prefix) {
                ctx.append(`throw_unless(${contractErrors.invalidPrefix.id}, sc_0~load_uint(32) == ${allocation.prefix});`);
            }

            // Write cell parser
            writeCellParser(allocation.root, 0, ctx);

            // Compile tuple
            ctx.used(`__tact_tuple_create_${allocation.fields.length}`);
            ctx.append(`return __tact_tuple_create_${allocation.fields.length}(${allocation.fields.map((v) => `v'${v.name}`).join(', ')});`);
        });
        ctx.append("}");
    });
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
        ctx.append(`() __gen_store_${type.name}(${resolveFuncType(type, ctx)} v) impure inline {`); // NOTE: Impure function
        ctx.inIndent(() => {
            ctx.append(`builder b = begin_cell();`);

            // Persist system cell
            ctx.used(`__tact_context`);
            ctx.append(`b = b.store_ref(__tact_context_sys);`);

            // Build data
            ctx.used(`__gen_write_${type.name}`);
            ctx.append(`b = __gen_write_${type.name}(b, v);`);

            // Persist data
            ctx.append(`set_data(b.end_cell());`);
        });
        ctx.append(`}`);
    });
}