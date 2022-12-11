import { ContractABI } from "../abi/ContractABI";
import { ASTCondition, ASTStatement } from "../grammar/ast";
import { CompilerContext } from "../context";
import { getAllocation, getAllocations } from "../storage/resolveAllocation";
import { getAllStaticFunctions, getAllTypes, getType, resolveTypeRef } from "../types/resolveDescriptors";
import { FunctionDescription, InitDescription, ReceiverDescription, TypeDescription } from "../types/types";
import { getMethodId } from "../utils";
import { WriterContext } from "./Writer";
import { resolveFuncType } from "./writers/resolveFuncType";
import { writeExpression } from "./writers/writeExpression";
import { writeParser, writeSerializer } from "./writers/writeSerialization";
import { writeStdlib } from "./writers/writeStdlib";
import { resolveFuncTensor, TensorDef, tensorToString } from "./writers/resolveFuncTensor";
import { writeAccessors } from "./writers/writeAccessors";
import { beginCell } from "ton";

function writeStatement(f: ASTStatement, self: string | null, ctx: WriterContext) {
    if (f.kind === 'statement_return') {
        let exp = writeExpression(f.expression, ctx);
        if (self) {
            ctx.append(`return (${self}, ${exp});`);
        } else {
            ctx.append(`return ${exp};`);
        }
        return;
    } else if (f.kind === 'statement_let') {
        let t = resolveTypeRef(ctx.ctx, f.type);
        if (t.kind === 'ref') {
            let tt = getType(ctx.ctx, t.name);
            if (tt.kind === 'contract' || tt.kind === 'struct') {
                let tensor = resolveFuncTensor(tt.fields, ctx, `${f.name}'`);
                ctx.append(`var (${tensorToString(tensor, 'full').join(', ')}) = ${writeExpression(f.expression, ctx)};`);
                return;
            }
        }

        ctx.append(`${resolveFuncType(resolveTypeRef(ctx.ctx, f.type), ctx)} ${f.name} = ${writeExpression(f.expression, ctx)};`);
        return;
    } else if (f.kind === 'statement_assign') {
        ctx.append(`${f.path.map((v) => v.name).join(`'`)} = ${writeExpression(f.expression, ctx)};`);
        return;
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

function writeCondition(f: ASTCondition, self: string | null, elseif: boolean, ctx: WriterContext) {
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

    // Resolve self
    let self = f.self ? getType(ctx.ctx, f.self) : null;
    let selfTensor: TensorDef | null = null;
    if (self) {
        selfTensor = resolveFuncTensor([{ name: 'self', type: { kind: 'ref' as const, name: self.name, optional: false } }], ctx);
    }

    // Write function header
    let argsTensor = resolveFuncTensor(f.args, ctx);
    let returns: string = resolveFuncType(f.returns, ctx);
    if (selfTensor && f.isMutating) {
        if (f.returns) {
            returns = `((${tensorToString(selfTensor, 'types').join(', ')}), ${returns})`;
        } else {
            returns = `((${tensorToString(selfTensor, 'types').join(', ')}), ())`;
        }
    }

    // Resolve function name
    let name = (self ? '__gen_' + self.name + '_' : '') + f.name;
    let selfStr = selfTensor ? `(${tensorToString(selfTensor, 'names').join(', ')})` : null;
    let modifier = f.ast.statements.length > 0 ? 'impure inline' : 'impure';

    // Write function body
    ctx.fun(name, () => {
        ctx.append(`${returns} ${name}(${[...(selfTensor ? ['(' + tensorToString(selfTensor, 'types').join(', ') + ') self'] : []), ...tensorToString(argsTensor, 'full')].join(', ')}) ${modifier} {`);
        ctx.inIndent(() => {

            // Unpack self
            if (selfTensor) {
                ctx.append(`var (${tensorToString(selfTensor, 'full').join(', ')}) = self;`);
            }

            for (let s of fd.statements) {
                writeStatement(s, f.isMutating ? selfStr : null, ctx);
            }
            if (f.self && (f.returns.kind === 'void') && f.isMutating) {
                if (fd.statements.length === 0 || fd.statements[fd.statements.length - 1].kind !== 'statement_return') {
                    ctx.append(`return (${selfStr}, ());`);
                }
            }
        });
        ctx.append(`}`);
    });
}

function writeReceiver(self: TypeDescription, f: ReceiverDescription, ctx: WriterContext) {
    const selector = f.selector;

    // Binary receiver
    if (selector.kind === 'internal-binary') {
        ctx.fun(`__gen_${self.name}_receive_${selector.type}`, () => {
            let selfTensor = resolveFuncTensor(self.fields, ctx, `self'`);
            let argsTensor = resolveFuncTensor([
                { name: selector.name, type: { kind: 'ref', name: selector.type, optional: false } }
            ], ctx);
            let selfRes = `(${tensorToString(selfTensor, 'names').join(', ')})`;
            let modifier = f.ast.statements.length > 0 ? 'impure inline' : 'impure';
            ctx.append(`((${tensorToString(selfTensor, 'types').join(', ')}), ()) __gen_${self.name}_receive_${selector.type}((${[(tensorToString(selfTensor, 'types').join(', ') + ') self'), ...tensorToString(argsTensor, 'full')].join(', ')}) ${modifier} {`);
            ctx.inIndent(() => {
                ctx.append(`var (${tensorToString(selfTensor, 'names').join(', ')}) = self;`);

                for (let s of f.ast.statements) {
                    writeStatement(s, selfRes, ctx);
                }

                if (f.ast.statements.length === 0 || f.ast.statements[f.ast.statements.length - 1].kind !== 'statement_return') {
                    ctx.append(`return (${selfRes}, ());`);
                }
            });
            ctx.append(`}`);
        });
        return;
    }

    // Empty receiver
    if (selector.kind === 'internal-empty') {
        ctx.fun(`__gen_${self.name}_receive`, () => {
            let selfTensor = resolveFuncTensor(self.fields, ctx, `self'`);
            let selfRes = `(${tensorToString(selfTensor, 'names').join(', ')})`;
            let modifier = f.ast.statements.length > 0 ? 'impure inline' : 'impure';
            ctx.append(`((${tensorToString(selfTensor, 'types').join(', ')}), ()) __gen_${self.name}_receive((${(tensorToString(selfTensor, 'types').join(', ') + ') self')}) ${modifier} {`);
            ctx.inIndent(() => {
                ctx.append(`var (${tensorToString(selfTensor, 'names').join(', ')}) = self;`);

                for (let s of f.ast.statements) {
                    writeStatement(s, selfRes, ctx);
                }

                if (f.ast.statements.length === 0 || f.ast.statements[f.ast.statements.length - 1].kind !== 'statement_return') {
                    ctx.append(`return (${selfRes}, ());`);
                }
            });
            ctx.append(`}`);
        });
    }

    // Comment receiver
    if (selector.kind === 'internal-comment') {
        ctx.fun(`__gen_${self.name}_receive_comment_${selector.comment}`, () => {
            let selfTensor = resolveFuncTensor(self.fields, ctx, `self'`);
            let selfRes = `(${tensorToString(selfTensor, 'names').join(', ')})`;
            let modifier = f.ast.statements.length > 0 ? 'impure inline' : 'impure';
            ctx.append(`((${tensorToString(selfTensor, 'types').join(', ')}), ()) __gen_${self.name}_receive_comment_${selector.comment}((${(tensorToString(selfTensor, 'types').join(', ') + ') self')}) ${modifier} {`);
            ctx.inIndent(() => {
                ctx.append(`var (${tensorToString(selfTensor, 'names').join(', ')}) = self;`);

                for (let s of f.ast.statements) {
                    writeStatement(s, selfRes, ctx);
                }

                if (f.ast.statements.length === 0 || f.ast.statements[f.ast.statements.length - 1].kind !== 'statement_return') {
                    ctx.append(`return (${selfRes}, ());`);
                }
            });
            ctx.append(`}`);
        });
    }

    // Fallback
    if (selector.kind === 'internal-fallback') {
        ctx.fun(`__gen_${self.name}_receive_fallback`, () => {
            let selfTensor = resolveFuncTensor(self.fields, ctx, `self'`);
            let selfRes = `(${tensorToString(selfTensor, 'names').join(', ')})`;
            let modifier = f.ast.statements.length > 0 ? 'impure inline' : 'impure';
            ctx.append(`((${tensorToString(selfTensor, 'types').join(', ')}), ()) __gen_${self.name}_receive_fallback((${(tensorToString(selfTensor, 'types').join(', '))}) self, slice ${selector.name}) ${modifier} {`);
            ctx.inIndent(() => {
                ctx.append(`var (${tensorToString(selfTensor, 'names').join(', ')}) = self;`);

                for (let s of f.ast.statements) {
                    writeStatement(s, selfRes, ctx);
                }

                if (f.ast.statements.length === 0 || f.ast.statements[f.ast.statements.length - 1].kind !== 'statement_return') {
                    ctx.append(`return (${selfRes}, ());`);
                }
            });
            ctx.append(`}`);
        });
    }
}

function writeInit(t: TypeDescription, init: InitDescription, ctx: WriterContext) {
    ctx.fun(`__gen_${t.name}_init`, () => {
        let argsTensor = resolveFuncTensor(init.args, ctx);
        let selfTensor = resolveFuncTensor(t.fields, ctx, `self'`);
        let selfRes = `(${tensorToString(selfTensor, 'names').join(', ')})`;
        ctx.append(`cell __gen_${t.name}_init(${tensorToString(argsTensor, 'full').join(', ')}) inline {`);
        ctx.inIndent(() => {

            // Generate self initial tensor
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
            if (initValues.length > 0) { // Special case for empty contracts
                ctx.append(`var (${tensorToString(selfTensor, 'full').join(', ')}) = (${initValues.join(', ')});`);
            }

            // Generate statements
            for (let s of init.ast.statements) {
                writeStatement(s, selfRes, ctx);
            }

            // Assemble result cell
            ctx.used(`__gen_writecell_${t.name}`);
            ctx.append(`return __gen_writecell_${t.name}(${tensorToString(selfTensor, 'names').join(', ')});`);
        });
        ctx.append(`}`);
    });
}

function writeStorageOps(type: TypeDescription, ctx: WriterContext) {

    // Load function
    let tensor = resolveFuncTensor(type.fields, ctx, `v'`);
    ctx.fun(`__gen_load_${type.name}`, () => {
        ctx.append(`(${tensorToString(tensor, 'types').join(', ')}) __gen_load_${type.name}() inline {`); // NOTE: Inline function
        ctx.inIndent(() => {
            ctx.append(`slice sc = get_data().begin_parse();`);
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
            ctx.used(`__gen_write_${type.name}`);
            ctx.append(`b = __gen_write_${type.name}(${['b', tensorToString(tensor, 'names')].join(', ')});`);
            ctx.append(`set_data(b.end_cell());`);
        });
        ctx.append(`}`);
    });
}

function writeGetter(f: FunctionDescription, ctx: WriterContext) {
    ctx.fun(`__gen_get_${f.name}`, () => {

        // Render tensors
        const self = f.self ? getType(ctx.ctx, f.self) : null;
        if (!self) {
            throw new Error(`No self type for getter ${f.name}`); // Impossible
        }
        const argsTensor = resolveFuncTensor(f.args, ctx);
        const argsFullTensor = resolveFuncTensor([{ name: 'self', type: { kind: 'ref', name: self.name, optional: false } }, ...f.args], ctx);

        ctx.append(`_ __gen_get_${f.name}(${tensorToString(argsTensor, 'full').join(', ')}) method_id(${getMethodId(f.name)}) {`);
        ctx.inIndent(() => {
            let selfTensor = resolveFuncTensor(self.fields, ctx, `self'`);

            // Load contract state
            ctx.used(`__gen_load_${self.name}`);
            ctx.append(`var (${tensorToString(selfTensor, 'full').join(', ')}) = __gen_load_${self.name}();`);

            // Execute get method
            ctx.used(`__gen_${self.name}_${f.name}`);
            ctx.append(`var res = __gen_${self.name}_${f.name}(${tensorToString(argsFullTensor, 'names').join(', ')});`);

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
        ctx.append(``)
        ctx.append(`() recv_internal(int msg_value, cell in_msg_cell, slice in_msg) impure {`);
        ctx.inIndent(() => {

            // Require context function
            ctx.used('__tact_context');

            // Load operation
            ctx.append();
            ctx.append(`;; Parse incoming message`);
            ctx.append(`int op = 0;`);
            ctx.append(`if (slice_bits(in_msg) >= 32) {`);
            ctx.inIndent(() => {
                ctx.append(`op = in_msg.preload_uint(32);`);
            });
            ctx.append(`}`);
            ctx.append(`var cs = in_msg_cell.begin_parse();`);
            ctx.append(`var msg_flags = cs~load_uint(4);`); // int_msg_info$0 ihr_disabled:Bool bounce:Bool bounced:Bool
            ctx.append(`var msg_bounced = ((msg_flags & 1) == 1 ? true : false);`);
            ctx.append(`slice msg_sender_addr = cs~load_msg_addr();`);
            ctx.append(`__tact_context = (msg_bounced, msg_sender_addr, msg_value);`);
            ctx.append();

            // Non-empty receivers
            ctx.append(`;; Receivers`);
            for (const f of type.receivers) {
                const selector = f.selector;

                // Generic receiver
                if (selector.kind === 'internal-binary') {
                    let allocation = getAllocation(ctx.ctx, selector.type);
                    if (!allocation.prefix) {
                        throw Error('Invalid allocation');
                    }
                    ctx.append(`if (op == ${allocation.prefix}) {`);
                    ctx.inIndent(() => {

                        // Resolve tensors
                        let selfTensor = resolveFuncTensor(type.fields, ctx, `self'`);
                        let msgTensor = resolveFuncTensor(allocation.fields, ctx, `msg'`);

                        // Load storage
                        ctx.used(`__gen_load_${type.name}`);
                        ctx.append(`var (${tensorToString(selfTensor, 'full').join(', ')}) = __gen_load_${type.name}();`);

                        // Read message
                        ctx.used(`__gen_read_${selector.type}`);
                        ctx.append(`var (${tensorToString(msgTensor, 'full').join(', ')}) = in_msg~__gen_read_${selector.type}();`);

                        // Execute function
                        ctx.used(`__gen_${type.name}_receive_${selector.type}`);
                        ctx.append(`(${tensorToString(selfTensor, 'names').join(', ')})~__gen_${type.name}_receive_${selector.type}(${tensorToString(msgTensor, 'names').join(', ')});`);

                        // Persist
                        ctx.used(`__gen_store_${type.name}`);
                        ctx.append(`__gen_store_${type.name}(${tensorToString(selfTensor, 'names').join(', ')});`);

                        // Exit
                        ctx.append(`return ();`);
                    })
                    ctx.append(`}`);
                }

                if (selector.kind === 'internal-empty') {
                    ctx.append(`if ((op == 0) & (slice_bits(in_msg) <= 32)) {`);
                    ctx.inIndent(() => {

                        // Resolve tensors
                        let selfTensor = resolveFuncTensor(type.fields, ctx, `self'`);

                        // Load storage
                        ctx.used(`__gen_load_${type.name}`);
                        ctx.append(`var (${tensorToString(selfTensor, 'full').join(', ')}) = __gen_load_${type.name}();`);

                        // Execute function
                        ctx.used(`__gen_${type.name}_receive`);
                        ctx.append(`(${tensorToString(selfTensor, 'names').join(', ')})~__gen_${type.name}_receive();`);

                        // Persist
                        ctx.used(`__gen_store_${type.name}`);
                        ctx.append(`__gen_store_${type.name}(${tensorToString(selfTensor, 'names').join(', ')});`);

                        // Exit
                        ctx.append(`return ();`);
                    })
                    ctx.append(`}`);
                }
            }

            // Text resolvers
            let hasComments = !!type.receivers.find((v) => v.selector.kind === 'internal-comment');
            if (hasComments) {
                ctx.append();
                ctx.append(`;; Text resolvers`);
                ctx.append(`if (op == 0) {`);
                ctx.inIndent(() => {
                    ctx.append(`var text_op = slice_hash(in_msg);`);
                    for (const r of type.receivers) {
                        const selector = r.selector;
                        if (selector.kind === 'internal-comment') {
                            let hash = '0x' + beginCell()
                                .storeUint(0, 32)
                                .storeBuffer(Buffer.from(selector.comment, 'utf8'))
                                .endCell()
                                .hash()
                                .toString('hex', 0, 64);
                            ctx.append(`if (text_op == ${hash}) {`);
                            ctx.inIndent(() => {

                                // Resolve tensors
                                let selfTensor = resolveFuncTensor(type.fields, ctx, `self'`);

                                // Load storage
                                ctx.used(`__gen_load_${type.name}`);
                                ctx.append(`var (${tensorToString(selfTensor, 'full').join(', ')}) = __gen_load_${type.name}();`);

                                // Execute function
                                ctx.used(`__gen_${type.name}_receive_comment_${selector.comment}`);
                                ctx.append(`(${tensorToString(selfTensor, 'names').join(', ')})~__gen_${type.name}_receive_comment_${selector.comment}();`);

                                // Persist
                                ctx.used(`__gen_store_${type.name}`);
                                ctx.append(`__gen_store_${type.name}(${tensorToString(selfTensor, 'names').join(', ')});`);

                                // Exit
                                ctx.append(`return ();`);
                            })
                            ctx.append(`}`);
                        }
                    }
                });
                ctx.append(`}`);
            }

            // Fallback
            let fallbackReceiver = type.receivers.find((v) => v.selector.kind === 'internal-fallback');
            if (fallbackReceiver) {

                ctx.append();
                ctx.append(`;; Fallback receiver`);
                // Resolve tensors
                let selfTensor = resolveFuncTensor(type.fields, ctx, `self'`);

                // Load storage
                ctx.used(`__gen_load_${type.name}`);
                ctx.append(`var (${tensorToString(selfTensor, 'full').join(', ')}) = __gen_load_${type.name}();`);

                // Execute function
                ctx.used(`__gen_${type.name}_receive_fallback`);
                ctx.append(`(${tensorToString(selfTensor, 'names').join(', ')})~__gen_${type.name}_receive_fallback(in_msg);`);

                // Persist
                ctx.used(`__gen_store_${type.name}`);
                ctx.append(`__gen_store_${type.name}(${tensorToString(selfTensor, 'names').join(', ')});`);

            } else {
                ctx.append();
                ctx.append(`throw(100);`);
            }
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

    // Accessors
    for (let t of allTypes) {
        if (t.kind === 'contract' || t.kind === 'struct') {
            writeAccessors(t, wctx);
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