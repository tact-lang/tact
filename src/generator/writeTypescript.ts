import { AllocationCell, AllocationField, ContractABI, ContractField, ContractFunctionArg } from "../abi/ContractABI";
import { TypeRef } from "../types/types";
import { Writer } from "./Writer";

function printFieldType(ref: TypeRef): string {
    if (ref.kind === 'direct') {
        if (ref.name === 'Int') {
            return 'BigInt';
        } else if (ref.name === 'Bool') {
            return 'boolean';
        } else if (ref.name === 'Cell') {
            return 'Cell';
        } else if (ref.name === 'Slice') {
            return 'Slice';
        } else if (ref.name === 'Address') {
            return 'Address';
        } else {
            return ref.name;
        }
    } else if (ref.kind === 'optional') {
        return `${printFieldType(ref.inner)} | null`;
    }

    throw Error(`Unsupported type`);
}

function writeArguments(args: ContractFunctionArg[]) {
    return args.map((v) => `${v.name}: ${printFieldType(v.type)}`).join(', ');
}

function writeField(field: ContractField, w: Writer) {
    w.append(`${field.name}: ${printFieldType(field.type)};`);
}

function writeStackItem(name: string, ref: TypeRef, w: Writer) {

    if (ref.kind === 'optional') {
        w.append(`if (${name} !== null) {`);
        w.inIndent(() => {
            writeStackItem(name, ref.inner, w);
        });
        w.append('} else {');
        w.inIndent(() => {
            w.append(`__stack.push({ type: 'null' });`);
        });
        w.append('}');
        return;
    }

    if (ref.kind === 'direct') {
        if (ref.name === 'Int') {
            w.append(`__stack.push({ type: 'int', value: new BN(${name}.toString(), 10)});`);
            return;
        } else if (ref.name === 'Cell') {
            w.append(`__stack.push({ type: 'cell', value: ${name}});`);
            return;
        } else if (ref.name === 'Slice') {
            w.append(`__stack.push({ type: 'slice', value: ${name}});`);
            return;
        }
    }

    throw Error(`Unsupported type: ${ref.kind}`);
}

export function writeTypescript(abi: ContractABI) {
    let w = new Writer();
    w.append(`import { Cell, Slice, StackItem, Address, Builder } from 'ton';`);
    w.append(`import { BN } from 'bn.js';`);
    w.append(`import { deploy } from '../abi/deploy';`);
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

        w.append(`export function pack${s.name}(src: ${s.name}): Cell {`);
        w.inIndent(() => {
            w.append(`let b_0 = new Builder();`);
            if (s.allocation.prefix) {
                w.append(`b_0 = b_0.storeInt(${s.allocation.prefix}, 32);`);
            }

            function processField(index: number, f: AllocationField) {
                if (f.kind === 'int') {
                    if (f.bits === 1) {
                        w.append(`b_${index} = b_${index}.storeBit(src.${s.fields[f.index].name});`);
                    } else {
                        w.append(`b_${index} = b_${index}.storeInt(new BN(src.${s.fields[f.index].name}.toString(10), 10), ${f.bits});`);
                    }
                } else if (f.kind === 'uint') {
                    w.append(`b_${index} = b_${index}.storeUint(new BN(src.${s.fields[f.index].name}.toString(10), 10), ${f.bits});`);
                } else if (f.kind === 'coins') {
                    w.append(`b_${index} = b_${index}.storeCoins(new BN(src.${s.fields[f.index].name}.toString(10), 10));`);
                } else if (f.kind === 'cell') {
                    w.append(`b_${index} = b_${index}.storeRef(src.${s.fields[f.index].name});`);
                } else if (f.kind === 'slice') {
                    w.append(`b_${index} = b_${index}.storeRef(src.${s.fields[f.index].name}.toCell());`);
                } else if (f.kind === 'optional') {
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
                } else if (f.kind === 'struct') {
                    w.append(`b_${index} = b_${index}.storeCellCopy(pack${f.type}(src.${s.fields[f.index].name}));`);
                } else if (f.kind === 'address') {
                    w.append(`b_${index} = b_${index}.storeAddress(src.${s.fields[f.index].name});`);
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

            w.append(`return b_0.endCell();`);
        });
        w.append(`}`);
        w.append();
    }

    // Init
    if (abi.init) {
        w.append(`export function ${abi.name}_init(${writeArguments(abi.init.args)}) {`);
        w.inIndent(() => {
            w.append(`const __code = '${abi.code}';`);
            w.append('let __stack: StackItem[] = [];');
            for (let a of abi.init!.args) {
                writeStackItem(a.name, a.type, w);
            }
            w.append(`return deploy(__code, '${abi.init!.name}', __stack);`);
        });
        w.append(`}`);
        w.append();
    }

    return w.end();
}