import assert from "assert";
import { ASTCondition, ASTStatement } from "../ast/ast";
import { CompilerContext } from "../ast/context";
import { getAllocation, getAllocations } from "../storage/resolveAllocation";
import { getLValuePaths } from "../types/resolveExpressionType";
import { getAllStaticFunctions, getAllTypes, getType } from "../types/resolveTypeDescriptors";
import { FunctionDescription, InitDescription, TypeDescription } from "../types/types";
import { getMethodId } from "../utils";
import { WriterContext } from "./Writer";
import { resolveFuncType } from "./writers/resolveFuncType";
import { writeExpression } from "./writers/writeExpression";
import { writeParser, writeSerializer } from "./writers/writeSerialization";
import { writeStdlib } from "./writers/writeStdlib";

function writeStatement(f: ASTStatement, self: boolean, ctx: WriterContext) {
    if (f.kind === 'statement_return') {
        let exp = writeExpression(f.expression, ctx);
        if (self) {
            ctx.append(`return (self, ${exp});`);
        } else {
            ctx.append(`return ${exp};`);
        }
        return;
    } else if (f.kind === 'statement_let') {
        ctx.append(`${resolveFuncType(getType(ctx.ctx, f.type.name), ctx)} ${f.name} = ${writeExpression(f.expression, ctx)};`);
        return;
    } else if (f.kind === 'statement_assign') {

        // Local variable case
        if (f.path.length === 1) {
            ctx.append(`${f.path[0]} = ${writeExpression(f.expression, ctx)};`);
            return;
        }

        // Depth = 2
        if (f.path.length === 2) {
            let valueExpr = writeExpression(f.expression, ctx);
            let lvalueTypes = getLValuePaths(ctx.ctx, f);
            let srcExpr = f.path[1];
            assert(lvalueTypes[0].kind === 'direct');
            let tt = getType(ctx.ctx, lvalueTypes[0].name);
            let targetIndex = tt.fields.findIndex((v) => v.name === srcExpr);
            ctx.used('__tact_set');
            ctx.append(`${f.path[0]} = __tact_set(${f.path[0]}, ${targetIndex}, ${valueExpr});`);
            return;
        }

        throw Error('Too deep assignment');
    } else if (f.kind === 'statement_condition') {
        writeCondition(f, self, false, ctx);
        return;
    } else if (f.kind === 'statement_call') {
        let exp = writeExpression(f.expression, ctx);
        ctx.append(`${exp};`);
        return;
    } else if (f.kind === 'statement_while') {
        ctx.append(`while (${writeExpression(f.condition, ctx)}) {`);
        ctx.inIndent(() => {
            for (let s of f.statements) {
                writeStatement(s, self, ctx);
            }
        });
        ctx.append(`}`);
        return;
    } else if (f.kind === 'statement_until') {
        ctx.append(`do {`);
        ctx.inIndent(() => {
            for (let s of f.statements) {
                writeStatement(s, self, ctx);
            }
        });
        ctx.append(`} until (${writeExpression(f.condition, ctx)});`);
        return;
    } else if (f.kind === 'statement_repeat') {
        ctx.append(`repeat (${writeExpression(f.condition, ctx)}) {`);
        ctx.inIndent(() => {
            for (let s of f.statements) {
                writeStatement(s, self, ctx);
            }
        });
        ctx.append(`}`);
        return;
    }

    throw Error('Unknown statement kind');
}

function writeCondition(f: ASTCondition, self: boolean, elseif: boolean, ctx: WriterContext) {
    ctx.append(`${(elseif ? '} else' : '')}if (${writeExpression(f.expression, ctx)}) {`);
    ctx.inIndent(() => {
        for (let s of f.trueStatements) {
            writeStatement(s, self, ctx);
        }
    });
    if (f.falseStatements.length > 0) {
        ctx.append(`} else {`);
        ctx.inIndent(() => {
            for (let s of f.falseStatements) {
                writeStatement(s, self, ctx);
            }
        });
        ctx.append(`}`);
    } else if (f.elseif) {
        writeCondition(f.elseif, self, true, ctx);
    } else {
        ctx.append(`}`);
    }
}

