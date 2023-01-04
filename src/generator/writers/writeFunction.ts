import { beginCell } from "ton-core";
import { enabledInline } from "../../config";
import { ASTCondition, ASTStatement } from "../../grammar/ast";
import { getType, resolveTypeRef } from "../../types/resolveDescriptors";
import { getExpType } from "../../types/resolveExpression";
import { FunctionDescription, InitDescription, ReceiverDescription, TypeDescription } from "../../types/types";
import { getMethodId } from "../../utils";
import { WriterContext } from "../Writer";
import { resolveFuncPrimitive } from "./resolveFuncPrimitive";
import { resolveFuncType } from "./resolveFuncType";
import { resolveFuncTypeUnpack } from "./resolveFuncTypeUnpack";
import { fn, id } from "./id";
import { writeExpression, writeValue } from "./writeExpression";

function writeStatement(f: ASTStatement, self: string | null, ctx: WriterContext) {
    if (f.kind === 'statement_return') {
        if (f.expression) {
            let exp = writeExpression(f.expression, ctx);
            if (self) {
                ctx.append(`return (${self}, ${exp});`);
            } else {
                ctx.append(`return ${exp};`);
            }
        } else {
            if (self) {
                ctx.append(`return (${self}, ());`);
            } else {
                ctx.append(`return;`);
            }
        }
        return;
    } else if (f.kind === 'statement_let') {

        // Contract/struct case
        let t = resolveTypeRef(ctx.ctx, f.type);
        if (t.kind === 'ref') {
            let tt = getType(ctx.ctx, t.name);
            if (tt.kind === 'contract' || tt.kind === 'struct') {
                ctx.append(`var ${resolveFuncTypeUnpack(t, id(f.name), ctx)} = ${writeExpression(f.expression, ctx)};`);
                return;
            }
        }

        ctx.append(`${resolveFuncType(resolveTypeRef(ctx.ctx, f.type), ctx)} ${id(f.name)} = ${writeExpression(f.expression, ctx)};`);
        return;
    } else if (f.kind === 'statement_assign') {

        // Prepare lvalue
        let path = f.path.map((v, i) => (i === 0) ? id(v.name) : v.name).join(`'`);

        // Contract/struct case
        let t = getExpType(ctx.ctx, f.path[f.path.length - 1]);
        if (t.kind === 'ref') {
            let tt = getType(ctx.ctx, t.name);
            if (tt.kind === 'contract' || tt.kind === 'struct') {
                ctx.append(`${resolveFuncTypeUnpack(t, `${path}`, ctx)} = ${writeExpression(f.expression, ctx)};`);
                return;
            }
        }

        ctx.append(`${path} = ${writeExpression(f.expression, ctx)};`);
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

export function writeFunction(f: FunctionDescription, ctx: WriterContext) {

    // Do not write native functions
    if (f.ast.kind === 'def_native_function') {
        return;
    }
    const fd = f.ast;

    // Resolve self
    let self = f.self ? getType(ctx.ctx, f.self) : null;

    // Write function header
    let returns: string = resolveFuncType(f.returns, ctx);
    let returnsStr: string | null;
    if (self && f.isMutating) {
        if (f.returns.kind !== 'void') {
            returns = `(${resolveFuncType(self, ctx)}, ${returns})`;
        } else {
            returns = `(${resolveFuncType(self, ctx)}, ())`;
        }
        returnsStr = resolveFuncTypeUnpack(self, id('self'), ctx);
    }

    // Resolve function descriptor
    let name = (self ? '__gen_' + self.name + '_' : '') + f.name;
    let modifier = enabledInline(ctx.ctx) ? 'impure inline' : 'impure';
    let args: string[] = [];
    if (self) {
        args.push(resolveFuncType(self, ctx) + ' ' + id('self'));
    }
    for (let a of f.args) {
        args.push(resolveFuncType(a.type, ctx) + ' ' + id(a.name));
    }

    // Write function body
    ctx.fun(name, () => {
        ctx.append(`${returns} ${fn(name)}(${args.join(', ')}) ${modifier} {`);
        ctx.inIndent(() => {

            // Unpack self
            if (self) {
                ctx.append(`var (${resolveFuncTypeUnpack(self, id('self'), ctx)}) = ${id('self')};`);
            }
            for (let a of fd.args) {
                if (!resolveFuncPrimitive(resolveTypeRef(ctx.ctx, a.type), ctx)) {
                    ctx.append(`var (${resolveFuncTypeUnpack(resolveTypeRef(ctx.ctx, a.type), id(a.name), ctx)}) = ${id(a.name)};`);
                }
            }

            // Process statements
            for (let s of fd.statements) {
                writeStatement(s, returnsStr, ctx);
            }

            // Auto append return
            if (f.self && (f.returns.kind === 'void') && f.isMutating) {
                if (fd.statements.length === 0 || fd.statements[fd.statements.length - 1].kind !== 'statement_return') {
                    ctx.append(`return (${returnsStr}, ());`);
                }
            }
        });
        ctx.append(`}`);
    });
}

export function writeReceiver(self: TypeDescription, f: ReceiverDescription, ctx: WriterContext) {
    const selector = f.selector;

    // Binary receiver
    if (selector.kind === 'internal-binary') {
        ctx.fun(`__gen_${self.name}_receive_${selector.type}`, () => {
            let selfRes = resolveFuncTypeUnpack(self, id('self'), ctx);
            let modifier = enabledInline(ctx.ctx) ? 'impure inline' : 'impure';
            ctx.append(`((${resolveFuncType(self, ctx)}), ()) ${fn(`__gen_${self.name}_receive_${selector.type}`)}(${[resolveFuncType(self, ctx) + ' ' + id('self'), resolveFuncType(selector.type, ctx) + ' ' + id(selector.name)].join(', ')}) ${modifier} {`);
            ctx.inIndent(() => {
                ctx.append(`var ${resolveFuncTypeUnpack(self, id('self'), ctx)} = ${id('self')};`);
                ctx.append(`var ${resolveFuncTypeUnpack(selector.type, id(selector.name), ctx)} = ${id(selector.name)};`);

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
            let selfRes = resolveFuncTypeUnpack(self, id('self'), ctx);
            let modifier = enabledInline(ctx.ctx) ? 'impure inline' : 'impure';
            ctx.append(`((${resolveFuncType(self, ctx)}), ()) ${fn(`__gen_${self.name}_receive`)}(${(resolveFuncType(self, ctx) + ' ' + id('self'))}) ${modifier} {`);
            ctx.inIndent(() => {
                ctx.append(`var ${resolveFuncTypeUnpack(self, id('self'), ctx)} = ${id('self')};`);

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
        let hash = beginCell()
            .storeUint(0, 32)
            .storeBuffer(Buffer.from(selector.comment, 'utf8'))
            .endCell()
            .hash()
            .toString('hex', 0, 64);
        ctx.fun(`__gen_${self.name}_receive_comment_${hash}`, () => {
            let selfRes = resolveFuncTypeUnpack(self, id('self'), ctx);
            let modifier = enabledInline(ctx.ctx) ? 'impure inline' : 'impure';
            ctx.append(`(${resolveFuncType(self, ctx)}, ()) ${fn(`__gen_${self.name}_receive_comment_${hash}`)}(${(resolveFuncType(self, ctx) + ' ' + id('self'))}) ${modifier} {`);
            ctx.inIndent(() => {
                ctx.append(`var ${resolveFuncTypeUnpack(self, id('self'), ctx)} = ${id('self')};`);

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
    if (selector.kind === 'internal-comment-fallback') {
        ctx.fun(`__gen_${self.name}_receive_comment`, () => {
            let selfRes = resolveFuncTypeUnpack(self, id('self'), ctx);
            let modifier = enabledInline(ctx.ctx) ? 'impure inline' : 'impure';
            ctx.append(`(${resolveFuncType(self, ctx)}, ()) ${fn(`__gen_${self.name}_receive_comment`)}(${([resolveFuncType(self, ctx) + ' ' + id('self'), 'slice ' + id(selector.name)]).join(', ')}) ${modifier} {`);
            ctx.inIndent(() => {
                ctx.append(`var ${resolveFuncTypeUnpack(self, id('self'), ctx)} = ${id('self')};`);

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
            let selfRes = resolveFuncTypeUnpack(self, id('self'), ctx);
            let modifier = enabledInline(ctx.ctx) ? 'impure inline' : 'impure';
            ctx.append(`(${resolveFuncType(self, ctx)}, ()) ${fn(`__gen_${self.name}_receive_fallback`)}(${resolveFuncType(self, ctx)} ${id('self')}, slice ${id(selector.name)}) ${modifier} {`);
            ctx.inIndent(() => {
                ctx.append(`var ${resolveFuncTypeUnpack(self, id('self'), ctx)} = ${id('self')};`);

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

    // Bounced
    if (selector.kind === 'internal-bounce') {
        ctx.fun(`__gen_${self.name}_receive_bounced`, () => {
            let selfRes = resolveFuncTypeUnpack(self, id('self'), ctx);
            let modifier = enabledInline(ctx.ctx) ? 'impure inline' : 'impure';
            ctx.append(`(${resolveFuncType(self, ctx)}, ()) ${fn(`__gen_${self.name}_receive_bounced`)}(${resolveFuncType(self, ctx)} ${id('self')}, slice ${id(selector.name)}) ${modifier} {`);
            ctx.inIndent(() => {
                ctx.append(`var ${resolveFuncTypeUnpack(self, id('self'), ctx)} = ${id('self')};`);

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

export function writeGetter(f: FunctionDescription, ctx: WriterContext) {
    ctx.fun(`__gen_get_${f.name}`, () => {

        // Render tensors
        const self = f.self ? getType(ctx.ctx, f.self) : null;
        if (!self) {
            throw new Error(`No self type for getter ${f.name}`); // Impossible
        }

        ctx.append(`_ ${fn(`__gen_get_${f.name}`)}(${[f.args.map((v) => resolveFuncType(v.type, ctx) + ' ' + id(v.name))].join(', ')}) method_id(${getMethodId(f.name)}) {`);
        ctx.inIndent(() => {

            // Load contract state
            ctx.used(`__gen_load_${self.name}`);
            ctx.append(`var self = __gen_load_${self.name}();`);

            // Execute get method
            ctx.used(`__gen_${self.name}_${f.name}`);
            ctx.append(`var res = ${fn(`__gen_${self.name}_${f.name}`)}(${['self', ...f.args.map((v) => id(v.name))].join(', ')});`);

            // Pack if needed
            if (f.returns.kind === 'ref') {
                let t = getType(ctx.ctx, f.returns.name);
                if (t.kind === 'struct') {
                    if (f.returns.optional) {
                        ctx.used(`__gen_${t.name}_opt_to_external`);
                        ctx.append(`return __gen_${t.name}_opt_to_external(res);`);
                    } else {
                        ctx.used(`__gen_${t.name}_to_external`);
                        ctx.append(`return __gen_${t.name}_to_external(res);`);
                    }
                    return;
                }
            }

            // Return restult
            ctx.append(`return res;`);
        });
        ctx.append(`}`);
    });
}

export function writeInit(t: TypeDescription, init: InitDescription, ctx: WriterContext) {
    ctx.fun(`__gen_${t.name}_init`, () => {

        let modifier = enabledInline(ctx.ctx) ? ' inline ' : ' ';
        ctx.append(`cell ${fn(`__gen_${t.name}_init`)}(${[`cell sys'`, ...init.args.map((v) => resolveFuncType(v.type, ctx) + ' ' + id(v.name))].join(', ')})${modifier}{`);
        ctx.inIndent(() => {

            // Unpack args
            for (let a of init.args) {
                if (!resolveFuncPrimitive(a.type, ctx)) {
                    ctx.append(`var (${resolveFuncTypeUnpack(a.type, id(a.name), ctx)}) = ${id(a.name)};`);
                }
            }

            // Generate self initial tensor
            let initValues: string[] = [];
            for (let i = 0; i < t.fields.length; i++) {
                let init = 'null()';
                if (t.fields[i].default !== undefined) {
                    init = writeValue(t.fields[i].default!, ctx);
                }
                initValues.push(init);
            }
            if (initValues.length > 0) { // Special case for empty contracts
                ctx.append(`var (${resolveFuncTypeUnpack(t, id('self'), ctx)}) = (${initValues.join(', ')});`);
            }

            // Generate statements
            let returns = resolveFuncTypeUnpack(t, id('self'), ctx);
            for (let s of init.ast.statements) {
                writeStatement(s, returns, ctx);
            }

            // Assemble result cell
            ctx.used(`__gen_write_${t.name}`);
            ctx.append(`var b' = begin_cell();`)
            ctx.append(`b' = b'.store_ref(sys');`)
            ctx.append(`b' = __gen_write_${t.name}(${[`b'`, resolveFuncTypeUnpack(t, id('self'), ctx)].join(', ')});`);
            ctx.append(`return b'.end_cell();`);
        });
        ctx.append(`}`);
    });

    ctx.fun(`__gen_${t.name}_init_child`, () => {
        let modifier = enabledInline(ctx.ctx) ? ' inline ' : ' ';
        ctx.append(`(cell, cell) ${fn(`__gen_${t.name}_init_child`)}(${[`cell sys'`, ...init.args.map((v) => resolveFuncType(v.type, ctx) + ' ' + id(v.name))].join(', ')})${modifier}{`);
        ctx.inIndent(() => {
            ctx.used(`__tact_dict_get_code`);

            // Parsing sys
            ctx.append(`slice sc' = sys'.begin_parse();`);
            ctx.append(`cell source = sc'~load_dict();`);
            ctx.append(`cell mine = __tact_dict_get_code(source, ${t.uid});`);

            // Copy contracts code
            ctx.append(`cell contracts = new_dict();`);
            for (let c of t.dependsOn) {
                ctx.used(`__tact_dict_set_code`);
                ctx.append(`cell code_${t.uid} = __tact_dict_get_code(source, ${t.uid});`);
                ctx.append(`contracts = __tact_dict_set_code(contracts, ${t.uid}, code_${t.uid});`);
            }

            // Build cell
            ctx.append(`cell sys = begin_cell().store_dict(contracts).end_cell();`);
            ctx.used(`__gen_${t.name}_init`);
            ctx.append(`return (mine, ${fn(`__gen_${t.name}_init`)}(${['sys', ...init.args.map((v) => id(v.name))].join(', ')}));`);
        });
        ctx.append(`}`);
    });
}