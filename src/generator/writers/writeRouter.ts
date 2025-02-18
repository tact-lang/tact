import { beginCell } from "@ton/core";
import { getType } from "../../types/resolveDescriptors";
import type { ReceiverDescription, TypeDescription } from "../../types/types";
import type { WriterContext } from "../Writer";
import { funcIdOf } from "./id";
import { ops } from "./ops";
import { resolveFuncType } from "./resolveFuncType";
import { resolveFuncTypeUnpack } from "./resolveFuncTypeUnpack";
import { writeStatement } from "./writeFunction";
import type { AstNumber } from "../../ast/ast";
import {
    throwCompilationError,
    throwInternal,
    throwInternalCompilerError,
} from "../../error/errors";
import type { SrcInfo } from "../../grammar";

type ContractReceivers = {
    readonly internal: Receivers;
    readonly external: Receivers;
    readonly bounced: BouncedReceivers;
};

// External or internal receivers
// Bounced receivers are not included because only internal receivers can be bounced
type Receivers = {
    kind: "internal" | "external";
    empty: ReceiverDescription | undefined;
    binary: ReceiverDescription[];
    comment: ReceiverDescription[];
    commentFallback: ReceiverDescription | undefined;
    fallback: ReceiverDescription | undefined;
};

type BouncedReceivers = {
    binary: ReceiverDescription[];
    fallback: ReceiverDescription | undefined;
};

export function writeRouter(
    contract: TypeDescription,
    wCtx: WriterContext,
): void {
    const contractReceivers: ContractReceivers =
        groupContractReceivers(contract);
    const contractFuncType = resolveFuncType(contract, wCtx);
    writeInternalRouter(
        contractReceivers.internal,
        contractReceivers.bounced,
        contract.name,
        contractFuncType,
        wCtx,
    );
    writeExternalRouter(
        contractReceivers.external,
        contract.name,
        contractFuncType,
        wCtx,
    );
}

function writeInternalRouter(
    internalReceivers: Receivers,
    bouncedReceivers: BouncedReceivers,
    contractName: string,
    contractFuncType: string,
    wCtx: WriterContext,
): void {
    wCtx.inBlock(
        `(${contractFuncType}, int) ${ops.contractRouter(contractName, "internal")}(${contractFuncType} self, slice in_msg, int msg_bounced) impure inline_ref`,
        () => {
            writeBouncedRouter(bouncedReceivers, contractName, wCtx);
            writeNonBouncedRouter(internalReceivers, contractName, wCtx);
        },
    );
}

function writeExternalRouter(
    externalReceivers: Receivers,
    contractName: string,
    contractFuncType: string,
    wCtx: WriterContext,
): void {
    // Special case: no external receivers at all
    if (
        externalReceivers.binary.length === 0 &&
        externalReceivers.comment.length === 0 &&
        typeof externalReceivers.commentFallback === "undefined" &&
        typeof externalReceivers.empty === "undefined" &&
        typeof externalReceivers.fallback === "undefined"
    ) {
        // do not write the signature of recv_external
        return;
    }

    wCtx.inBlock(
        `(${contractFuncType}, int) ${ops.contractRouter(contractName, "external")}(${contractFuncType} self, slice in_msg) impure inline_ref`,
        () => {
            writeNonBouncedRouter(externalReceivers, contractName, wCtx);
        },
    );
}

