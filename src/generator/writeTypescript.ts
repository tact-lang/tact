import { AllocationCell, AllocationField, ContractABI, ContractField, ContractFunctionArg } from "../abi/ContractABI";
import { TypeRef } from "../types/types";
import { Writer } from "./Writer";
import * as changeCase from "change-case";
import { writeToStack } from "./typescript/writeToStack";
import { readFromStack } from "./typescript/readFromStack";

function printFieldType(ref: TypeRef): string {
    if (ref.kind === 'ref') {
        if (ref.name === 'Int') {
            return 'bigint' + (ref.optional ? ' | null' : '');
        } else if (ref.name === 'Bool') {
            return 'boolean' + (ref.optional ? ' | null' : '');
        } else if (ref.name === 'Cell' || ref.name === 'Slice' || ref.name === 'Builder') {
            return 'Cell' + (ref.optional ? ' | null' : '');
        } else if (ref.name === 'Address') {
            return 'Address' + (ref.optional ? ' | null' : '');
        } else if (ref.name === 'String') {
            return 'string' + (ref.optional ? ' | null' : '');
        } else {
            return ref.name + (ref.optional ? ' | null' : '');
        }
    }
    if (ref.kind === 'map') {
        return `Cell`;
    }

    throw Error(`Unsupported type`);
}

function writeArguments(args: ContractFunctionArg[]) {
    return args.map((v) => `${v.name}: ${printFieldType(v.type)}`);
}

function writeField(field: ContractField, w: Writer) {
    w.append(`${field.name}: ${printFieldType(field.type)};`);
}

