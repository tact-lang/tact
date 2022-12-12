import { StorageAllocation, StorageCell, StorageField } from "../../storage/StorageAllocation";
import { getType } from "../../types/resolveDescriptors";
import { TypeDescription } from "../../types/types";
import { WriterContext } from "../Writer";
import { resolveFuncTensor, tensorToString } from "./resolveFuncTensor";

//
// Serializer
//

function writeSerializerField(f: StorageField, index: number, ctx: WriterContext) {

    // Handle optional

    if (f.kind === 'optional') {
        ctx.append(`if (null?(v'${f.name})) {`);
        ctx.inIndent(() => {
            ctx.append(`build_${index} = store_int(build_${index}, false, 1);`);
        });
        ctx.append(`} else {`);
        ctx.inIndent(() => {
            ctx.append(`build_${index} = store_int(build_${index}, true, 1);`);
            writeSerializerField(f.inner, index, ctx);
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
        ctx.used(`__gen_write_${f.type.name}`);
        ctx.append(`build_${index} = __gen_write_${f.type.name}(build_${index}, v'${f.name});`);
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

    let tensor = resolveFuncTensor(allocation.fields, ctx, `v'`);
    let args = tensorToString(tensor, 'full');
    let vvss = tensorToString(tensor, 'names');

    // Write to builder
    ctx.fun(`__gen_write_${name}`, () => {
        ctx.append(`builder __gen_write_${name}(${['builder build_0', ...args].join(', ')}) inline {`);
        ctx.inIndent(() => {
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
        ctx.append(`cell __gen_writecell_${name}(${args.join(', ')}) inline {`);
        ctx.inIndent(() => {
            ctx.used(`__gen_write_${name}`);
            ctx.append(`return __gen_write_${name}(begin_cell(), ${vvss.join(', ')}).end_cell();`);
        });
        ctx.append(`}`);
    });

    // Write to slice
    ctx.fun(` __gen_writeslice_${name}`, () => {
        ctx.append(`slice __gen_writeslice_${name}(${args.join(', ')}) inline {`);
        ctx.inIndent(() => {
            ctx.used(`__gen_writecell_${name}`);
            ctx.append(`return __gen_writecell_${name}(${vvss.join(', ')}).begin_parse();`);
        });
        ctx.append(`}`);
    });
}

//
// Parser
//

function writeFieldParser(f: StorageField, ctx: WriterContext) {

    // Handle optional

    if (f.kind === 'optional') {
        ctx.append(`var ${f.name} = null();`);
        ctx.append('if (sc~load_int(1)) {');
        ctx.inIndent(() => {
            writeFieldParser(f.inner, ctx);
        });
        ctx.append('}');
        return;
    }

    // Handle primitive values

    if (f.kind === 'int') {
        ctx.append(`var ${f.name} = sc~load_int(${f.bits});`);
        return;
    }

    if (f.kind === 'uint') {
        ctx.append(`var ${f.name} = sc~load_uint(${f.bits});`);
        return;
    }

    if (f.kind === 'coins') {
        ctx.append(`var ${f.name} = sc~load_coins();`);
        return;
    }

    if (f.kind === 'slice') {
        ctx.append(`var ${f.name} = sc~load_ref().begin_parse();`);
        return;
    }

    if (f.kind === 'cell') {
        ctx.append(`var ${f.name} = sc~load_ref();`);
        return;
    }

    if (f.kind === 'address') {
        ctx.used(`__tact_load_address`);
        ctx.append(`var ${f.name} = sc~__tact_load_address();`);
        return;
    }

    if (f.kind === 'map') {
        ctx.append(`var ${f.name} = sc~load_dict();`);
        return;
    }

    if (f.kind === 'remaining') {
        ctx.append(`var ${f.name} = sc;`);
        return;
    }

    if (f.kind === 'bytes') {
        ctx.append(`var ${f.name} = sc~load_bits(${f.bytes * 8});`);
        return;
    }

    // Handle structs

    if (f.kind === 'struct') {
        let ft = resolveFuncTensor(f.type.fields, ctx, `${f.name}'`);
        ctx.used(`__gen_read_${f.type.name}`);
        ctx.append(`var (${tensorToString(ft, 'full').join(', ')}) = sc~__gen_read_${f.type.name}();`);
        return;
    }

    throw Error('Unsupported field kind: ' + f.kind);
}

function writeCellParser(cell: StorageCell, ctx: WriterContext) {

    // Write current fields
    for (let f of cell.fields) {
        writeFieldParser(f, ctx);
    }

    // Handle next cell
    if (cell.next) {
        ctx.append('sc = (sc~load_ref()).begin_parse();');
        writeCellParser(cell.next, ctx);
    }
}

export function writeParser(name: string, allocation: StorageAllocation, ctx: WriterContext) {
    ctx.fun(`__gen_read_${name}`, () => {
        let tensor = resolveFuncTensor(allocation.fields, ctx);
        let returns = tensorToString(tensor, 'types');
        ctx.append(`(slice, (${returns.join(', ')})) __gen_read_${name}(slice sc) inline {`);
        ctx.inIndent(() => {

            // Check prefix
            if (allocation.prefix) {
                ctx.append(`throw_unless(100, sc~load_uint(32) == ${allocation.prefix});`);
            }

            // Write cell parser
            writeCellParser(allocation.root, ctx);

            // Compile tuple
            ctx.append(`return (sc, (${tensorToString(tensor, 'names').join(', ')}));`);
        });
        ctx.append("}");
    });
}

//
// Storage
//

export function writeStorageOps(type: TypeDescription, ctx: WriterContext) {

    // Load function
    let tensor = resolveFuncTensor(type.fields, ctx, `v'`);
    ctx.fun(`__gen_load_${type.name}`, () => {
        ctx.append(`(${tensorToString(tensor, 'types').join(', ')}) __gen_load_${type.name}() inline {`); // NOTE: Inline function
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
        ctx.append(`() __gen_store_${type.name}(${tensorToString(tensor, 'full').join(', ')}) impure inline {`); // NOTE: Impure function
        ctx.inIndent(() => {
            ctx.append(`builder b = begin_cell();`);

            // Persist system cell
            ctx.used(`__tact_context`);
            ctx.append(`b = b.store_ref(__tact_context_sys);`);

            // Build data
            ctx.used(`__gen_write_${type.name}`);
            ctx.append(`b = __gen_write_${type.name}(${['b', tensorToString(tensor, 'names')].join(', ')});`);

            // Persist data
            ctx.append(`set_data(b.end_cell());`);
        });
        ctx.append(`}`);
    });
}

//
// Resolve
//

export function resolveReadVariableName(name: string, type: string, ctx: WriterContext) {
    let t = getType(ctx.ctx, type);
    if (t.kind === 'contract' || t.kind === 'struct') {
        let tz = resolveFuncTensor(t.fields, ctx, `${name}'`);
        return '(' + tensorToString(tz, 'names').join(', ') + ')';
    }
    return `${name}`;
}
