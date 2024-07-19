import { getAllTypes, getType } from "../types/resolveDescriptors";
import { TypeDescription } from "../types/types";
import { getSortedTypes } from "../storage/resolveAllocation";
import { getSupportedInterfaces } from "../types/getSupportedInterfaces";
import { ops } from "./util";
import {
    FuncAstModule,
    FuncAstStmt,
    FuncAstFunctionAttribute,
    FuncType,
    FuncAstFunctionDefinition,
    FuncAstExpr,
} from "../func/syntax";
import {
    comment,
    assign,
    expr,
    call,
    binop,
    bool,
    number,
    hexnumber,
    string,
    fun,
    ret,
    tensor,
    Type,
    vardef,
    mod,
    condition,
    id,
} from "../func/syntaxConstructors";
import { resolveFuncType } from "./type";
import { FunctionGen, CodegenContext } from ".";
import { beginCell } from "@ton/core";

/**
 * Encapsulates generation of the main Func compilation module from the main Tact module.
 */
export class ModuleGen {
    private constructor(
        private ctx: CodegenContext,
        private contractName: string,
        private abiLink: string,
    ) {}

    static fromTact(
        ctx: CodegenContext,
        contractName: string,
        abiLink: string,
    ): ModuleGen {
        return new ModuleGen(ctx, contractName, abiLink);
    }

    /**
     * Adds stdlib definitions to the generated module.
     */
    private addStdlib(_m: FuncAstModule): void {
        // TODO
    }

    private addSerializers(_m: FuncAstModule): void {
        const sortedTypes = getSortedTypes(this.ctx.ctx);
        for (const t of sortedTypes) {
        }
    }

    private addAccessors(_m: FuncAstModule): void {
        // TODO
    }

    private addInitSerializer(_m: FuncAstModule): void {
        // TODO
    }

    private addStorageFunctions(_m: FuncAstModule): void {
        // TODO
    }

    private addStaticFunctions(_m: FuncAstModule): void {
        // TODO
    }

    private addExtensions(_m: FuncAstModule): void {
        // TODO
    }

    /**
     * Generates a method that returns the supported interfaces, e.g.:
     * ```
     * _ supported_interfaces() method_id {
     *     return (
     *         "org.ton.introspection.v0"H >> 128,
     *         "org.ton.abi.ipfs.v0"H >> 128,
     *         "org.ton.deploy.lazy.v0"H >> 128,
     *         "org.ton.chain.workchain.v0"H >> 128);
     * }
     * ```
     */
    private writeInterfaces(type: TypeDescription): FuncAstFunctionDefinition {
        const supported: string[] = [];
        supported.push("org.ton.introspection.v0");
        supported.push(...getSupportedInterfaces(type, this.ctx.ctx));
        const shiftExprs: FuncAstExpr[] = supported.map((item) =>
            binop(string(item, "H"), ">>", number(128)),
        );
        return fun(
            ["method_id"],
            "supported_interfaces",
            [],
            Type.hole(),
            [ret(tensor(...shiftExprs))],
        );
    }

    /**
     * Adds functions defined within the Tact contract to the generated Func module.
     * TODO: Why do we need function from *all* the contracts?
     */
    private addContractFunctions(m: FuncAstModule, c: TypeDescription): void {
        m.entries.push(comment("", `Contract ${c.name} functions`, ""));

        for (const tactFun of c.functions.values()) {
            const funcFun = FunctionGen.fromTact(this.ctx).writeFunction(
                tactFun,
            );
            m.entries.push(funcFun);
        }
    }

    private commentPseudoOpcode(comment: string): string {
        return beginCell()
            .storeUint(0, 32)
            .storeBuffer(Buffer.from(comment, "utf8"))
            .endCell()
            .hash()
            .toString("hex", 0, 64);
    }

