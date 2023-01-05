import { ContractABI, ContractFunctionArg } from "../abi/ContractABI";
import * as changeCase from "change-case";
import { Writer } from "../utils/Writer";
import { writeArgumentToStack, writeParser, writeSerializer, writeStruct, writeTupleParser, writeTupleSerializer } from "./typescript/writeStruct";
import { getTSFieldType } from "./typescript/getTSFieldType";

function writeArguments(args: ContractFunctionArg[]) {
    return args.map((v) => `${v.name}: ${getTSFieldType(v.type)}`);
}

export function writeTypescript(abi: ContractABI, code: string, initCode: string, system: string) {
    let w = new Writer();
    w.append(`import { Cell, Slice, Address, Builder, beginCell, ComputeError, TupleItem, TupleReader, Dictionary, contractAddress, ContractProvider, Sender, Contract, ContractABI } from 'ton-core';`);
    w.append(`import { ContractSystem, ContractExecutor } from 'ton-emulator';`);
    w.append();

    // Structs
    for (let s of abi.structs) {
        writeStruct(s, w);
        writeSerializer(s, w);
        writeParser(s, w);
        writeTupleParser(s, w);
        writeTupleSerializer(s, w);
    }

    // Init
    if (abi.init) {
        w.append(`async function ${abi.name}_init(${writeArguments(abi.init.args).join(', ')}) {`);
        w.inIndent(() => {

            // Code references
            w.append(`const __init = '${initCode}';`)
            w.append(`const __code = '${code}';`);
            w.append(`const __system = '${system}';`);
            w.append(`let systemCell = Cell.fromBase64(__system);`);

            // Stack
            w.append('let __tuple: TupleItem[] = [];');
            w.append(`__tuple.push({ type: 'cell', cell: systemCell });`);
            for (let a of abi.init!.args) {
                writeArgumentToStack(a.name, a.type, w);
            }

            // Deploy
            w.append(`let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];`);
            w.append(`let initCell = Cell.fromBoc(Buffer.from(__init, 'base64'))[0];`);
            w.append(`let system = await ContractSystem.create();`);
            w.append(`let executor = await ContractExecutor.create({ code: initCell, data: new Cell() }, system);`);
            w.append(`let res = await executor.get('init', __tuple);`);
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
        for (let k in abi.errors) {
            w.append(`${k}: { message: \`${abi.errors[k].message}\` },`);
        }
    });
    w.append(`}`);
    w.append();

    // Wrapper
    w.append(`export class ${abi.name} implements Contract {`);
    w.inIndent(() => {
        w.append();

        if (abi.init) {
            w.append(`static async init(${writeArguments(abi.init.args).join(', ')}) {`);
            w.inIndent(() => {
                w.append(`return await ${abi.name}_init(${abi.init!.args.map((v) => v.name)});`);
            });
            w.append(`}`);
            w.append();

            w.append(`static async fromInit(${writeArguments(abi.init.args).join(', ')}) {`);
            w.inIndent(() => {
                w.append(`const init = await ${abi.name}_init(${abi.init!.args.map((v) => v.name)});`);
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
        if (abi.receivers.length > 0) {
            let receivers: string[] = [];
            for (const r of abi.receivers) {
                if (r.kind === 'internal-empty') {
                    receivers.push(`null`);
                } else if (r.kind === 'internal-binary') {
                    receivers.push(`${r.type}`);
                } else if (r.kind === 'internal-comment') {
                    receivers.push(`'${r.comment}'`);
                } else if (r.kind === 'internal-fallback') {
                    receivers.push(`Slice`);
                }
            }
            w.append(`async send(provider: ContractProvider, via: Sender, args: { value: bigint, bounce?: boolean| null | undefined }, message: ${receivers.join(' | ')}) {`);
            w.inIndent(() => {
                w.append();

                // Parse message
                w.append(`let body: Cell | null = null;`);
                for (const r of abi.receivers) {
                    if (r.kind === 'internal-binary') {
                        w.append(`if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === '${r.type}') {`);
                        w.inIndent(() => {
                            w.append(`body = beginCell().store(store${r.type}(message)).endCell();`);
                        });
                        w.append(`}`);
                    } else if (r.kind === 'internal-empty') {
                        w.append(`if (message === null) {`);
                        w.inIndent(() => {
                            w.append(`body = new Cell();`);
                        });
                        w.append(`}`);
                    } else if (r.kind === 'internal-comment') {
                        w.append(`if (message === '${r.comment}') {`);
                        w.inIndent(() => {
                            w.append(`body = beginCell().storeUint(0, 32).storeBuffer(Buffer.from(message)).endCell();`);
                        });
                        w.append(`}`);
                    } else if (r.kind === 'internal-fallback') {
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

        // Getters
        for (let g of abi.getters) {
            w.append(`async get${changeCase.pascalCase(g.name)}(${['provider: ContractProvider', ...writeArguments(g.args)].join(', ')}) {`);
            w.inIndent(() => {
                w.append(`let __tuple: TupleItem[] = [];`);
                for (let a of g.args) {
                    writeArgumentToStack(a.name, a.type, w);
                }
                w.append(`let result = await provider.get('${g.name}', __tuple);`);

                if (g.returns) {
                    if (g.returns.kind === 'ref') {
                        if (g.returns.name === 'Bool') {
                            if (g.returns.optional) {
                                w.append(`return result.stack.readBooleanOpt();`);
                            } else {
                                w.append(`return result.stack.readBoolean();`);
                            }
                        } else if (g.returns.name === 'Int') {
                            if (g.returns.optional) {
                                w.append(`return result.stack.readBigNumberOpt();`);
                            } else {
                                w.append(`return result.stack.readBigNumber();`);
                            }
                        } else if (g.returns.name === 'Address') {
                            if (g.returns.optional) {
                                w.append(`return result.stack.readAddressOpt();`);
                            } else {
                                w.append(`return result.stack.readAddress();`);
                            }
                        } else if (g.returns.name === 'Cell') {
                            if (g.returns.optional) {
                                w.append(`return result.stack.readCellOpt();`);
                            } else {
                                w.append(`return result.stack.readCell();`);
                            }
                        } else if (g.returns.name === 'Slice') {
                            if (g.returns.optional) {
                                w.append(`return result.stack.readCellOpt();`);
                            } else {
                                w.append(`return result.stack.readCell();`);
                            }
                        } else if (g.returns.name === 'Builder') {
                            if (g.returns.optional) {
                                w.append(`return result.stack.readCellOpt();`);
                            } else {
                                w.append(`return result.stack.readCell();`);
                            }
                        } else if (g.returns.name === 'String') {
                            if (g.returns.optional) {
                                w.append(`let c = result.stack.readCellOpt();`);
                                w.append(`if (c === null) { return null; }`);
                                w.append(`return c.beginParse().loadStringTail();`);
                            } else {
                                w.append(`return result.stack.readCell().beginParse().loadStringTail();`);
                            }
                        } else {
                            if (g.returns.optional) {
                                w.append(`let pp = result.stack.readTupleOpt();`);
                                w.append(`if (!pp) { return null; }`);
                                w.append(`return loadTuple${g.returns.name}(pp);`);
                            } else {
                                w.append(`return loadTuple${g.returns.name}(result.stack);`);
                            }
                        }
                    } else if (g.returns.kind === 'map') {
                        w.append(`return result.stack.readCellOpt();`);
                    } else if (g.returns.kind === 'null') {
                        throw Error('Impossible');
                    } else if (g.returns.kind === 'void') {
                        throw Error('Impossible');
                    } else {
                        throw Error('Not implemented');
                    }
                }
            });
            w.append(`}`);
            w.append();
        }
    });
    w.append(`}`);

    return w.end();
}