// empty string receiver (`receive("")`) is not allowed
function writeNonBouncedRouter(
    receivers: Receivers,
    contractName: string,
    wCtx: WriterContext,
): void {
    // - Special case: there are no receivers at all
    if (
        typeof receivers.empty === "undefined" &&
        receivers.binary.length === 0 &&
        receivers.comment.length === 0 &&
        typeof receivers.commentFallback === "undefined" &&
        typeof receivers.fallback === "undefined"
    ) {
        wCtx.append("return (self, false);");
        return;
    }

    // - Special case: only fallback receiver
    if (
        typeof receivers.fallback !== "undefined" &&
        receivers.binary.length === 0 &&
        receivers.comment.length === 0 &&
        typeof receivers.commentFallback === "undefined"
    ) {
        wCtx.append(
            `self~${ops.receiveAny(contractName, receivers.kind)}(in_msg);`,
        );
        wCtx.append("return (self, true);");
        return;
    }

    // - Special case: only binary receivers
    if (
        typeof receivers.empty === "undefined" &&
        receivers.comment.length === 0 &&
        typeof receivers.commentFallback === "undefined" &&
        typeof receivers.fallback === "undefined"
    ) {
        wCtx.append(`var (op, _) = in_msg~load_uint_quiet(32);`);

        receivers.binary.forEach((binRcv) => {
            wCtx.append();

            writeBinaryReceiver(
                binRcv,
                receivers.kind,
                true,
                contractName,
                wCtx,
            );
        });

        wCtx.append("return (self, false);");
        return;
    }

    // If there is a fallback receiver and binary/string receivers, we need to keep in_msg intact,
    // otherwise we can modify in_msg in-place
    const opcodeReader: "~load_uint" | ".preload_uint" =
        typeof receivers.fallback === "undefined"
            ? "~load_uint"
            : ".preload_uint";

    const doesHaveTextReceivers =
        receivers.comment.length > 0 ||
        typeof receivers.commentFallback !== "undefined";

    wCtx.append("int op = 0;");
    wCtx.append("int in_msg_length = slice_bits(in_msg);");
    wCtx.inBlock("if (in_msg_length >= 32)", () => {
        wCtx.append(`op = in_msg${opcodeReader}(32);`);

        if (doesHaveTextReceivers) {
            receivers.binary.forEach((binRcv) => {
                wCtx.append();

                writeBinaryReceiver(
                    binRcv,
                    receivers.kind,
                    opcodeReader === "~load_uint",
                    contractName,
                    wCtx,
                );
            });
        }
    });

    // NOTE: It should be more efficent to write all binary receivers inside
    //       `in_msg_length` length if-check regardless of text receivers,
    //       but while using Fift this way is better
    if (!doesHaveTextReceivers) {
        receivers.binary.forEach((binRcv) => {
            writeBinaryReceiver(
                binRcv,
                receivers.kind,
                opcodeReader === "~load_uint",
                contractName,
                wCtx,
            );
            wCtx.append();
        });
    }

    if (typeof receivers.empty !== "undefined") {
        wCtx.append(";; Receive empty message");
        wCtx.inBlock("if ((op == 0) & (in_msg_length <= 32))", () => {
            wCtx.append(
                `self~${ops.receiveEmpty(contractName, receivers.kind)}();`,
            );
            wCtx.append("return (self, true);");
        });
    }

    writeCommentReceivers(
        receivers.comment,
        receivers.commentFallback,
        receivers.kind,
        opcodeReader === "~load_uint",
        typeof receivers.fallback !== "undefined",
        contractName,
        wCtx,
    );

    if (typeof receivers.fallback !== "undefined") {
        wCtx.append(";; Receiver fallback");
        wCtx.append(
            `self~${ops.receiveAny(contractName, receivers.kind)}(in_msg);`,
        );
        wCtx.append("return (self, true);");
    } else {
        wCtx.append("return (self, false);");
    }
}

function writeBinaryReceiver(
    binaryReceiver: ReceiverDescription,
    kind: "internal" | "external",
    msgOpcodeRemoved: boolean,
    contractName: string,
    wCtx: WriterContext,
): void {
    const selector = binaryReceiver.selector;
    if (
        selector.kind !== "internal-binary" &&
        selector.kind !== "external-binary"
    )
        throwInternalCompilerError(
            `Invalid selector type: ${selector.kind} (internal-binary or external-binary is expected)`,
            binaryReceiver.ast.loc,
        );

    const allocation = getType(wCtx.ctx, selector.type);
    if (!allocation.header) {
        throwInternalCompilerError(
            `Invalid allocation: ${selector.type}`,
            binaryReceiver.ast.loc,
        );
    }
    wCtx.append(`;; Receive ${selector.type} message`);
    wCtx.inBlock(`if (op == ${messageOpcode(allocation.header)})`, () => {
        if (!msgOpcodeRemoved) {
            wCtx.append("in_msg~skip_bits(32);");
        }
        // Read message
        wCtx.append(
            `var msg = in_msg~${ops.reader(selector.type, "no-opcode", wCtx)}();`,
        );
        // Execute function
        wCtx.append(
            `self~${ops.receiveType(contractName, kind, selector.type)}(msg);`,
        );
        // Exit
        wCtx.append("return (self, true);");
    });
}

