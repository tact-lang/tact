import { beginCell } from "ton-core";
import { getType } from "../../types/resolveDescriptors";
import { ReceiverDescription, TypeDescription } from "../../types/types";
import { WriterContext } from "../Writer";
import { id } from "./id";
import { ops } from "./ops";
import { resolveFuncType } from "./resolveFuncType";
import { resolveFuncTypeUnpack } from "./resolveFuncTypeUnpack";
import { writeStatement } from "./writeFunction";

export function writeRouter(type: TypeDescription, ctx: WriterContext) {
    ctx.append(`(${resolveFuncType(type, ctx)}, int) ${ops.contractRouter(type.name)}(${resolveFuncType(type, ctx)} self, int msg_bounced, slice in_msg) impure inline_ref {`);
    ctx.inIndent(() => {

        // Parse incoming message
        ctx.append();
        ctx.append(`;; Parse incoming message`);
        ctx.append(`int op = 0;`);
        ctx.append(`if (slice_bits(in_msg) >= 32) {`);
        ctx.inIndent(() => {
            ctx.append(`op = in_msg.preload_uint(32);`);
        });
        ctx.append(`}`);
        ctx.append();

        // Handle bounced
        ctx.append(`;; Handle bounced messages`);
        ctx.append(`if (msg_bounced) {`);
        ctx.inIndent(() => {
            let bouncedHandler = type.receivers.find(f => f.selector.kind === 'internal-bounce');
            if (bouncedHandler) {

                ctx.append(`self~${ops.receiveBounce(type.name)}(in_msg);`);

                // Exit
                ctx.append('return (self, true);');
            } else {

                // Exit
                ctx.append(`return (self, true);`);
            }
        });
        ctx.append(`}`);

        // Non-empty receivers
        for (const f of type.receivers) {
            const selector = f.selector;

            // Generic receiver
            if (selector.kind === 'internal-binary') {
                let allocation = getType(ctx.ctx, selector.type);
                if (!allocation.header) {
                    throw Error('Invalid allocation: ' + selector.type);
                }
                ctx.append();
                ctx.append(`;; Receive ${selector.type} message`);
                ctx.append(`if (op == ${allocation.header}) {`);
                ctx.inIndent(() => {

                    // Read message
                    ctx.append(`var msg = in_msg~${ops.reader(selector.type, ctx)}();`);

                    // Execute function
                    ctx.append(`self~${ops.receiveType(type.name, selector.type)}(msg);`);

                    // Exit
                    ctx.append('return (self, true);');
                })
                ctx.append(`}`);
            }

            if (selector.kind === 'internal-empty') {
                ctx.append();
                ctx.append(`;; Receive empty message`);
                ctx.append(`if ((op == 0) & (slice_bits(in_msg) <= 32)) {`);
                ctx.inIndent(() => {

                    // Execute function
                    ctx.append(`self~${ops.receiveEmpty(type.name)}();`);

                    // Exit
                    ctx.append('return (self, true);');
                })
                ctx.append(`}`);
            }
        }

        // Text resolvers
        let hasComments = !!type.receivers.find((v) => v.selector.kind === 'internal-comment' || v.selector.kind === 'internal-comment-fallback');
        if (hasComments) {
            ctx.append();
            ctx.append(`;; Text Receivers`);
            ctx.append(`if (op == 0) {`);
            ctx.inIndent(() => {
                if (!!type.receivers.find((v) => v.selector.kind === 'internal-comment')) {
                    ctx.append(`var text_op = slice_hash(in_msg);`);
                    for (const r of type.receivers) {
                        const selector = r.selector;
                        if (selector.kind === 'internal-comment') {
                            let hash = beginCell()
                                .storeUint(0, 32)
                                .storeBuffer(Buffer.from(selector.comment, 'utf8'))
                                .endCell()
                                .hash()
                                .toString('hex', 0, 64);
                            ctx.append();
                            ctx.append(`;; Receive "${selector.comment}" message`);
                            ctx.append(`if (text_op == 0x${hash}) {`);
                            ctx.inIndent(() => {

                                // Execute function
                                ctx.append(`self~${ops.receiveText(type.name, hash)}();`);

                                // Exit
                                ctx.append('return (self, true);');
                            })
                            ctx.append(`}`);
                        }
                    }
                }

                // Comment fallback resolver
                let fallback = type.receivers.find((v) => v.selector.kind === 'internal-comment-fallback');
                if (fallback) {

                    ctx.append(`if (slice_bits(in_msg) >= 32) {`);
                    ctx.inIndent(() => {

                        // Execute function
                        ctx.append(`self~${ops.receiveAnyText(type.name)}(in_msg.skip_bits(32));`);

                        // Exit
                        ctx.append('return (self, true);');
                    });

                    ctx.append(`}`);
                }
            });
            ctx.append(`}`);
        }

        // Fallback
        let fallbackReceiver = type.receivers.find((v) => v.selector.kind === 'internal-fallback');
        if (fallbackReceiver) {

            ctx.append();
            ctx.append(`;; Receiver fallback`);

            // Execute function
            ctx.append(`self~${ops.receiveAny(type.name)}(in_msg);`);

            ctx.append('return (self, true);');
        } else {
            ctx.append();
            ctx.append('return (self, false);');
        }
    });
    ctx.append(`}`);
    ctx.append();
}

