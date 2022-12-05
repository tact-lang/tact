import { ContractABI, ContractField, ContractFunctionArg } from "../abi/ContractABI";
import { TypeRef } from "../types/types";
import { Writer } from "./Writer";

function printFieldType(ref: TypeRef): string {
    if (ref.kind === 'direct') {
        if (ref.name === 'Int') {
            return 'BigInt';
        } else if (ref.name === 'Cell') {
            return 'Cell';
        } else if (ref.name === 'Slice') {
            return 'Slice';
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
    w.append(`import { Cell, Slice, StackItem } from 'ton';`);
    w.append(`import { BN } from 'bn.js';`);
    w.append(`import { deploy } from '../abi/deploy';`)
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