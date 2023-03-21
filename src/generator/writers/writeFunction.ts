import { beginCell } from "ton-core";
import { enabledInline } from "../../config/features";
import { ASTCondition, ASTExpression, ASTStatement } from "../../grammar/ast";
import { getType, resolveTypeRef } from "../../types/resolveDescriptors";
import { getExpType } from "../../types/resolveExpression";
import { FunctionDescription, InitDescription, ReceiverDescription, TypeDescription, TypeRef } from "../../types/types";
import { getMethodId } from "../../utils/utils";
import { WriterContext } from "../Writer";
import { resolveFuncPrimitive } from "./resolveFuncPrimitive";
import { resolveFuncType } from "./resolveFuncType";
import { resolveFuncTypeUnpack } from "./resolveFuncTypeUnpack";
import { fn, id } from "./id";
import { writeExpression, writeValue } from "./writeExpression";
import { cast } from "./cast";
import { resolveFuncTupledType } from "./resolveFuncTupledType";

export function writeCastedExpression(expression: ASTExpression, to: TypeRef, ctx: WriterContext) {
    let expr = getExpType(ctx.ctx, expression);
    return cast(expr, to, writeExpression(expression, ctx), ctx); // Cast for nullable
}

export function unwrapExternal(targetName: string, sourceName: string, type: TypeRef, ctx: WriterContext) {
    if (type.kind === 'ref') {
        let t = getType(ctx.ctx, type.name);
        if (t.kind === 'struct') {
            if (type.optional) {
                ctx.used(`__gen_${t.name}_from_opt_tuple`);
                ctx.append(`${resolveFuncType(type, ctx)} ${targetName} = __gen_${t.name}_from_opt_tuple(${sourceName});`);
            } else {
                ctx.used(`__gen_${t.name}_from_tuple`);
                ctx.append(`${resolveFuncType(type, ctx)} ${targetName} = __gen_${t.name}_from_tuple(${sourceName});`);
            }
            return;
        } else if (t.kind === 'primitive' && t.name === 'Address') {
            if (type.optional) {
                ctx.append(`${resolveFuncType(type, ctx)} ${targetName} = null?(${sourceName}) ? null() : ${ctx.used(`__tact_verify_address`)}(${sourceName});`);
            } else {
                ctx.append(`${resolveFuncType(type, ctx)} ${targetName} = ${ctx.used(`__tact_verify_address`)}(${sourceName});`);
            }
            return;
        }
    }
    ctx.append(`${resolveFuncType(type, ctx)} ${targetName} = ${sourceName};`);
}

export function writeStatement(f: ASTStatement, self: string | null, returns: TypeRef | null, ctx: WriterContext) {
    if (f.kind === 'statement_return') {
        if (f.expression) {

            // Format expression
            let result = writeCastedExpression(f.expression, returns!, ctx);

            // Return
            if (self) {
                ctx.append(`return (${self}, ${result});`);
            } else {
                ctx.append(`return ${result};`);
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
                if (t.optional) {
                    ctx.append(`tuple ${id(f.name)} = ${writeCastedExpression(f.expression, t, ctx)};`);
                } else {
                    ctx.append(`var ${resolveFuncTypeUnpack(t, id(f.name), ctx)} = ${writeCastedExpression(f.expression, t, ctx)};`);
                }
                return;
            }
        }

        ctx.append(`${resolveFuncType(t, ctx)} ${id(f.name)} = ${writeCastedExpression(f.expression, t, ctx)};`);
        return;
    } else if (f.kind === 'statement_assign') {

        // Prepare lvalue
        let path = f.path.map((v, i) => (i === 0) ? id(v.name) : v.name).join(`'`);

        // Contract/struct case
        let t = getExpType(ctx.ctx, f.path[f.path.length - 1]);
        if (t.kind === 'ref') {
            let tt = getType(ctx.ctx, t.name);
            if (tt.kind === 'contract' || tt.kind === 'struct') {
                ctx.append(`${resolveFuncTypeUnpack(t, `${path}`, ctx)} = ${writeCastedExpression(f.expression, t, ctx)};`);
                return;
            }
        }

        ctx.append(`${path} = ${writeCastedExpression(f.expression, t, ctx)};`);
        return;
    } else if (f.kind === 'statement_condition') {
        writeCondition(f, self, false, returns, ctx);
        return;
    } else if (f.kind === 'statement_expression') {
        let exp = writeExpression(f.expression, ctx);
        ctx.append(`${exp};`);
        return;
    } else if (f.kind === 'statement_while') {
        ctx.append(`while (${writeExpression(f.condition, ctx)}) {`);
        ctx.inIndent(() => {
            for (let s of f.statements) {
                writeStatement(s, self, returns, ctx);
            }
        });
        ctx.append(`}`);
        return;
    } else if (f.kind === 'statement_until') {
        ctx.append(`do {`);
        ctx.inIndent(() => {
            for (let s of f.statements) {
                writeStatement(s, self, returns, ctx);
            }
        });
        ctx.append(`} until (${writeExpression(f.condition, ctx)});`);
        return;
    } else if (f.kind === 'statement_repeat') {
        ctx.append(`repeat (${writeExpression(f.condition, ctx)}) {`);
        ctx.inIndent(() => {
            for (let s of f.statements) {
                writeStatement(s, self, returns, ctx);
            }
        });
        ctx.append(`}`);
        return;
    }

    throw Error('Unknown statement kind');
}

