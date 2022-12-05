import { StorageAllocation, StorageCell, StorageField } from "../../storage/StorageAllocation";
import { WriterContext } from "../Writer";
import { resolveFuncType } from "./resolveFuncType";

//
// Serializer
//

function writeSerializerField(f: StorageField, index: number, ctx: WriterContext) {

    // Handle optional

    if (f.kind === 'optional') {
        ctx.append(`if (null?(v_${f.index})) {`);
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
        ctx.append(`build_${index} = store_int(build_${index}, v_${f.index}, ${f.bits});`);
        return;
    }

    if (f.kind === 'uint') {
        ctx.append(`build_${index} = store_uint(build_${index}, v_${f.index}, ${f.bits});`);
        return;
    }

    if (f.kind === 'coins') {
        ctx.append(`build_${index} = store_coins(build_${index}, v_${f.index});`);
        return;
    }

    if (f.kind === 'slice') {
        ctx.append(`build_${index} = store_ref(build_${index}, v_${f.index}.end_cell());`);
        return;
    }

    if (f.kind === 'cell') {
        ctx.append(`build_${index} = store_ref(build_${index}, v_${f.index});`);
        return;
    }

    // Handle structs

    if (f.kind === 'struct') {
        ctx.used(`__gen_write_${f.type.name}`);
        ctx.append(`build_${index} = __gen_write_${f.type.name}(build_${index}, v_${f.index});`);
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
        ctx.append(`builder __gen_write_${name}(builder build_0, tuple v) {`);
        ctx.inIndent(() => {
            for (let f of allocation.fields) {
                ctx.append(`var v_${f.index} = at(v, ${f.index});`);
            }
            writeSerializerCell(allocation.root, 0, ctx);
            ctx.append(`return build_0;`);
        });
        ctx.append(`}`);
    });

    // Write to cell
    ctx.fun(`__gen_writecell_${name}`, () => {
        ctx.append(`cell __gen_writecell_${name}(tuple v) {`);
        ctx.inIndent(() => {
            ctx.used(`__gen_write_${name}`);
            ctx.append(`return __gen_write_${name}(begin_cell(), v).end_cell();`);
        });
        ctx.append(`}`);
    });

    // Write to slice
    ctx.fun(` __gen_writeslice_${name}`, () => {
        ctx.append(`slice __gen_writeslice_${name}(tuple v) {`);
        ctx.inIndent(() => {
            ctx.used(`__gen_writecell_${name}`);
            ctx.append(`return __gen_writecell_${name}(v).begin_parse();`);
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
        ctx.append('if (sc~load_int(1)) {');
        ctx.inIndent(() => {
            writeFieldParser(f.inner, ctx);
        });
        ctx.append('}');
        return;
    }

    // Handle primitive values

    if (f.kind === 'int') {
        ctx.append(`__${f.name} = sc~load_int(${f.bits});`);
        return;
    }

    if (f.kind === 'uint') {
        ctx.append(`__${f.name} = sc~load_uint(${f.bits});`);
        return;
    }

    if (f.kind === 'coins') {
        ctx.append(`__${f.name} = sc~load_coins();`);
        return;
    }

    if (f.kind === 'slice') {
        ctx.append(`__${f.name} = sc~load_ref().begin_parse();`);
        return;
    }

    if (f.kind === 'cell') {
        ctx.append(`__${f.name} = sc~load_ref();`);
        return;
    }

    // Handle structs

    if (f.kind === 'struct') {
        ctx.used(`__gen_read_${f.type.name}`);
        ctx.append(`__${f.name} = sc~__gen_read_${f.type.name}();`);
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
        ctx.append(`(slice, tuple) __gen_read_${name}(slice sc) {`);
        ctx.inIndent(() => {

            // Create variables
            for (let f of allocation.fields) {
                ctx.append(`${resolveFuncType(f.type, ctx)} __${f.name} = null();`);
            }

            // Write cell parser
            writeCellParser(allocation.root, ctx);

            // Compile tuple
            ctx.append("tuple res = empty_tuple();");
            function writeCell(src: StorageCell) {
                for (let s of src.fields) {
                    ctx.append('res = tpush(res, __' + s.name + ');');
                }
                if (src.next) {
                    writeCell(src.next);
                }
            }
            writeCell(allocation.root);
            ctx.append('return (sc, res);');
        });
        ctx.append("}");
    });
}