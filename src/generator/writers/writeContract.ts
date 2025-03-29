import {
    enabledInline,
    enabledInterfacesGetter,
    enabledInternalExternalReceiversOutsideMethodsMap,
    enabledIpfsAbiGetter,
    enabledLazyDeploymentCompletedGetter,
    enabledOptimizedChildCode,
} from "../../config/features";
import type { InitDescription, TypeDescription } from "../../types/types";
import type { WriterContext } from "../Writer";
import { funcIdOf, funcInitIdOf } from "./id";
import { ops } from "./ops";
import { resolveFuncPrimitive } from "./resolveFuncPrimitive";
import { resolveFuncType } from "./resolveFuncType";
import { resolveFuncTypeUnpack } from "./resolveFuncTypeUnpack";
import { writeValue } from "./writeExpression";
import { writeGetter, writeStatement } from "./writeFunction";
import { writeInterfaces } from "./writeInterfaces";
import {
    groupContractReceivers,
    writeBouncedRouter,
    writeNonBouncedRouter,
    writeOpcodeCheckers,
} from "./writeRouter";
import { resolveFuncTypeFromAbiUnpack } from "./resolveFuncTypeFromAbiUnpack";
import { getAllocation } from "../../storage/resolveAllocation";

export type ContractsCodes = Record<
    string,
    | {
          codeBoc: Buffer;
          abi: string;
      }
    | undefined
>;

export function writeContractStorageOps(
    contract: TypeDescription,
    wCtx: WriterContext,
) {
    // Load function
    wCtx.fun(ops.contractLoad(contract.name, wCtx), () => {
        wCtx.signature(
            `${resolveFuncType(contract, wCtx)} ${ops.contractLoad(contract.name, wCtx)}()`,
        );
        wCtx.flag("impure");
        wCtx.flag("inline");
        wCtx.context("type:" + contract.name + "$init");
        wCtx.body(() => {
            // Load data slice
            wCtx.append(`slice $sc = get_data().begin_parse();`);

            // Load context
            if (
                contract.dependsOn.length > 0 &&
                !enabledOptimizedChildCode(wCtx.ctx)
            ) {
                wCtx.append(`__tact_child_contract_codes = $sc~load_ref();`);
            }

            if (contract.init?.kind !== "contract-params") {
                wCtx.append(`int $loaded = $sc~load_int(1);`);

                // Load data
                wCtx.inBlock("if ($loaded)", () => {
                    if (contract.fields.length > 0) {
                        wCtx.append(
                            `return $sc~${ops.reader(contract.name, "with-opcode", wCtx)}();`,
                        );
                    } else {
                        wCtx.append(`return null();`);
                    }
                });
                wCtx.inBlock("else", () => {
                    // Load arguments
                    if (contract.init!.params.length > 0) {
                        wCtx.append(
                            `(${contract.init!.params.map((v) => resolveFuncType(v.type, wCtx) + " " + funcIdOf(v.name)).join(", ")}) = $sc~${ops.reader(funcInitIdOf(contract.name), "with-opcode", wCtx)}();`,
                        );
                        wCtx.append(`$sc.end_parse();`);
                    }

                    // Execute init function
                    wCtx.append(
                        `return ${ops.contractInit(contract.name, wCtx)}(${[...contract.init!.params.map((v) => funcIdOf(v.name))].join(", ")});`,
                    );
                });
            } else {
                if (contract.fields.length > 0) {
                    wCtx.append(
                        `return $sc~${ops.reader(contract.name, "with-opcode", wCtx)}();`,
                    );
                } else {
                    wCtx.append(`return null();`);
                }
            }
        });
    });

    // Store function
    wCtx.fun(ops.contractStore(contract.name, wCtx), () => {
        const sig = `() ${ops.contractStore(contract.name, wCtx)}(${resolveFuncType(contract, wCtx)} v)`;
        wCtx.signature(sig);
        wCtx.flag("impure");
        wCtx.flag("inline");
        wCtx.context("type:" + contract.name + "$init");
        wCtx.body(() => {
            wCtx.append(`builder b = begin_cell();`);

            // Persist system cell
            if (
                contract.dependsOn.length > 0 &&
                !enabledOptimizedChildCode(wCtx.ctx)
            ) {
                wCtx.append(`b = b.store_ref(__tact_child_contract_codes);`);
            }

            if (contract.init?.kind !== "contract-params") {
                // Persist deployment flag
                wCtx.append(`b = b.store_int(true, 1);`);
            }

            // Build data
            if (contract.fields.length > 0) {
                wCtx.append(`b = ${ops.writer(contract.name, wCtx)}(b, v);`);
            }

            // Persist data
            wCtx.append(`set_data(b.end_cell());`);
        });
    });
}