function writeCommentReceivers(
    commentReceivers: ReceiverDescription[],
    commentFallbackReceiver: ReceiverDescription | undefined,
    kind: "internal" | "external",
    msgOpcodeRemoved: boolean,
    fallbackReceiverExists: boolean,
    contractName: string,
    wCtx: WriterContext,
): void {
    // - Special case: no text receivers at all
    if (
        typeof commentFallbackReceiver === "undefined" &&
        commentReceivers.length === 0
    ) {
        return;
    }
    const writeFallbackTextReceiver = () => {
        wCtx.append(";; Fallback Text Receiver");
        const inMsg = msgOpcodeRemoved ? "in_msg" : "in_msg.skip_bits(32)";
        wCtx.append(
            `self~${ops.receiveAnyText(contractName, kind)}(${inMsg});`,
        );
        wCtx.append("return (self, true);");
    };

    const writeTextReceivers = () => {
        // - Special case: only fallback comment receiver
        if (
            typeof commentFallbackReceiver !== "undefined" &&
            commentReceivers.length === 0
        ) {
            writeFallbackTextReceiver();
            return;
        }

        wCtx.append("var text_op = slice_hash(in_msg);");
        commentReceivers.forEach((commentRcv) => {
            if (
                commentRcv.selector.kind !== "external-comment" &&
                commentRcv.selector.kind !== "internal-comment"
            ) {
                throwInternal(
                    `Wrong type of a text receiver: ${commentRcv.selector.kind}`,
                );
                return;
            }
            const hash = commentPseudoOpcode(
                commentRcv.selector.comment,
                !msgOpcodeRemoved,
                commentRcv.ast.loc,
            );
            const hashForReceiverFunctionName = commentPseudoOpcode(
                commentRcv.selector.comment,
                true,
                commentRcv.ast.loc,
            );
            wCtx.append(`;; Receive "${commentRcv.selector.comment}" message`);

            wCtx.inBlock(`if (text_op == 0x${hash})`, () => {
                wCtx.append(
                    `self~${ops.receiveText(contractName, kind, hashForReceiverFunctionName)}();`,
                );
                wCtx.append("return (self, true);");
            });
        });

        if (typeof commentFallbackReceiver !== "undefined") {
            writeFallbackTextReceiver();
        }
    };

    wCtx.append(";; Empty Receiver and Text Receivers");
    if (fallbackReceiverExists) {
        wCtx.inBlock("if (op == 0)", writeTextReceivers);
    } else {
        // - Special case: no fallback receiver
        writeTextReceivers();
    }
}

function groupContractReceivers(contract: TypeDescription): ContractReceivers {
    const contractReceivers: ContractReceivers = {
        internal: {
            kind: "internal",
            empty: undefined,
            binary: [],
            comment: [],
            commentFallback: undefined,
            fallback: undefined,
        },
        external: {
            kind: "external",
            empty: undefined,
            binary: [],
            comment: [],
            commentFallback: undefined,
            fallback: undefined,
        },
        bounced: {
            binary: [],
            fallback: undefined,
        },
    };

    for (const receiver of contract.receivers) {
        const selector = receiver.selector;
        switch (selector.kind) {
            case "internal-empty":
                contractReceivers.internal.empty = receiver;
                break;
            case "internal-binary":
                contractReceivers.internal.binary.push(receiver);
                break;
            case "internal-comment":
                contractReceivers.internal.comment.push(receiver);
                break;
            case "internal-comment-fallback":
                contractReceivers.internal.commentFallback = receiver;
                break;
            case "internal-fallback":
                contractReceivers.internal.fallback = receiver;
                break;
            case "external-empty":
                contractReceivers.external.empty = receiver;
                break;
            case "external-binary":
                contractReceivers.external.binary.push(receiver);
                break;
            case "external-comment":
                contractReceivers.external.comment.push(receiver);
                break;
            case "external-comment-fallback":
                contractReceivers.external.commentFallback = receiver;
                break;
            case "external-fallback":
                contractReceivers.external.fallback = receiver;
                break;
            case "bounce-binary":
                contractReceivers.bounced.binary.push(receiver);
                break;
            case "bounce-fallback":
                contractReceivers.bounced.fallback = receiver;
                break;
        }
    }
    return contractReceivers;
}

