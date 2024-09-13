import * as changeCase from "change-case";
import { ABIField, beginCell } from "@ton/core";
import { CompilerContext } from "../context";
import { idToHex } from "../utils/idToHex";
import { idTextErr, throwInternalCompilerError } from "../errors";
import { getType, getAllTypes } from "./resolveDescriptors";
import {
    BinaryReceiverSelector,
    CommentReceiverSelector,
    ReceiverDescription,
} from "./types";
import { throwCompilationError } from "../errors";
import { AstNumber, AstReceiver } from "../grammar/ast";
import { commentPseudoOpcode } from "../generator/writers/writeRouter";
import { sha256_sync } from "@ton/crypto";
import { dummySrcInfo } from "../grammar/grammar";

export function resolveSignatures(ctx: CompilerContext) {
    const signatures: Map<
        string,
        { signature: string; tlb: string; id: AstNumber | null }
    > = new Map();
    function createTypeFormat(
        type: string,
        format: string | number | boolean | null,
    ) {
        if (type === "int") {
            if (typeof format === "number") {
                return `int${format}`;
            } else if (format !== null) {
                throwInternalCompilerError(`Unsupported int format: ${format}`);
            }
            return `int`;
        } else if (type === "uint") {
            if (typeof format === "number") {
                return `uint${format}`;
            } else if (format === "coins") {
                return `coins`;
            } else if (format !== null) {
                throwInternalCompilerError(
                    `Unsupported uint format: ${format}`,
                );
            }
            return `uint`;
        } else if (type === "bool") {
            if (format !== null) {
                throwInternalCompilerError(
                    `Unsupported bool format: ${format}`,
                );
            }
            return "bool";
        } else if (type === "address") {
            if (format !== null) {
                throwInternalCompilerError(
                    `Unsupported address format: ${format}`,
                );
            }
            return "address";
        } else if (type === "cell") {
            if (format === "remainder") {
                return "remainder<cell>";
            } else if (format === "ref") {
                return "^cell";
            }
            if (format !== null) {
                throwInternalCompilerError(
                    `Unsupported cell format: ${format}`,
                );
            }
            return "^cell";
        } else if (type === "slice") {
            if (format === "remainder") {
                return "remainder<slice>";
            } else if (format === "ref") {
                return "^slice";
            } else if (format !== null) {
                throwInternalCompilerError(
                    `Unsupported slice format: ${format}`,
                );
            }
            return "^slice";
        } else if (type === "builder") {
            if (format === "remainder") {
                return "remainder<builder>";
            } else if (format === "ref") {
                return "^slice";
            } else if (format !== null) {
                throwInternalCompilerError(
                    `Unsupported builder format: ${format}`,
                );
            }
            return "^builder";
        } else if (type === "string") {
            if (format !== null) {
                throwInternalCompilerError(
                    `Unsupported builder format: ${format}`,
                );
            }
            return "^string";
        } else if (type === "fixed-bytes") {
            if (typeof format === "number") {
                return `fixed_bytes${format}`;
            } else if (format !== null) {
                throwInternalCompilerError(
                    `Unsupported fixed-bytes format: ${format}`,
                );
            }
            throwInternalCompilerError("Missing fixed-bytes format");
        }

        // Struct types
        const t = getType(ctx, type);
        if (t.kind !== "struct") {
            throwInternalCompilerError(`Unsupported type: ${type}`);
        }
        const s = createTupleSignature(type);
        if (format === "ref") {
            return `^${s.signature}`;
        } else if (format !== null) {
            throwInternalCompilerError(`Unsupported struct format: ${format}`);
        }
        return s.signature;
    }

    function createTLBField(src: ABIField) {
        switch (src.type.kind) {
            case "simple": {
                let base = createTypeFormat(
                    src.type.type,
                    src.type.format ? src.type.format : null,
                );
                if (src.type.optional) {
                    base = "Maybe " + base;
                }
                return src.name + ":" + base;
            }
            case "dict": {
                if (src.type.format !== null && src.type.format !== undefined) {
                    throwInternalCompilerError(
                        `Unsupported map format: ${src.type.format}`,
                    );
                }
                if (src.type.keyFormat === "coins") {
                    throwCompilationError(
                        `Unsupported format ${src.type.keyFormat} for map key`,
                    );
                }
                const key = createTypeFormat(
                    src.type.key,
                    src.type.keyFormat ? src.type.keyFormat : null,
                );
                const value = createTypeFormat(
                    src.type.value,
                    src.type.valueFormat ? src.type.valueFormat : null,
                );
                return src.name + ":dict<" + key + ", " + value + ">";
            }
        }
    }

    function createTupleSignature(name: string): {
        signature: string;
        tlb: string;
        id: AstNumber | null;
    } {
        if (signatures.has(name)) {
            return signatures.get(name)!;
        }
        const t = getType(ctx, name);
        if (t.kind !== "struct") {
            throwInternalCompilerError(`Unsupported type: ${name}`);
        }

        // Check for no "remainder" in the middle of the struct
        for (const field of t.fields.slice(0, -1)) {
            if (field.as === "remaining") {
                throwCompilationError(
                    `The "remainder" field can only be the last field of the struct`,
                );
            }
        }

        const fields = t.fields.map((v) => createTLBField(v.abi));

        // Calculate signature and method id
        const signature = name + "{" + fields.join(",") + "}";
        let id: AstNumber | null = null;
        if (t.ast.kind === "message_decl") {
            if (t.ast.opcode !== null) {
                id = t.ast.opcode;
            } else {
                id = newMessageOpcode(signature);
                if (id.value === 0n) {
                    throwCompilationError(
                        `Auto-generated opcode for message "${idTextErr(t.ast.name)}" is zero which is reserved for text comments.\nTry changing names of the message type or its fields to get a non-zero opcode.\nOr consider specifying the opcode explicitly.`,
                        t.ast.loc,
                    );
                }
            }
        }

        // Calculate TLB
        const tlbHeader =
            id !== null
                ? `${changeCase.snakeCase(name)}#${idToHex(Number(id.value))}`
                : "_";
        const tlb = tlbHeader + " " + fields.join(" ") + " = " + name;

        signatures.set(name, { signature, id, tlb });
        return { signature, id, tlb };
    }

    getAllTypes(ctx).forEach((t) => {
        if (t.kind === "struct") {
            const r = createTupleSignature(t.name);
            t.tlb = r.tlb;
            t.signature = r.signature;
            t.header = r.id;
        }
    });

    checkMessageOpcodesUnique(ctx);

    return ctx;
}

