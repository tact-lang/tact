import { beginCell, Contract } from "@ton/core";
import { getType } from "../../types/resolveDescriptors";
import {
    showValue,
    type FallbackReceiverSelector,
    type ReceiverDescription,
    type TypeDescription,
} from "../../types/types";
import type { WriterContext } from "../Writer";
import { funcIdOf } from "./id";
import { ops } from "./ops";
import { resolveFuncTypeUnpack } from "./resolveFuncTypeUnpack";
import { writeStatement } from "./writeFunction";
import type * as Ast from "../../ast/ast";
import {
    throwCompilationError,
    throwInternal,
    throwInternalCompilerError,
} from "../../error/errors";
import type { SrcInfo } from "../../grammar";
import { contractErrors } from "../../abi/errors";
import { resolveFuncTypeFromAbiUnpack } from "./resolveFuncTypeFromAbiUnpack";
import { getAllocation } from "../../storage/resolveAllocation";
import type { Effect } from "../../types/effects";
import { enabledAlwaysSaveContractData } from "../../config/features";
import { getAstFactory, idText, isWildcard } from "../../ast/ast-helpers";
import { evalConstantExpression } from "../../optimizer/constEval";
import { getAstUtil } from "../../ast/util";
import { func } from "fast-check";

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
    effects: ReadonlySet<Effect>;
    ast: Ast.Receiver;
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

    if (receivers.binary.length !== 0) {
        wCtx.append(";; Start of binary receiver switch");
        receivers.binary.forEach((binaryReceiver) => {
            writeBinaryReceiver(binaryReceiver, contract, wCtx);
        });
        wCtx.append(";; End of binary receiver switch");
        wCtx.append();
    }

    if (receivers.comment.length !== 0) {
        wCtx.append(";; Start of comment receiver switch");
        wCtx.append("var in_msg_hash = slice_hash(in_msg);");
        receivers.comment.forEach((commentReceiver) => {
            writeCommentReceiver(commentReceiver, contract, wCtx);
        });
        wCtx.append(";; End of comment receiver switch");
        wCtx.append();
    }

    // Yeah this is a mess, but I don't create the rules...
    const commentFallback = receivers.commentFallback;
    const emptyReceiver = receivers.empty;
    if (typeof emptyReceiver !== "undefined") {
        wCtx.append("int in_msg_length = slice_bits(in_msg);");
        if (typeof commentFallback !== "undefined") {
            wCtx.inBlock(`if (in_msg~${opcodeCheckerFuncId(0n)}())`, () => {
                wCtx.append(";; Empty receiver");
                wCtx.inBlock("if (in_msg_length == 32)", () => {
                    writeReceiverBody(emptyReceiver, contract, wCtx);
                });
                wCtx.append(";; Comment fallback receiver");
                writeFallbackReceiver(commentFallback, contract, "in_msg", wCtx);
            });
        }
        wCtx.inBlock('if ((in_msg_length < 32) | equal_slices_bits("00000000"s, in_msg))', () => {
            writeReceiverBody(emptyReceiver, contract, wCtx);
        });
    } else if (typeof commentFallback !== "undefined") {
        wCtx.append(";; Comment fallback receiver");
        wCtx.inBlock(`if (in_msg~${opcodeCheckerFuncId(0n)}())`, () => {
            writeFallbackReceiver(commentFallback, contract, "in_msg", wCtx);
        });
    }

    if (typeof receivers.fallback !== "undefined") {
        wCtx.append(";; Fallback receiver");
        writeFallbackReceiver(receivers.fallback, contract, "in_msg", wCtx);
    } else {
        wCtx.append(`;; Throw if not handled`);
        wCtx.append(`throw(${contractErrors.invalidMessage.id});`);
    }
}

function writeBinaryReceiver(
    binaryReceiver: ReceiverDescription,
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

    const opcode = allocation.header.value;

    wCtx.append(`;; Receive ${selector.type} message`);
    wCtx.inBlock(`if (in_msg~${opcodeCheckerFuncId(opcode)}())`, () => {
        const msgFields = resolveFuncTypeUnpack(
            selector.type,
            funcIdOf(selector.name),
            wCtx,
        );
        wCtx.append(
            `var ${msgFields} = in_msg~${ops.reader(selector.type, "no-opcode", wCtx)}();`,
        );

        writeReceiverBody(binaryReceiver, contract, wCtx);
    });
}

