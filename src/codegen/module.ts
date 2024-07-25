import { getAllTypes, getType } from "../types/resolveDescriptors";
import { enabledInline, enabledMasterchain } from "../config/features";
import { LiteralGen, Location } from ".";
import {
    ReceiverDescription,
    TypeDescription,
    InitDescription,
    TypeRef,
    FunctionDescription,
} from "../types/types";
import { CompilerContext } from "../context";
import { getSortedTypes } from "../storage/resolveAllocation";
import { getMethodId } from "../utils/utils";
import { idTextErr } from "../errors";
import { contractErrors } from "../abi/errors";
import { writeStdlib } from "./stdlib";
import {
    resolveFuncTypeUnpack,
    resolveFuncType,
    resolveFuncTupleType,
} from "./type";
import { resolveFuncPrimitive } from "./primitive";
import { getSupportedInterfaces } from "../types/getSupportedInterfaces";
import { funcIdOf, funcInitIdOf, ops } from "./util";
import {
    UNIT_TYPE,
    FuncAstModule,
    FuncAstStmt,
    FuncAstFunctionAttribute,
    FuncType,
    FuncAstVarDefStmt,
    FuncAstFunctionDefinition,
    FuncAstExpr,
} from "../func/syntax";
import {
    cr,
    unop,
    comment,
    FunParamValue,
    assign,
    expr,
    unit,
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
    ternary,
    FunAttr,
    vardef,
    mod,
    condition,
    id,
} from "../func/syntaxConstructors";
import { FunctionGen, StatementGen, WriterContext } from ".";
import { beginCell } from "@ton/core";

import JSONbig from "json-bigint";

export function commentPseudoOpcode(comment: string): string {
    return beginCell()
        .storeUint(0, 32)
        .storeBuffer(Buffer.from(comment, "utf8"))
        .endCell()
        .hash()
        .toString("hex", 0, 64);
}

export function unwrapExternal(
    ctx: CompilerContext,
    targetName: string,
    sourceName: string,
    type: TypeRef,
): FuncAstVarDefStmt {
    if (type.kind === "ref") {
        const t = getType(ctx, type.name);
        if (t.kind === "struct") {
            if (type.optional) {
                return vardef(
                    resolveFuncType(ctx, type),
                    targetName,
                    call(ops.typeFromOptTuple(t.name), [id(sourceName)]),
                );
            } else {
                return vardef(
                    resolveFuncType(ctx, type),
                    targetName,
                    call(ops.typeFromTuple(t.name), [id(sourceName)]),
                );
            }
        } else if (t.kind === "primitive_type_decl" && t.name === "Address") {
            if (type.optional) {
                const init = ternary(
                    call("null?", [id(sourceName)]),
                    call("null", []),
                    call("__tact_verify_address", [id(sourceName)]),
                );
                return vardef(resolveFuncType(ctx, type), targetName, init);
            } else {
                return vardef(
                    resolveFuncType(ctx, type),
                    targetName,
                    call("__tact_verify_address", [id(sourceName)]),
                );
            }
        }
    }
    return vardef(resolveFuncType(ctx, type), targetName, id(sourceName));
}

/**
 * Encapsulates generation of the main Func compilation module from the main Tact module.
 */
export class ModuleGen {
    private constructor(
        private ctx: WriterContext,
        private contractName: string,
        private abiLink: string,
    ) {}

    static fromTact(
        ctx: WriterContext,
        contractName: string,
        abiLink: string,
    ): ModuleGen {
        return new ModuleGen(ctx, contractName, abiLink);
    }

    /**
     * Adds stdlib definitions to the generated module.
     */
    private writeStdlib(m: FuncAstModule): void {
        writeStdlib(this.ctx);
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
        return this.ctx.fun(
            [FunAttr.method_id()],
            "supported_interfaces",
            [],
            Type.hole(),
            [ret(tensor(...shiftExprs))],
            { inMainContract: true },
        );
    }

