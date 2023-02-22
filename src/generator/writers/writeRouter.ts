import { beginCell } from "ton-core";
import { getType } from "../../types/resolveDescriptors";
import { TypeDescription } from "../../types/types";
import { WriterContext } from "../Writer";
import { fn } from "./id";
import { resolveFuncType } from "./resolveFuncType";

export function writeRouter(type: TypeDescription, ctx: WriterContext) {
    ctx.append(`(${resolveFuncType(type, ctx)}, int) __gen_router_${type.name}(${resolveFuncType(type, ctx)} self, int msg_bounced, slice in_msg) impure inline_ref {`);
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
                ctx.used(`__gen_${type.name}_receive_bounced`);
                ctx.append(`self~${fn(`__gen_${type.name}_receive_bounced`)}(in_msg);`);
                
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
                    ctx.used(`__gen_read_${selector.type}`);
                    ctx.append(`var msg = in_msg~__gen_read_${selector.type}();`);

                    // Execute function
                    ctx.used(`__gen_${type.name}_receive_${selector.type}`);
                    ctx.append(`self~${fn(`__gen_${type.name}_receive_${selector.type}`)}(msg);`);

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
                    ctx.used(`__gen_${type.name}_receive`);
                    ctx.append(`self~${fn(`__gen_${type.name}_receive`)}();`);

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
                                ctx.used(`__gen_${type.name}_receive_comment_${hash}`);
                                ctx.append(`self~${fn(`__gen_${type.name}_receive_comment_${hash}`)}();`);

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
                        ctx.used(`__gen_${type.name}_receive_comment`);
                        ctx.append(`self~${fn(`__gen_${type.name}_receive_comment`)}(in_msg.skip_bits(32));`);

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
            ctx.used(`__gen_${type.name}_receive_fallback`);
            ctx.append(`self~${fn(`__gen_${type.name}_receive_fallback`)}(in_msg);`);

            ctx.append('return (self, true);');
        } else {
            ctx.append();
            ctx.append('return (self, false);');
        }
    });
    ctx.append(`}`);
}