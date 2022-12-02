import assert from "assert";
import { ASTStatement } from "../ast/ast";
import { CompilerContext } from "../ast/context";
import { getAllocation, getAllocations } from "../storage/resolveAllocation";
import { StorageAllocation, StorageCell } from "../storage/StorageAllocation";
import { getLValuePaths } from "../types/resolveExpressionType";
import { getAllStaticFunctions, getAllTypes, getType } from "../types/resolveTypeDescriptors";
import { FunctionDescription, TypeDescription } from "../types/types";
import { getMethodId } from "../utils";
import { writeStdlib } from "./stdlib/writeStdlib";
import { Writer, WriterContext } from "./Writer";
import { resolveFuncType } from "./writers/resolveFuncType";
import { writeExpression } from "./writers/writeExpression";

function writeStatement(ctx: CompilerContext, f: ASTStatement, w: Writer, self: boolean, wctx: WriterContext) {
    if (f.kind === 'statement_return') {
        let exp = writeExpression(ctx, f.expression, wctx);
        if (self) {
            w.append('return (self, ' + exp + ');');
        } else {
            w.append('return ' + exp + ';');
        }
        return;
    } else if (f.kind === 'statement_let') {
        w.append(resolveFuncType(ctx, getType(ctx, f.type.name)) + ' ' + f.name + ' = ' + writeExpression(ctx, f.expression, wctx) + ';');
        return;
    } else if (f.kind === 'statement_assign') {

        // Local variable case
        if (f.path.length === 1) {
            w.append(f.path[0] + ' = ' + writeExpression(ctx, f.expression, wctx) + ';');
            return;
        }

        // Depth = 2
        if (f.path.length === 2) {
            let valueExpr = writeExpression(ctx, f.expression, wctx);
            let lvalueTypes = getLValuePaths(ctx, f);
            let srcExpr = f.path[1];
            assert(lvalueTypes[0].kind === 'direct');
            let tt = getType(ctx, lvalueTypes[0].name);
            let targetIndex = tt.fields.findIndex((v) => v.name === srcExpr);
            wctx.useLib('__tact_set');
            valueExpr = '__tact_set(' + f.path[0] + ', ' + targetIndex + ', ' + valueExpr + ')';
            w.append(f.path[0] + ' = ' + valueExpr + ';');
            return;
        }

        throw Error('Too deep assignment');
    }
    throw Error('Unknown statement kind: ' + f.kind);
}

function writeFunction(ctx: CompilerContext, f: FunctionDescription, w: Writer, wctx: WriterContext) {

    // Do not write native functions
    if (f.ast.kind === 'def_native_function') {
        return;
    }
    const fd = f.ast;

    // Write function header
    let args = f.args.map((a) => resolveFuncType(ctx, a.type) + ' ' + a.name);
    if (f.self) {
        args.unshift(resolveFuncType(ctx, f.self) + ' self');
    }
    let returns: string = f.returns ? resolveFuncType(ctx, f.returns) : '()';
    if (f.self && f.returns) {
        returns = '(tuple, ' + returns + ')';
    } else if (f.self) {
        returns = '(tuple, ())';
    }
    w.append(returns + ' ' + (f.self ? '__gen_' + f.self.name + '_' : '') + f.name + '(' + args.join(', ') + ') {');
    w.inIndent(() => {
        for (let s of fd.statements) {
            writeStatement(ctx, s, w, !!f.self, wctx);
        }
        if (f.self && !f.returns) {
            if (fd.statements.length === 0 || fd.statements[fd.statements.length - 1].kind !== 'statement_return') {
                w.append('return (self, ());');
            }
        }
    });
    w.append("}");
    w.append();
}

function writeSerializerCell(ctx: CompilerContext, cell: StorageCell, w: Writer, wctx: WriterContext) {
    for (let f of cell.fields) {
        if (f.kind === 'int') {
            wctx.useLib('__tact_get');
            w.append('.store_int(' + f.size.bits + ', __tact_get(v, ' + f.index + '))');
        } else if (f.kind === 'struct') {
            wctx.useLib('__tact_get');
            w.append('.__gen_write_' + f.type.name + '(__tact_get(v, ' + f.index + '))');
        }
    }
    if (cell.next) {
        w.append('.store_ref(begin_cell()');
        w.inIndent(() => {
            writeSerializerCell(ctx, cell.next!, w, wctx);
        });
        w.append('.end_cell())');
    }
}

function writeSerializer(ctx: CompilerContext, name: string, allocation: StorageAllocation, w: Writer, wctx: WriterContext) {
    w.append('builder __gen_write_' + name + '(builder build, tuple v) {');
    w.inIndent(() => {
        w.append('return build');
        w.inIndent(() => {
            writeSerializerCell(ctx, allocation.root, w, wctx);
        });
        w.append(';');
    });
    w.append("}");
    w.append();
}

