import { beginCell } from "@ton/core";
import { getType } from "../../types/resolveDescriptors";
import { ReceiverDescription, TypeDescription } from "../../types/types";
import { WriterContext } from "../Writer";
import { funcIdOf } from "./id";
import { ops } from "./ops";
import { resolveFuncType } from "./resolveFuncTypeNew";
import { resolveFuncTypeUnpack } from "./resolveFuncTypeUnpack";
import { writeStatement } from "./writeFunction";
import { AstNumber } from "../../grammar/ast";
import {
    cr,
    comment,
    assign,
    expr,
    call,
    binop,
    bool,
    int,
    hex,
fun,
    ret,
    tensor,
    Type,
    FunAttr,
    vardef,
    condition,
    id,
} from "../../func/syntaxConstructors";
import {FuncAstFunctionAttribute, FuncAstType, FuncAstStatement} from "../../func/grammar";

export function commentPseudoOpcode(comment: string): string {
    return beginCell()
        .storeUint(0, 32)
        .storeBuffer(Buffer.from(comment, "utf8"))
        .endCell()
        .hash()
        .toString("hex", 0, 64);
}

export function writeRouter(
    type: TypeDescription,
    kind: "internal" | "external",
    ctx: WriterContext,
): void {
    const internal = kind === "internal";
    const attrs: FuncAstFunctionAttribute[] = [
        FunAttr.impure(),
        FunAttr.inline_ref(),
    ];
    const name = ops.contractRouter(type.name, kind);
    const returnTy = Type.tensor(
        resolveFuncType(type, false, false, ctx),
        Type.int(),
    );
    const paramValues: [string, FuncAstType][] = internal
        ? [
              ["self", resolveFuncType(type, false, false, ctx)],
              ["msg_bounced", Type.int()],
              ["in_msg", Type.slice()],
          ]
        : [
              ["self", resolveFuncType(type, false, false, ctx)],
              ["in_msg", Type.slice()],
          ];
    const functionBody: FuncAstStatement[] = [];

    // ;; Handle bounced messages
    // if (msg_bounced) {
    //   ...
    // }
    if (internal) {
        functionBody.push(comment("Handle bounced messages"));
        const body: FuncAstStatement[] = [];
        const bounceReceivers = type.receivers.filter((r) => {
            return r.selector.kind === "bounce-binary";
        });

        const fallbackReceiver = type.receivers.find((r) => {
            return r.selector.kind === "bounce-fallback";
        });

        const condBody: FuncAstStatement[] = [];
        if (fallbackReceiver ?? bounceReceivers.length > 0) {
            // ;; Skip 0xFFFFFFFF
            // in_msg~skip_bits(32);
            condBody.push(comment("Skip 0xFFFFFFFF"));
            condBody.push(expr(call("in_msg~skip_bits", tensor(int(32)))));
        }

        if (bounceReceivers.length > 0) {
            // ;; Parse op
            // int op = 0;
            // if (slice_bits(in_msg) >= 32) {
            //   op = in_msg.preload_uint(32);
            // }
            condBody.push(comment("Parse op"));
            condBody.push(vardef(Type.int(), "op", int(0)));
            condBody.push(
                condition(
                    binop(
                        call("slice_bits", tensor(id("in_msg"))),
                        ">=",
                        int(30),
                    ),
                    [
                        expr(
                            assign(
                                id("op"),
                                call(id("in_msg.preload_uint"), tensor(int(32))),
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
                        int(getType(ctx.ctx, selector.type).header!.value),
                    ),
                    [
                        vardef(
                            "_",
                            "msg",
                            call(
                                id(
                                    `in_msg~${selector.bounced ? ops.readerBounced(selector.type, ctx) : ops.reader(selector.type, ctx)}`,
                                ),
                                tensor(),
                            ),
                        ),
                        expr(
                            call(
                                id(
                                    `self~${ops.receiveTypeBounce(type.name, selector.type)}`,
                                ),
                                tensor(id("msg")),
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
                    call(id(`self~${ops.receiveBounceAny(type.name)}`), tensor(
                        id("in_msg"),
                    )),
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
    functionBody.push(vardef(Type.int(), "op", int(0)));
    functionBody.push(
        condition(
            binop(call(id("slice_bits"), tensor(id("in_msg"))), ">=", int(32)),
            [
                expr(
                    assign(
                        id("op"),
                        call("in_msg.preload_uint", tensor(int(32))),
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
            const allocation = getType(ctx.ctx, selector.type);
            if (!allocation.header) {
                throw Error(`Invalid allocation: ${selector.type}`);
            }
            functionBody.push(comment(`Receive ${selector.type} message`));
            functionBody.push(
                condition(binop(id("op"), "==", int(allocation.header.value)), [
                    vardef(
                        "_",
                        "msg",
                        call(`in_msg~${ops.reader(selector.type, ctx)}`, tensor()),
                    ),
                    expr(
                        call(
                            `self~${ops.receiveType(type.name, kind, selector.type)}`,
                            tensor(id("msg")),
                        ),
                    ),
                ]),
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
                        binop(id("op"), "==", int(0)),
                        "&",
                        binop(
                            call("slice_bits", tensor(id("in_msg"))),
                            "<=",
                            int(32),
                        ),
                    ),
                    [
                        expr(
                            call(
                                `self~${ops.receiveEmpty(type.name, kind)}`,
                                tensor(),
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
        const cond = binop(id("op"), "==", int(0));
        const condBody: FuncAstStatement[] = [];
        if (
            type.receivers.find(
                (v) =>
                    v.selector.kind ===
                    (internal ? "internal-comment" : "external-comment"),
            )
        ) {
            // var text_op = slice_hash(in_msg);
            condBody.push(
                vardef("_", "text_op", call("slice_hash", tensor(id("in_msg")))),
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
                    const hash = commentPseudoOpcode(
                        r.selector.comment,
                    );
                    condBody.push(
                        comment(`Receive "${r.selector.comment}" message`),
                    );
                    condBody.push(
                        condition(binop(id("text_op"), "==", hex(hash)), [
                            expr(
                                call(
                                    `self~${ops.receiveText(type.name, kind, hash)}`,
                                    tensor(),
                                ),
                            ),
                            ret(tensor(id("self"), bool(true))),
                        ]),
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
                        call("slice_bits", tensor(id("in_msg"))),
                        ">=",
                        int(32),
                    ),
                    [
                        expr(
                            call(
                                id(
                                    `self~${ops.receiveAnyText(type.name, kind)}`,
                                ),
                                tensor(call("in_msg.skip_bits", tensor(int(32)))),
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
                call(`self~${ops.receiveAny(type.name, kind)}`, tensor(
                    id("in_msg"),
                )),
            ),
        );
        functionBody.push(ret(tensor(id("self"), bool(true))));
    } else {
        // return (self, false);
        functionBody.push(ret(tensor(id("self"), bool(false))));
    }

    const receiver = fun(name, paramValues, attrs, returnTy, functionBody);
    ctx.appendNode(receiver);
}

function messageOpcode(n: AstNumber): string {
    // FunC does not support binary and octal numerals
    switch (n.base) {
        case 10:
            return n.value.toString(n.base);
        case 2:
        case 8:
        case 16:
            return `0x${n.value.toString(n.base)}`;
    }
}

export function writeReceiver(
    self: TypeDescription,
    f: ReceiverDescription,
    ctx: WriterContext,
) {
    const selector = f.selector;
    const selfRes = resolveFuncTypeUnpack(self, funcIdOf("self"), ctx);
    const selfType = resolveFuncType(self, false, false, ctx);
    const selfUnpack = `var ${resolveFuncTypeUnpack(self, funcIdOf("self"), ctx)} = ${funcIdOf("self")};`;

    // Binary receiver
    if (
        selector.kind === "internal-binary" ||
        selector.kind === "external-binary"
    ) {
        const args = [
            selfType + " " + funcIdOf("self"),
            resolveFuncType(selector.type, false, false, ctx) + " " + funcIdOf(selector.name),
        ];
        ctx.append(
            `((${selfType}), ()) ${ops.receiveType(self.name, selector.kind === "internal-binary" ? "internal" : "external", selector.type)}(${args.join(", ")}) impure inline {`,
        );
        ctx.inIndent(() => {
            ctx.append(selfUnpack);
            ctx.append(
                `var ${resolveFuncTypeUnpack(selector.type, funcIdOf(selector.name), ctx)} = ${funcIdOf(selector.name)};`,
            );

            for (const s of f.ast.statements) {
                writeStatement(s, selfRes, null, ctx);
            }

            if (
                f.ast.statements.length === 0 ||
                f.ast.statements[f.ast.statements.length - 1]!.kind !==
                    "statement_return"
            ) {
                ctx.append(`return (${selfRes}, ());`);
            }
        });
        ctx.append(`}`);
        ctx.append();
        return;
    }

    // Empty receiver
    if (
        selector.kind === "internal-empty" ||
        selector.kind === "external-empty"
    ) {
        ctx.append(
            `((${selfType}), ()) ${ops.receiveEmpty(self.name, selector.kind === "internal-empty" ? "internal" : "external")}(${selfType + " " + funcIdOf("self")}) impure inline {`,
        );
        ctx.inIndent(() => {
            ctx.append(selfUnpack);

            for (const s of f.ast.statements) {
                writeStatement(s, selfRes, null, ctx);
            }

            if (
                f.ast.statements.length === 0 ||
                f.ast.statements[f.ast.statements.length - 1]!.kind !==
                    "statement_return"
            ) {
                ctx.append(`return (${selfRes}, ());`);
            }
        });
        ctx.append(`}`);
        ctx.append();
        return;
    }

    // Comment receiver
    if (
        selector.kind === "internal-comment" ||
        selector.kind === "external-comment"
    ) {
        const hash = commentPseudoOpcode(selector.comment);
        ctx.append(
            `(${selfType}, ()) ${ops.receiveText(self.name, selector.kind === "internal-comment" ? "internal" : "external", hash)}(${selfType + " " + funcIdOf("self")}) impure inline {`,
        );
        ctx.inIndent(() => {
            ctx.append(selfUnpack);

            for (const s of f.ast.statements) {
                writeStatement(s, selfRes, null, ctx);
            }

            if (
                f.ast.statements.length === 0 ||
                f.ast.statements[f.ast.statements.length - 1]!.kind !==
                    "statement_return"
            ) {
                ctx.append(`return (${selfRes}, ());`);
            }
        });
        ctx.append(`}`);
        ctx.append();
        return;
    }

    // Fallback
    if (
        selector.kind === "internal-comment-fallback" ||
        selector.kind === "external-comment-fallback"
    ) {
        ctx.append(
            `(${selfType}, ()) ${ops.receiveAnyText(self.name, selector.kind === "internal-comment-fallback" ? "internal" : "external")}(${[selfType + " " + funcIdOf("self"), "slice " + funcIdOf(selector.name)].join(", ")}) impure inline {`,
        );
        ctx.inIndent(() => {
            ctx.append(selfUnpack);

            for (const s of f.ast.statements) {
                writeStatement(s, selfRes, null, ctx);
            }

            if (
                f.ast.statements.length === 0 ||
                f.ast.statements[f.ast.statements.length - 1]!.kind !==
                    "statement_return"
            ) {
                ctx.append(`return (${selfRes}, ());`);
            }
        });
        ctx.append(`}`);
        ctx.append();
        return;
    }

    // Fallback
    if (selector.kind === "internal-fallback") {
        ctx.append(
            `(${selfType}, ()) ${ops.receiveAny(self.name, "internal")}(${selfType} ${funcIdOf("self")}, slice ${funcIdOf(selector.name)}) impure inline {`,
        );
        ctx.inIndent(() => {
            ctx.append(selfUnpack);

            for (const s of f.ast.statements) {
                writeStatement(s, selfRes, null, ctx);
            }

            if (
                f.ast.statements.length === 0 ||
                f.ast.statements[f.ast.statements.length - 1]!.kind !==
                    "statement_return"
            ) {
                ctx.append(`return (${selfRes}, ());`);
            }
        });
        ctx.append(`}`);
        ctx.append();
        return;
    }

    // Bounced
    if (selector.kind === "bounce-fallback") {
        ctx.append(
            `(${selfType}, ()) ${ops.receiveBounceAny(self.name)}(${selfType} ${funcIdOf("self")}, slice ${funcIdOf(selector.name)}) impure inline {`,
        );
        ctx.inIndent(() => {
            ctx.append(selfUnpack);

            for (const s of f.ast.statements) {
                writeStatement(s, selfRes, null, ctx);
            }

            if (
                f.ast.statements.length === 0 ||
                f.ast.statements[f.ast.statements.length - 1]!.kind !==
                    "statement_return"
            ) {
                ctx.append(`return (${selfRes}, ());`);
            }
        });
        ctx.append(`}`);
        ctx.append();
        return;
    }

    if (selector.kind === "bounce-binary") {
        const args = [
            selfType + " " + funcIdOf("self"),
            resolveFuncType(selector.type,false, selector.bounced, ctx) +
                " " +
                funcIdOf(selector.name),
        ];
        ctx.append(
            `((${selfType}), ()) ${ops.receiveTypeBounce(self.name, selector.type)}(${args.join(", ")}) impure inline {`,
        );
        ctx.inIndent(() => {
            ctx.append(selfUnpack);
            ctx.append(
                `var ${resolveFuncTypeUnpack(selector.type, funcIdOf(selector.name), ctx, false, selector.bounced)} = ${funcIdOf(selector.name)};`,
            );

            for (const s of f.ast.statements) {
                writeStatement(s, selfRes, null, ctx);
            }

            if (
                f.ast.statements.length === 0 ||
                f.ast.statements[f.ast.statements.length - 1]!.kind !==
                    "statement_return"
            ) {
                ctx.append(`return (${selfRes}, ());`);
            }
        });
        ctx.append(`}`);
        ctx.append();
        return;
    }
}
