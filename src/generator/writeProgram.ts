import assert from "assert";
import { ContractABI } from "../abi/ContractABI";
import { ASTCondition, ASTStatement } from "../grammar/ast";
import { CompilerContext } from "../context";
import { getAllocation, getAllocations } from "../storage/resolveAllocation";
import { getExpType } from "../types/resolveExpression";
import { getAllStaticFunctions, getAllTypes, getType, resolveTypeRef } from "../types/resolveDescriptors";
import { FunctionDescription, InitDescription, ReceiverDescription, TypeDescription } from "../types/types";
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
        ctx.append(`${resolveFuncType(resolveTypeRef(ctx.ctx, f.type), ctx)} ${f.name} = ${writeExpression(f.expression, ctx)};`);
        return;
    } else if (f.kind === 'statement_assign') {

        // Local variable case
        if (f.path.length === 1) {
            ctx.append(`${f.path[0].name} = ${writeExpression(f.expression, ctx)};`);
            return;
        }

        // Depth = 2
        if (f.path.length === 2) {
            let valueExpr = writeExpression(f.expression, ctx);
            let lvalueTypes = f.path.map((v) => getExpType(ctx.ctx, v)!);
            let srcExpr = f.path[1];
            assert(lvalueTypes[0].kind === 'ref');
            assert(!lvalueTypes[0].optional);
            let tt = getType(ctx.ctx, lvalueTypes[0].name);
            let targetIndex = tt.fields.findIndex((v) => v.name === srcExpr.name);
            ctx.used('__tact_set');
            ctx.append(`${f.path[0].name} = __tact_set(${f.path[0].name}, ${valueExpr}, ${targetIndex});`);
            return;
        }

        throw Error('Too deep assignment');
    } else if (f.kind === 'statement_condition') {
        writeCondition(f, self, false, ctx);
        return;
    } else if (f.kind === 'statement_expression') {
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

    let self = f.self ? getType(ctx.ctx, f.self) : null;

    // Write function header
    let args = f.args.map((a) => resolveFuncType(a.type, ctx) + ' ' + a.name);
    if (self) {
        args.unshift(`${resolveFuncType(self, ctx)} self`);
    }
    let returns: string = resolveFuncType(f.returns, ctx);
    if (self && f.isMutating) {
        if (f.returns) {
            returns = `(${resolveFuncType(self, ctx)}, ${returns})`;
        } else {
            returns = `(${resolveFuncType(self, ctx)}, ())`;
        }
    }

    // Resolve function name
    let name = (self ? '__gen_' + self.name + '_' : '') + f.name;

    // Write function body
    ctx.fun(name, () => {
        ctx.append(`${returns} ${name}(${args.join(', ')}) impure {`);
        ctx.inIndent(() => {
            for (let s of fd.statements) {
                writeStatement(s, f.isMutating && !!f.self, ctx);
            }
            if (f.self && (f.returns.kind === 'void') && f.isMutating) {
                if (fd.statements.length === 0 || fd.statements[fd.statements.length - 1].kind !== 'statement_return') {
                    ctx.append(`return (self, ());`);
                }
            }
        });
        ctx.append(`}`);
    });
}

function writeReceiver(self: TypeDescription, f: ReceiverDescription, ctx: WriterContext) {
    ctx.fun(`__gen_${self.name}_receive_${f.type}`, () => {
        let args = [`tuple self`, `tuple ${f.name}`].join(', ');
        ctx.append(`(tuple, ()) __gen_${self.name}_receive_${f.type}(${args}) impure {`);
        ctx.inIndent(() => {

            for (let s of f.ast.statements) {
                writeStatement(s, true, ctx);
            }

            if (f.ast.statements.length === 0 || f.ast.statements[f.ast.statements.length - 1].kind !== 'statement_return') {
                ctx.append(`return (self, ());`);
            }
        });
        ctx.append(`}`);
    });
}