function writeCondition(f: ASTCondition, self: string | null, elseif: boolean, returns: TypeRef | null, ctx: WriterContext) {
    ctx.append(`${(elseif ? '} else' : '')}if (${writeExpression(f.expression, ctx)}) {`);
    ctx.inIndent(() => {
        for (let s of f.trueStatements) {
            writeStatement(s, self, returns, ctx);
        }
    });
    if (f.falseStatements && f.falseStatements.length > 0) {
        ctx.append(`} else {`);
        ctx.inIndent(() => {
            for (let s of f.falseStatements!) {
                writeStatement(s, self, returns, ctx);
            }
        });
        ctx.append(`}`);
    } else if (f.elseif) {
        writeCondition(f.elseif, self, true, returns, ctx);
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
    let args: string[] = [];
    if (self) {
        args.push(resolveFuncType(self, ctx) + ' ' + id('self'));
    }
    for (let a of f.args) {
        args.push(resolveFuncType(a.type, ctx) + ' ' + id(a.name));
    }

    // Write function body
    ctx.fun(name, () => {
        ctx.signature(`${returns} ${fn(name)}(${args.join(', ')})`);
        ctx.flag('impure');
        if (enabledInline(ctx.ctx)) {
            ctx.flag('inline');
        }
        ctx.body(() => {
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
                writeStatement(s, returnsStr, f.returns, ctx);
            }

            // Auto append return
            if (f.self && (f.returns.kind === 'void') && f.isMutating) {
                if (fd.statements.length === 0 || fd.statements[fd.statements.length - 1].kind !== 'statement_return') {
                    ctx.append(`return (${returnsStr}, ());`);
                }
            }
        });
    });
}