function writeCommentReceiver(
    commentReceiver: ReceiverDescription,
    contract: TypeDescription,
    wCtx: WriterContext,
): void {
    const selector = commentReceiver.selector;
    if (
        selector.kind !== "internal-comment" &&
        selector.kind !== "external-comment"
    ) {
        throwInternalCompilerError(
            `Invalid selector type: ${selector.kind} (internal-comment or external-comment is expected)`,
            commentReceiver.ast.loc,
        );
    }

    const hash = commentPseudoOpcode(selector.comment, true, commentReceiver.ast.loc);
    wCtx.append(`;; Receive "${selector.comment}" message`);
    wCtx.inBlock(`if (in_msg_hash == 0x${hash})`, () => {
        writeReceiverBody(commentReceiver, contract, wCtx);
    });
}

function opcodeCheckerFuncId(opcode: bigint) {
    const opHex = opcode.toString(16).padStart(8, "0");
    return `opcode<${opHex}>?`;
}

function writeOpcodeChecker(opcode: bigint, wCtx: WriterContext) {
    const opHex = opcode.toString(16).padStart(8, "0");
    wCtx.append(
        `(slice, int) ${opcodeCheckerFuncId(opcode)}(slice s) asm "x{${opHex}} SDBEGINSQ";`
    );
}

export function writeOpcodeCheckers(
    receivers: ContractReceivers,
    contract: TypeDescription,
    wCtx: WriterContext
) {
    const opcodes: Set<bigint> = new Set();

    const binaryReceivers: ReceiverDescription[] = [];
    binaryReceivers.push(...receivers.internal.binary);
    binaryReceivers.push(...receivers.external.binary);
    binaryReceivers.push(...receivers.bounced.binary);

    binaryReceivers.forEach((binaryReceiver: ReceiverDescription) => {
        const selector = binaryReceiver.selector;
        if (
            selector.kind !== "internal-binary" &&
            selector.kind !== "external-binary" &&
            selector.kind !== "bounce-binary"
        ) {
            throwInternalCompilerError(
                `Invalid selector type: ${selector.kind} (internal-binary, external-binary or bounce-binary is expected)`,
                binaryReceiver.ast.loc,
            );
        }

        const allocation = getType(wCtx.ctx, selector.type);
        if (!allocation.header) {
            throwInternalCompilerError(
                `Invalid allocation: ${selector.type}`,
                binaryReceiver.ast.loc,
            );
        }
        opcodes.add(allocation.header.value);
    });

    // If there is a comment fallback, it is convenient to have zero opcode checker
    if (
        typeof receivers.internal.commentFallback !== "undefined" ||
        typeof receivers.external.commentFallback !== "undefined"
    ) {
        opcodes.add(0n);
    }

    if (opcodes.size === 0) {
        return;
    }

    wCtx.append(";; Opcode checkers for binary messages (trims opcode on success)")
    opcodes.forEach((opcode: bigint) => writeOpcodeChecker(opcode, wCtx));
}

type FallbackReceiverKind =
    | { kind: "unknown" }
    | { kind: "no-fallback" }
    | { kind: "empty-body" }
    | { kind: "wildcard-parameter" }
    | { kind: "statically-known-single-throw"; exitCode: number };

