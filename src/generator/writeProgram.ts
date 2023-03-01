import { CompilerContext } from "../context";
import { getAllocation, getSortedTypes } from "../storage/resolveAllocation";
import { getAllStaticFunctions, getAllTypes } from "../types/resolveDescriptors";
import { InitDescription, TypeDescription } from "../types/types";
import { WriterContext } from "./Writer";
import { writeOptionalParser, writeOptionalSerializer, writeParser, writeSerializer } from "./writers/writeSerialization";
import { writeStdlib } from "./writers/writeStdlib";
import { writeAccessors } from "./writers/writeAccessors";
import { ContractABI } from "ton-core";
import { unwrapExternal, writeFunction, writeGetter, writeReceiver, writeStatement } from "./writers/writeFunction";
import { contractErrors } from "../abi/errors";
import { writeInterfaces } from "./writers/writeInterfaces";
import { calculateIPFSlink } from "../utils/calculateIPFSlink";
import { getAllStrings } from "../types/resolveStrings";
import { writeString } from './writers/writeConstant';
import { fn, id } from "./writers/id";
import { resolveFuncTupledType } from "./writers/resolveFuncTupledType";
import { getRawAST } from "../grammar/store";
import { resolveFuncType } from "./writers/resolveFuncType";
import { ops } from "./writers/ops";
import { writeRouter } from "./writers/writeRouter";
import { resolveFuncPrimitive } from "./writers/resolveFuncPrimitive";
import { resolveFuncTypeUnpack } from "./writers/resolveFuncTypeUnpack";
import { writeValue } from "./writers/writeExpression";
import { enabledInline } from "../config/features";

function writeStorageOps(type: TypeDescription, ctx: WriterContext) {

    // Load function
    ctx.fun(`__gen_load_${type.name}`, () => {
        ctx.append(`${resolveFuncType(type, ctx)} __gen_load_${type.name}() impure inline {`); // NOTE: Inline impure function
        ctx.inIndent(() => {

            // Load data slice
            ctx.append(`slice $sc = get_data().begin_parse();`);

            // Load context
            ctx.used(`__tact_context`);
            ctx.append(`__tact_context_sys = $sc~load_ref();`);
            ctx.append(`int $loaded = $sc~load_int(1);`);

            // Load data
            ctx.append(`if ($loaded) {`);
            ctx.inIndent(() => {
                if (type.fields.length > 0) {
                    ctx.used(`__gen_read_${type.name}`);
                    ctx.append(`return $sc~__gen_read_${type.name}();`);
                } else {
                    ctx.append(`return null();`);
                }
            });
            ctx.append(`} else {`);
            ctx.inIndent(() => {

                // Load arguments
                if (type.init!.args.length > 0) {
                    ctx.used(`__gen_read_$init$${type.name}`);
                    ctx.append(`(${type.init!.args.map((v) => resolveFuncType(v.type, ctx) + ' ' + v.name).join(', ')}) = $sc~__gen_read_$init$${type.name}();`);
                    ctx.append(`$sc.end_parse();`);
                }

                // Execute init function
                ctx.used(`__gen_${type.name}_init`);
                ctx.append(`return ${fn(`__gen_${type.name}_init`)}(${[...type.init!.args.map((v) => v.name)].join(', ')});`);
            });

            ctx.append(`}`);
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

            // Persist deployment flag
            ctx.append(`b = b.store_int(true, 1);`);

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

function writeInit(t: TypeDescription, init: InitDescription, ctx: WriterContext) {
    ctx.fun(`__gen_${t.name}_init`, () => {
        ctx.append(`${resolveFuncType(t, ctx)} ${fn(`__gen_${t.name}_init`)}(${[...init.args.map((v) => resolveFuncType(v.type, ctx) + ' ' + id(v.name))].join(', ')}) impure inline_ref {`);
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
            } else {
                ctx.append(`tuple ${id('self')} = null();`);
            }

            // Generate statements
            let returns = resolveFuncTypeUnpack(t, id('self'), ctx);
            for (let s of init.ast.statements) {
                writeStatement(s, returns, null, ctx);
            }

            // Return result
            if (init.ast.statements.length === 0 || init.ast.statements[init.ast.statements.length - 1].kind !== 'statement_return') {
                ctx.append(`return ${returns};`);
            }
        });
        ctx.append(`}`);
    });

    ctx.fun(`__gen_${t.name}_init_child`, () => {
        let modifier = enabledInline(ctx.ctx) ? ' inline ' : ' ';
        ctx.append(`(cell, cell) ${fn(`__gen_${t.name}_init_child`)}(${[`cell sys'`, ...init.args.map((v) => resolveFuncType(v.type, ctx) + ' ' + id(v.name))].join(', ')})${modifier}{`);
        ctx.inIndent(() => {
            ctx.write(`
                slice sc' = sys'.begin_parse();
                cell source = sc'~load_dict();
                cell contracts = new_dict();

                ;; Contract Code: ${t.name}
                cell mine = ${ctx.used(`__tact_dict_get_code`)}(source, ${t.uid});
                contracts = ${ctx.used(`__tact_dict_set_code`)}(contracts, ${t.uid}, mine);
            `);

            // Copy contracts code
            for (let c of t.dependsOn) {
                ctx.append();
                ctx.write(`
                    ;; Contract Code: ${c.name}
                    cell code_${c.uid} = __tact_dict_get_code(source, ${c.uid});
                    contracts = ${ctx.used(`__tact_dict_set_code`)}(contracts, ${c.uid}, code_${c.uid});
                `);
            }

            // Build cell
            ctx.append();
            ctx.append(`;; Build cell`);
            ctx.append(`builder b = begin_cell();`);
            ctx.append(`b = b.store_ref(begin_cell().store_dict(contracts).end_cell());`);
            ctx.append(`b = b.store_int(false, 1);`);
            let args = t.init!.args.length > 0 ? ['b', '(' + t.init!.args.map((a) => id(a.name)).join(', ') + ')'].join(', ') : 'b, null()';
            ctx.append(`b = ${ops.writer(`$init$${t.name}`, ctx)}(${args});`);
            ctx.append(`return (mine, b.end_cell());`);
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
            ctx.append(`builder b = begin_cell();`);
            ctx.append(`b = b.store_ref(sys');`);
            ctx.append(`b = b.store_int(false, 1);`);
            let args = type.init!.args.length > 0 ? ['b', '(' + type.init!.args.map((a) => id(a.name)).join(', ') + ')'].join(', ') : 'b, null()';
            ctx.append(`b = ${ops.writer(`$init$${type.name}`, ctx)}(${args});`);
            ctx.append(`return b.end_cell();`);
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
            ctx.append(`slice msg_sender_addr = ${ctx.used('__tact_verify_address')}(cs~load_msg_addr());`);
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
        ctx.append();

        // Deployed
        ctx.append(`_ lazy_deployment_completed() {`);
        ctx.inIndent(() => {
            ctx.append(`return get_data().begin_parse().load_int(1);`);
        });
        ctx.append(`}`);
        ctx.append();
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
        wctx.header('\n' + fc.code);
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