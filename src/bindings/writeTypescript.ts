import * as changeCase from "change-case";
import { Writer } from "../utils/Writer";
import { ABIArgument, ABIType, ContractABI } from "@ton/core";
import {
    writeArgumentToStack,
    writeDictParser,
    writeGetParser,
    writeInitSerializer,
    writeParser,
    writeSerializer,
    writeStruct,
    writeTupleParser,
    writeTupleSerializer,
} from "./typescript/writeStruct";
import { AllocationCell } from "../storage/operation";
import { topologicalSort } from "../utils/utils";
import {
    allocate,
    getAllocationOperationFromField,
} from "../storage/allocator";
import { serializers } from "./typescript/serializers";

function writeArguments(args: ABIArgument[]) {
    const res: string[] = [];
    outer: for (const f of args) {
        for (const s of serializers) {
            const v = s.abiMatcher(f.type);
            if (v) {
                res.push(`${f.name}: ${s.tsType(v)}`);
                continue outer;
            }
        }
        throw Error("Unsupported type: " + JSON.stringify(f.type));
    }

    return res;
}

export function writeTypescript(
    abi: ContractABI,
    init?: {
        code: string;
        system: string;
        args: ABIArgument[];
        prefix?:
            | {
                  value: number;
                  bits: number;
              }
            | undefined;
    },
) {
    const w = new Writer();

    w.write(`
        import { 
            Cell,
            Slice, 
            Address, 
            Builder, 
            beginCell, 
            ComputeError, 
            TupleItem, 
            TupleReader, 
            Dictionary, 
            contractAddress, 
            ContractProvider, 
            Sender, 
            Contract, 
            ContractABI, 
            ABIType,
            ABIGetter,
            ABIReceiver,
            TupleBuilder,
            DictionaryValue
        } from '@ton/core';
    `);
    w.append();

    const allocations: {
        [key: string]: {
            size: { bits: number; refs: number };
            root: AllocationCell;
        };
    } = {};

    // Structs
    if (abi.types) {
        // Allocations
        const refs = (src: ABIType) => {
            const res: ABIType[] = [];
            const t = new Set<string>();
            for (const f of src.fields) {
                const r = f.type;
                if (r.kind === "simple") {
                    const e = abi.types!.find((v) => v.name === r.type);
                    if (e) {
                        if (!t.has(r.type)) {
                            t.add(r.type);
                            res.push(e);
                        }
                    }
                }
            }
            return res;
        };
        const sortedTypes = topologicalSort(abi.types, refs);
        for (const f of sortedTypes) {
            const ops = f.fields.map((v) => ({
                name: v.name,
                type: v.type,
                op: getAllocationOperationFromField(
                    v.type,
                    (s) => allocations[s].size,
                ),
            }));
            const headerBits = f.header ? 32 : 0;
            const allocation = allocate({
                reserved: { bits: headerBits, refs: 0 },
                ops,
            });
            allocations[f.name] = {
                size: {
                    bits: allocation.size.bits + headerBits,
                    refs: allocation.size.refs,
                },
                root: allocation,
            };
        }

        for (const s of abi.types) {
            writeStruct(s.name, s.fields, true, w);
            writeSerializer(s, allocations[s.name].root, w);
            writeParser(s, allocations[s.name].root, w);
            writeTupleParser(s, w);
            writeTupleSerializer(s, w);
            writeDictParser(s, w);
        }
    }

    // Init
    if (init) {
        // Write serializer
        const argTypeName = (abi.name || "Contract") + "_init_args";
        const ops = init.args.map((v) => ({
            name: v.name,
            type: v.type,
            op: getAllocationOperationFromField(
                v.type,
                (s) => allocations[s].size,
            ),
        }));
        const allocation = allocate({
            reserved: { bits: init.prefix ? init.prefix.bits : 0, refs: 1 },
            ops,
        });
        writeStruct(argTypeName, init.args, false, w);
        writeInitSerializer(argTypeName, allocation, w);

        // Write init function
        w.append(
            `async function ${abi.name}_init(${writeArguments(init.args).join(", ")}) {`,
        );
        w.inIndent(() => {
            // Code references
            w.append(`const __code = Cell.fromBase64('${init.code}');`);
            w.append(`const __system = Cell.fromBase64('${init.system}');`);

            // Stack
            w.append("let builder = beginCell();");
            w.append(`builder.storeRef(__system);`);
            if (init.prefix) {
                w.append(
                    `builder.storeUint(${init.prefix.value}, ${init.prefix.bits});`,
                );
            }
            w.append(
                `init${argTypeName}({ ${[`$$type: '${argTypeName}'`, ...init.args.map((v) => v.name)].join(", ")} })(builder);`,
            );
            w.append(`const __data = builder.endCell();`);
            w.append(`return { code: __code, data: __data };`);
        });
        w.append(`}`);
        w.append();
    }

    // Errors
    w.append(
        `const ${abi.name}_errors: { [key: number]: { message: string } } = {`,
    );
    w.inIndent(() => {
        if (abi.errors) {
            for (const k in abi.errors) {
                w.append(
                    `${k}: { message: \`${abi.errors[
                        parseInt(k, 10)
                    ].message.replaceAll("`", "\\`")}\` },`,
                );
            }
        }
    });
    w.append(`}`);
    w.append();

    // Types
    w.append(`const ${abi.name}_types: ABIType[] = [`);
    w.inIndent(() => {
        if (abi.types) {
            for (const t of abi.types) {
                w.append(JSON.stringify(t) + ",");
            }
        }
    });
    w.append(`]`);
    w.append();

    // Getters
    w.append(`const ${abi.name}_getters: ABIGetter[] = [`);
    w.inIndent(() => {
        if (abi.getters) {
            for (const t of abi.getters) {
                w.append(JSON.stringify(t) + ",");
            }
        }
    });
    w.append(`]`);
    w.append();

    // Receivers
    w.append(`const ${abi.name}_receivers: ABIReceiver[] = [`);
    w.inIndent(() => {
        if (abi.receivers) {
            for (const t of abi.receivers) {
                w.append(JSON.stringify(t) + ",");
            }
        }
    });
    w.append(`]`);
    w.append();

    // Wrapper
    w.append(`export class ${abi.name} implements Contract {`);
    w.inIndent(() => {
        w.append();

        if (init) {
            w.append(
                `static async init(${writeArguments(init.args).join(", ")}) {`,
            );
            w.inIndent(() => {
                w.append(
                    `return await ${abi.name}_init(${init!.args.map((v) => v.name).join(", ")});`,
                );
            });
            w.append(`}`);
            w.append();

            w.append(
                `static async fromInit(${writeArguments(init.args).join(", ")}) {`,
            );
            w.inIndent(() => {
                w.append(
                    `const init = await ${abi.name}_init(${init!.args.map((v) => v.name).join(", ")});`,
                );
                w.append(`const address = contractAddress(0, init);`);
                w.append(`return new ${abi.name}(address, init);`);
            });
            w.append(`}`);
            w.append();
        }

        w.append(`static fromAddress(address: Address) {`);
        w.inIndent(() => {
            w.append(`return new ${abi.name}(address);`);
        });
        w.append(`}`);
        w.append();

        w.append(`readonly address: Address; `);
        w.append(`readonly init?: { code: Cell, data: Cell };`);
        w.append(`readonly abi: ContractABI = {`);
        w.inIndent(() => {
            w.append(`types:  ${abi.name}_types,`);
            w.append(`getters: ${abi.name}_getters,`);
            w.append(`receivers: ${abi.name}_receivers,`);
            w.append(`errors: ${abi.name}_errors,`);
        });
        w.append(`};`);
        w.append();
        w.append(
            `private constructor(address: Address, init?: { code: Cell, data: Cell }) {`,
        );
        w.inIndent(() => {
            w.append("this.address = address;");
            w.append("this.init = init;");
        });
        w.append("}");
        w.append();

        // Internal receivers
        if (
            abi.receivers &&
            abi.receivers.filter((v) => v.receiver === "internal").length > 0
        ) {
            // Types
            const receivers: string[] = [];
            for (const r of abi.receivers) {
                if (r.receiver !== "internal") {
                    continue;
                }
                if (r.message.kind === "empty") {
                    receivers.push(`null`);
                } else if (r.message.kind === "typed") {
                    receivers.push(`${r.message.type}`);
                } else if (r.message.kind === "text") {
                    if (
                        r.message.text !== null &&
                        r.message.text !== undefined
                    ) {
                        receivers.push(`'${r.message.text}'`);
                    } else {
                        receivers.push(`string`);
                    }
                } else if (r.message.kind === "any") {
                    receivers.push(`Slice`);
                }
            }

            // Receiver function
            w.append(
                `async send(provider: ContractProvider, via: Sender, args: { value: bigint, bounce?: boolean| null | undefined }, message: ${receivers.join(" | ")}) {`,
            );
            w.inIndent(() => {
                w.append();

                // Parse message
                w.append(`let body: Cell | null = null;`);
                for (const r of abi.receivers!) {
                    if (r.receiver !== "internal") {
                        continue;
                    }
                    const msg = r.message;
                    if (msg.kind === "typed") {
                        w.append(
                            `if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === '${msg.type}') {`,
                        );
                        w.inIndent(() => {
                            w.append(
                                `body = beginCell().store(store${msg.type}(message)).endCell();`,
                            );
                        });
                        w.append(`}`);
                    } else if (msg.kind === "empty") {
                        w.append(`if (message === null) {`);
                        w.inIndent(() => {
                            w.append(`body = new Cell();`);
                        });
                        w.append(`}`);
                    } else if (msg.kind === "text") {
                        if (msg.text === null || msg.text === undefined) {
                            w.append(`if (typeof message === 'string') {`);
                            w.inIndent(() => {
                                w.append(
                                    `body = beginCell().storeUint(0, 32).storeStringTail(message).endCell();`,
                                );
                            });
                            w.append(`}`);
                        } else {
                            w.append(`if (message === '${msg.text}') {`);
                            w.inIndent(() => {
                                w.append(
                                    `body = beginCell().storeUint(0, 32).storeStringTail(message).endCell();`,
                                );
                            });
                            w.append(`}`);
                        }
                    } else if (msg.kind === "any") {
                        w.append(
                            `if (message && typeof message === 'object' && message instanceof Slice) {`,
                        );
                        w.inIndent(() => {
                            w.append(`body = message.asCell();`);
                        });
                        w.append(`}`);
                    }
                }
                w.append(
                    `if (body === null) { throw new Error('Invalid message type'); }`,
                );
                w.append();

                // Send message
                w.append(
                    `await provider.internal(via, { ...args, body: body });`,
                );
                w.append();
            });
            w.append(`}`);
            w.append();
        }

        if (
            abi.receivers &&
            abi.receivers.filter((v) => v.receiver === "external").length > 0
        ) {
            // Types
            const receivers: string[] = [];
            for (const r of abi.receivers) {
                if (r.receiver !== "external") {
                    continue;
                }
                if (r.message.kind === "empty") {
                    receivers.push(`null`);
                } else if (r.message.kind === "typed") {
                    receivers.push(`${r.message.type}`);
                } else if (r.message.kind === "text") {
                    if (
                        r.message.text !== null &&
                        r.message.text !== undefined
                    ) {
                        receivers.push(`'${r.message.text}'`);
                    } else {
                        receivers.push(`string`);
                    }
                } else if (r.message.kind === "any") {
                    receivers.push(`Slice`);
                }
            }

            // Receiver function
            w.append(
                `async sendExternal(provider: ContractProvider, message: ${receivers.join(" | ")}) {`,
            );
            w.inIndent(() => {
                w.append();

                // Parse message
                w.append(`let body: Cell | null = null;`);
                for (const r of abi.receivers!) {
                    if (r.receiver !== "external") {
                        continue;
                    }
                    const msg = r.message;
                    if (msg.kind === "typed") {
                        w.append(
                            `if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === '${msg.type}') {`,
                        );
                        w.inIndent(() => {
                            w.append(
                                `body = beginCell().store(store${msg.type}(message)).endCell();`,
                            );
                        });
                        w.append(`}`);
                    } else if (msg.kind === "empty") {
                        w.append(`if (message === null) {`);
                        w.inIndent(() => {
                            w.append(`body = new Cell();`);
                        });
                        w.append(`}`);
                    } else if (msg.kind === "text") {
                        if (msg.text === null || msg.text === undefined) {
                            w.append(`if (typeof message === 'string') {`);
                            w.inIndent(() => {
                                w.append(
                                    `body = beginCell().storeUint(0, 32).storeStringTail(message).endCell();`,
                                );
                            });
                            w.append(`}`);
                        } else {
                            w.append(`if (message === '${msg.text}') {`);
                            w.inIndent(() => {
                                w.append(
                                    `body = beginCell().storeUint(0, 32).storeStringTail(message).endCell();`,
                                );
                            });
                            w.append(`}`);
                        }
                    } else if (msg.kind === "any") {
                        w.append(
                            `if (message && typeof message === 'object' && message instanceof Slice) {`,
                        );
                        w.inIndent(() => {
                            w.append(`body = message.asCell();`);
                        });
                        w.append(`}`);
                    }
                }
                w.append(
                    `if (body === null) { throw new Error('Invalid message type'); }`,
                );
                w.append();

                // Send message
                w.append(`await provider.external(body);`);
                w.append();
            });
            w.append(`}`);
            w.append();
        }

        // Getters
        if (abi.getters) {
            for (const g of abi.getters) {
                w.append(
                    `async get${changeCase.pascalCase(g.name)}(${["provider: ContractProvider", ...writeArguments(g.arguments ? g.arguments : [])].join(", ")}) {`,
                );
                w.inIndent(() => {
                    w.append(`let builder = new TupleBuilder();`);
                    if (g.arguments) {
                        for (const a of g.arguments) {
                            writeArgumentToStack(a.name, a.type, w);
                        }
                    }
                    w.append(
                        `let source = (await provider.get('${g.name}', builder.build())).stack;`,
                    );
                    if (g.returnType) {
                        writeGetParser("result", g.returnType, w);
                        w.append(`return result;`);
                    }
                });
                w.append(`}`);
                w.append();
            }
        }
    });
    w.append(`}`);

    return w.end();
}
