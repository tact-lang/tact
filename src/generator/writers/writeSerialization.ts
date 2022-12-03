import { CompilerContext } from "../../ast/context";
import { StorageAllocation, StorageCell, StorageField } from "../../storage/StorageAllocation";
import { Writer, WriterContext } from "../Writer";
import { resolveFuncType } from "./resolveFuncType";

//
// Serializer
//

function writeSerializerField(ctx: CompilerContext, f: StorageField, w: Writer, index: number, wctx: WriterContext) {

    // Handle optional

    if (f.kind === 'optional') {
        w.append(`if (null?(v_${f.index})) {`);
        w.inIndent(() => {
            w.append(`build_${index} = store_int(build_${index}, false, 1);`);
        });
        w.append(`} else {`);
        w.inIndent(() => {
            w.append(`build_${index} = store_int(build_${index}, true, 1);`);
            writeSerializerField(ctx, f.inner, w, index, wctx);
        });
        w.append(`}`);
        return;
    }

    // Handle primitives

    if (f.kind === 'int') {
        w.append(`build_${index} = store_int(build_${index}, v_${f.index}, ${f.size.bits});`);
        return;
    }

    if (f.kind === 'uint') {
        w.append(`build_${index} = store_uint(build_${index}, v_${f.index}, ${f.size.bits});`);
        return;
    }

    if (f.kind === 'slice') {
        w.append(`build_${index} = store_ref(build_${index}, v_${f.index}.end_cell());`);
        return;
    }

    if (f.kind === 'cell') {
        w.append(`build_${index} = store_ref(build_${index}, v_${f.index});`);
        return;
    }

    // Handle structs

    if (f.kind === 'struct') {
        w.append(`build_${index} = __gen_write_${f.type.name}(build_${index}, v_${f.index});`);
        return;
    }

    throw Error('Unsupported field kind: ' + f.kind);
}

function writeSerializerCell(ctx: CompilerContext, cell: StorageCell, w: Writer, index: number, wctx: WriterContext) {

    // Write fields
    for (let f of cell.fields) {
        writeSerializerField(ctx, f, w, index, wctx);
    }

    // Tail
    if (cell.next) {
        w.append(`var build_${index + 1} = begin_cell();`);
        writeSerializerCell(ctx, cell.next!, w, index + 1, wctx);
        w.append(`build_${index} = store_ref(build_${index}, build_${index + 1}.end_cell());`);
    }
}

export function writeSerializer(ctx: CompilerContext, name: string, allocation: StorageAllocation, w: Writer, wctx: WriterContext) {
    w.append('builder __gen_write_' + name + '(builder build_0, tuple v) {');
    w.inIndent(() => {
        for (let f of allocation.fields) {
            wctx.useLib('__tact_get');
            w.append(`var v_${f.index} = __tact_get(v, ${f.index});`);
        }
        writeSerializerCell(ctx, allocation.root, w, 0, wctx);
        w.append('return build_0;');
    });
    w.append("}");
    w.append();

    w.append('cell __gen_writecell_' + name + '(tuple v) {');
    w.inIndent(() => {
        w.append('return __gen_write_' + name + '(begin_cell(), v).end_cell();');
    });
    w.append("}");
    w.append();

    w.append('slice __gen_writeslice_' + name + '(tuple v) {');
    w.inIndent(() => {
        w.append('return __gen_writecell_' + name + '(v).begin_parse();');
    });
    w.append("}");
    w.append();
}

//
// Parser
//

function writeFieldParser(ctx: CompilerContext, f: StorageField, w: Writer, wctx: WriterContext) {

    // Handle optional

    if (f.kind === 'optional') {
        w.append('if (sc~load_int(1)) {');
        w.inIndent(() => {
            writeFieldParser(ctx, f.inner, w, wctx);
        });
        w.append('}');
        return;
    }

    // Handle primitive values

    if (f.kind === 'int') {
        w.append(' __' + f.name + ' = sc~load_int(' + f.bits + ');');
        return;
    }

    if (f.kind === 'uint') {
        w.append(' __' + f.name + ' = sc~load_uint(' + f.bits + ');');
        return;
    }

    if (f.kind === 'slice') {
        w.append(' __' + f.name + ' = sc~load_ref().begin_parse();');
        return;
    }

    if (f.kind === 'cell') {
        w.append(' __' + f.name + ' = sc~load_ref();');
        return;
    }

    // Handle structs

    if (f.kind === 'struct') {
        w.append(' __' + f.name + ' = sc~__gen_read_' + f.type.name + '();');
        return;
    }

    throw Error('Unsupported field kind: ' + f.kind);
}

function writeCellParser(ctx: CompilerContext, cell: StorageCell, w: Writer, wctx: WriterContext) {

    // Write current fields
    for (let f of cell.fields) {
        writeFieldParser(ctx, f, w, wctx);
    }

    // Handle next cell
    if (cell.next) {
        w.append('sc = (sc~load_ref()).begin_parse();');
        writeCellParser(ctx, cell.next, w, wctx);
    }
}

export function writeParser(ctx: CompilerContext, name: string, allocation: StorageAllocation, w: Writer, wctx: WriterContext) {
    w.append('(slice, tuple) __gen_read_' + name + '(slice sc) {');
    w.inIndent(() => {

        // Create variables
        for (let f of allocation.fields) {
            w.append(resolveFuncType(ctx, f.type) + ' __' + f.name + ' = null();');
        }

        // Write cell parser
        writeCellParser(ctx, allocation.root, w, wctx);

        // Compile tuple
        w.append("tuple res = empty_tuple();");
        function writeCell(src: StorageCell) {
            for (let s of src.fields) {
                w.append('res = tpush(res, __' + s.name + ');');
            }
            if (src.next) {
                writeCell(src.next);
            }
        }
        writeCell(allocation.root);
        w.append('return (sc, res);');
    });
    w.append("}");
    w.append();
}