function writeFunction(f: FunctionDescription, ctx: WriterContext) {

    // Do not write native functions
    if (f.ast.kind === 'def_native_function') {
        return;
    }
    const fd = f.ast;

    // Write function header
    let args = f.args.map((a) => resolveFuncType(a.type, ctx) + ' ' + a.name);
    if (f.self) {
        args.unshift(`${resolveFuncType(f.self, ctx)} self`);
    }
    let returns: string = f.returns ? resolveFuncType(f.returns, ctx) : '()';
    if (f.self && f.returns) {
        returns = '(tuple, ' + returns + ')';
    } else if (f.self) {
        returns = '(tuple, ())';
    }

    // Resolve function name
    let name = (f.self ? '__gen_' + f.self.name + '_' : '') + f.name;

    // Write function body
    ctx.fun(name, () => {
        ctx.append(`${returns} ${name}(${args.join(', ')}) {`);
        ctx.inIndent(() => {
            for (let s of fd.statements) {
                writeStatement(s, !!f.self, ctx);
            }
            if (f.self && !f.returns) {
                if (fd.statements.length === 0 || fd.statements[fd.statements.length - 1].kind !== 'statement_return') {
                    ctx.append(`return (self, ());`);
                }
            }
        });
        ctx.append(`}`);
    });
}

function writeInit(t: TypeDescription, init: InitDescription, ctx: WriterContext) {
    ctx.fun(`__gen_${t.name}_init`, () => {
        let args = init.args.map((a) => resolveFuncType(a.type, ctx) + ' ' + a.name);
        ctx.append(`cell __gen_${t.name}_init(${args.join(', ')}) {`);
        ctx.inIndent(() => {
            let selfInit = 'empty_tuple()';
            for (let i = 0; i < t.fields.length; i++) {
                selfInit = `tpush(${selfInit}, null())`;
            }
            ctx.append(`tuple self = ${selfInit};`);

            // Generate statements
            for (let s of init.ast.statements) {
                writeStatement(s, true, ctx);
            }

            ctx.used(`__gen_writecell_${t.name}`);
            ctx.append(`return __gen_writecell_${t.name}(self);`);
        });
        ctx.append(`}`);
    });
}

function writeStorageOps(type: TypeDescription, ctx: WriterContext) {

    // Load function
    ctx.fun(`__gen_load_${type.name}`, () => {
        ctx.append(`tuple __gen_load_${type.name}() inline {`); // NOTE: Inline function
        ctx.inIndent(() => {
            ctx.append(`slice sc = get_data().begin_parse();`);
            ctx.used(`__gen_read_${type.name}`);
            ctx.append(`tuple res = sc~__gen_read_${type.name}();`);
            ctx.append(`return res;`);
        });
        ctx.append(`}`);
    });

    // Store function
    ctx.fun(`__gen_store_${type.name}`, () => {
        ctx.append(`() __gen_store_${type.name}(tuple v) impure {`);
        ctx.inIndent(() => {
            ctx.append(`builder b = begin_cell();`);
            ctx.used(`__gen_write_${type.name}`);
            ctx.append(`b = __gen_write_${type.name}(b, v);`);
            ctx.append(`set_data(b.end_cell());`);
        });
        ctx.append(`}`);
    });
}

function writeGetter(f: FunctionDescription, ctx: WriterContext) {
    ctx.fun(`__gen_get_${f.name}`, () => {
        let args = f.args.map((a) => resolveFuncType(a.type, ctx) + ' ' + a.name);
        ctx.append(`_ __gen_get_${f.name}(${args.join(', ')}) method_id(${getMethodId(f.name)}) {`);
        ctx.inIndent(() => {

            // Load contract state
            ctx.used(`__gen_load_${f.self!.name}`);
            ctx.append(`tuple self = __gen_load_${f.self!.name}();`);

            // Execute get method
            ctx.used(`__gen_${f.self!.name}_${f.name}`);
            ctx.append(`var res = self~__gen_${f.self!.name}_${f.name}(${[...f.args.map((a) => a.name)].join(', ')});`);

            // Return restult
            ctx.append(`return res;`);
        });
        ctx.append(`}`);
    });
}