export function writeInit(
    t: TypeDescription,
    init: InitDescription,
    ctx: WriterContext,
    codes: ContractsCodes,
) {
    ctx.fun(ops.contractInit(t.name, ctx), () => {
        const args = init.params.map(
            (v) => resolveFuncType(v.type, ctx) + " " + funcIdOf(v.name),
        );
        const sig = `${resolveFuncType(t, ctx)} ${ops.contractInit(t.name, ctx)}(${args.join(", ")})`;
        ctx.signature(sig);
        ctx.flag("impure");
        ctx.flag("inline");
        ctx.body(() => {
            // Unpack parameters
            for (const a of init.params) {
                if (!resolveFuncPrimitive(a.type, ctx)) {
                    ctx.append(
                        `var (${resolveFuncTypeUnpack(a.type, funcIdOf(a.name), ctx)}) = ${funcIdOf(a.name)};`,
                    );
                }
            }

            // Generate self initial tensor
            const initValues: string[] = [];
            t.fields.forEach((tField) => {
                let init = "null()";
                if (tField.default !== undefined) {
                    init = writeValue(tField.default!, ctx);
                }
                initValues.push(init);
            });
            if (initValues.length > 0) {
                // Special case for empty contracts
                ctx.append(
                    `var (${resolveFuncTypeUnpack(t, funcIdOf("self"), ctx)}) = (${initValues.join(", ")});`,
                );
            } else {
                ctx.append(`tuple ${funcIdOf("self")} = null();`);
            }

            // Generate statements
            const returns = resolveFuncTypeUnpack(t, funcIdOf("self"), ctx);
            for (const s of init.ast.statements) {
                if (s.kind === "statement_return") {
                    ctx.append(`return ${returns};`);
                } else {
                    writeStatement(s, returns, null, ctx);
                }
            }

            // Return result
            if (
                init.ast.statements.length === 0 ||
                init.ast.statements[init.ast.statements.length - 1]!.kind !==
                    "statement_return"
            ) {
                ctx.append(`return ${returns};`);
            }
        });
    });

    const codeBoc = codes[t.name]?.codeBoc;
    ctx.fun(ops.contractChildGetCode(t.name, ctx), () => {
        if (typeof codeBoc === "undefined") {
            ctx.comment(
                "This function should be removed by the compiler. If you see it in your code, please report it at https://github.com/tact-lang/tact/issues",
            );
        }
        ctx.signature(`cell ${ops.contractChildGetCode(t.name, ctx)}()`);
        ctx.context("type:" + t.name + "$init");
        ctx.flag("inline");
        ctx.flag("impure");

        const boc =
            typeof codeBoc === "undefined"
                ? "internal bug, please report to https://github.com/tact-lang/tact/issues"
                : codeBoc.toString("hex");
        ctx.asm("", `B{${boc}} B>boc PUSHREF`);
    });

    ctx.fun(ops.contractInitChild(t.name, ctx), () => {
        const args = init.params.map(
            (v) => resolveFuncType(v.type, ctx) + " " + funcIdOf(v.name),
        );
        const sig = `(cell, cell) ${ops.contractInitChild(t.name, ctx)}(${args.join(", ")})`;
        ctx.signature(sig);
        if (enabledInline(ctx.ctx)) {
            ctx.flag("inline");
        }
        ctx.context("type:" + t.name + "$init");
        ctx.flag("inline");
        ctx.body(() => {
            ctx.append(";; Build init code cell");
            ctx.append();
            if (t.name === ctx.name) {
                // The contract wants to deploy its copy
                ctx.write(`
                    ;; Contract Code: ${t.name}
                    cell init_code = my_code();
                `);
                ctx.append();
                ctx.append(";; Build init data cell");
                ctx.append();
                ctx.append("builder b = begin_cell();");
                if (
                    t.dependsOn.length > 0 &&
                    !enabledOptimizedChildCode(ctx.ctx)
                ) {
                    ctx.append("b = b.store_ref(__tact_child_contract_codes);");
                }
            } else {
                if (!enabledOptimizedChildCode(ctx.ctx)) {
                    ctx.write(`
                        slice sc' = __tact_child_contract_codes.begin_parse();
                        cell source = sc'~load_dict();
                    `);
                    ctx.write(`
                        ;; Contract Code: ${t.name}
                        cell init_code = ${ctx.used("__tact_dict_get_code")}(source, ${t.uid});
                    `);
                } else {
                    ctx.write(`
                        ;; Contract Code: ${t.name}
                        cell init_code = ${ops.contractChildGetCode(t.name, ctx)}();
                    `);
                }
                ctx.append();
                if (!enabledOptimizedChildCode(ctx.ctx)) {
                    ctx.append(";; Build init data cell");
                    if (t.dependsOn.length > 0) {
                        ctx.write(`
                            cell contracts = new_dict();
                        `);
                    }
                    // Copy contracts code
                    for (const c of t.dependsOn) {
                        ctx.append();
                        ctx.append(`;; Contract Code: ${c.name}`);
                        if (c.name === ctx.name) {
                            ctx.append(
                                `contracts = ${ctx.used("__tact_dict_set_code")}(contracts, ${c.uid}, my_code());`,
                            );
                        } else {
                            ctx.write(`
                                cell code_${c.uid} = ${ctx.used("__tact_dict_get_code")}(source, ${c.uid});
                                contracts = ${ctx.used("__tact_dict_set_code")}(contracts, ${c.uid}, code_${c.uid});
                            `);
                        }
                    }
                }
                ctx.append();
                ctx.append("builder b = begin_cell();");
                if (
                    !enabledOptimizedChildCode(ctx.ctx) &&
                    t.dependsOn.length > 0
                ) {
                    ctx.append(
                        `b = b.store_ref(begin_cell().store_dict(contracts).end_cell());`,
                    );
                }
            }

            // store initialization bit and contract variables
            if (init.kind !== "contract-params") {
                ctx.append(`b = b.store_int(false, 1);`);
            }
            const args =
                t.init!.params.length > 0
                    ? [
                          "b",
                          "(" +
                              t
                                  .init!.params.map((a) => funcIdOf(a.name))
                                  .join(", ") +
                              ")",
                      ].join(", ")
                    : "b, null()";
            ctx.append(
                `b = ${ops.writer(funcInitIdOf(t.name), ctx)}(${args});`,
            );
            ctx.append(`return (init_code, b.end_cell());`);
        });
    });

    ctx.fun(ops.contractCodeChild(t.name, ctx), () => {
        const sig = `cell ${ops.contractCodeChild(t.name, ctx)}()`;
        ctx.signature(sig);
        ctx.flag("inline");
        ctx.context("type:" + t.name + "$init");
        ctx.body(() => {
            if (!enabledOptimizedChildCode(ctx.ctx)) {
                ctx.write(`
                    slice sc' = __tact_child_contract_codes.begin_parse();
                    cell source = sc'~load_dict();
                    ;; Contract Code: ${t.name}
                    return ${ctx.used("__tact_dict_get_code")}(source, ${t.uid});
                `);
            } else {
                ctx.write(`
                    return ${ctx.used(ops.contractChildGetCode(t.name, ctx))}();
                `);
            }
        });
    });
}

