import { beginCell } from "@ton/core";
import { getType } from "../../types/resolveDescriptors";
import type {
    FallbackReceiverSelector,
    ReceiverDescription,
    TypeDescription,
} from "../../types/types";
import type { WriterContext } from "../Writer";
import { funcIdOf } from "./id";
import { ops } from "./ops";
import { resolveFuncTypeUnpack } from "./resolveFuncTypeUnpack";
import { writeStatement } from "./writeFunction";
import type { AstNumber, AstReceiver, AstStatement } from "../../ast/ast";
import {
    throwCompilationError,
    throwInternal,
    throwInternalCompilerError,
} from "../../error/errors";
import type { SrcInfo } from "../../grammar";
import { contractErrors } from "../../abi/errors";
import { resolveFuncTypeFromAbiUnpack } from "./resolveFuncTypeFromAbiUnpack";
import { getAllocation } from "../../storage/resolveAllocation";

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
    commentFallback: FallbackReceiver | undefined;
    fallback: FallbackReceiver | undefined;
};

type FallbackReceiver = {
    selector: FallbackReceiverSelector;
    ast: AstReceiver;
};

type BouncedReceivers = {
    binary: ReceiverDescription[];
    fallback: FallbackReceiver | undefined;
};

// empty string receiver (`receive("")`) is not allowed
export function writeNonBouncedRouter(
    receivers: Receivers,
    contract: TypeDescription,
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
        wCtx.append(`throw(${contractErrors.invalidMessage.id});`);
        return;
    }

    // - Special case: only fallback receiver
    if (
        typeof receivers.fallback !== "undefined" &&
        receivers.binary.length === 0 &&
        receivers.comment.length === 0 &&
        typeof receivers.commentFallback === "undefined" &&
        typeof receivers.empty === "undefined"
    ) {
        writeFallbackReceiver(receivers.fallback, contract, "in_msg", wCtx);
        return;
    }

    const writeBinaryReceivers = (msgOpcodeRemoved: boolean) => {
        receivers.binary.forEach((binRcv) => {
            writeBinaryReceiver(binRcv, msgOpcodeRemoved, contract, wCtx);
            wCtx.append();
        });
    };

    // - Special case: only binary receivers
    if (
        typeof receivers.empty === "undefined" &&
        receivers.comment.length === 0 &&
        typeof receivers.commentFallback === "undefined" &&
        typeof receivers.fallback === "undefined"
    ) {
        wCtx.append(`var (op, _) = in_msg~load_uint_quiet(32);`);

        writeBinaryReceivers(true);

        wCtx.append(`throw(${contractErrors.invalidMessage.id});`);
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
            writeBinaryReceivers(opcodeReader === "~load_uint");
        }
    });

    // NOTE: It should be more efficient to write all binary receivers inside
    //       `in_msg_length` length if-check regardless of text receivers,
    //       but while using Fift this way is better
    if (!doesHaveTextReceivers) {
        writeBinaryReceivers(opcodeReader === "~load_uint");
    }

    if (typeof receivers.empty !== "undefined") {
        const emptyRcv = receivers.empty;
        wCtx.append(";; Receive empty message");
        wCtx.inBlock("if ((op == 0) & (in_msg_length <= 32))", () => {
            writeReceiverBody(emptyRcv.ast.statements, contract, wCtx);
        });
    }

    writeCommentReceivers(
        receivers.comment,
        receivers.commentFallback,
        receivers.kind,
        opcodeReader === "~load_uint",
        typeof receivers.fallback !== "undefined",
        contract,
        wCtx,
    );

    if (typeof receivers.fallback !== "undefined") {
        wCtx.append(";; Receiver fallback");
        writeFallbackReceiver(receivers.fallback, contract, "in_msg", wCtx);
    } else {
        wCtx.append(`;; Throw if not handled`);
        wCtx.append(`throw(${contractErrors.invalidMessage.id});`);
    }
}

function writeBinaryReceiver(
    binaryReceiver: ReceiverDescription,
    msgOpcodeRemoved: boolean,
    contract: TypeDescription,
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
        const msgFields = resolveFuncTypeUnpack(
            selector.type,
            funcIdOf(selector.name),
            wCtx,
        );
        wCtx.append(
            `var ${msgFields} = in_msg~${ops.reader(selector.type, "no-opcode", wCtx)}();`,
        );

        writeReceiverBody(binaryReceiver.ast.statements, contract, wCtx);
    });
}

