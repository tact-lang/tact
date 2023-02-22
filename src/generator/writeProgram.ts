import { CompilerContext } from "../context";
import { getAllocation, getSortedTypes } from "../storage/resolveAllocation";
import { getAllStaticFunctions, getAllTypes, getType } from "../types/resolveDescriptors";
import { TypeDescription } from "../types/types";
import { WriterContext } from "./Writer";
import { writeOptionalParser, writeOptionalSerializer, writeParser, writeSerializer } from "./writers/writeSerialization";
import { writeStdlib } from "./writers/writeStdlib";
import { writeAccessors } from "./writers/writeAccessors";
import { ContractABI } from "ton-core";
import { unwrapExternal, writeFunction, writeGetter, writeInit, writeReceiver } from "./writers/writeFunction";
import { contractErrors } from "../abi/errors";
import { writeInterfaces } from "./writers/writeInterfaces";
import { calculateIPFSlink } from "../utils/calculateIPFSlink";
import { getAllStrings } from "../types/resolveStrings";
import { writeString } from './writers/writeString';
import { fn, id } from "./writers/id";
import { resolveFuncTupledType } from "./writers/resolveFuncTupledType";
import { getRawAST } from "../grammar/store";
import { resolveFuncType } from "./writers/resolveFuncType";
import { ops } from "./writers/ops";
import { writeRouter } from "./writers/writeRouter";

function writeStorageOps(type: TypeDescription, ctx: WriterContext) {

    // Load function
    ctx.fun(`__gen_load_${type.name}`, () => {
        ctx.append(`${resolveFuncType(type, ctx)} __gen_load_${type.name}() impure inline {`); // NOTE: Inline impure function
        ctx.inIndent(() => {

            // Load data slice
            ctx.append(`slice sc = get_data().begin_parse();`);

            // Load context
            ctx.used(`__tact_context`);
            ctx.append(`__tact_context_sys = sc~load_ref();`);

            // Load data
            if (type.fields.length > 0) {
                ctx.used(`__gen_read_${type.name}`);
                ctx.append(`return sc~__gen_read_${type.name}();`);
            } else {
                ctx.append(`return null();`);
            }
        });
        ctx.append(`}`);
    });

    // Store function
    ctx.fun(`__gen_store_${type.name}`, () => {
        ctx.append(`() __gen_store_${type.name}(${resolveFuncType(type, ctx)} v) impure inline {`); // NOTE: Impure inline function
        ctx.inIndent(() => {
            ctx.append(`builder b = begin_cell();`);

            // Persist system cell
            ctx.used(`__tact_context`);
            ctx.append(`b = b.store_ref(__tact_context_sys);`);

            // Build data
            if (type.fields.length > 0) {
                ctx.append(`b = ${ops.writer(type.name, ctx)}(b, v);`);
            }

            // Persist data
            ctx.append(`set_data(b.end_cell());`);
        });
        ctx.append(`}`);
    });
}

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

        // Write router
        writeRouter(type, ctx);

        // Render body
        ctx.append(``)
        ctx.append(`() recv_internal(int msg_value, cell in_msg_cell, slice in_msg) impure {`);
        ctx.inIndent(() => {

            // Require context function
            ctx.used('__tact_context');

            // Load context
            ctx.append();
            ctx.append(`;; Context`);
            ctx.append(`var cs = in_msg_cell.begin_parse();`);
            ctx.append(`var msg_flags = cs~load_uint(4);`); // int_msg_info$0 ihr_disabled:Bool bounce:Bool bounced:Bool
            ctx.append(`var msg_bounced = ((msg_flags & 1) == 1 ? true : false);`);
            ctx.append(`slice msg_sender_addr = cs~load_msg_addr();`);
            ctx.append(`__tact_context = (msg_bounced, msg_sender_addr, msg_value, cs);`);
            ctx.append();

            // Load self
            ctx.append(`;; Load contract data`);
            ctx.used(`__gen_load_${type.name}`);
            ctx.append(`var self = __gen_load_${type.name}();`);
            ctx.append();

            // Process operation
            ctx.append(`;; Handle operation`);
            ctx.append(`int handled = self~__gen_router_${type.name}(msg_bounced, in_msg);`);
            ctx.append();

            // Throw if not handled
            ctx.append(`;; Throw if not handled`);
            ctx.append(`throw_unless(handled, ${contractErrors.invalidMessage.id});`);
            ctx.append();
            
            // Persist state
            ctx.append(`;; Persist state`);
            ctx.used(`__gen_store_${type.name}`);
            ctx.append(`__gen_store_${type.name}(self);`);
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

        // Deployed
        ctx.append(`_ lazy_deployment_completed() {`);
        ctx.inIndent(() => {
            ctx.append(`return get_data().begin_parse().load_int(1);`);
        });
        ctx.append(`}`);
    });
}

export async function writeProgram(ctx: CompilerContext, abiSrc: ContractABI, debug: boolean = false) {
    const wctx = new WriterContext(ctx);
    let allTypes = Object.values(getAllTypes(ctx));
    let contracts = allTypes.filter((v) => v.kind === 'contract');

    // Headers
    wctx.header(`#pragma version =0.4.1;`); // FunC version
    wctx.header(`#pragma allow-post-modification;`); // Allow post modification
    wctx.header(`#pragma compute-asm-ltr;`); // Compute asm left to right

    // FunC imports
    for (let fc of getRawAST(ctx).funcSources) {
        wctx.header('\n' + fc);
    }

    // Stdlib
    writeStdlib(wctx);

    // Serializators
    let sortedTypes = getSortedTypes(ctx);
    for (let t of sortedTypes) {
        if (t.kind === 'contract' || t.kind === 'struct') {
            let allocation = getAllocation(ctx, t.name);
            writeSerializer(t.name, t.kind === 'contract', allocation, wctx);
            writeOptionalSerializer(t.name, wctx);
            writeParser(t.name, t.kind === 'contract', allocation, wctx);
            writeOptionalParser(t.name, wctx);
        }
    }

    // Accessors
    for (let t of allTypes) {
        if (t.kind === 'contract' || t.kind === 'struct') {
            writeAccessors(t, wctx);
        }
    }

    // Init serializers
    for (let t of sortedTypes) {
        if (t.kind === 'contract' && t.init) {
            let allocation = getAllocation(ctx, '$init$' + t.name);
            writeSerializer(`$init$${t.name}`, true, allocation, wctx);
            writeParser(`$init$${t.name}`, false, allocation, wctx);
        }
    }

    // Storage Functions
    for (let t of sortedTypes) {
        if (t.kind === 'contract') {
            writeStorageOps(t, wctx);
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