    // TODO: refactor this bs asap:
    //  + two different functions depending on `kind`
    //  + extract methods
    //  + separate file
    private writeRouter(
        type: TypeDescription,
        kind: "internal" | "external",
    ): FuncAstFunctionDefinition {
        const internal = kind === "internal";
        const attrs: FuncAstFunctionAttribute[] = ["impure", "inline_ref"];
        const name = ops.contractRouter(type.name, kind);
        const returnTy = Type.tensor(
            resolveFuncType(this.ctx.ctx, type),
            Type.int(),
        );
        const paramValues: [string, FuncType][] = internal
            ? [
                  ["self", resolveFuncType(this.ctx.ctx, type)],
                  ["msg_bounced", Type.int()],
                  ["in_msg", Type.slice()],
              ]
            : [
                  ["self", resolveFuncType(this.ctx.ctx, type)],
                  ["in_msg", Type.slice()],
              ];
        const functionBody: FuncAstStmt[] = [];

        // ;; Handle bounced messages
        // if (msg_bounced) {
        //   ...
        // }
        if (internal) {
            const body: FuncAstStmt[] = [];
            body.push(comment("Handle bounced messages"));
            const bounceReceivers = type.receivers.filter((r) => {
                return r.selector.kind === "bounce-binary";
            });

            const fallbackReceiver = type.receivers.find((r) => {
                return r.selector.kind === "bounce-fallback";
            });

            const condBody: FuncAstStmt[] = [];
            if (fallbackReceiver ?? bounceReceivers.length > 0) {
                // ;; Skip 0xFFFFFFFF
                // in_msg~skip_bits(32);
                condBody.push(comment("Skip 0xFFFFFFFF"));
                condBody.push(expr(call("in_msg~skip_bits", [number(32)])));
            }

            if (bounceReceivers.length > 0) {
                // ;; Parse op
                // int op = 0;
                // if (slice_bits(in_msg) >= 32) {
                //   op = in_msg.preload_uint(32);
                // }
                condBody.push(comment("Parse op"));
                condBody.push(vardef(Type.int(), "op", number(0)));
                condBody.push(
                    condition(
                        binop(
                            call("slice_bits", [id("in_msg")]),
                            ">=",
                            number(30),
                        ),
                        [
                            expr(
                                assign(
                                    id("op"),
                                    call(id("in_msg.preload_uint"), [
                                        number(32),
                                    ]),
                                ),
                            ),
                        ],
                    ),
                );
            }

            for (const r of bounceReceivers) {
                const selector = r.selector;
                if (selector.kind !== "bounce-binary")
                    throw Error(`Invalid selector type: ${selector.kind}`); // Should not happen
                body.push(
                    comment(`Bounced handler for ${selector.type} message`),
                );
                // XXX: We assert `header` to be non-null only in the new backend; otherwise it could be a compiler bug
                body.push(
                    condition(
                        binop(
                            id("op"),
                            "==",
                            number(
                                getType(this.ctx.ctx, selector.type).header!,
                            ),
                        ),
                        [
                            vardef(
                                undefined,
                                "msg",
                                call(
                                    id(
                                        `in_msg~${selector.bounced ? ops.readerBounced(selector.type) : ops.reader(selector.type)}`,
                                    ),
                                    [],
                                ),
                            ),
                            expr(
                                call(
                                    id(
                                        `self~${ops.receiveTypeBounce(type.name, selector.type)}`,
                                    ),
                                    [id("msg")],
                                ),
                            ),
                            ret(tensor(id("self"), bool(true))),
                        ],
                    ),
                );
            }

            if (fallbackReceiver) {
                const selector = fallbackReceiver.selector;
                if (selector.kind !== "bounce-fallback")
                    throw Error("Invalid selector type: " + selector.kind);
                body.push(comment("Fallback bounce receiver"));
                body.push(
                    expr(
                        call(id(`self~${ops.receiveBounceAny(type.name)}`), [
                            id("in_msg"),
                        ]),
                    ),
                );
                body.push(ret(tensor(id("self"), bool(true))));
            } else {
                body.push(ret(tensor(id("self"), bool(true))));
            }
            const cond = condition(id("msg_bounced"), body);
            functionBody.push(cond);
        }

        // ;; Parse incoming message
        // int op = 0;
        // if (slice_bits(in_msg) >= 32) {
        //   op = in_msg.preload_uint(32);
        // }
        functionBody.push(comment("Parse incoming message"));
        functionBody.push(vardef(Type.int(), "op", number(0)));
        functionBody.push(
            condition(
                binop(call(id("slice_bits"), [id("in_msg")]), ">=", number(32)),
                [
                    expr(
                        assign(
                            id("op"),
                            call("in_msg.preload_uint", [number(32)]),
                        ),
                    ),
                ],
            ),
        );

        // Non-empty receivers
        for (const f of type.receivers) {
            const selector = f.selector;

            // Generic receiver
            if (
                selector.kind ===
                (internal ? "internal-binary" : "external-binary")
            ) {
                const allocation = getType(this.ctx.ctx, selector.type);
                if (!allocation.header) {
                    throw Error(`Invalid allocation: ${selector.type}`);
                }
                functionBody.push(comment(`Receive ${selector.type} message`));
                functionBody.push(
                    condition(
                        binop(id("op"), "==", number(allocation.header)),
                        [
                            vardef(
                                undefined,
                                "msg",
                                call(`in_msg~${ops.reader(selector.type)}`, []),
                            ),
                            expr(
                                call(
                                    `self~${ops.receiveType(type.name, kind, selector.type)}`,
                                    [id("msg")],
                                ),
                            ),
                        ],
                    ),
                );
            }

            if (
                selector.kind ===
                (internal ? "internal-empty" : "external-empty")
            ) {
                // ;; Receive empty message
                // if ((op == 0) & (slice_bits(in_msg) <= 32)) {
                //   self~${ops.receiveEmpty(type.name, kind)}();
                //   return (self, true);
                // }
                functionBody.push(comment("Receive empty message"));
                functionBody.push(
                    condition(
                        binop(
                            binop(id("op"), "==", number(0)),
                            "&",
                            binop(
                                call("slice_bits", [id("in_msg")]),
                                "<=",
                                number(32),
                            ),
                        ),
                        [
                            expr(
                                call(
                                    `self~${ops.receiveEmpty(type.name, kind)}`,
                                    [],
                                ),
                            ),
                            ret(tensor(id("self"), bool(true))),
                        ],
                    ),
                );
            }
        }

        // Text resolvers
        const hasComments = !!type.receivers.find((v) =>
            internal
                ? v.selector.kind === "internal-comment" ||
                  v.selector.kind === "internal-comment-fallback"
                : v.selector.kind === "external-comment" ||
                  v.selector.kind === "external-comment-fallback",
        );
        if (hasComments) {
            // ;; Text Receivers
            // if (op == 0) {
            //   ...
            // }
            functionBody.push(comment("Text Receivers"));
            const cond = binop(id("op"), "==", number(0));
            const condBody: FuncAstStmt[] = [];
            if (
                type.receivers.find(
                    (v) =>
                        v.selector.kind ===
                        (internal ? "internal-comment" : "external-comment"),
                )
            ) {
                // var text_op = slice_hash(in_msg);
                condBody.push(
                    vardef(
                        undefined,
                        "text_op",
                        call("slice_hash", [id("in_msg")]),
                    ),
                );
                for (const r of type.receivers) {
                    if (
                        r.selector.kind ===
                        (internal ? "internal-comment" : "external-comment")
                    ) {
                        // ;; Receive "increment" message
                        // if (text_op == 0xc4f8d72312edfdef5b7bec7833bdbb162d1511bd78a912aed0f2637af65572ae) {
                        //     self~$A$_internal_text_c4f8d72312edfdef5b7bec7833bdbb162d1511bd78a912aed0f2637af65572ae();
                        //     return (self, true);
                        // }
                        const hash = this.commentPseudoOpcode(
                            r.selector.comment,
                        );
                        condBody.push(
                            comment(`Receive "${r.selector.comment}" message`),
                        );
                        condBody.push(
                            condition(
                                binop(
                                    id("text_op"),
                                    "==",
                                    hexnumber(`0x${hash}`),
                                ),
                                [
                                    expr(
                                        call(
                                            `self~${ops.receiveText(type.name, kind, hash)}`,
                                            [],
                                        ),
                                    ),
                                    ret(tensor(id("self"), bool(true))),
                                ],
                            ),
                        );
                    }
                }
            }

            // Comment fallback resolver
            const fallback = type.receivers.find(
                (v) =>
                    v.selector.kind ===
                    (internal
                        ? "internal-comment-fallback"
                        : "external-comment-fallback"),
            );
            if (fallback) {
                condBody.push(
                    condition(
                        binop(
                            call("slice_bits", [id("in_msg")]),
                            ">=",
                            number(32),
                        ),
                        [
                            expr(
                                call(
                                    id(
                                        `self~${ops.receiveAnyText(type.name, kind)}`,
                                    ),
                                    [call("in_msg.skip_bits", [number(32)])],
                                ),
                            ),
                            ret(tensor(id("self"), bool(true))),
                        ],
                    ),
                );
            }
            functionBody.push(condition(cond, condBody));
        }

        // Fallback
        const fallbackReceiver = type.receivers.find(
            (v) =>
                v.selector.kind ===
                (internal ? "internal-fallback" : "external-fallback"),
        );
        if (fallbackReceiver) {
            // ;; Receiver fallback
            // self~${ops.receiveAny(type.name, kind)}(in_msg);
            // return (self, true);
            functionBody.push(comment("Receiver fallback"));
            functionBody.push(
                expr(
                    call(`self~${ops.receiveAny(type.name, kind)}`, [
                        id("in_msg"),
                    ]),
                ),
            );
            functionBody.push(ret(tensor(id("self"), bool(true))));
        } else {
            // return (self, false);
            functionBody.push(ret(tensor(id("self"), bool(false))));
        }

        return fun(attrs, name, paramValues, returnTy, functionBody);
    }