function writeCommentReceivers(
    commentReceivers: ReceiverDescription[],
    commentFallbackReceiver: FallbackReceiver | undefined,
    kind: "internal" | "external",
    msgOpcodeRemoved: boolean,
    fallbackReceiverExists: boolean,
    contract: TypeDescription,
    wCtx: WriterContext,
): void {
    // - Special case: no text receivers at all
    if (
        typeof commentFallbackReceiver === "undefined" &&
        commentReceivers.length === 0
    ) {
        return;
    }
    const writeFallbackTextReceiver = (
        commentFallbackReceiver: FallbackReceiver,
    ) => {
        const writeFallbackTextReceiverInternal = () => {
            wCtx.append(";; Fallback Text Receiver");
            wCtx.inBlock("if (in_msg_length >= 32)", () => {
                const inMsg = msgOpcodeRemoved
                    ? "in_msg"
                    : "in_msg.skip_bits(32)";
                writeFallbackReceiver(
                    commentFallbackReceiver,
                    contract,
                    inMsg,
                    wCtx,
                );
                wCtx.append("return ();");
            });
        };

        // We optimize fallback
        if (!fallbackReceiverExists) {
            wCtx.inBlock("if (op == 0)", writeFallbackTextReceiverInternal);
        } else {
            writeFallbackTextReceiverInternal();
        }
    };

    const writeTextReceivers = () => {
        // - Special case: only fallback comment receiver
        if (
            typeof commentFallbackReceiver !== "undefined" &&
            commentReceivers.length === 0
        ) {
            writeFallbackTextReceiver(commentFallbackReceiver);
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
            wCtx.append(`;; Receive "${commentRcv.selector.comment}" message`);

            wCtx.inBlock(`if (text_op == 0x${hash})`, () => {
                writeReceiverBody(commentRcv.ast.statements, contract, wCtx);
            });
        });

        if (typeof commentFallbackReceiver !== "undefined") {
            writeFallbackTextReceiver(commentFallbackReceiver);
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

export function groupContractReceivers(
    contract: TypeDescription,
): ContractReceivers {
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
                contractReceivers.internal.commentFallback = {
                    selector,
                    ast: receiver.ast,
                };
                break;
            case "internal-fallback":
                contractReceivers.internal.fallback = {
                    selector,
                    ast: receiver.ast,
                };
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
                contractReceivers.external.commentFallback = {
                    selector,
                    ast: receiver.ast,
                };
                break;
            case "external-fallback":
                contractReceivers.external.fallback = {
                    selector,
                    ast: receiver.ast,
                };
                break;
            case "bounce-binary":
                contractReceivers.bounced.binary.push(receiver);
                break;
            case "bounce-fallback":
                contractReceivers.bounced.fallback = {
                    selector,
                    ast: receiver.ast,
                };
                break;
        }
    }
    return contractReceivers;
}

export function writeBouncedRouter(
    bouncedReceivers: BouncedReceivers,
    contract: TypeDescription,
    wCtx: WriterContext,
): void {
    wCtx.append(";; Handle bounced messages");

    // - Special case: there are no bounce receivers at all, we can skip the bounce handling
    if (
        typeof bouncedReceivers.fallback === "undefined" &&
        bouncedReceivers.binary.length === 0
    ) {
        wCtx.append("if (msg_bounced) { return (); }");
        return;
    }

    // - Special case: there is only a fallback receiver
    if (
        typeof bouncedReceivers.fallback !== "undefined" &&
        bouncedReceivers.binary.length === 0
    ) {
        const bouncedFallback = bouncedReceivers.fallback;
        wCtx.inBlock("if (msg_bounced)", () => {
            wCtx.append(";; Fallback bounce receiver");
            wCtx.append(";; Skip 0xFFFFFFFF prefix of the bounced message");
            wCtx.append("in_msg~skip_bits(32);");
            writeFallbackReceiver(bouncedFallback, contract, "in_msg", wCtx);
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
                contract,
                wCtx,
            );
            wCtx.append();
        });
        if (typeof bouncedReceivers.fallback !== "undefined") {
            wCtx.append(";; Fallback bounce receiver");
            writeFallbackReceiver(
                bouncedReceivers.fallback,
                contract,
                "in_msg",
                wCtx,
            );
        }
        // it's cheaper in terms of gas to just exit with code zero even if the
        // bounced message wasn't recognized, this is a common behavior of TON contracts
        wCtx.append("return ();");
    });
}

function writeFallbackReceiver(
    fbRcv: FallbackReceiver,
    contract: TypeDescription,
    inMsg: string,
    wCtx: WriterContext,
): void {
    wCtx.append(`slice ${funcIdOf(fbRcv.selector.name)} = ${inMsg};`);
    writeReceiverBody(fbRcv.ast.statements, contract, wCtx);
}

function writeBouncedReceiver(
    bouncedReceiver: ReceiverDescription,
    msgOpcodeRemoved: boolean,
    contract: TypeDescription,
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
        const msgFields = resolveFuncTypeUnpack(
            selector.type,
            funcIdOf(selector.name),
            wCtx,
            false,
            selector.bounced,
        );

        const msgReader = selector.bounced
            ? ops.readerBounced(selector.type, wCtx)
            : ops.reader(selector.type, "no-opcode", wCtx);
        wCtx.append(`var ${msgFields} = in_msg~${msgReader}();`);

        writeReceiverBody(bouncedReceiver.ast.statements, contract, wCtx);
    });
}

function writeReceiverBody(
    statements: readonly AstStatement[],
    contract: TypeDescription,
    wCtx: WriterContext,
): void {
    for (const stmt of statements) {
        writeStatement(stmt, null, null, wCtx);
    }
    writeStoreContractVariables(contract, wCtx);
    wCtx.append("return ();");
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

function writeStoreContractVariables(
    contract: TypeDescription,
    wCtx: WriterContext,
): void {
    const contractVariables = resolveFuncTypeFromAbiUnpack(
        "$self",
        getAllocation(wCtx.ctx, contract.name).ops,
        wCtx,
    );
    wCtx.append(`;; Persist state`);
    wCtx.append(
        `${ops.contractStore(contract.name, wCtx)}(${contractVariables});`,
    );
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
