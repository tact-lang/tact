import { beginCell } from "ton";
import { config } from "../../config";
import { ASTCondition, ASTStatement } from "../../grammar/ast";
import { getType, resolveTypeRef } from "../../types/resolveDescriptors";
import { FunctionDescription, InitDescription, ReceiverDescription, TypeDescription } from "../../types/types";
import { getMethodId } from "../../utils";
import { WriterContext } from "../Writer";
import { resolveFuncTensor, TensorDef, tensorToString } from "./resolveFuncTensor";
import { resolveFuncType } from "./resolveFuncType";
import { writeExpression } from "./writeExpression";

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

export function writeFunction(f: FunctionDescription, ctx: WriterContext) {

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
        if (f.returns.kind !== 'void') {
            returns = `((${tensorToString(selfTensor, 'types').join(', ')}), ${returns})`;
        } else {
            returns = `((${tensorToString(selfTensor, 'types').join(', ')}), ())`;
        }
    }

    // Resolve function name
    let name = (self ? '__gen_' + self.name + '_' : '') + f.name;
    let selfStr = selfTensor ? `(${tensorToString(selfTensor, 'names').join(', ')})` : null;
    let modifier = config.enableInline ? 'impure inline' : 'impure';

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

export function writeReceiver(self: TypeDescription, f: ReceiverDescription, ctx: WriterContext) {
    const selector = f.selector;

    // Binary receiver
    if (selector.kind === 'internal-binary') {
        ctx.fun(`__gen_${self.name}_receive_${selector.type}`, () => {
            let selfTensor = resolveFuncTensor(self.fields, ctx, `self'`);
            let argsTensor = resolveFuncTensor([
                { name: selector.name, type: { kind: 'ref', name: selector.type, optional: false } }
            ], ctx);
            let selfRes = `(${tensorToString(selfTensor, 'names').join(', ')})`;
            let modifier = config.enableInline ? 'impure inline' : 'impure';
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
            let modifier = config.enableInline ? 'impure inline' : 'impure';
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
        let hash = beginCell()
            .storeUint(0, 32)
            .storeBuffer(Buffer.from(selector.comment, 'utf8'))
            .endCell()
            .hash()
            .toString('hex', 0, 64);
        ctx.fun(`__gen_${self.name}_receive_comment_${hash}`, () => {
            let selfTensor = resolveFuncTensor(self.fields, ctx, `self'`);
            let selfRes = `(${tensorToString(selfTensor, 'names').join(', ')})`;
            let modifier = config.enableInline ? 'impure inline' : 'impure';
            ctx.append(`((${tensorToString(selfTensor, 'types').join(', ')}), ()) __gen_${self.name}_receive_comment_${hash}((${(tensorToString(selfTensor, 'types').join(', ') + ') self')}) ${modifier} {`);
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
            let modifier = config.enableInline ? 'impure inline' : 'impure';
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

    // Bounced
    if (selector.kind === 'internal-bounce') {
        ctx.fun(`__gen_${self.name}_receive_bounced`, () => {
            let selfTensor = resolveFuncTensor(self.fields, ctx, `self'`);
            let selfRes = `(${tensorToString(selfTensor, 'names').join(', ')})`;
            let modifier = config.enableInline ? 'impure inline' : 'impure';
            ctx.append(`((${tensorToString(selfTensor, 'types').join(', ')}), ()) __gen_${self.name}_receive_bounced((${(tensorToString(selfTensor, 'types').join(', '))}) self, slice ${selector.name}) ${modifier} {`);
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

export function writeGetter(f: FunctionDescription, ctx: WriterContext) {
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

export function writeInit(t: TypeDescription, init: InitDescription, ctx: WriterContext) {
    ctx.fun(`__gen_${t.name}_init`, () => {
        let argsTensor = resolveFuncTensor([{ name: `sys'`, type: { kind: 'ref', name: 'Cell', optional: false } }, ...init.args], ctx);
        let selfTensor = resolveFuncTensor(t.fields, ctx, `self'`);
        let selfRes = `(${tensorToString(selfTensor, 'names').join(', ')})`;
        let modifier = config.enableInline ? ' inline ' : ' ';
        ctx.append(`cell __gen_${t.name}_init(${tensorToString(argsTensor, 'full').join(', ')})${modifier}{`);
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
            ctx.used(`__gen_write_${t.name}`);
            ctx.append(`var b' = begin_cell();`)
            ctx.append(`b' = b'.store_ref(sys');`)
            ctx.append(`b' = __gen_write_${t.name}(${[`b'`, ...tensorToString(selfTensor, 'names')].join(', ')});`);
            ctx.append(`return b'.end_cell();`);
        });
        ctx.append(`}`);
    });

    ctx.fun(`__gen_${t.name}_init_child`, () => {
        let argsTensor = resolveFuncTensor([{ name: `sys'`, type: { kind: 'ref', name: 'Cell', optional: false } }, ...init.args], ctx);
        let argsTensorChild = resolveFuncTensor([{ name: `sys`, type: { kind: 'ref', name: 'Cell', optional: false } }, ...init.args], ctx);
        let modifier = config.enableInline ? ' inline ' : ' ';
        ctx.append(`(cell, cell) __gen_${t.name}_init_child(${tensorToString(argsTensor, 'full').join(', ')})${modifier}{`);
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
            ctx.append(`return (mine, __gen_${t.name}_init(${tensorToString(argsTensorChild, 'names').join(', ')}));`);
        });
        ctx.append(`}`);
    });
}