function writeBouncedRouter(
    bouncedReceivers: BouncedReceivers,
    contractName: string,
    wCtx: WriterContext,
): void {
    wCtx.append(";; Handle bounced messages");

    // - Special case: there are no bounce receivers at all, we can skip the bounce handling
    if (
        typeof bouncedReceivers.fallback === "undefined" &&
        bouncedReceivers.binary.length === 0
    ) {
        wCtx.append("if (msg_bounced) { return (self, true); }");
        return;
    }

    // - Special case: there is only a fallback receiver
    if (
        typeof bouncedReceivers.fallback !== "undefined" &&
        bouncedReceivers.binary.length === 0
    ) {
        wCtx.inBlock("if (msg_bounced)", () => {
            wCtx.append(";; Fallback bounce receiver");
            wCtx.append(";; Skip 0xFFFFFFFF prefix of the bounced message");
            wCtx.append("in_msg~skip_bits(32);");
            wCtx.append(`self~${ops.receiveBounceAny(contractName)}(in_msg);`);
            wCtx.append("return (self, true);");
        });
        return;
    }

    // If there is a fallback receiver and bounced message receivers, we need to keep in_msg intact,
    // otherwise we can modify in_msg in-place
    const opcodeReader: "~load_uint" | ".preload_uint" =
        typeof bouncedReceivers.fallback === "undefined"
            ? "~load_uint"
            : ".preload_uint";

    wCtx.inBlock("if (msg_bounced)", () => {
        wCtx.append(";; Skip 0xFFFFFFFF prefix of a bounced message");
        wCtx.append("in_msg~skip_bits(32);");
        wCtx.append(`int op = 0;`);
        wCtx.inBlock("if (slice_bits(in_msg) >= 32)", () => {
            wCtx.append(`op = in_msg${opcodeReader}(32);`);
        });
        bouncedReceivers.binary.forEach((bouncedRcv) => {
            writeBouncedReceiver(
                bouncedRcv,
                opcodeReader === "~load_uint",
                contractName,
                wCtx,
            );
            wCtx.append();
        });
        if (typeof bouncedReceivers.fallback !== "undefined") {
            wCtx.append(";; Fallback bounce receiver");
            wCtx.append(`self~${ops.receiveBounceAny(contractName)}(in_msg);`);
        }
        // it's cheaper in terms of gas to just exit with code zero even if the
        // bounced message wasn't recognized, this is a common behavior of TON contracts
        wCtx.append("return (self, true);");
    });
}

function writeBouncedReceiver(
    bouncedReceiver: ReceiverDescription,
    msgOpcodeRemoved: boolean,
    contractName: string,
    wCtx: WriterContext,
): void {
    const selector = bouncedReceiver.selector;
    if (selector.kind !== "bounce-binary")
        throwInternalCompilerError(
            `Invalid selector type: ${selector.kind} (bounce-binary is expected)`,
            bouncedReceiver.ast.loc,
        );

    wCtx.append(`;; Bounced handler for ${selector.type} message`);
    const allocation = getType(wCtx.ctx, selector.type);
    wCtx.inBlock(`if (op == ${messageOpcode(allocation.header!)})`, () => {
        if (!msgOpcodeRemoved) {
            wCtx.append("in_msg~skip_bits(32);");
        }
        // Read message
        wCtx.append(
            `var msg = in_msg~${selector.bounced ? ops.readerBounced(selector.type, wCtx) : ops.reader(selector.type, "no-opcode", wCtx)}();`,
        );

        // Execute function
        wCtx.append(
            `self~${ops.receiveTypeBounce(contractName, selector.type)}(msg);`,
        );

        // Exit
        wCtx.append("return (self, true);");
    });
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
    const selfType = resolveFuncType(self, ctx);
    const selfUnpack = `var ${resolveFuncTypeUnpack(self, funcIdOf("self"), ctx)} = ${funcIdOf("self")};`;

    // Binary receiver
    if (
        selector.kind === "internal-binary" ||
        selector.kind === "external-binary"
    ) {
        const args = [
            selfType + " " + funcIdOf("self"),
            resolveFuncType(selector.type, ctx) + " " + funcIdOf(selector.name),
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
        const hash = commentPseudoOpcode(selector.comment, true, f.ast.loc);
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
            resolveFuncType(selector.type, ctx, false, selector.bounced) +
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

export function commentPseudoOpcode(
    comment: string,
    includeZeroOpcode: boolean,
    loc: SrcInfo,
): string {
    const buffer = Buffer.from(comment, "utf8");
    if (buffer.length > 123) {
        throwCompilationError(
            `receiver message is too long, max length is 123 bytes, but given ${buffer.length}`,
            loc,
        );
    }

    const cell = includeZeroOpcode
        ? beginCell().storeUint(0, 32).storeBuffer(buffer).endCell()
        : beginCell().storeBuffer(buffer).endCell();
    return cell.hash().toString("hex", 0, 64);
}