export function writeReceiver(self: TypeDescription, f: ReceiverDescription, ctx: WriterContext) {
    const selector = f.selector;
    let selfRes = resolveFuncTypeUnpack(self, id('self'), ctx);
    let selfType = resolveFuncType(self, ctx);
    let selfUnpack = `var ${resolveFuncTypeUnpack(self, id('self'), ctx)} = ${id('self')};`;

    // Binary receiver
    if (selector.kind === 'internal-binary') {
        let args = [
            selfType + ' ' + id('self'),
            resolveFuncType(selector.type, ctx) + ' ' + id(selector.name)
        ];
        ctx.append(`((${selfType}), ()) ${ops.receiveType(self.name, selector.type)}(${args.join(', ')}) impure inline {`);
        ctx.inIndent(() => {
            ctx.append(selfUnpack);
            ctx.append(`var ${resolveFuncTypeUnpack(selector.type, id(selector.name), ctx)} = ${id(selector.name)};`);

            for (let s of f.ast.statements) {
                writeStatement(s, selfRes, null, ctx);
            }

            if (f.ast.statements.length === 0 || f.ast.statements[f.ast.statements.length - 1].kind !== 'statement_return') {
                ctx.append(`return (${selfRes}, ());`);
            }
        });
        ctx.append(`}`);
        ctx.append();
        return;
    }

    // Empty receiver
    if (selector.kind === 'internal-empty') {
        ctx.append(`((${selfType}), ()) ${ops.receiveEmpty(self.name)}(${(selfType + ' ' + id('self'))}) impure inline {`);
        ctx.inIndent(() => {
            ctx.append(selfUnpack);

            for (let s of f.ast.statements) {
                writeStatement(s, selfRes, null, ctx);
            }

            if (f.ast.statements.length === 0 || f.ast.statements[f.ast.statements.length - 1].kind !== 'statement_return') {
                ctx.append(`return (${selfRes}, ());`);
            }
        });
        ctx.append(`}`);
        ctx.append();
        return;
    }

    // Comment receiver
    if (selector.kind === 'internal-comment') {
        let hash = beginCell()
            .storeUint(0, 32)
            .storeBuffer(Buffer.from(selector.comment, 'utf8'))
            .endCell()
            .hash()
            .toString('hex', 0, 64);
        ctx.append(`(${selfType}, ()) ${ops.receiveText(self.name, hash)}(${(selfType + ' ' + id('self'))}) impure inline {`);
        ctx.inIndent(() => {
            ctx.append(selfUnpack);

            for (let s of f.ast.statements) {
                writeStatement(s, selfRes, null, ctx);
            }

            if (f.ast.statements.length === 0 || f.ast.statements[f.ast.statements.length - 1].kind !== 'statement_return') {
                ctx.append(`return (${selfRes}, ());`);
            }
        });
        ctx.append(`}`);
        ctx.append();
        return;
    }


    // Fallback
    if (selector.kind === 'internal-comment-fallback') {
        ctx.append(`(${selfType}, ()) ${ops.receiveAnyText(self.name)}(${([selfType + ' ' + id('self'), 'slice ' + id(selector.name)]).join(', ')}) impure inline {`)
        ctx.inIndent(() => {
            ctx.append(selfUnpack);

            for (let s of f.ast.statements) {
                writeStatement(s, selfRes, null, ctx);
            }

            if (f.ast.statements.length === 0 || f.ast.statements[f.ast.statements.length - 1].kind !== 'statement_return') {
                ctx.append(`return (${selfRes}, ());`);
            }
        });
        ctx.append(`}`);
        ctx.append();
        return;
    }

    // Fallback
    if (selector.kind === 'internal-fallback') {
        ctx.append(`(${selfType}, ()) ${ops.receiveAny(self.name)}(${selfType} ${id('self')}, slice ${id(selector.name)}) impure inline {`);
        ctx.inIndent(() => {
            ctx.append(selfUnpack);

            for (let s of f.ast.statements) {
                writeStatement(s, selfRes, null, ctx);
            }

            if (f.ast.statements.length === 0 || f.ast.statements[f.ast.statements.length - 1].kind !== 'statement_return') {
                ctx.append(`return (${selfRes}, ());`);
            }
        });
        ctx.append(`}`);
        ctx.append();
        return;
    }

    // Bounced
    if (selector.kind === 'internal-bounce') {
        ctx.append(`(${selfType}, ()) ${ops.receiveBounce(self.name)}(${selfType} ${id('self')}, slice ${id(selector.name)}) impure inline {`);
        ctx.inIndent(() => {
            ctx.append(selfUnpack);

            for (let s of f.ast.statements) {
                writeStatement(s, selfRes, null, ctx);
            }

            if (f.ast.statements.length === 0 || f.ast.statements[f.ast.statements.length - 1].kind !== 'statement_return') {
                ctx.append(`return (${selfRes}, ());`);
            }
        });
        ctx.append(`}`);
        ctx.append();
        return;
    }
}