function writeMainEmpty(ctx: WriterContext) {
    ctx.fun('$main', () => {

        // Render empty body
        ctx.append(`() recv_internal(cell in_msg_cell, slice in_msg) impure {`);
        ctx.inIndent(() => {
            ctx.append(`throw(100);`);
        });
        ctx.append(`}`);

        // TODO: Implicit dependencies
    });
}

function writeMainContract(type: TypeDescription, ctx: WriterContext) {

    // Main field
    ctx.fun('$main', () => {

        // Render body
        ctx.append(`() recv_internal(cell in_msg_cell, slice in_msg) impure {`);
        ctx.inIndent(() => {

            // Begin parsing
            ctx.append(`int op = in_msg~load_int(32);`);

            ctx.used(`__gen_load_${type.name}`);
            ctx.append(`tuple self = __gen_load_${type.name}();`);

            // Routing
            for (let f of type.functions) {
                if (f.isPublic) {
                    let allocation = getAllocation(ctx.ctx, type.name + '$$' + f.name);
                    ctx.append(`if (op == ${allocation.prefix}) {`);
                    ctx.inIndent(() => {

                        // Read message
                        ctx.used(`__gen_read_${type.name}_${f.name}`);
                        ctx.append(`tuple msg = in_msg~__gen_read_${type.name}_${f.name}();`);

                        // Execute function
                        ctx.used(`__gen_${type.name}_${f.name}`);
                        ctx.append('self~__gen_' + type.name + '_' + f.name + '(' + [...f.args.map((v, i) => 'at(msg, ' + i + ')')].join(', ') + ');');
                    })
                    ctx.append(`}`);
                }
            }

            // Persist
            ctx.used(`__gen_store_${type.name}`);
            ctx.append(`__gen_store_${type.name}(self);`);
        });
        ctx.append('}');

        // Init method
        if (type.init) {
            ctx.append();
            ctx.append(`cell init_${type.name}(${type.init.args.map((a) => resolveFuncType(a.type, ctx) + ' ' + a.name).join(', ')}) method_id {`);
            ctx.inIndent(() => {
                ctx.used(`__gen_${type.name}_init`);
                ctx.append(`return __gen_${type.name}_init(${type.init!.args.map((a) => a.name).join(', ')});`);
            });
            ctx.append(`}`);
        }

        // TODO: Implicit dependencies
    });
}

export function writeProgram(ctx: CompilerContext, debug: boolean = false) {
    const wctx = new WriterContext(ctx);
    let contracts = Object.values(getAllTypes(ctx)).filter((v) => v.kind === 'contract');

    // Stdlib
    writeStdlib(wctx);

    // Serializators
    let allocations = getAllocations(ctx);
    for (let k of allocations) {
        writeSerializer(k.type.name, k.allocation, wctx);
        writeParser(k.type.name, k.allocation, wctx);
    }
    for (let c of contracts) {
        for (let f of c.functions) {
            if (f.isPublic) {
                writeSerializer(c.name + '_' + f.name, getAllocation(ctx, c.name + '$$' + f.name), wctx);
                writeParser(c.name + '_' + f.name, getAllocation(ctx, c.name + '$$' + f.name), wctx);
            }
        }
    }

    // Storage Functions
    for (let k of allocations) {
        if (k.type.kind === 'contract') {
            writeStorageOps(k.type, wctx);
        }
    }

    // Static functions
    let sf = getAllStaticFunctions(ctx);
    for (let k in sf) {
        let f = sf[k];
        writeFunction(f, wctx);
    }

    // Contract functions
    for (let c of contracts) {
        for (let f of c.functions) {
            writeFunction(f, wctx);
        }
    }

    // Contract getters
    for (let c of contracts) {
        for (let f of c.functions) {
            if (f.isGetter) {
                writeGetter(f, wctx);
            }
        }
    }

    // Contract inits
    for (let c of contracts) {
        if (c.init) {
            writeInit(c, c.init, wctx);
        }
    }

    // Contract
    if (contracts.length > 1) {
        throw Error('Too many contracts');
    }

    // Empty contract
    if (contracts.length === 0) {
        writeMainEmpty(wctx);
    }

    // Entry Point
    if (contracts.length === 1) {
        writeMainContract(contracts[0], wctx);
    }

    // Render output
    return wctx.render(debug);
}