export function writeReceiver(self: TypeDescription, f: ReceiverDescription, ctx: WriterContext) {
    const selector = f.selector;

    // Binary receiver
    if (selector.kind === 'internal-binary') {
        ctx.fun(`__gen_${self.name}_receive_${selector.type}`, () => {
            let selfRes = resolveFuncTypeUnpack(self, id('self'), ctx);
            ctx.signature(`((${resolveFuncType(self, ctx)}), ()) ${fn(`__gen_${self.name}_receive_${selector.type}`)}(${[resolveFuncType(self, ctx) + ' ' + id('self'), resolveFuncType(selector.type, ctx) + ' ' + id(selector.name)].join(', ')})`);
            ctx.flag('impure');
            ctx.flag('inline');
            ctx.body(() => {
                ctx.append(`var ${resolveFuncTypeUnpack(self, id('self'), ctx)} = ${id('self')};`);
                ctx.append(`var ${resolveFuncTypeUnpack(selector.type, id(selector.name), ctx)} = ${id(selector.name)};`);

                for (let s of f.ast.statements) {
                    writeStatement(s, selfRes, null, ctx);
                }

                if (f.ast.statements.length === 0 || f.ast.statements[f.ast.statements.length - 1].kind !== 'statement_return') {
                    ctx.append(`return (${selfRes}, ());`);
                }
            });
        });
        return;
    }

    // Empty receiver
    if (selector.kind === 'internal-empty') {
        ctx.fun(`__gen_${self.name}_receive`, () => {
            let selfRes = resolveFuncTypeUnpack(self, id('self'), ctx);
            ctx.signature(`((${resolveFuncType(self, ctx)}), ()) ${fn(`__gen_${self.name}_receive`)}(${(resolveFuncType(self, ctx) + ' ' + id('self'))})`);
            ctx.flag('impure');
            ctx.flag('inline');
            ctx.body(() => {
                ctx.append(`var ${resolveFuncTypeUnpack(self, id('self'), ctx)} = ${id('self')};`);

                for (let s of f.ast.statements) {
                    writeStatement(s, selfRes, null, ctx);
                }

                if (f.ast.statements.length === 0 || f.ast.statements[f.ast.statements.length - 1].kind !== 'statement_return') {
                    ctx.append(`return (${selfRes}, ());`);
                }
            });
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
            ctx.signature(`(${resolveFuncType(self, ctx)}, ()) ${fn(`__gen_${self.name}_receive_comment_${hash}`)}(${(resolveFuncType(self, ctx) + ' ' + id('self'))})`);
            ctx.flag('impure');
            ctx.flag('inline');
            ctx.body(() => {
                ctx.append(`var ${resolveFuncTypeUnpack(self, id('self'), ctx)} = ${id('self')};`);

                for (let s of f.ast.statements) {
                    writeStatement(s, selfRes, null, ctx);
                }

                if (f.ast.statements.length === 0 || f.ast.statements[f.ast.statements.length - 1].kind !== 'statement_return') {
                    ctx.append(`return (${selfRes}, ());`);
                }
            });
        });
    }


    // Fallback
    if (selector.kind === 'internal-comment-fallback') {
        ctx.fun(`__gen_${self.name}_receive_comment`, () => {
            let selfRes = resolveFuncTypeUnpack(self, id('self'), ctx);
            ctx.signature(`(${resolveFuncType(self, ctx)}, ()) ${fn(`__gen_${self.name}_receive_comment`)}(${([resolveFuncType(self, ctx) + ' ' + id('self'), 'slice ' + id(selector.name)]).join(', ')})`);
            ctx.flag('impure');
            ctx.flag('inline');
            ctx.body(() => {
                ctx.append(`var ${resolveFuncTypeUnpack(self, id('self'), ctx)} = ${id('self')};`);

                for (let s of f.ast.statements) {
                    writeStatement(s, selfRes, null, ctx);
                }

                if (f.ast.statements.length === 0 || f.ast.statements[f.ast.statements.length - 1].kind !== 'statement_return') {
                    ctx.append(`return (${selfRes}, ());`);
                }
            });
        });
    }

    // Fallback
    if (selector.kind === 'internal-fallback') {
        ctx.fun(`__gen_${self.name}_receive_fallback`, () => {
            let selfRes = resolveFuncTypeUnpack(self, id('self'), ctx);
            ctx.signature(`(${resolveFuncType(self, ctx)}, ()) ${fn(`__gen_${self.name}_receive_fallback`)}(${resolveFuncType(self, ctx)} ${id('self')}, slice ${id(selector.name)})`);
            ctx.flag('impure');
            ctx.flag('inline');
            ctx.body(() => {
                ctx.append(`var ${resolveFuncTypeUnpack(self, id('self'), ctx)} = ${id('self')};`);

                for (let s of f.ast.statements) {
                    writeStatement(s, selfRes, null, ctx);
                }

                if (f.ast.statements.length === 0 || f.ast.statements[f.ast.statements.length - 1].kind !== 'statement_return') {
                    ctx.append(`return (${selfRes}, ());`);
                }
            });
        });
    }

    // Bounced
    if (selector.kind === 'internal-bounce') {
        ctx.fun(`__gen_${self.name}_receive_bounced`, () => {
            let selfRes = resolveFuncTypeUnpack(self, id('self'), ctx);
            ctx.signature(`(${resolveFuncType(self, ctx)}, ()) ${fn(`__gen_${self.name}_receive_bounced`)}(${resolveFuncType(self, ctx)} ${id('self')}, slice ${id(selector.name)})`);
            ctx.flag('impure');
            ctx.flag('inline');
            ctx.body(() => {
                ctx.append(`var ${resolveFuncTypeUnpack(self, id('self'), ctx)} = ${id('self')};`);

                for (let s of f.ast.statements) {
                    writeStatement(s, selfRes, null, ctx);
                }

                if (f.ast.statements.length === 0 || f.ast.statements[f.ast.statements.length - 1].kind !== 'statement_return') {
                    ctx.append(`return (${selfRes}, ());`);
                }
            });
        });
    }
}

export function writeGetter(f: FunctionDescription, ctx: WriterContext) {

    // Render tensors
    const self = f.self ? getType(ctx.ctx, f.self) : null;
    if (!self) {
        throw new Error(`No self type for getter ${f.name}`); // Impossible
    }
    ctx.append(`_ %${f.name}(${f.args.map((v) => resolveFuncTupledType(v.type, ctx) + ' ' + id('$' + v.name)).join(', ')}) method_id(${getMethodId(f.name)}) {`);
    ctx.inIndent(() => {

        // Unpack arguments
        for (let arg of f.args) {
            unwrapExternal(id(arg.name), id('$' + arg.name), arg.type, ctx);
        }

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
    ctx.append();
}