export function writeTypescript(abi: ContractABI, code: string, depends: { [key: string]: { code: string } }) {
    let w = new Writer();
    w.append(`import { Cell, Slice, Address, Builder, beginCell, ComputeError, TupleItem, TupleReader, Dictionary, contractAddress, ContractProvider, Sender } from 'ton-core';`);
    w.append(`import { ContractSystem, ContractExecutor } from 'ton-emulator';`);
    w.append();

    // Structs
    for (let s of abi.structs) {
        w.append(`export type ${s.name} = {`);
        w.inIndent(() => {
            w.append(`$$type: '${s.name}';`);
            for (let f of s.fields) {
                writeField(f, w);
            }
        });
        w.append(`}`);
        w.append();

        w.append(`export function store${s.name}(src: ${s.name}) {`);
        w.inIndent(() => {
            w.append(`return (builder: Builder) => {`)
            w.inIndent(() => {
                w.append(`let b_0 = builder;`);
                if (s.allocation.prefix) {
                    w.append(`b_0 = b_0.storeUint(${s.allocation.prefix}, 32);`);
                }

                function processField(index: number, f: AllocationField) {
                    if (f.kind === 'int') {
                        if (f.bits === 1) {
                            w.append(`b_${index} = b_${index}.storeBit(src.${s.fields[f.index].name});`);
                        } else {
                            w.append(`b_${index} = b_${index}.storeInt(src.${s.fields[f.index].name}, ${f.bits});`);
                        }
                    } else if (f.kind === 'uint') {
                        w.append(`b_${index} = b_${index}.storeUint(src.${s.fields[f.index].name}, ${f.bits});`);
                    } else if (f.kind === 'coins') {
                        w.append(`b_${index} = b_${index}.storeCoins(src.${s.fields[f.index].name});`);
                    } else if (f.kind === 'cell') {
                        w.append(`b_${index} = b_${index}.storeRef(src.${s.fields[f.index].name});`);
                    } else if (f.kind === 'slice') {
                        w.append(`b_${index} = b_${index}.storeRef(src.${s.fields[f.index].name});`);
                    } else if (f.kind === 'optional') {
                        if (f.inner.kind === 'address') {
                            w.append(`b_${index} = b_${index}.storeAddress(src.${s.fields[f.index].name});`);
                        } else {
                            w.append(`if (src.${s.fields[f.index].name} !== null) {`);
                            w.inIndent(() => {
                                w.append(`b_${index} = b_${index}.storeBit(true);`);
                                processField(index, f.inner);
                            });
                            w.append(`} else {`);
                            w.inIndent(() => {
                                w.append(`b_${index} = b_${index}.storeBit(false);`);
                            });
                            w.append(`}`);
                        }
                    } else if (f.kind === 'struct') {
                        w.append(`b_${index} = b_${index}.store(store${f.type}(src.${s.fields[f.index].name}));`);
                    } else if (f.kind === 'address') {
                        w.append(`b_${index} = b_${index}.storeAddress(src.${s.fields[f.index].name});`);
                    } else if (f.kind === 'remaining') {
                        w.append(`b_${index} = b_${index}.storeSlice(src.${s.fields[f.index].name}.beginParse());`);
                    } else if (f.kind === 'bytes') {
                        w.append(`b_${index} = b_${index}.storeSlice(src.${s.fields[f.index].name});`);
                    } else if (f.kind === 'map') {
                        w.append(`b_${index} = b_${index}.storeDict(src.${s.fields[f.index].name});`);
                    } else {
                        throw Error('Unsupported field type');
                    }
                }

                function processCell(index: number, src: AllocationCell) {
                    for (let f of src.fields) {
                        processField(index, f);
                    }
                    if (src.next) {
                        w.append(`let b_${index + 1} = new Builder();`);
                        processCell(index + 1, src.next);
                        w.append(`b_${index} = b_${index}.storeRef(b_${index + 1}.endCell());`);
                    }
                }
                processCell(0, s.allocation.root);


            });
            w.append(`};`);
        });
        w.append(`}`);
        w.append();

        // Pack to stack
        w.append(`export function packStack${s.name}(src: ${s.name}, __stack: TupleItem[]) {`);
        w.inIndent(() => {
            for (const f of s.fields) {
                writeToStack(`src.${f.name}`, f.type, w);
            }
        });
        w.append(`}`);
        w.append();
        w.append(`export function packTuple${s.name}(src: ${s.name}): TupleItem[] {`);
        w.inIndent(() => {
            w.append(`let __stack: TupleItem[] = [];`)
            for (const f of s.fields) {
                writeToStack(`src.${f.name}`, f.type, w, false, true);
            }
            w.append(`return __stack;`);
        });
        w.append(`}`);
        w.append();

        // Unpack from stack
        w.append(`export function unpackStack${s.name}(slice: TupleReader): ${s.name} {`)
        w.inIndent(() => {
            for (const f of s.fields) {
                readFromStack(f.name, f.type, w);
            }
            w.append(`return { $$type: '${s.name}', ${s.fields.map(f => `${f.name}: ${f.name}`).join(', ')} };`);
        });
        w.append(`}`);
        w.append(`export function unpackTuple${s.name}(slice: TupleReader): ${s.name} {`)
        w.inIndent(() => {
            for (const f of s.fields) {
                readFromStack(f.name, f.type, w, true);
            }
            w.append(`return { $$type: '${s.name}', ${s.fields.map(f => `${f.name}: ${f.name}`).join(', ')} };`);
        });
        w.append(`}`);
    }

    // Init
    if (abi.init) {
        w.append(`async function ${abi.name}_init(${writeArguments(abi.init.args).join(', ')}) {`);
        w.inIndent(() => {

            // Code references
            w.append(`const __code = '${code}';`);
            w.append(`const depends = Dictionary.empty(Dictionary.Keys.Uint(16), Dictionary.Values.Cell());`);
            for (let s in abi.dependsOn) {
                let cd = depends[s];
                if (!cd) {
                    throw Error(`Cannot find code for ${s}`);
                }
                w.append(`depends.set(${abi.dependsOn[s].uid}, Cell.fromBoc(Buffer.from('${cd.code}', 'base64'))[0]);`);
            }
            w.append(`let systemCell = beginCell().storeDict(depends).endCell();`);

            // Stack
            w.append('let __stack: TupleItem[] = [];');
            w.append(`__stack.push({ type: 'cell', cell: systemCell });`);
            for (let a of abi.init!.args) {
                writeToStack(a.name, a.type, w);
            }

            // Deploy
            w.append(`let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];`);
            w.append(`let system = await ContractSystem.create();`);
            w.append(`let executor = await ContractExecutor.create({ code: codeCell, data: new Cell() }, system);`);
            w.append(`let res = await executor.get('${abi.init!.name}', __stack);`);
            w.append(`if (!res.success) { throw Error(res.error); }`);
            w.append(`let data = res.stack.readCell();`);
            w.append(`return { code: codeCell, data };`);
        });
        w.append(`}`);
        w.append();
    }

    // Errors
    w.append(`export const ${abi.name}_errors: { [key: string]: string } = {`);
    w.inIndent(() => {
        for (let k in abi.errors) {
            w.append(`'${k}': \`${abi.errors[k].message}\`,`);
        }
    });
    w.append(`}`);
    w.append();

    // Wrapper
    w.append(`export class ${abi.name} {`);
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
                w.append('try {')
                w.inIndent(() => {
                    w.append(`let __stack: TupleItem[] = [];`);
                    for (let a of g.args) {
                        writeToStack(a.name, a.type, w);
                    }
                    w.append(`let result = await provider.get('${g.name}', __stack);`);

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
                                    w.append(`return readString(c.beginParse());`);
                                } else {
                                    w.append(`return readString(result.stack.readCell().beginParse());`);
                                }
                            } else {
                                if (g.returns.optional) {
                                    w.append(`let pp = result.stack.pop();`);
                                    w.append(`if (pp.type !== 'tuple') { return null; }`);
                                    w.append(`return unpackTuple${g.returns.name}(new TupleSlice4(pp.items));`);
                                } else {
                                    w.append(`return unpackStack${g.returns.name}(result.stack);`);
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
                w.append(`} catch (e) {`);
                w.inIndent(() => {
                    w.append(`if (e instanceof ComputeError) {`)
                    w.inIndent(() => {
                        w.append(`if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }`);
                        w.append(`if (${abi.name}_errors[e.exitCode.toString()]) {`);
                        w.inIndent(() => {
                            w.append(`throw new Error(${abi.name}_errors[e.exitCode.toString()]);`);
                        });
                        w.append(`}`);
                    });
                    w.append(`}`);
                    w.append(`throw e;`);
                });
                w.append(`}`);
            });
            w.append(`}`);
            w.append();
        }
    });
    w.append(`}`);

    return w.end();
}