function fallbackReceiverKind(
    fallback: FallbackReceiver | undefined,
    wCtx: WriterContext,
): FallbackReceiverKind {
    // Note the order of the `if` statements is very important
    // For instance, `receive(foo: Slice) { } and
    // `receive(_: Slice) { throw(0xFFFF) }` have higher priority
    // compared to a fallback receiver that does not read its message, i.e.
    // `receive(_: Slice) { /* body that is not `throw()` and not empty */}`

    if (typeof fallback === "undefined") {
        return { kind: "no-fallback" };
    }
    if (fallback.ast.statements.length === 0) {
        return { kind: "empty-body" };
    }
    // fallback receiver with single statement `throw(CODE)` in its body
    const [fbStmt] = fallback.ast.statements;
    if (typeof fbStmt !== "undefined") {
        if (
            fbStmt.kind === "statement_expression" &&
            fbStmt.expression.kind === "static_call" &&
            idText(fbStmt.expression.function) === "throw"
        ) {
            const [throwArg] = fbStmt.expression.args;
            const util = getAstUtil(getAstFactory());
            if (typeof throwArg !== "undefined") {
                const constEvalResult = evalConstantExpression(
                    throwArg,
                    wCtx.ctx,
                    util,
                );
                if (constEvalResult.kind !== "number") {
                    throwInternalCompilerError(
                        `"throw" can only have a number as an argument, but it has throws ${showValue(constEvalResult)}`,
                        throwArg.loc,
                    );
                }
                return {
                    kind: "statically-known-single-throw",
                    exitCode: Number(constEvalResult.value),
                };
            } else {
                throwInternalCompilerError(
                    `"throw" must have an argument`,
                    fbStmt.expression.loc,
                );
            }
        }
    }
    if (isWildcard(fallback.selector.name)) {
        return { kind: "wildcard-parameter" };
    }
    return { kind: "unknown" };
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
                    effects: receiver.effects,
                    ast: receiver.ast,
                };
                break;
            case "internal-fallback":
                contractReceivers.internal.fallback = {
                    selector,
                    effects: receiver.effects,
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
                    effects: receiver.effects,
                    ast: receiver.ast,
                };
                break;
            case "external-fallback":
                contractReceivers.external.fallback = {
                    selector,
                    effects: receiver.effects,
                    ast: receiver.ast,
                };
                break;
            case "bounce-binary":
                contractReceivers.bounced.binary.push(receiver);
                break;
            case "bounce-fallback":
                contractReceivers.bounced.fallback = {
                    selector,
                    effects: receiver.effects,
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

    wCtx.inBlock("if (msg_bounced)", () => {
        wCtx.append(";; Skip 0xFFFFFFFF prefix of a bounced message");
        wCtx.append("in_msg~skip_bits(32);");
    
        bouncedReceivers.binary.forEach((bouncedRcv) => {
            writeBouncedReceiver(
                bouncedRcv,
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
    if (!isWildcard(fbRcv.selector.name) && fbRcv.ast.statements.length != 0) {
        wCtx.append(`slice ${funcIdOf(fbRcv.selector.name)} = ${inMsg};`);
    }
    for (const stmt of fbRcv.ast.statements) {
        writeStatement(stmt, null, null, wCtx);
    }
    if (
        enabledAlwaysSaveContractData(wCtx.ctx) ||
        contract.init?.kind !== "contract-params" ||
        fbRcv.effects.has("contractStorageWrite")
    ) {
        writeStoreContractVariables(contract, wCtx);
    }
    if (
        fbRcv.selector.kind !== "internal-fallback" &&
        fbRcv.selector.kind !== "external-fallback"
    ) {
        wCtx.append("return ();");
    }
}

function writeBouncedReceiver(
    bouncedReceiver: ReceiverDescription,
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

    if (!allocation.header) {
        throwInternalCompilerError(
            `Invalid allocation: ${selector.type}`,
            bouncedReceiver.ast.loc,
        );
    }

    wCtx.inBlock(`if (in_msg~${opcodeCheckerFuncId(allocation.header.value)}())`, () => {
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

        writeReceiverBody(bouncedReceiver, contract, wCtx);
    });
}

function writeReceiverBody(
    rcv: ReceiverDescription,
    contract: TypeDescription,
    wCtx: WriterContext,
): void {
    for (const stmt of rcv.ast.statements) {
        writeStatement(stmt, null, null, wCtx);
    }
    if (
        enabledAlwaysSaveContractData(wCtx.ctx) ||
        contract.init?.kind !== "contract-params" ||
        rcv.effects.has("contractStorageWrite")
    ) {
        writeStoreContractVariables(contract, wCtx);
    }
    wCtx.append("return ();");
}

function messageOpcode(n: Ast.Number): string {
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
