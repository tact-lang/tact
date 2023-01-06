import { CompilerContext } from "../context";
import { getAllocation, getAllocations } from "../storage/resolveAllocation";
import { getAllStaticFunctions, getAllTypes } from "../types/resolveDescriptors";
import { TypeDescription } from "../types/types";
import { WriterContext } from "./Writer";
import { writeParser, writeSerializer, writeStorageOps } from "./writers/writeSerialization";
import { writeStdlib } from "./writers/writeStdlib";
import { writeAccessors } from "./writers/writeAccessors";
import { beginCell } from "ton-core";
import { unwrapExternal, writeFunction, writeGetter, writeInit, writeReceiver } from "./writers/writeFunction";
import { contractErrors } from "../abi/errors";
import { writeInterfaces } from "./writers/writeInterfaces";
import { calculateIPFSlink } from "../utils/calculateIPFSlink";
import { getAllStrings } from "../types/resolveStrings";
import { writeString } from './writers/writeString';
import { fn, id } from "./writers/id";
import { resolveFuncTupledType } from "./writers/resolveFuncTupledType";

function writeInitContract(type: TypeDescription, ctx: WriterContext) {
    // Main field
    ctx.fun('$main', () => {
        ctx.append(`cell init(${[`cell sys'`, ...type.init!.args.map((a) => resolveFuncTupledType(a.type, ctx) + ' ' + id('$' + a.name))].join(', ')}) method_id {`);
        ctx.inIndent(() => {

            // Unpack arguments
            for (let arg of type.init!.args) {
                unwrapExternal(id(arg.name), id('$' + arg.name), arg.type, ctx);
            }

            // Call init function
            ctx.used(`__gen_${type.name}_init`);
            ctx.append(`return ${fn(`__gen_${type.name}_init`)}(${[`sys'`, ...type.init!.args.map((a) => id(a.name))].join(', ')});`);
        });
        ctx.append(`}`);
        ctx.append();

        // To to avoid compiler crash
        ctx.append(`() main() {`);
        ctx.append(`}`);
    });
}

function writeMainContract(type: TypeDescription, abiLink: string, ctx: WriterContext) {

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
            ctx.append(`__tact_context = (msg_bounced, msg_sender_addr, msg_value, cs);`);
            ctx.append();

            // Handle bounced
            ctx.append(`;; Handle bounced messages`);
            ctx.append(`if (msg_bounced) {`);
            ctx.inIndent(() => {
                let bouncedHandler = type.receivers.find(f => f.selector.kind === 'internal-bounce');
                if (bouncedHandler) {

                    // Load storage
                    ctx.used(`__gen_load_${type.name}`);
                    ctx.append(`var self = __gen_load_${type.name}();`);

                    // Execute function
                    ctx.used(`__gen_${type.name}_receive_bounced`);
                    ctx.append(`self~${fn(`__gen_${type.name}_receive_bounced`)}(in_msg);`);

                    // Persist
                    ctx.used(`__gen_store_${type.name}`);
                    ctx.append(`__gen_store_${type.name}(self);`);
                    ctx.append(`return ();`);
                } else {
                    ctx.append(`return ();`);
                }
            });
            ctx.append(`}`);

            // Non-empty receivers
            for (const f of type.receivers) {
                const selector = f.selector;

                // Generic receiver
                if (selector.kind === 'internal-binary') {
                    let allocation = getAllocation(ctx.ctx, selector.type);
                    if (!allocation.prefix) {
                        throw Error('Invalid allocation');
                    }
                    ctx.append();
                    ctx.append(`;; Receive ${selector.type} message`);
                    ctx.append(`if (op == ${allocation.prefix}) {`);
                    ctx.inIndent(() => {

                        // Load storage
                        ctx.used(`__gen_load_${type.name}`);
                        ctx.append(`var self = __gen_load_${type.name}();`);

                        // Read message
                        ctx.used(`__gen_read_${selector.type}`);
                        ctx.append(`var msg = in_msg~__gen_read_${selector.type}();`);

                        // Execute function
                        ctx.used(`__gen_${type.name}_receive_${selector.type}`);
                        ctx.append(`self~${fn(`__gen_${type.name}_receive_${selector.type}`)}(msg);`);

                        // Persist
                        ctx.used(`__gen_store_${type.name}`);
                        ctx.append(`__gen_store_${type.name}(self);`);

                        // Exit
                        ctx.append(`return ();`);
                    })
                    ctx.append(`}`);
                }

                if (selector.kind === 'internal-empty') {
                    ctx.append();
                    ctx.append(`;; Receive empty message`);
                    ctx.append(`if ((op == 0) & (slice_bits(in_msg) <= 32)) {`);
                    ctx.inIndent(() => {

                        // Load storage
                        ctx.used(`__gen_load_${type.name}`);
                        ctx.append(`var self = __gen_load_${type.name}();`);

                        // Execute function
                        ctx.used(`__gen_${type.name}_receive`);
                        ctx.append(`self~${fn(`__gen_${type.name}_receive`)}();`);

                        // Persist
                        ctx.used(`__gen_store_${type.name}`);
                        ctx.append(`__gen_store_${type.name}(self);`);

                        // Exit
                        ctx.append(`return ();`);
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

                                    // Load storage
                                    ctx.used(`__gen_load_${type.name}`);
                                    ctx.append(`var self = __gen_load_${type.name}();`);

                                    // Execute function
                                    ctx.used(`__gen_${type.name}_receive_comment_${hash}`);
                                    ctx.append(`self~${fn(`__gen_${type.name}_receive_comment_${hash}`)}();`);

                                    // Persist
                                    ctx.used(`__gen_store_${type.name}`);
                                    ctx.append(`__gen_store_${type.name}(self);`);

                                    // Exit
                                    ctx.append(`return ();`);
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

                            // Load storage
                            ctx.used(`__gen_load_${type.name}`);
                            ctx.append(`var self = __gen_load_${type.name}();`);

                            // Execute function
                            ctx.used(`__gen_${type.name}_receive_comment`);
                            ctx.append(`self~${fn(`__gen_${type.name}_receive_comment`)}(in_msg.skip_bits(32));`);

                            // Persist
                            ctx.used(`__gen_store_${type.name}`);
                            ctx.append(`__gen_store_${type.name}(self);`);

                            // Exit
                            ctx.append(`return ();`);
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

                // Load storage
                ctx.used(`__gen_load_${type.name}`);
                ctx.append(`var self = __gen_load_${type.name}();`);

                // Execute function
                ctx.used(`__gen_${type.name}_receive_fallback`);
                ctx.append(`self~${fn(`__gen_${type.name}_receive_fallback`)}(in_msg);`);

                // Persist
                ctx.used(`__gen_store_${type.name}`);
                ctx.append(`__gen_store_${type.name}(self);`);

            } else {
                ctx.append();
                ctx.append(`throw(${contractErrors.invalidMessage.id});`);
            }
        });
        ctx.append('}');
        ctx.append();

        // Implicit dependencies
        for (let f of type.functions.values()) {
            if (f.isGetter) {
                ctx.used(`__gen_get_${f.name}`);
            }
        }

        // Interfaces
        writeInterfaces(type, ctx);

        // ABI
        ctx.append(`_ get_abi_ipfs() {`);
        ctx.inIndent(() => {
            ctx.append(`return "${abiLink}";`);
        });
        ctx.append(`}`);
    });
}

export async function writeProgram(ctx: CompilerContext, abiSrc: ContractABI, debug: boolean = false) {
    const wctx = new WriterContext(ctx);
    let allTypes = Object.values(getAllTypes(ctx));
    let contracts = allTypes.filter((v) => v.kind === 'contract');

    // Stdlib
    writeStdlib(wctx);

    // Serializators
    let allocations = getAllocations(ctx);
    for (let k of allocations) {
        writeSerializer(k.type.name, k.allocation, wctx);
        writeParser(k.type.name, k.type.fields, k.allocation, wctx);
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

    // Strings
    for (let k of getAllStrings(ctx)) {
        writeString(k.value, wctx);
    }

    // Static functions
    let sf = getAllStaticFunctions(ctx);
    for (let k in sf) {
        let f = sf[k];
        writeFunction(f, wctx);
    }

    // Extensions
    for (let c of allTypes) {
        if (c.kind !== 'contract' && c.kind !== 'trait') { // We are rendering contract functions separately
            for (let f of c.functions.values()) {
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
        for (let f of c.functions.values()) {
            writeFunction(f, wctx);

            // Render only needed getter
            if (c.name === abiSrc.name) {
                if (f.isGetter) {
                    writeGetter(f, wctx);
                }
            }
        }

        // Receivers
        for (let r of Object.values(c.receivers)) {
            writeReceiver(c, r, wctx);
        }
    }

    // Find contract
    let c = contracts.find((v) => v.name === abiSrc.name);
    if (!c) {
        throw Error(`Contract ${abiSrc.name} not found`);
    }

    // Prepare ABI
    let abi = JSON.stringify(abiSrc);
    let abiLink = await calculateIPFSlink(Buffer.from(abi));

    // Write contract
    let mainCtx = wctx.clone();
    writeMainContract(c, abiLink, mainCtx);
    let output = mainCtx.render(debug);

    // Write init
    let initCtx = wctx.clone();
    writeInitContract(c, initCtx);
    let initOutput = initCtx.render(debug);

    return { output, initOutput, abi };
}