function newMessageOpcode(signature: string): AstNumber {
    return {
        kind: "number",
        base: 10,
        value: BigInt(
            beginCell()
                .storeBuffer(sha256_sync(signature))
                .endCell()
                .beginParse()
                .loadUint(32),
        ),
        id: 0,
        loc: dummySrcInfo,
    };
}

type messageType = string;
type binOpcode = number;

function checkBinaryMessageReceiver(
    rcv: BinaryReceiverSelector,
    rcvAst: AstReceiver,
    usedOpcodes: Map<binOpcode, messageType>,
    ctx: CompilerContext,
) {
    const msgType = getType(ctx, rcv.type);
    const opcode = msgType.header!;
    if (usedOpcodes.has(Number(opcode.value))) {
        throwCompilationError(
            `Receive functions of a contract or trait cannot process messages with the same opcode: opcodes of message types "${rcv.type}" and "${usedOpcodes.get(Number(opcode.value))}" are equal`,
            rcvAst.loc,
        );
    } else {
        usedOpcodes.set(Number(opcode.value), rcv.type);
    }
}

type commentOpcode = string;

// "opcode" clashes are highly unlikely in this case, of course
function checkCommentMessageReceiver(
    rcv: CommentReceiverSelector,
    rcvAst: AstReceiver,
    usedOpcodes: Map<commentOpcode, messageType>,
) {
    const opcode = commentPseudoOpcode(rcv.comment);
    if (usedOpcodes.has(opcode)) {
        throwCompilationError(
            `Receive functions of a contract or trait cannot process comments with the same hashes: hashes of comment strings "${rcv.comment}" and "${usedOpcodes.get(opcode)}" are equal`,
            rcvAst.loc,
        );
    } else {
        usedOpcodes.set(opcode, rcv.comment);
    }
}

function checkMessageOpcodesUniqueInContractOrTrait(
    receivers: ReceiverDescription[],
    ctx: CompilerContext,
) {
    const binBouncedRcvUsedOpcodes: Map<binOpcode, messageType> = new Map();
    const binExternalRcvUsedOpcodes: Map<binOpcode, messageType> = new Map();
    const binInternalRcvUsedOpcodes: Map<binOpcode, messageType> = new Map();

    const commentExternalRcvUsedOpcodes: Map<commentOpcode, messageType> =
        new Map();
    const commentInternalRcvUsedOpcodes: Map<commentOpcode, messageType> =
        new Map();

    for (const rcv of receivers) {
        switch (rcv.selector.kind) {
            case "internal-binary":
                checkBinaryMessageReceiver(
                    rcv.selector,
                    rcv.ast,
                    binInternalRcvUsedOpcodes,
                    ctx,
                );
                break;
            case "bounce-binary":
                checkBinaryMessageReceiver(
                    rcv.selector,
                    rcv.ast,
                    binBouncedRcvUsedOpcodes,
                    ctx,
                );
                break;
            case "external-binary":
                checkBinaryMessageReceiver(
                    rcv.selector,
                    rcv.ast,
                    binExternalRcvUsedOpcodes,
                    ctx,
                );
                break;
            case "internal-comment":
                checkCommentMessageReceiver(
                    rcv.selector,
                    rcv.ast,
                    commentInternalRcvUsedOpcodes,
                );
                break;
            case "external-comment":
                checkCommentMessageReceiver(
                    rcv.selector,
                    rcv.ast,
                    commentExternalRcvUsedOpcodes,
                );
                break;
            default:
                break;
        }
    }
}

function checkMessageOpcodesUnique(ctx: CompilerContext) {
    getAllTypes(ctx).forEach((aggregate) => {
        switch (aggregate.kind) {
            case "contract":
            case "trait":
                checkMessageOpcodesUniqueInContractOrTrait(
                    aggregate.receivers,
                    ctx,
                );
                break;
            default:
                break;
        }
    });
}