    /**
     * Adds the init function and the init utility function to the context.
     *
     * TODO: Create two separate functions when refactoring
     */
    private writeInit(t: TypeDescription, init: InitDescription) {
        {
            const returnTy = resolveFuncType(this.ctx.ctx, t);
            const funName = ops.contractInit(t.name);
            const paramValues: FunParamValue[] = init.params.map((v) => [
                funcIdOf(v.name),
                resolveFuncType(this.ctx.ctx, v.type),
            ]);
            const attrs = [FunAttr.impure()];
            const body: FuncAstStmt[] = [];

            // Unpack parameters
            for (const a of init.params) {
                if (!resolveFuncPrimitive(this.ctx.ctx, a.type)) {
                    body.push(
                        vardef(
                            undefined,
                            resolveFuncTypeUnpack(
                                this.ctx.ctx,
                                a.type,
                                funcIdOf(a.name),
                            ),
                            id(funcIdOf(a.name)),
                        ),
                    );
                }
            }

            // Generate self initial tensor
            const initValues: FuncAstExpr[] = t.fields.map((tField) =>
                tField.default === undefined
                    ? call("null", [])
                    : LiteralGen.fromTact(
                          this.ctx,
                          tField.default!,
                      ).writeValue(),
            );
            if (initValues.length > 0) {
                // Special case for empty contracts
                body.push(
                    vardef(
                        undefined,
                        resolveFuncTypeUnpack(
                            this.ctx.ctx,
                            t,
                            funcIdOf("self"),
                        ),
                        tensor(...initValues),
                    ),
                );
            } else {
                body.push(
                    vardef(Type.tuple(), funcIdOf("self"), call("null", [])),
                );
            }

            // Generate statements
            const returns = resolveFuncTypeUnpack(
                this.ctx.ctx,
                t,
                funcIdOf("self"),
            );
            for (const s of init.ast.statements) {
                body.push(
                    StatementGen.fromTact(
                        this.ctx,
                        s,
                        returns,
                    ).writeStatement(),
                );
            }

            // Return result
            if (
                init.ast.statements.length === 0 ||
                init.ast.statements[init.ast.statements.length - 1]!.kind !==
                    "statement_return"
            ) {
                body.push(ret(id(returns)));
            }

            this.ctx.fun(attrs, funName, paramValues, returnTy, body);
        }

        {
            const returnTy = Type.tensor(Type.cell(), Type.cell());
            const funName = ops.contractInitChild(t.name);
            const paramValues: FunParamValue[] = [
                ["sys", Type.cell()],
                ...init.params.map(
                    (v) =>
                        [
                            funcIdOf(v.name),
                            resolveFuncType(this.ctx.ctx, v.type),
                        ] as FunParamValue,
                ),
            ];
            const attrs = [
                ...(enabledInline(this.ctx.ctx) ? [FunAttr.inline()] : []),
            ];
            const body: FuncAstStmt[] = [];

            // slice sc' = sys'.begin_parse();
            // cell source = sc'~load_dict();
            // cell contracts = new_dict();
            //
            // ;; Contract Code: ${t.name}
            // cell mine = __tact_dict_get_code(source, ${t.uid});
            // contracts = __tact_dict_set_code(contracts, ${t.uid}, mine);
            body.push(
                vardef(
                    Type.slice(),
                    "sc'",
                    call("begin_parse", [], { receiver: id("sys'") }),
                ),
            );
            body.push(vardef(Type.cell(), "source", call("sc'~load_dict", [])));
            body.push(vardef(Type.cell(), "contracts", call("new_dict", [])));
            body.push(cr());
            body.push(comment(`Contract Code: ${t.name}`));
            body.push(
                vardef(
                    Type.cell(),
                    "mine",
                    call("__tact_dict_get_code", [id("source"), number(t.uid)]),
                ),
            );
            body.push(
                expr(
                    assign(
                        id("contracts"),
                        call("__tact_dict_set_code", [
                            id("contracts"),
                            number(t.uid),
                            id("mine"),
                        ]),
                    ),
                ),
            );

            // Copy contracts code
            for (const c of t.dependsOn) {
                // ;; Contract Code: ${c.name}
                // cell code_${c.uid} = __tact_dict_get_code(source, ${c.uid});
                // contracts = __tact_dict_set_code(contracts, ${c.uid}, code_${c.uid});
                body.push(cr());
                body.push(comment(`Contract Code: ${c.name}`));
                body.push(
                    vardef(
                        Type.cell(),
                        `code_${c.uid}`,
                        call("__tact_dict_get_code", [
                            id("source"),
                            number(c.uid),
                        ]),
                    ),
                );
                body.push(
                    expr(
                        assign(
                            id("contracts"),
                            call("__tact_dict_set_code", [
                                id("contracts"),
                                number(c.uid),
                                id(`code_${c.uid}`),
                            ]),
                        ),
                    ),
                );
            }

            // Build cell
            body.push(cr());
            body.push(comment("Build cell"));
            body.push(vardef(Type.builder(), "b", call("begin_cell", [])));
            // b = b.store_ref(begin_cell().store_dict(contracts).end_cell());
            body.push(
                expr(
                    assign(
                        id("b"),
                        call(
                            "store_ref",
                            [
                                call("end_cell", [], {
                                    receiver: call(
                                        "store_dict",
                                        [id("contracts")],
                                        { receiver: call("begin_cell", []) },
                                    ),
                                }),
                            ],
                            { receiver: id("b") },
                        ),
                    ),
                ),
            );
            // b = b.store_int(false, 1);
            body.push(
                expr(
                    assign(
                        id("b"),
                        call("store_int", [bool(false), number(1)], {
                            receiver: id("b"),
                        }),
                    ),
                ),
            );
            const args =
                t.init!.params.length > 0
                    ? [
                          call(
                              "b",
                              t.init!.params.map((a) => id(funcIdOf(a.name))),
                          ),
                      ]
                    : [id("b"), call("null", [])];
            body.push(
                expr(
                    assign(
                        id("b"),
                        call(`${ops.writer(funcInitIdOf(t.name))}`, args),
                    ),
                ),
            );
            body.push(
                ret(
                    tensor(
                        id("mine"),
                        call("end_cell", [], { receiver: id("b") }),
                    ),
                ),
            );

            this.ctx.fun(attrs, funName, paramValues, returnTy, body, {
                context: Location.type("type:" + t.name + "$init"),
            });
        }
    }