export function writeMainContract(
    contract: TypeDescription,
    abiLink: string,
    wCtx: WriterContext,
) {
    // Main field
    wCtx.main(() => {
        wCtx.append(`;;`);
        wCtx.append(`;; Get methods of a Contract ${contract.name}`);
        wCtx.append(`;;`);
        wCtx.append();

        // Getters
        for (const f of contract.functions.values()) {
            if (f.isGetter) {
                writeGetter(f, wCtx);
            }
        }

        // Interfaces
        if (enabledInterfacesGetter(wCtx.ctx)) {
            writeInterfaces(contract, wCtx);
        }

        // ABI
        if (enabledIpfsAbiGetter(wCtx.ctx)) {
            wCtx.append(`_ get_abi_ipfs() method_id {`);
            wCtx.inIndent(() => {
                wCtx.append(`return "${abiLink}";`);
            });
            wCtx.append(`}`);
            wCtx.append();
        }

        if (
            enabledLazyDeploymentCompletedGetter(wCtx.ctx) &&
            contract.init?.kind !== "contract-params"
        ) {
            // Deployed
            wCtx.append(`_ lazy_deployment_completed() method_id {`);
            wCtx.inIndent(() => {
                wCtx.append(`return get_data().begin_parse().load_int(1);`);
            });
            wCtx.append(`}`);
            wCtx.append();
        }

        wCtx.append(`;;`);
        wCtx.append(`;; Routing of a Contract ${contract.name}`);
        wCtx.append(`;;`);
        wCtx.append();

        const contractReceivers = groupContractReceivers(contract);

        writeOpcodeCheckers(contractReceivers, contract, wCtx);
        wCtx.append();

        // Render internal receiver
        wCtx.inBlock(
            "() recv_internal(int msg_value, cell in_msg_cell, slice in_msg) impure",
            () => {
                wCtx.append();
                wCtx.append(`;; Context`);
                wCtx.append(`var cs = in_msg_cell.begin_parse();`);
                wCtx.append(`cs~skip_bits(2);`); // skip int_msg_info$0 ihr_disabled:Bool
                wCtx.append(`var msg_bounceable = cs~load_int(1);`); // bounce:Bool
                wCtx.append(`var msg_bounced = cs~load_int(1);`); // bounced:Bool
                wCtx.append(`slice msg_sender_addr = cs~load_msg_addr();`);
                wCtx.append(
                    `__tact_context = (msg_bounceable, msg_sender_addr, msg_value, cs);`,
                );
                wCtx.append(`__tact_context_sender = msg_sender_addr;`);
                wCtx.append();

                writeLoadContractVariables(contract, wCtx);

                writeBouncedRouter(contractReceivers.bounced, contract, wCtx);

                writeNonBouncedRouter(
                    contractReceivers.internal,
                    contract,
                    wCtx,
                );
            },
        );
        wCtx.append();

        // Render external receiver
        const hasExternal = !(
            contractReceivers.external.binary.length === 0 &&
            contractReceivers.external.comment.length === 0 &&
            typeof contractReceivers.external.commentFallback === "undefined" &&
            typeof contractReceivers.external.empty === "undefined" &&
            typeof contractReceivers.external.fallback === "undefined"
        );
        if (hasExternal) {
            wCtx.inBlock("() recv_external(slice in_msg) impure", () => {
                writeLoadContractVariables(contract, wCtx);

                writeNonBouncedRouter(
                    contractReceivers.external,
                    contract,
                    wCtx,
                );
            });
        }

        // fift injection, protected by a feature flag
        if (enabledInternalExternalReceiversOutsideMethodsMap(wCtx.ctx)) {
            wCtx.append(`
() __tact_selector_hack_asm() impure asm """
@atend @ 1 {
        execute current@ context@ current!
        {
            // The core idea of this function is to save gas by avoiding unnecessary dict jump, when recv_internal/recv_external is called
            // We want to extract recv_internal/recv_external from the dict and select needed function
            // not by jumping to the needed function by it's index, but by using usual IF statements.
            
            }END> b> // Close previous builder, now we have a cell of previous code on top of the stack
            
            <{ // Start of the new code builder
                SETCP0
                // Swap the new code builder with the previous code, now we have previous code on top of the stack
                swap
                // Transform cell to slice and load first ref from the previous code, now we have the dict on top of the stack
                <s ref@`);
            if (hasExternal) {
                wCtx.append(`
                // Extract the recv_external from the dict
                dup -1 swap @procdictkeylen idict@ { "internal shortcut error" abort } ifnot 
                swap`);
            }

            wCtx.append(`
                // Extract the recv_internal from the dict
                dup 0 swap @procdictkeylen idict@ { "internal shortcut error" abort } ifnot 
                swap
                
                // Delete the recv_internal from the dict
                0 swap @procdictkeylen idict- drop 
                // Delete the recv_external from the dict (it's okay if it's not there)
                -1 swap @procdictkeylen idict- drop 
                // Delete the __tact_selector_hack from the dict
                65535 swap @procdictkeylen idict- drop 

                // Bring the code builder from the bottom of the stack
                // because if recv_external extraction is optional, and the number of elements on the stack is not fixed
                depth 1- roll
                // Swap with the dict from which we extracted recv_internal and (maybe) recv_external
                swap
                
                // Check if the dict is empty
                dup null?
                // Store a copy of this flag in the bottom of the stack
                dup depth 1- -roll 
                {
                    // If the dict is empty, just drop it (it will be null if it's empty)
                    drop 
                } 
                {
                    // If the dict is not empty, prepare continuation to be stored in c3
                    <{
                        // Save this dict as first ref in this continuation, it will be pushed in runtime by DICTPUSHCONST
                        swap @procdictkeylen DICTPUSHCONST
                        // Jump to the needed function by it's index
                        DICTIGETJMPZ
                        // If such key is not found, throw 11 along with the key as an argument
                        11 THROWARG
                    }> PUSHCONT
                    // Store the continuation in c3
                    c3 POP
                } cond
                
                // Function id is on top of the (runtime) stack
                DUP IFNOTJMP:<{
                    // place recv_internal here
                    DROP swap @addop
                }>`);

            if (hasExternal) {
                wCtx.append(`
                DUP INC IFNOTJMP:<{
                    // place recv_external here
                    DROP swap @addop
                }>`);
            }

            wCtx.append(`
                // Bring back the flag, indicating if the dict is empty or not from the bottom of the stack
                depth 1- roll 
                { 
                    // If the dict is empty, throw 11
                    11 THROWARG 
                } 
                { 
                    // If the dict is not empty, jump to continuation from c3
                    c3 PUSH JMPX 
                } cond 
            }> b>
        } : }END>c
        current@ context! current!
    } does @atend !
""";`);

            wCtx.append(`
() __tact_selector_hack() method_id(65535) {
    return __tact_selector_hack_asm();
}`);
        }
    });
}

function writeLoadContractVariables(
    contract: TypeDescription,
    wCtx: WriterContext,
): void {
    wCtx.append(";; Load contract data");
    const contractVariables = resolveFuncTypeFromAbiUnpack(
        "$self",
        getAllocation(wCtx.ctx, contract.name).ops,
        wCtx,
    );
    wCtx.append(
        `var ${contractVariables} = ${ops.contractLoad(contract.name, wCtx)}();`,
    );
    wCtx.append();
}