function writeCellParser(ctx: CompilerContext, cell: StorageCell, w: Writer, wctx: WriterContext) {
    for (let f of cell.fields) {
        if (f.kind === 'int') {
            w.append(resolveFuncType(ctx, f.type) + ' __' + f.name + ' = sc~load_int(' + f.size.bits + ');');
        } else if (f.kind === 'int-optional') {
            w.append(resolveFuncType(ctx, f.type) + ' __' + f.name + ' = null();');
            w.append('if (sc~load_int(1)) {');
            w.inIndent(() => {
                w.append(' __' + f.name + ' = sc~__tact_load_int_opt(' + f.size.bits + ');');
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
        }
    }
    if (cell.next) {
        w.append('sc = (sc~load_ref()).begin_parse();');
        writeCellParser(ctx, cell.next, w, wctx);
    }
}

function writeParser(ctx: CompilerContext, name: string, allocation: StorageAllocation, w: Writer, wctx: WriterContext) {
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

function writeStorageOps(ctx: CompilerContext, type: TypeDescription, w: Writer, wctx: WriterContext) {
    w.append('tuple __gen_load_' + type.name + '() {');
    w.inIndent(() => {
        w.append('slice sc = get_data().begin_parse();');
        w.append('tuple res = sc~__gen_read_' + type.name + '();');
        w.append('return res;');
    });
    w.append('}');
    w.append();
    w.append('() __gen_store_' + type.name + '(tuple v) impure {');
    w.inIndent(() => {
        w.append('builder b = begin_cell();');
        w.append('b = __gen_write_' + type.name + '(b, v);');
        w.append('set_data(b.end_cell());');
    });
    w.append('}');
    w.append();
}

function writeGetter(ctx: CompilerContext, f: FunctionDescription, w: Writer, wctx: WriterContext) {
    let args = f.args.map((a) => resolveFuncType(ctx, a.type) + ' ' + a.name);
    w.append('_ __gen_get_' + f.name + '(' + args.join(', ') + ') method_id(' + getMethodId(f.name) + ') {');
    w.inIndent(() => {
        w.append('tuple self = __gen_load_' + f.self!.name + '();');
        w.append('var res = self~__gen_' + f.self!.name + '_' + f.name + '(' + [...f.args.map((a) => a.name)].join(', ') + ');');
        w.append('return res;');
    });
    w.append('}');
    w.append();
}

export function writeProgram(ctx: CompilerContext) {
    const writer = new Writer();
    const wctx = new WriterContext();
    let contracts = Object.values(getAllTypes(ctx)).filter((v) => v.kind === 'contract');

    // Serializators
    let allocations = getAllocations(ctx);
    for (let k of allocations) {
        writeSerializer(ctx, k.type.name, k.allocation, writer, wctx);
        writeParser(ctx, k.type.name, k.allocation, writer, wctx);
    }
    for (let c of contracts) {
        for (let f of c.functions) {
            if (f.isPublic) {
                writeSerializer(ctx, c.name + '_' + f.name, getAllocation(ctx, c.name + '$$' + f.name), writer, wctx);
                writeParser(ctx, c.name + '_' + f.name, getAllocation(ctx, c.name + '$$' + f.name), writer, wctx);
            }
        }
    }

    // Storage Functions
    for (let k of allocations) {
        if (k.type.kind === 'contract') {
            writeStorageOps(ctx, k.type, writer, wctx);
        }
    }

    // Static functions
    let sf = getAllStaticFunctions(ctx);
    for (let k in sf) {
        let f = sf[k];
        writeFunction(ctx, f, writer, wctx);
    }

    // Contract functions
    for (let c of contracts) {
        for (let f of c.functions) {
            writeFunction(ctx, f, writer, wctx);
        }
    }

    // Contract getters
    for (let c of contracts) {
        for (let f of c.functions) {
            if (f.isGetter) {
                writeGetter(ctx, f, writer, wctx);
            }
        }
    }

    // Contract
    if (contracts.length > 1) {
        throw Error('Too many contracts');
    }

    // Empty contract
    if (contracts.length === 0) {
        writer.append('() recv_internal(cell in_msg_cell, slice in_msg) impure {');
        writer.inIndent(() => {
            writer.append('throw(100);');
        });
        writer.append('}');
    }

    // Entry Point
    if (contracts.length === 1) {
        let c = contracts[0];
        writer.append('() recv_internal(cell in_msg_cell, slice in_msg) impure {');
        writer.inIndent(() => {
            writer.append('int op = in_msg~load_int(32);');
            writer.append('tuple self = __gen_load_' + contracts[0].name + '();');
            for (let f of c.functions) {
                if (f.isPublic) {
                    let allocation = getAllocation(ctx, c.name + '$$' + f.name);
                    writer.append('if (op == ' + allocation.prefix + ') {');
                    writer.inIndent(() => {
                        writer.append('tuple msg = in_msg~__gen_read_' + c.name + '_' + f.name + '();');
                        writer.append('self~__gen_' + c.name + '_' + f.name + '(' + [...f.args.map((v, i) => '__tact_get(msg, ' + i + ')')].join(',') + ');');
                    })
                    writer.append('}');
                }
            }
            // TODO Implement
            writer.append('__gen_store_SampleContract(self);');
        });
        writer.append('}');
    }

    // Write header
    let res = writeStdlib(Array.from(wctx.stdlib)) + '\n' + writer.end();
    return res;
}