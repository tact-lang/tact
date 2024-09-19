import { ABIGetter, ABIReceiver, ABIType, ContractABI } from "@ton/core";
import { contractErrors } from "../abi/errors";
import { CompilerContext } from "../context";
import { idText } from "../grammar/ast";
import { getSupportedInterfaces } from "../types/getSupportedInterfaces";
import { createABITypeRefFromTypeRef } from "../types/resolveABITypeRef";
import { getAllTypes } from "../types/resolveDescriptors";
import { getAllErrors } from "../types/resolveErrors";

export function createABI(ctx: CompilerContext, name: string): ContractABI {
    const allTypes = getAllTypes(ctx);

    // Contract
    const contract = allTypes.find((v) => v.name === name);
    if (!contract) {
        throw Error(`Contract "${name}" not found`);
    }
    if (contract.kind !== "contract") {
        throw Error("Not a contract");
    }

    // Structs
    const types: ABIType[] = [];
    for (const t of allTypes) {
        if (t.kind === "struct") {
            types.push({
                name: t.name,
                header: Number(t.header?.value),
                fields: t.fields.map((v) => v.abi),
            });
        } else if (t.kind === "contract") {
            types.push({
                name: t.name + "$Data",
                header: Number(t.header?.value),
                fields: t.fields.map((v) => v.abi),
            });
        }
    }

    // // Receivers
    const receivers: ABIReceiver[] = [];
    for (const r of contract.receivers) {
        if (r.selector.kind === "internal-binary") {
            receivers.push({
                receiver: "internal",
                message: {
                    kind: "typed",
                    type: r.selector.type,
                },
            });
        } else if (r.selector.kind === "external-binary") {
            receivers.push({
                receiver: "external",
                message: {
                    kind: "typed",
                    type: r.selector.type,
                },
            });
        } else if (r.selector.kind === "internal-empty") {
            receivers.push({
                receiver: "internal",
                message: {
                    kind: "empty",
                },
            });
        } else if (r.selector.kind === "external-empty") {
            receivers.push({
                receiver: "external",
                message: {
                    kind: "empty",
                },
            });
        } else if (r.selector.kind === "internal-comment") {
            receivers.push({
                receiver: "internal",
                message: {
                    kind: "text",
                    text: r.selector.comment,
                },
            });
        } else if (r.selector.kind === "external-comment") {
            receivers.push({
                receiver: "external",
                message: {
                    kind: "text",
                    text: r.selector.comment,
                },
            });
        } else if (r.selector.kind === "internal-comment-fallback") {
            receivers.push({
                receiver: "internal",
                message: {
                    kind: "text",
                },
            });
        } else if (r.selector.kind === "external-comment-fallback") {
            receivers.push({
                receiver: "external",
                message: {
                    kind: "text",
                },
            });
        } else if (r.selector.kind === "internal-fallback") {
            receivers.push({
                receiver: "internal",
                message: {
                    kind: "any",
                },
            });
        } else if (r.selector.kind === "external-fallback") {
            receivers.push({
                receiver: "external",
                message: {
                    kind: "any",
                },
            });
        }
    }

    // Getters
    const getters: ABIGetter[] = [];
    for (const f of contract.functions.values()) {
        if (f.isGetter) {
            getters.push({
                name: f.name,
                arguments: f.params.map((v) => ({
                    name: idText(v.name),
                    type: createABITypeRefFromTypeRef(ctx, v.type, v.loc),
                })),
                returnType:
                    f.returns.kind !== "void"
                        ? createABITypeRefFromTypeRef(ctx, f.returns, f.ast.loc)
                        : null,
            });
        }
    }

    // Errors
    const errors: Record<string, { message: string }> = {};
    errors["2"] = { message: "Stack underflow" };
    errors["3"] = { message: "Stack overflow" };
    errors["4"] = { message: "Integer overflow" };
    errors["5"] = { message: "Integer out of expected range" };
    errors["6"] = { message: "Invalid opcode" };
    errors["7"] = { message: "Type check error" };
    errors["8"] = { message: "Cell overflow" };
    errors["9"] = { message: "Cell underflow" };
    errors["10"] = { message: "Dictionary error" };
    errors["11"] = { message: "'Unknown' error" };
    errors["12"] = { message: "Fatal error" };
    errors["13"] = { message: "Out of gas error" };
    errors["14"] = { message: "Virtualization error" };
    errors["32"] = { message: "Action list is invalid" };
    errors["33"] = { message: "Action list is too long" };
    errors["34"] = { message: "Action is invalid or not supported" };
    errors["35"] = { message: "Invalid source address in outbound message" };
    errors["36"] = {
        message: "Invalid destination address in outbound message",
    };
    errors["37"] = { message: "Not enough TON" };
    errors["38"] = { message: "Not enough extra-currencies" };
    errors["39"] = {
        message: "Outbound message does not fit into a cell after rewriting",
    };
    errors["40"] = { message: "Cannot process a message" };
    errors["41"] = { message: "Library reference is null" };
    errors["42"] = { message: "Library change action error" };
    errors["43"] = {
        message:
            "Exceeded maximum number of cells in the library or the maximum depth of the Merkle tree",
    };
    errors["50"] = { message: "Account state size exceeded limits" };
    for (const e of Object.values(contractErrors)) {
        errors[e.id] = { message: e.message };
    }
    const codeErrors = getAllErrors(ctx);
    for (const c of codeErrors) {
        errors[c.id + ""] = { message: c.value };
    }

    // Interfaces
    const interfaces = [
        "org.ton.introspection.v0",
        ...getSupportedInterfaces(contract, ctx),
    ];

    return {
        name: contract.name,
        types,
        receivers,
        getters,
        errors,
        interfaces,
    } as object;
}
