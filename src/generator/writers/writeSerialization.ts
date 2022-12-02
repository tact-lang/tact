import { CompilerContext } from "../../ast/context";
import { StorageAllocation, StorageCell } from "../../storage/StorageAllocation";
import { Writer, WriterContext } from "../Writer";
import { resolveFuncType } from "./resolveFuncType";

//
// Serializer
//

function writeSerializerCell(ctx: CompilerContext, cell: StorageCell, w: Writer, index: number, wctx: WriterContext) {
    for (let f of cell.fields) {

        // Read variable
        wctx.useLib('__tact_get');
        w.append(`var v_${f.index} = __tact_get(v, ${f.index});`);

        // Write serializator
        if (f.kind === 'int') {
            w.append(`build_${index} = store_int(build_${index}, ${f.size.bits}, v_${f.index});`);
        } else if (f.kind === 'int-optional') {
            w.append(`if (null?(v_${f.index})) {`);
            w.inIndent(() => {
                w.append(`build_${index} = store_int(build_${index}, false, 1);`);
            });
            w.append(`} else {`);
            w.inIndent(() => {
                w.append(`build_${index} = store_int(build_${index}, true, 1);`);
                w.append(`build_${index} = store_int(build_${index}, ${f.size.bits}, v_${f.index});`);
            });
            w.append(`}`);
        } else if (f.kind === 'struct') {
            w.append(`build_${index} = __gen_write_${f.type.name}(build_${index}, v_${f.index});`);
        } else if (f.kind === 'struct-optional') {
            w.append(`if (null?(v_${f.index})) {`);
            w.inIndent(() => {
                w.append(`build_${index} = store_int(build_${index}, false, 1);`);
            });
            w.append(`} else {`);
            w.inIndent(() => {
                w.append(`build_${index} = __gen_write_${f.type.name}(build_${index}, v_${f.index});`);
                w.append(`build_${index} = store_int(build_${index}, true, 1);`);
            });
            w.append(`}`);
        } else if (f.kind === 'slice') {
            w.append(`build_${index} = store_ref(build_${index}, v_${f.index}.end_cell());`);
        } else if (f.kind === 'slice-optional') {
            w.append(`if (null?(v_${f.index})) {`);
            w.inIndent(() => {
                w.append(`build_${index} = store_int(build_${index}, false, 1);`);
            });
            w.append(`} else {`);
            w.inIndent(() => {
                w.append(`build_${index} = store_int(build_${index}, true, 1);`);
                w.append(`build_${index} = store_ref(build_${index}, v_${f.index}.end_cell());`);
            });
            w.append(`}`);
        }
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

function writeCellParser(ctx: CompilerContext, cell: StorageCell, w: Writer, wctx: WriterContext) {
    for (let f of cell.fields) {
        if (f.kind === 'int') {
            w.append(resolveFuncType(ctx, f.type) + ' __' + f.name + ' = sc~load_int(' + f.size.bits + ');');
        } else if (f.kind === 'int-optional') {
            w.append(resolveFuncType(ctx, f.type) + ' __' + f.name + ' = null();');
            w.append('if (sc~load_int(1)) {');
            w.inIndent(() => {
                w.append(' __' + f.name + ' = sc~load_int(' + f.size.bits + ');');
            });
            w.append('}');
        } else if (f.kind === 'struct') {
            w.append(resolveFuncType(ctx, f.type) + ' __' + f.name + ' = sc~__gen_read_' + f.type.name + '();');
        } else if (f.kind === 'struct-optional') {
            w.append(resolveFuncType(ctx, f.type) + ' __' + f.name + ' = null();');
            w.append('if (sc~load_int(1)) {')
            w.inIndent(() => {
                w.append(' __' + f.name + ' = sc~__gen_read_' + f.type.name + '();');
            });
            w.append('}');
        } else if (f.kind === 'slice') {
            w.append(resolveFuncType(ctx, f.type) + ' __' + f.name + ' = sc~load_ref().begin_parse();');
        } else if (f.kind === 'slice-optional') {
            w.append(resolveFuncType(ctx, f.type) + ' __' + f.name + ' = null();');
            w.append('if (sc~load_int(1)) {')
            w.inIndent(() => {
                w.append(' __' + f.name + ' = sc~load_ref().begin_parse();');
            });
            w.append('}');
        }
    }
    if (cell.next) {
        w.append('sc = (sc~load_ref()).begin_parse();');
        writeCellParser(ctx, cell.next, w, wctx);
    }
}

export function writeParser(ctx: CompilerContext, name: string, allocation: StorageAllocation, w: Writer, wctx: WriterContext) {
    w.append('(slice, tuple) __gen_read_' + name + '(slice sc) {');
    w.inIndent(() => {

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