    /**
     * Adds entries from the main Tact contract.
     */
    private writeMainContract(
        m: FuncAstModule,
        contractTy: TypeDescription,
    ): void {
        m.entries.push(
            comment("", `Receivers of a Contract ${contractTy.name}`, ""),
        );

        // // Write receivers
        // for (const r of Object.values(c.receivers)) {
        //     this.writeReceiver(type, r, ctx);
        // }

        m.entries.push(
            comment("", `Get methods of a Contract ${contractTy.name}`, ""),
        );

        // // Getters
        // for (const f of type.functions.values()) {
        //     if (f.isGetter) {
        //         writeGetter(f, ctx);
        //     }
        // }

        // Interfaces
        m.entries.push(this.writeInterfaces(contractTy));

        // ABI:
        // _ get_abi_ipfs() method_id {
        //   return "${abiLink}";
        // }
        m.entries.push(
            fun(["method_id"], "get_abi_ipfs", [], Type.hole(), [
                ret(string(this.abiLink)),
            ]),
        );

        // Deployed
        //_ lazy_deployment_completed() method_id {
        //   return get_data().begin_parse().load_int(1);
        // }
        m.entries.push(
            fun(["method_id"], "lazy_deployment_completed", [], Type.hole(), [
                ret(
                    call("load_int", [number(1)], {
                        receiver: call("begin_parse", [], {
                            receiver: call("get_data", []),
                        }),
                    }),
                ),
            ]),
        );

        m.entries.push(
            comment("", `Routing of a Contract ${contractTy.name}`, ""),
        );
        const hasExternal = contractTy.receivers.find((v) =>
            v.selector.kind.startsWith("external-"),
        );
        m.entries.push(this.writeRouter(contractTy, "internal"));
        if (hasExternal) {
            m.entries.push(this.writeRouter(contractTy, "external"));
        }

        // // Render internal receiver
        // ctx.append(
        //     `() recv_internal(int msg_value, cell in_msg_cell, slice in_msg) impure {`,
        // );
        // ctx.inIndent(() => {
        //     // Load context
        //     ctx.append();
        //     ctx.append(`;; Context`);
        //     ctx.append(`var cs = in_msg_cell.begin_parse();`);
        //     ctx.append(`var msg_flags = cs~load_uint(4);`); // int_msg_info$0 ihr_disabled:Bool bounce:Bool bounced:Bool
        //     ctx.append(`var msg_bounced = -(msg_flags & 1);`);
        //     ctx.append(
        //         `slice msg_sender_addr = ${ctx.used("__tact_verify_address")}(cs~load_msg_addr());`,
        //     );
        //     ctx.append(
        //         `__tact_context = (msg_bounced, msg_sender_addr, msg_value, cs);`,
        //     );
        //     ctx.append(`__tact_context_sender = msg_sender_addr;`);
        //     ctx.append();
        //
        //     // Load self
        //     ctx.append(`;; Load contract data`);
        //     ctx.append(`var self = ${ops.contractLoad(type.name, ctx)}();`);
        //     ctx.append();
        //
        //     // Process operation
        //     ctx.append(`;; Handle operation`);
        //     ctx.append(
        //         `int handled = self~${ops.contractRouter(type.name, "internal")}(msg_bounced, in_msg);`,
        //     );
        //     ctx.append();
        //
        //     // Throw if not handled
        //     ctx.append(`;; Throw if not handled`);
        //     ctx.append(
        //         `throw_unless(${contractErrors.invalidMessage.id}, handled);`,
        //     );
        //     ctx.append();
        //
        //     // Persist state
        //     ctx.append(`;; Persist state`);
        //     ctx.append(`${ops.contractStore(type.name, ctx)}(self);`);
        // });
        // ctx.append("}");
        // ctx.append();
        //
        //     // Render external receiver
        //     if (hasExternal) {
        //         ctx.append(`() recv_external(slice in_msg) impure {`);
        //         ctx.inIndent(() => {
        //             // Load self
        //             ctx.append(`;; Load contract data`);
        //             ctx.append(`var self = ${ops.contractLoad(type.name, ctx)}();`);
        //             ctx.append();
        //
        //             // Process operation
        //             ctx.append(`;; Handle operation`);
        //             ctx.append(
        //                 `int handled = self~${ops.contractRouter(type.name, "external")}(in_msg);`,
        //             );
        //             ctx.append();
        //
        //             // Throw if not handled
        //             ctx.append(`;; Throw if not handled`);
        //             ctx.append(
        //                 `throw_unless(handled, ${contractErrors.invalidMessage.id});`,
        //             );
        //             ctx.append();
        //
        //             // Persist state
        //             ctx.append(`;; Persist state`);
        //             ctx.append(`${ops.contractStore(type.name, ctx)}(self);`);
        //         });
        //         ctx.append("}");
        //         ctx.append();
        //     }
        // });
    }

    public writeAll(): FuncAstModule {
        const m: FuncAstModule = mod();

        const allTypes = Object.values(getAllTypes(this.ctx.ctx));
        const contracts = allTypes.filter((v) => v.kind === "contract");
        const contract = contracts.find((v) => v.name === this.contractName);
        if (contract === undefined) {
            throw Error(`Contract "${this.contractName}" not found`);
        }

        this.addStdlib(m);
        this.addSerializers(m);
        this.addAccessors(m);
        this.addInitSerializer(m);
        this.addStorageFunctions(m);
        this.addStaticFunctions(m);
        this.addExtensions(m);
        contracts.forEach((c) => this.addContractFunctions(m, c));
        this.writeMainContract(m, contract);

        return m;
    }
}
