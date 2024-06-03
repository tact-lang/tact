import { ABIGetter, ABIReceiver, ABIType, ContractABI } from "@ton/core";
import { contractErrors } from "../abi/errors";
import { CompilerContext } from "../context";
import { getSupportedInterfaces } from "../types/getSupportedInterfaces";
import { createABITypeRefFromTypeRef } from "../types/resolveABITypeRef";
import { getAllTypes } from "../types/resolveDescriptors";
import { getAllErrors } from "../types/resolveErrors";

export function createABI(ctx: CompilerContext, name: string): ContractABI {
    const allTypes = Object.values(getAllTypes(ctx));

    // Contract
    const contract = allTypes.find((v) => v.name === name)!;
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
                header: t.header,
                fields: t.fields.map((v) => v.abi),
            });
        }
    }

    // // Receivers
    const receivers: ABIReceiver[] = [];
    for (const r of Object.values(contract.receivers)) {
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
                arguments: f.args.map((v) => ({
                    name: v.name,
                    type: createABITypeRefFromTypeRef(v.type, v.ref),
                })),
                returnType:
                    f.returns.kind !== "void"
                        ? createABITypeRefFromTypeRef(f.returns, f.ast.ref)
                        : null,
            });
        }
    }

    // Errors
    const errors: { [key: string]: { message: string } } = {};
    errors["2"] = { message: "Stack underflow" };
    errors["3"] = { message: "Stack overflow" };
    errors["4"] = { message: "Integer overflow" };
    errors["5"] = { message: "Integer out of expected range" };
    errors["6"] = { message: "Invalid opcode" };
    errors["7"] = { message: "Type check error" };
    errors["8"] = { message: "Cell overflow" };
    errors["9"] = { message: "Cell underflow" };
    errors["10"] = { message: "Dictionary error" };
    errors["13"] = { message: "Out of gas error" };
    errors["32"] = { message: "Method ID not found" };
    errors["34"] = { message: "Action is invalid or not supported" };
    errors["37"] = { message: "Not enough TON" };
    errors["38"] = { message: "Not enough extra-currencies" };
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
