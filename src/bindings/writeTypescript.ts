import { Writer } from "../utils/Writer";
import { getTSFieldType } from "./typescript/getTSFieldType";
import { ABIArgument, ABIType, ContractABI } from "ton-core";
import { writeArgumentToStack, writeParser, writeSerializer, writeStruct, writeTupleParser, writeTupleSerializer } from "./typescript/writeStruct";
import { AllocationCell } from "../storage/operation";
import { topologicalSort } from "../utils/utils";
import { allocate, getAllocationOperationFromField } from "../storage/allocator";

function writeArguments(args: ABIArgument[]) {
    return args.map((v) => `${v.name}: ${getTSFieldType(v.type)}`);
}

export function writeTypescript(abi: ContractABI, init?: { code: string, initCode: string, system: string, args: ABIArgument[] }) {
    let w = new Writer();
    w.append(`import { Cell, Slice, Address, Builder, beginCell, ComputeError, TupleItem, TupleReader, Dictionary, contractAddress, ContractProvider, Sender, Contract, ContractABI, TupleBuilder } from 'ton-core';`);
    w.append(`import { ContractSystem, ContractExecutor } from 'ton-emulator';`);
    w.append();

    // Structs
    if (abi.types) {

        // Allocations
        let allocations: { [key: string]: { size: { bits: number, refs: number }, root: AllocationCell } } = {};
        let refs = (src: ABIType) => {
            let res: ABIType[] = []
            let t = new Set<string>();
            for (let f of src.fields) {
                const r = f.type;
                if (r.kind === 'simple') {
                    let e = abi.types!.find((v) => v.name === r.type);
                    if (e) {
                        if (!t.has(r.type)) {
                            t.add(r.type);
                            res.push(e);
                        }
                    }
                }
            }
            return res;
        }
        let sortedTypes = topologicalSort(abi.types, refs);
        for (let f of sortedTypes) {
            let ops = f.fields.map((v) => getAllocationOperationFromField(v.type, (s) => allocations[s].size));
            let headerBits = f.header ? 32 : 0;
            let allocation = allocate({ reserved: { bits: headerBits, refs: 0 }, ops });
            allocations[f.name] = { size: { bits: allocation.size.bits + headerBits, refs: allocation.size.refs }, root: allocation };
        }

        for (let s of abi.types) {
            writeStruct(s, w);
            writeSerializer(s, allocations[s.name].root, w);
            writeParser(s, allocations[s.name].root, w);
            writeTupleParser(s, w);
            writeTupleSerializer(s, w);
        }
    }

    // Init
    if (init) {
        w.append(`async function ${abi.name}_init(${writeArguments(init.args).join(', ')}) {`);
        w.inIndent(() => {

            // Code references
            w.append(`const __init = '${init.initCode}';`)
            w.append(`const __code = '${init.code}';`);
            w.append(`const __system = '${init.system}';`);
            w.append(`let systemCell = Cell.fromBase64(__system);`);

            // Stack
            w.append('let builder = new TupleBuilder();');
            w.append(`builder.writeCell(systemCell);`);
            for (let a of init.args) {
                writeArgumentToStack(a.name, a.type, w);
            }
            w.append(`let __stack = builder.build();`);

            // Deploy
            w.append(`let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];`);
            w.append(`let initCell = Cell.fromBoc(Buffer.from(__init, 'base64'))[0];`);
            w.append(`let system = await ContractSystem.create();`);
            w.append(`let executor = await ContractExecutor.create({ code: initCell, data: new Cell() }, system);`);
            w.append(`let res = await executor.get('init', __stack);`);
            w.append(`if (!res.success) { throw Error(res.error); }`);
            w.append(`if (res.exitCode !== 0 && res.exitCode !== 1) {`);
            w.inIndent(() => {
                w.append(`if (${abi.name}_errors[res.exitCode]) {`);
                w.inIndent(() => {
                    w.append(`throw new ComputeError(${abi.name}_errors[res.exitCode].message, res.exitCode, { logs: res.vmLogs });`);
                });
                w.append(`} else {`);
                w.inIndent(() => {
                    w.append(`throw new ComputeError('Exit code: ' + res.exitCode, res.exitCode, { logs: res.vmLogs });`);
                });
                w.append(`}`);
            });
            w.append(`}`);
            w.append();
            w.append(`let data = res.stack.readCell();`);
            w.append(`return { code: codeCell, data };`);
        });
        w.append(`}`);
        w.append();
    }

    // Errors
    w.append(`const ${abi.name}_errors: { [key: number]: { message: string } } = {`);
    w.inIndent(() => {
        if (abi.errors) {
            for (let k in abi.errors) {
                w.append(`${k}: { message: \`${abi.errors[parseInt(k, 10)].message}\` },`);
            }
        }
    });
    w.append(`}`);
    w.append();

    // Wrapper
    w.append(`export class ${abi.name} implements Contract {`);
    w.inIndent(() => {
        w.append();

        if (init) {
            w.append(`static async init(${writeArguments(init.args).join(', ')}) {`);
            w.inIndent(() => {
                w.append(`return await ${abi.name}_init(${init!.args.map((v) => v.name)});`);
            });
            w.append(`}`);
            w.append();

            w.append(`static async fromInit(${writeArguments(init.args).join(', ')}) {`);
            w.inIndent(() => {
                w.append(`const init = await ${abi.name}_init(${init!.args.map((v) => v.name)});`);
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
            w.append(`errors: ${abi.name}_errors`)
        });
        w.append(`};`);
        w.append();
        w.append(`private constructor(address: Address, init?: { code: Cell, data: Cell }) {`);
        w.inIndent(() => {
            w.append('this.address = address;');
            w.append('this.init = init;');
        });
        w.append('}')
        w.append();

        // Receivers
        if (abi.receivers && abi.receivers.length > 0) {

            // Types
            let receivers: string[] = [];
            for (const r of abi.receivers) {
                if (r.receiver !== 'internal') {
                    continue;
                }
                if (r.message.kind === 'empty') {
                    receivers.push(`null`);
                } else if (r.message.kind === 'typed') {
                    receivers.push(`${r.message.type}`);
                } else if (r.message.kind === 'text') {
                    if (r.message.text !== null && r.message.text !== undefined) {
                        receivers.push(`'${r.message.text}'`);
                    } else {
                        receivers.push(`string`);
                    }
                } else if (r.message.kind === 'any') {
                    receivers.push(`Slice`);
                }
            }

            // Receiver function
            w.append(`async send(provider: ContractProvider, via: Sender, args: { value: bigint, bounce?: boolean| null | undefined }, message: ${receivers.join(' | ')}) {`);
            w.inIndent(() => {
                w.append();

                // Parse message
                w.append(`let body: Cell | null = null;`);
                for (const r of abi.receivers!) {
                    if (r.receiver !== 'internal') {
                        continue;
                    }
                    const msg = r.message;
                    if (msg.kind === 'typed') {
                        w.append(`if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === '${msg.type}') {`);
                        w.inIndent(() => {
                            w.append(`body = beginCell().store(store${msg.type}(message)).endCell();`);
                        });
                        w.append(`}`);
                    } else if (msg.kind === 'empty') {
                        w.append(`if (message === null) {`);
                        w.inIndent(() => {
                            w.append(`body = new Cell();`);
                        });
                        w.append(`}`);
                    } else if (msg.kind === 'text') {
                        if ((msg.text === null || msg.text === undefined)) {
                            w.append(`if (typeof message === 'string') {`);
                            w.inIndent(() => {
                                w.append(`body = beginCell().storeUint(0, 32).storeStringTail(message).endCell();`);
                            });
                            w.append(`}`);
                        } else {
                            w.append(`if (message === '${msg.text}') {`);
                            w.inIndent(() => {
                                w.append(`body = beginCell().storeUint(0, 32).storeStringTail(message).endCell();`);
                            });
                            w.append(`}`);
                        }
                    } else if (msg.kind === 'any') {
                        w.append(`if (message && typeof message === 'object' && message instanceof Slice) {`);
                        w.inIndent(() => {
                            w.append(`body = message.asCell();`);
                        });
                        w.append(`}`);
                    }
                }
                w.append(`if (body === null) { throw new Error('Invalid message type'); }`);
                w.append();

                // Send message
                w.append(`await provider.internal(via, { ...args, body: body });`);
                w.append();
            });
            w.append(`}`);
            w.append();
        }

        // // Getters
        // if (abi.getters) {
        //     for (let g of abi.getters) {
        //         w.append(`async get${changeCase.pascalCase(g.name)}(${['provider: ContractProvider', ...writeArguments(g.args)].join(', ')}) {`);
        //         w.inIndent(() => {
        //             w.append(`let __tuple: TupleItem[] = [];`);
        //             for (let a of g.args) {
        //                 writeArgumentToStack(a.name, a.type, w);
        //             }
        //             w.append(`let result = await provider.get('${g.name}', __tuple);`);

        //             if (g.returns) {
        //                 if (g.returns.kind === 'ref') {
        //                     if (g.returns.name === 'Bool') {
        //                         if (g.returns.optional) {
        //                             w.append(`return result.stack.readBooleanOpt();`);
        //                         } else {
        //                             w.append(`return result.stack.readBoolean();`);
        //                         }
        //                     } else if (g.returns.name === 'Int') {
        //                         if (g.returns.optional) {
        //                             w.append(`return result.stack.readBigNumberOpt();`);
        //                         } else {
        //                             w.append(`return result.stack.readBigNumber();`);
        //                         }
        //                     } else if (g.returns.name === 'Address') {
        //                         if (g.returns.optional) {
        //                             w.append(`return result.stack.readAddressOpt();`);
        //                         } else {
        //                             w.append(`return result.stack.readAddress();`);
        //                         }
        //                     } else if (g.returns.name === 'Cell') {
        //                         if (g.returns.optional) {
        //                             w.append(`return result.stack.readCellOpt();`);
        //                         } else {
        //                             w.append(`return result.stack.readCell();`);
        //                         }
        //                     } else if (g.returns.name === 'Slice') {
        //                         if (g.returns.optional) {
        //                             w.append(`return result.stack.readCellOpt();`);
        //                         } else {
        //                             w.append(`return result.stack.readCell();`);
        //                         }
        //                     } else if (g.returns.name === 'Builder') {
        //                         if (g.returns.optional) {
        //                             w.append(`return result.stack.readCellOpt();`);
        //                         } else {
        //                             w.append(`return result.stack.readCell();`);
        //                         }
        //                     } else if (g.returns.name === 'String') {
        //                         if (g.returns.optional) {
        //                             w.append(`let c = result.stack.readCellOpt();`);
        //                             w.append(`if (c === null) { return null; }`);
        //                             w.append(`return c.beginParse().loadStringTail();`);
        //                         } else {
        //                             w.append(`return result.stack.readCell().beginParse().loadStringTail();`);
        //                         }
        //                     } else {
        //                         if (g.returns.optional) {
        //                             w.append(`let pp = result.stack.readTupleOpt();`);
        //                             w.append(`if (!pp) { return null; }`);
        //                             w.append(`return loadTuple${g.returns.name}(pp);`);
        //                         } else {
        //                             w.append(`return loadTuple${g.returns.name}(result.stack);`);
        //                         }
        //                     }
        //                 } else if (g.returns.kind === 'map') {
        //                     w.append(`return result.stack.readCellOpt();`);
        //                 } else if (g.returns.kind === 'null') {
        //                     throw Error('Impossible');
        //                 } else if (g.returns.kind === 'void') {
        //                     throw Error('Impossible');
        //                 } else {
        //                     throw Error('Not implemented');
        //                 }
        //             }
        //         });
        //         w.append(`}`);
        //         w.append();
        //     }
        // }
    });
    w.append(`}`);

    return w.end();
}