    /**
     * Adds functions defined within the Tact contract to the generated Func module.
     * TODO: Why do we need function from *all* the contracts?
     */
    private addContractFunctions(m: FuncAstModule, c: TypeDescription): void {
        m.entries.push(comment("", `Contract ${c.name} functions`, ""));

        if (c.init) {
            this.writeInit(c, c.init);
        }

        for (const tactFun of c.functions.values()) {
            const funcFun = FunctionGen.fromTact(this.ctx).writeFunction(
                tactFun,
            );
            // TODO: Should we really put them here?
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
        const attrs: FuncAstFunctionAttribute[] = [
            FunAttr.impure(),
            FunAttr.inline_ref(),
        ];
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
            functionBody.push(comment("Handle bounced messages"));
            const body: FuncAstStmt[] = [];
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
            functionBody.push(cr());
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
        functionBody.push(cr());

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
                functionBody.push(cr());
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
            functionBody.push(cr());
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

        return this.ctx.fun(attrs, name, paramValues, returnTy, functionBody, {
            inMainContract: true,
        });
    }

    private writeReceiver(
        self: TypeDescription,
        f: ReceiverDescription,
    ): FuncAstFunctionDefinition {
        const selector = f.selector;
        const selfRes = resolveFuncTypeUnpack(
            this.ctx.ctx,
            self,
            funcIdOf("self"),
        );
        const selfType = resolveFuncType(this.ctx.ctx, self);
        const selfUnpack = vardef(
            undefined,
            resolveFuncTypeUnpack(this.ctx.ctx, self, funcIdOf("self")),
            id(funcIdOf("self")),
        );

        // Binary receiver
        if (
            selector.kind === "internal-binary" ||
            selector.kind === "external-binary"
        ) {
            const returnTy = Type.tensor(selfType, UNIT_TYPE);
            const funName = ops.receiveType(
                self.name,
                selector.kind === "internal-binary" ? "internal" : "external",
                selector.type,
            );
            const paramValues: FunParamValue[] = [
                [funcIdOf("self"), selfType],
                [
                    funcIdOf(selector.name),
                    resolveFuncType(this.ctx.ctx, selector.type),
                ],
            ];
            const attrs: FuncAstFunctionAttribute[] = [
                FunAttr.impure(),
                FunAttr.inline(),
            ];
            const body: FuncAstStmt[] = [selfUnpack];
            body.push(
                vardef(
                    undefined,
                    resolveFuncTypeUnpack(
                        this.ctx.ctx,
                        selector.type,
                        funcIdOf(selector.name),
                    ),
                    id(funcIdOf(selector.name)),
                ),
            );
            f.ast.statements.forEach((s) =>
                body.push(
                    StatementGen.fromTact(
                        this.ctx,
                        s,
                        selfRes,
                    ).writeStatement(),
                ),
            );
            if (
                f.ast.statements.length === 0 ||
                f.ast.statements[f.ast.statements.length - 1]!.kind !==
                    "statement_return"
            ) {
                body.push(ret(tensor(id(selfRes), unit())));
            }
            return this.ctx.fun(attrs, funName, paramValues, returnTy, body, {
                inMainContract: true,
            });
        }

        // Empty receiver
        if (
            selector.kind === "internal-empty" ||
            selector.kind === "external-empty"
        ) {
            const returnTy = Type.tensor(selfType, UNIT_TYPE);
            const funName = ops.receiveEmpty(
                self.name,
                selector.kind === "internal-empty" ? "internal" : "external",
            );
            const paramValues: FunParamValue[] = [[funcIdOf("self"), selfType]];
            const attrs: FuncAstFunctionAttribute[] = [
                FunAttr.impure(),
                FunAttr.inline(),
            ];
            const body: FuncAstStmt[] = [selfUnpack];
            f.ast.statements.forEach((s) =>
                body.push(
                    StatementGen.fromTact(
                        this.ctx,
                        s,
                        selfRes,
                    ).writeStatement(),
                ),
            );
            if (
                f.ast.statements.length === 0 ||
                f.ast.statements[f.ast.statements.length - 1]!.kind !==
                    "statement_return"
            ) {
                body.push(ret(tensor(id(selfRes), unit())));
            }
            return this.ctx.fun(attrs, funName, paramValues, returnTy, body, {
                inMainContract: true,
            });
        }

        // Comment receiver
        if (
            selector.kind === "internal-comment" ||
            selector.kind === "external-comment"
        ) {
            const hash = commentPseudoOpcode(selector.comment);
            const returnTy = Type.tensor(selfType, UNIT_TYPE);
            const funName = ops.receiveText(
                self.name,
                selector.kind === "internal-comment" ? "internal" : "external",
                hash,
            );
            const paramValues: FunParamValue[] = [[funcIdOf("self"), selfType]];
            const attrs: FuncAstFunctionAttribute[] = [
                FunAttr.impure(),
                FunAttr.inline(),
            ];
            const body: FuncAstStmt[] = [selfUnpack];
            f.ast.statements.forEach((s) =>
                body.push(
                    StatementGen.fromTact(
                        this.ctx,
                        s,
                        selfRes,
                    ).writeStatement(),
                ),
            );
            if (
                f.ast.statements.length === 0 ||
                f.ast.statements[f.ast.statements.length - 1]!.kind !==
                    "statement_return"
            ) {
                body.push(ret(tensor(id(selfRes), unit())));
            }
            return this.ctx.fun(attrs, funName, paramValues, returnTy, body, {
                inMainContract: true,
            });
        }

        // Fallback
        if (
            selector.kind === "internal-comment-fallback" ||
            selector.kind === "external-comment-fallback"
        ) {
            const returnTy = Type.tensor(selfType, UNIT_TYPE);
            const funName = ops.receiveAnyText(
                self.name,
                selector.kind === "internal-comment-fallback"
                    ? "internal"
                    : "external",
            );
            const paramValues: FunParamValue[] = [
                [funcIdOf("self"), selfType],
                [funcIdOf(selector.name), Type.slice()],
            ];
            const attrs: FuncAstFunctionAttribute[] = [
                FunAttr.impure(),
                FunAttr.inline(),
            ];
            const body: FuncAstStmt[] = [selfUnpack];
            f.ast.statements.forEach((s) =>
                body.push(
                    StatementGen.fromTact(
                        this.ctx,
                        s,
                        selfRes,
                    ).writeStatement(),
                ),
            );
            if (
                f.ast.statements.length === 0 ||
                f.ast.statements[f.ast.statements.length - 1]!.kind !==
                    "statement_return"
            ) {
                body.push(ret(tensor(id(selfRes), unit())));
            }
            return this.ctx.fun(attrs, funName, paramValues, returnTy, body, {
                inMainContract: true,
            });
        }

        // Fallback
        if (selector.kind === "internal-fallback") {
            const returnTy = Type.tensor(selfType, UNIT_TYPE);
            const funName = ops.receiveAny(self.name, "internal");
            const paramValues: FunParamValue[] = [
                [funcIdOf("self"), selfType],
                [funcIdOf(selector.name), Type.slice()],
            ];
            const attrs: FuncAstFunctionAttribute[] = [
                FunAttr.impure(),
                FunAttr.inline(),
            ];
            const body: FuncAstStmt[] = [selfUnpack];
            f.ast.statements.forEach((s) =>
                body.push(
                    StatementGen.fromTact(
                        this.ctx,
                        s,
                        selfRes,
                    ).writeStatement(),
                ),
            );
            if (
                f.ast.statements.length === 0 ||
                f.ast.statements[f.ast.statements.length - 1]!.kind !==
                    "statement_return"
            ) {
                body.push(ret(tensor(id(selfRes), unit())));
            }
            return this.ctx.fun(attrs, funName, paramValues, returnTy, body, {
                inMainContract: true,
            });
        }

        // Bounced
        if (selector.kind === "bounce-fallback") {
            const returnTy = Type.tensor(selfType, UNIT_TYPE);
            const funName = ops.receiveBounceAny(self.name);
            const paramValues: FunParamValue[] = [
                [funcIdOf("self"), selfType],
                [funcIdOf(selector.name), Type.slice()],
            ];
            const attrs: FuncAstFunctionAttribute[] = [
                FunAttr.impure(),
                FunAttr.inline(),
            ];
            const body: FuncAstStmt[] = [selfUnpack];
            f.ast.statements.forEach((s) =>
                body.push(
                    StatementGen.fromTact(
                        this.ctx,
                        s,
                        selfRes,
                    ).writeStatement(),
                ),
            );
            if (
                f.ast.statements.length === 0 ||
                f.ast.statements[f.ast.statements.length - 1]!.kind !==
                    "statement_return"
            ) {
                body.push(ret(tensor(id(selfRes), unit())));
            }
            return this.ctx.fun(attrs, funName, paramValues, returnTy, body, {
                inMainContract: true,
            });
        }

        if (selector.kind === "bounce-binary") {
            const returnTy = Type.tensor(selfType, UNIT_TYPE);
            const funName = ops.receiveTypeBounce(self.name, selector.type);
            const paramValues: FunParamValue[] = [
                [funcIdOf("self"), selfType],
                [
                    funcIdOf(selector.name),
                    resolveFuncType(
                        this.ctx.ctx,
                        selector.type,
                        false,
                        selector.bounced,
                    ),
                ],
            ];
            const attrs: FuncAstFunctionAttribute[] = [
                FunAttr.impure(),
                FunAttr.inline(),
            ];
            const body: FuncAstStmt[] = [selfUnpack];
            body.push(
                vardef(
                    undefined,
                    resolveFuncTypeUnpack(
                        this.ctx.ctx,
                        selector.type,
                        funcIdOf(selector.name),
                        false,
                        selector.bounced,
                    ),
                    id(funcIdOf(selector.name)),
                ),
            );
            f.ast.statements.forEach((s) =>
                body.push(
                    StatementGen.fromTact(
                        this.ctx,
                        s,
                        selfRes,
                    ).writeStatement(),
                ),
            );
            if (
                f.ast.statements.length === 0 ||
                f.ast.statements[f.ast.statements.length - 1]!.kind !==
                    "statement_return"
            ) {
                body.push(ret(tensor(id(selfRes), unit())));
            }
            return this.ctx.fun(attrs, funName, paramValues, returnTy, body, {
                inMainContract: true,
            });
        }

        throw new Error(
            `Unknown selector ${selector.kind}:\n${JSONbig.stringify(selector, null, 2)}`,
        );
    }

    private writeGetter(f: FunctionDescription): FuncAstFunctionDefinition {
        // Render tensors
        const self = f.self !== null ? getType(this.ctx.ctx, f.self) : null;
        if (!self) {
            throw new Error(`No self type for getter ${idTextErr(f.name)}`); // Impossible
        }
        const returnTy = Type.hole();
        const funName = `%${f.name}`;
        const paramValues: FunParamValue[] = f.params.map((v) => [
            funcIdOf(v.name),
            resolveFuncTupleType(this.ctx.ctx, v.type),
        ]);
        const attrs = [FunAttr.method_id(getMethodId(f.name))];

        const body: FuncAstStmt[] = [];
        // Unpack parameters
        for (const param of f.params) {
            unwrapExternal(
                this.ctx.ctx,
                funcIdOf(param.name),
                funcIdOf(param.name),
                param.type,
            );
        }
        // Load contract state
        body.push(
            vardef(undefined, "self", call(ops.contractLoad(self.name), [])),
        );
        // Execute get method
        body.push(
            vardef(
                undefined,
                "res",
                call(
                    `self~${ops.extension(self.name, f.name)}`,
                    f.params.map((v) => id(funcIdOf(v.name))),
                ),
            ),
        );
        // Pack if needed
        if (f.returns.kind === "ref") {
            const t = getType(this.ctx.ctx, f.returns.name);
            if (t.kind === "struct") {
                if (f.returns.optional) {
                    body.push(
                        ret(call(ops.typeToOptExternal(t.name), [id("res")])),
                    );
                } else {
                    body.push(
                        ret(call(ops.typeToExternal(t.name), [id("res")])),
                    );
                }
                return this.ctx.fun(
                    attrs,
                    funName,
                    paramValues,
                    returnTy,
                    body,
                    { inMainContract: true },
                );
            }
        }
        // Return result
        body.push(ret(id("res")));
        return this.ctx.fun(attrs, funName, paramValues, returnTy, body, {
            inMainContract: true,
        });
    }

    private makeInternalReceiver(
        type: TypeDescription,
    ): FuncAstFunctionDefinition {
        // () recv_internal(int msg_value, cell in_msg_cell, slice in_msg) impure
        const returnTy = UNIT_TYPE;
        const funName = "recv_internal";
        const paramValues: FunParamValue[] = [
            ["msg_value", Type.int()],
            ["in_msg_cell", Type.cell()],
            ["in_msg", Type.slice()],
        ];
        const attrs = [FunAttr.impure()];
        const body: FuncAstStmt[] = [];

        // Load context
        body.push(comment("Context"));
        body.push(
            vardef(
                undefined,
                "cs",
                call("begin_parse", [], { receiver: id("in_msg_cell") }),
            ),
        );
        body.push(
            vardef(undefined, "msg_flags", call("cs~load_uint", [number(4)])),
        ); // int_msg_info$0 ihr_disabled:Bool bounce:Bool bounced:Bool
        body.push(
            vardef(
                undefined,
                "msg_bounced",
                unop("-", binop(id("msg_flags"), "&", number(1))),
            ),
        );
        body.push(
            vardef(
                Type.slice(),
                id("msg_sender_addr"),
                call("__tact_verify_address", [call("cs~load_msg_addr", [])]),
            ),
        );
        body.push(
            expr(
                assign(
                    id("__tact_context"),
                    tensor(
                        id("msg_bounced"),
                        id("msg_sender_addr"),
                        id("msg_value"),
                        id("cs"),
                    ),
                ),
            ),
        );
        body.push(
            expr(assign(id("__tact_context_sender"), id("msg_sender_addr"))),
        );
        body.push(cr());

        // Load self
        body.push(comment("Load contract data"));
        body.push(
            vardef(undefined, "self", call(ops.contractLoad(type.name), [])),
        );
        body.push(cr());

        // Process operation
        body.push(comment("Handle operation"));
        body.push(
            vardef(
                Type.int(),
                id("handled"),
                call(`self~${ops.contractRouter(type.name, "internal")}`, [
                    id("msg_bounced"),
                    id("in_msg"),
                ]),
            ),
        );
        body.push(cr());

        // Throw if not handled
        body.push(comment("Throw if not handled"));
        body.push(
            expr(
                call("throw_unless", [
                    number(contractErrors.invalidMessage.id),
                    id("handled"),
                ]),
            ),
        );
        body.push(cr());

        // Persist state
        body.push(comment("Persist state"));
        body.push(expr(call(ops.contractStore(type.name), [id("self")])));

        return this.ctx.fun(attrs, funName, paramValues, returnTy, body, {
            inMainContract: true,
        });
    }

    private makeExternalReceiver(
        type: TypeDescription,
    ): FuncAstFunctionDefinition {
        // () recv_external(slice in_msg) impure
        const returnTy = UNIT_TYPE;
        const funName = "recv_internal";
        const paramValues: FunParamValue[] = [
            ["msg_value", Type.int()],
            ["in_msg_cell", Type.cell()],
            ["in_msg", Type.slice()],
        ];
        const attrs = [FunAttr.impure()];
        const body: FuncAstStmt[] = [];

        // Load self
        body.push(comment("Load contract data"));
        body.push(
            vardef(undefined, "self", call(ops.contractLoad(type.name), [])),
        );
        body.push(cr());

        // Process operation
        body.push(comment("Handle operation"));
        body.push(
            vardef(
                Type.int(),
                id("handled"),
                call(`self~${ops.contractRouter(type.name, "external")}`, [
                    id("in_msg"),
                ]),
            ),
        );
        body.push(cr());

        // Throw if not handled
        body.push(comment("Throw if not handled"));
        body.push(
            expr(
                call("throw_unless", [
                    number(contractErrors.invalidMessage.id),
                    id("handled"),
                ]),
            ),
        );
        body.push(cr());

        // Persist state
        body.push(comment("Persist state"));
        body.push(expr(call(ops.contractStore(type.name), [id("self")])));

        return this.ctx.fun(attrs, funName, paramValues, returnTy, body, {
            inMainContract: true,
        });
    }

    /**
     * Adds entries from the main Tact contract creating a program containing the entrypoint.
     *
     * XXX: In the old backend, they simply push multiply functions here, creating an entry
     * for a non-existent `$main` function.
     */
    private writeMainContract(
        m: FuncAstModule,
        contractTy: TypeDescription,
    ): void {
        m.entries.push(
            comment("", `Receivers of a Contract ${contractTy.name}`, ""),
        );

        // Write receivers
        for (const r of Object.values(contractTy.receivers)) {
            m.entries.push(this.writeReceiver(contractTy, r));
        }

        m.entries.push(
            comment("", `Get methods of a Contract ${contractTy.name}`, ""),
        );

        // Getters
        for (const f of contractTy.functions.values()) {
            if (f.isGetter) {
                m.entries.push(this.writeGetter(f));
            }
        }

        // Interfaces
        m.entries.push(this.writeInterfaces(contractTy));

        // ABI:
        // _ get_abi_ipfs() method_id {
        //   return "${abiLink}";
        // }
        m.entries.push(
            this.ctx.fun(
                [FunAttr.method_id()],
                "get_abi_ipfs",
                [],
                Type.hole(),
                [ret(string(this.abiLink))],
                { inMainContract: true },
            ),
        );

        // Deployed
        //_ lazy_deployment_completed() method_id {
        //   return get_data().begin_parse().load_int(1);
        // }
        m.entries.push(
            this.ctx.fun(
                [FunAttr.method_id()],
                "lazy_deployment_completed",
                [],
                Type.hole(),
                [
                    ret(
                        call("load_int", [number(1)], {
                            receiver: call("begin_parse", [], {
                                receiver: call("get_data", []),
                            }),
                        }),
                    ),
                ],
                { inMainContract: true },
            ),
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

        // Render internal receiver
        m.entries.push(this.makeInternalReceiver(contractTy));
        if (hasExternal) {
            // Render external receiver
            m.entries.push(this.makeExternalReceiver(contractTy));
        }
    }

    public writeAll(): FuncAstModule {
        const m: FuncAstModule = mod();

        const allTypes = Object.values(getAllTypes(this.ctx.ctx));
        const contracts = allTypes.filter((v) => v.kind === "contract");
        const contract = contracts.find((v) => v.name === this.contractName);
        if (contract === undefined) {
            throw Error(`Contract "${this.contractName}" not found`);
        }

        this.writeStdlib(m);
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
