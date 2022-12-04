import assert from "assert";
import { ASTCondition, ASTStatement } from "../ast/ast";
import { CompilerContext } from "../ast/context";
import { getAllocation, getAllocations } from "../storage/resolveAllocation";
import { getLValuePaths } from "../types/resolveExpressionType";
import { getAllStaticFunctions, getAllTypes, getType } from "../types/resolveTypeDescriptors";
import { FunctionDescription, InitDescription, TypeDescription } from "../types/types";
import { getMethodId } from "../utils";
import { writeStdlib } from "./stdlib/writeStdlib";
import { Writer, WriterContext } from "./Writer";
import { resolveFuncType } from "./writers/resolveFuncType";
import { writeExpression } from "./writers/writeExpression";
import { writeParser, writeSerializer } from "./writers/writeSerialization";

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
    } else if (f.kind === 'statement_condition') {
        writeCondition(ctx, f, w, self, wctx);
        return;
    } else if (f.kind === 'statement_call') {
        let exp = writeExpression(ctx, f.expression, wctx);
        w.append(exp + ';');
        return;
    } else if (f.kind === 'statement_while') {
        w.append(`while (${writeExpression(ctx, f.condition, wctx)}) {`);
        w.inIndent(() => {
            for (let s of f.statements) {
                writeStatement(ctx, s, w, self, wctx);
            }
        });
        w.append(`}`);
        return;
    } else if (f.kind === 'statement_until') {
        w.append(`do {`);
        w.inIndent(() => {
            for (let s of f.statements) {
                writeStatement(ctx, s, w, self, wctx);
            }
        });
        w.append(`} until (${writeExpression(ctx, f.condition, wctx)});`);
        return;
    } else if (f.kind === 'statement_repeat') {
        w.append(`repeat (${writeExpression(ctx, f.condition, wctx)}) {`);
        w.inIndent(() => {
            for (let s of f.statements) {
                writeStatement(ctx, s, w, self, wctx);
            }
        });
        w.append(`}`);
        return;
    }

    throw Error('Unknown statement kind');
}

function writeCondition(ctx: CompilerContext, f: ASTCondition, w: Writer, self: boolean, wctx: WriterContext, elseif: boolean = false) {
    w.append((elseif ? '} else' : '') + 'if (' + writeExpression(ctx, f.expression, wctx) + ') {');
    w.inIndent(() => {
        for (let s of f.trueStatements) {
            writeStatement(ctx, s, w, self, wctx);
        }
    });
    if (f.falseStatements.length > 0) {
        w.append('} else {');
        w.inIndent(() => {
            for (let s of f.falseStatements) {
                writeStatement(ctx, s, w, self, wctx);
            }
        });
        w.append('}');
    } else if (f.elseif) {
        writeCondition(ctx, f.elseif, w, self, wctx, true);
    } else {
        w.append('}');
    }
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

function writeInit(ctx: CompilerContext, t: TypeDescription, init: InitDescription, w: Writer, wctx: WriterContext) {

    // Resolve args
    let args = init.args.map((a) => resolveFuncType(ctx, a.type) + ' ' + a.name);

    w.append(`cell __gen_${t.name}_init(${args.join(', ')}) {`);
    w.inIndent(() => {
        let selfInit = 'empty_tuple()';
        for (let i = 0; i < t.fields.length; i++) {
            selfInit = `tpush(${selfInit}, null())`;
        }
        w.append(`tuple self = ${selfInit};`);

        // Generate statements
        for (let s of init.ast.statements) {
            writeStatement(ctx, s, w, true, wctx);
        }

        w.append('return __gen_writecell_' + t.name + '(self);');
    });
    w.append('}');
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

    // Contract inits
    for (let c of contracts) {
        if (c.init) {
            writeInit(ctx, c, c.init, writer, wctx);
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
        writer.append();
    }

    // Entry Point
    if (contracts.length === 1) {

        const c = contracts[0];
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
                        writer.append('self~__gen_' + c.name + '_' + f.name + '(' + [...f.args.map((v, i) => 'at(msg, ' + i + ')')].join(', ') + ');');
                    })
                    writer.append('}');
                }
            }
            writer.append('__gen_store_' + contracts[0].name + '(self);');
        });
        writer.append('}');
        writer.append();

        // Generate Init
        if (c.init) {
            writer.append(`cell init_${c.name}(${c.init.args.map((a) => resolveFuncType(ctx, a.type) + ' ' + a.name).join(', ')}) method_id {`);
            writer.inIndent(() => {
                writer.append(`return __gen_${c.name}_init(${c.init!.args.map((a) => a.name).join(', ')});`);
            });
            writer.append('}');
            writer.append();
        }
    }

    // Write header
    let res = writeStdlib(Array.from(wctx.stdlib)) + '\n' + writer.end();
    return res;
}