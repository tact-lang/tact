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
        ctx.append(`builder __gen_write_${name}(${['builder build_0', ...args].join(', ')}) impure {`);
        ctx.inIndent(() => {
            if (allocation.fields.length > 0) {
                writeSerializerCell(allocation.root, 0, ctx);
            }
            ctx.append(`return build_0;`);
        });
        ctx.append(`}`);
    });

    // Write to cell
    ctx.fun(`__gen_writecell_${name}`, () => {
        ctx.append(`cell __gen_writecell_${name}(${args}) impure {`);
        ctx.inIndent(() => {
            ctx.used(`__gen_write_${name}`);
            ctx.append(`return __gen_write_${name}(begin_cell(), ${vvss.join(', ')}).end_cell();`);
        });
        ctx.append(`}`);
    });

    // Write to slice
    ctx.fun(` __gen_writeslice_${name}`, () => {
        ctx.append(`slice __gen_writeslice_${name}(${args}) impure {`);
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
        ctx.append(`(slice, (${returns.join(', ')})) __gen_read_${name}(slice sc) {`);
        ctx.inIndent(() => {

            // Write cell parser
            writeCellParser(allocation.root, ctx);

            // Compile tuple
            ctx.append(`return (sc, (${tensorToString(tensor, 'names').join(', ')}));`);
        });
        ctx.append("}");
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