function writeInit(t: TypeDescription, init: InitDescription, ctx: WriterContext) {
    ctx.fun(`__gen_${t.name}_init`, () => {
        let args = init.args.map((a) => resolveFuncType(a.type, ctx) + ' ' + a.name);
        ctx.append(`cell __gen_${t.name}_init(${args.join(', ')}) impure {`);
        ctx.inIndent(() => {
            let initValues: string[] = [];
            for (let i = 0; i < t.fields.length; i++) {
                let init = 'null()';
                if (typeof t.fields[i].default === 'bigint') {
                    init = t.fields[i].default!.toString();
                } else if (typeof t.fields[i].default === 'boolean') {
                    init = t.fields[i].default!.toString();
                }
                initValues.push(init);
            }
            ctx.used('__tact_to_tuple');
            ctx.append(`tuple self = __tact_to_tuple([${initValues.join(', ')}]);`);

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

            let self = f.self ? getType(ctx.ctx, f.self) : null;
            if (!self) {
                throw new Error(`No self type for getter ${f.name}`); // Impossible
            }

            // Load contract state
            ctx.used(`__gen_load_${self.name}`);
            ctx.append(`tuple self = __gen_load_${self.name}();`);

            // Execute get method
            ctx.used(`__gen_${self.name}_${f.name}`);
            ctx.append(`var res = self~__gen_${self.name}_${f.name}(${[...f.args.map((a) => a.name)].join(', ')});`);

            // Return restult
            ctx.append(`return res;`);
        });
        ctx.append(`}`);
    });
}

function writeMainEmpty(ctx: WriterContext) {
    ctx.fun('$main', () => {
        ctx.append(`() recv_internal(cell in_msg_cell, slice in_msg) impure {`);
        ctx.inIndent(() => {
            ctx.append(`throw(100);`);
        });
        ctx.append(`}`);
    });
}

function writeMainContract(type: TypeDescription, ctx: WriterContext) {

    // Main field
    ctx.fun('$main', () => {

        // Render body
        ctx.append(`() recv_internal(cell in_msg_cell, slice in_msg) impure {`);
        ctx.inIndent(() => {

            // Begin parsing
            ctx.append(`int op = in_msg~load_uint(32);`);

            ctx.used(`__gen_load_${type.name}`);
            ctx.append(`tuple self = __gen_load_${type.name}();`);

            // Routing
            for (let f of Object.values(type.receivers)) {

                let allocation = getAllocation(ctx.ctx, f.type);
                if (!allocation.prefix) {
                    throw Error('Invalid allocation');
                }
                ctx.append(`if (op == ${allocation.prefix}) {`);
                ctx.inIndent(() => {

                    // Read message
                    ctx.used(`__gen_read_${f.type}`);
                    ctx.append(`tuple msg = in_msg~__gen_read_${f.type}();`);

                    // Execute function
                    ctx.used(`__gen_${type.name}_receive_${f.type}`);
                    ctx.append('self~__gen_' + type.name + '_receive_' + f.type + '(msg);');

                    // Persist
                    ctx.used(`__gen_store_${type.name}`);
                    ctx.append(`__gen_store_${type.name}(self);`);

                    // Exit
                    ctx.append(`return ();`);
                })
                ctx.append(`}`);
            }

            ctx.append();
            ctx.append(`throw(100);`);
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

        // Implicit dependencies
        for (let f of Object.values(type.functions)) {
            if (f.isGetter) {
                ctx.used(`__gen_get_${f.name}`);
            }
        }
    });
}

export function writeProgram(ctx: CompilerContext, abi: ContractABI, debug: boolean = false) {
    const wctx = new WriterContext(ctx);
    let allTypes = Object.values(getAllTypes(ctx));
    let contracts = allTypes.filter((v) => v.kind === 'contract');

    // Stdlib
    writeStdlib(wctx);

    // Serializators
    let allocations = getAllocations(ctx);
    for (let k of allocations) {
        writeSerializer(k.type.name, k.allocation, wctx);
        writeParser(k.type.name, k.allocation, wctx);
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

    // Extensions
    for (let c of allTypes) {
        if (c.kind !== 'contract') { // We are rendering contract functions separately
            for (let f of Object.values(c.functions)) {
                writeFunction(f, wctx);
            }
        }
    }

    // Contract functions
    for (let c of contracts) {

        // Init
        if (c.init) {
            writeInit(c, c.init, wctx);
        }

        // Functions
        for (let f of Object.values(c.functions)) {
            writeFunction(f, wctx);

            if (f.isGetter) {
                writeGetter(f, wctx);
            }
        }

        // Receivers
        for (let r of Object.values(c.receivers)) {
            writeReceiver(c, r, wctx);
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