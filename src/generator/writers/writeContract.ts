import {
    enabledInline,
    enabledInterfacesGetter,
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
} from "./writeRouter";
import type { ItemOrigin } from "../../imports/source";
import { resolveFuncTypeFromAbiUnpack } from "./resolveFuncTypeFromAbiUnpack";
import { getAllocation } from "../../storage/resolveAllocation";
import { contractErrors } from "../../abi/errors";

const SMALL_CONTRACT_MAX_FIELDS = 5;

export type ContractsCodes = Record<
    string,
    | {
          codeBoc: Buffer;
          abi: string;
      }
    | undefined
>;

export function writeStorageOps(
    type: TypeDescription,
    origin: ItemOrigin,
    ctx: WriterContext,
) {
    const isSmall = type.fields.length <= SMALL_CONTRACT_MAX_FIELDS;

    // Load function
    ctx.fun(ops.contractLoad(type.name, ctx), () => {
        ctx.signature(
            `${resolveFuncType(type, ctx)} ${ops.contractLoad(type.name, ctx)}()`,
        );
        ctx.flag("impure");
        if (isSmall) {
            ctx.flag("inline");
        }
        ctx.context("type:" + type.name + "$init");
        ctx.body(() => {
            // Load data slice
            ctx.append(`slice $sc = get_data().begin_parse();`);

            // Load context
            if (
                type.dependsOn.length > 0 &&
                !enabledOptimizedChildCode(ctx.ctx)
            ) {
                ctx.append(`__tact_child_contract_codes = $sc~load_ref();`);
            }

            if (type.init?.kind !== "contract-params") {
                ctx.append(`int $loaded = $sc~load_int(1);`);

                // Load data
                ctx.append(`if ($loaded) {`);
                ctx.inIndent(() => {
                    if (type.fields.length > 0) {
                        ctx.append(
                            `return $sc~${ops.reader(type.name, "with-opcode", ctx)}();`,
                        );
                    } else {
                        ctx.append(`return null();`);
                    }
                });
                ctx.append(`} else {`);
                ctx.inIndent(() => {
                    // Load arguments
                    if (type.init!.params.length > 0) {
                        ctx.append(
                            `(${type.init!.params.map((v) => resolveFuncType(v.type, ctx) + " " + funcIdOf(v.name)).join(", ")}) = $sc~${ops.reader(funcInitIdOf(type.name), "with-opcode", ctx)}();`,
                        );
                        ctx.append(`$sc.end_parse();`);
                    }

                    // Execute init function
                    ctx.append(
                        `return ${ops.contractInit(type.name, ctx)}(${[...type.init!.params.map((v) => funcIdOf(v.name))].join(", ")});`,
                    );
                });

                ctx.append(`}`);
            } else {
                if (type.fields.length > 0) {
                    ctx.append(
                        `return $sc~${ops.reader(type.name, "with-opcode", ctx)}();`,
                    );
                } else {
                    ctx.append(`return null();`);
                }
            }
        });
    });

    // Store function
    ctx.fun(ops.contractStore(type.name, ctx), () => {
        const sig = `() ${ops.contractStore(type.name, ctx)}(${resolveFuncType(type, ctx)} v)`;
        ctx.signature(sig);
        ctx.flag("impure");
        ctx.flag("inline");
        ctx.context("type:" + type.name + "$init");
        ctx.body(() => {
            ctx.append(`builder b = begin_cell();`);

            // Persist system cell
            if (
                type.dependsOn.length > 0 &&
                !enabledOptimizedChildCode(ctx.ctx)
            ) {
                ctx.append(`b = b.store_ref(__tact_child_contract_codes);`);
            }

            if (type.init?.kind !== "contract-params") {
                // Persist deployment flag
                ctx.append(`b = b.store_int(true, 1);`);
            }

            // Build data
            if (type.fields.length > 0) {
                ctx.append(`b = ${ops.writer(type.name, ctx)}(b, v);`);
            }

            // Persist data
            ctx.append(`set_data(b.end_cell());`);
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

        wCtx.append(";; message opcode reader utility");
        wCtx.append(
            `;; Returns 32 bit message opcode, otherwise throws the "Invalid incoming message" exit code`,
        );
        wCtx.append(
            `(slice, int) ~load_opcode(slice s) asm( -> 1 0) "32 LDUQ ${contractErrors.invalidMessage.id} THROWIFNOT";`,
        );

        wCtx.append(`;;`);
        wCtx.append(`;; Routing of a Contract ${contract.name}`);
        wCtx.append(`;;`);
        wCtx.append();

        const contractReceivers = groupContractReceivers(contract);

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

                // Load self
                wCtx.append(`;; Load contract data`);
                const contractVariables = resolveFuncTypeFromAbiUnpack(
                    "$self",
                    getAllocation(wCtx.ctx, contract.name).ops,
                    wCtx,
                );
                wCtx.append(
                    `var ${contractVariables} = ${ops.contractLoad(contract.name, wCtx)}();`,
                );
                wCtx.append();

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
                // Load self
                wCtx.append(`;; Load contract data`);
                const contractVariables = resolveFuncTypeFromAbiUnpack(
                    "$self",
                    getAllocation(wCtx.ctx, contract.name).ops,
                    wCtx,
                );
                wCtx.append(
                    `var ${contractVariables} = ${ops.contractLoad(contract.name, wCtx)}();`,
                );
                wCtx.append();

                writeNonBouncedRouter(
                    contractReceivers.external,
                    contract,
                    wCtx,
                );
            });
        }

        wCtx.append(`() __tact_selector_hack_asm() impure asm """
@atend @ 1 {
    execute current@ context@ current!
    {
        }END> b>
        
        <{
            SETCP0 DUP
            IFNOTJMP:<{
                DROP over <s ref@ 0 swap @procdictkeylen idict@ { "internal shortcut error" abort } ifnot @addop
            }>`);

        if (hasExternal) {
            wCtx.append(`DUP -1 EQINT IFJMP:<{
                DROP over <s ref@ -1 swap @procdictkeylen idict@ { "internal shortcut error" abort } ifnot @addop
            }>`);
        }

        wCtx.append(`swap <s ref@
            0 swap @procdictkeylen idict- drop
            -1 swap @procdictkeylen idict- drop
            65535 swap @procdictkeylen idict- drop

            @procdictkeylen DICTPUSHCONST DICTIGETJMPZ 11 THROWARG
        }> b>
    } : }END>c
    current@ context! current!
} does @atend !
""";`);

        wCtx.append(`() __tact_selector_hack() method_id(65535) {
    return __tact_selector_hack_asm();
}`);
    });
}
