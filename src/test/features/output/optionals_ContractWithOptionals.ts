import { Cell, Slice, StackItem, Address, Builder, InternalMessage, CommonMessageInfo, CellMessage, beginCell, serializeDict, TupleSlice4 } from 'ton';
import { ContractExecutor, createExecutorFromCode } from 'ton-nodejs';
import BN from 'bn.js';

export type SendParameters = {
    $$type: 'SendParameters';
    bounce: boolean;
    to: Address;
    value: BN;
    mode: BN;
    body: Cell | null;
    code: Cell | null;
    data: Cell | null;
}

export function packSendParameters(src: SendParameters): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeBit(src.bounce);
    b_0 = b_0.storeAddress(src.to);
    b_0 = b_0.storeInt(src.value, 257);
    b_0 = b_0.storeInt(src.mode, 257);
    if (src.body !== null) {
        b_0 = b_0.storeBit(true);
        b_0 = b_0.storeRef(src.body);
    } else {
        b_0 = b_0.storeBit(false);
    }
    if (src.code !== null) {
        b_0 = b_0.storeBit(true);
        b_0 = b_0.storeRef(src.code);
    } else {
        b_0 = b_0.storeBit(false);
    }
    if (src.data !== null) {
        b_0 = b_0.storeBit(true);
        b_0 = b_0.storeRef(src.data);
    } else {
        b_0 = b_0.storeBit(false);
    }
    return b_0.endCell();
}

export function packStackSendParameters(src: SendParameters, __stack: StackItem[]) {
    __stack.push({ type: 'int', value: src.bounce ? new BN(-1) : new BN(0) });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.to).endCell() });
    __stack.push({ type: 'int', value: src.value });
    __stack.push({ type: 'int', value: src.mode });
    if (src.body !== null) {
        __stack.push({ type: 'cell', cell: src.body });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.code !== null) {
        __stack.push({ type: 'cell', cell: src.code });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.data !== null) {
        __stack.push({ type: 'cell', cell: src.data });
    } else {
        __stack.push({ type: 'null' });
    }
}

export function unpackStackSendParameters(slice: TupleSlice4): SendParameters {
    const bounce = slice.readBoolean();
    const to = slice.readAddress();
    const value = slice.readBigNumber();
    const mode = slice.readBigNumber();
    const body = slice.readCellOpt();
    const code = slice.readCellOpt();
    const data = slice.readCellOpt();
    return { $$type: 'SendParameters', bounce: bounce, to: to, value: value, mode: mode, body: body, code: code, data: data };
}
export type Context = {
    $$type: 'Context';
    bounced: boolean;
    sender: Address;
    value: BN;
}

export function packContext(src: Context): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeBit(src.bounced);
    b_0 = b_0.storeAddress(src.sender);
    b_0 = b_0.storeInt(src.value, 257);
    return b_0.endCell();
}

export function packStackContext(src: Context, __stack: StackItem[]) {
    __stack.push({ type: 'int', value: src.bounced ? new BN(-1) : new BN(0) });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.sender).endCell() });
    __stack.push({ type: 'int', value: src.value });
}

export function unpackStackContext(slice: TupleSlice4): Context {
    const bounced = slice.readBoolean();
    const sender = slice.readAddress();
    const value = slice.readBigNumber();
    return { $$type: 'Context', bounced: bounced, sender: sender, value: value };
}
export type StateInit = {
    $$type: 'StateInit';
    code: Cell;
    data: Cell;
}

export function packStateInit(src: StateInit): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeRef(src.code);
    b_0 = b_0.storeRef(src.data);
    return b_0.endCell();
}

export function packStackStateInit(src: StateInit, __stack: StackItem[]) {
    __stack.push({ type: 'cell', cell: src.code });
    __stack.push({ type: 'cell', cell: src.data });
}

export function unpackStackStateInit(slice: TupleSlice4): StateInit {
    const code = slice.readCell();
    const data = slice.readCell();
    return { $$type: 'StateInit', code: code, data: data };
}
export type SomeGenericStruct = {
    $$type: 'SomeGenericStruct';
    value1: BN;
    value2: BN;
    value3: BN;
    value4: BN;
    value5: BN;
}

export function packSomeGenericStruct(src: SomeGenericStruct): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeInt(src.value1, 257);
    b_0 = b_0.storeInt(src.value2, 257);
    b_0 = b_0.storeInt(src.value3, 257);
    let b_1 = new Builder();
    b_1 = b_1.storeInt(src.value4, 257);
    b_1 = b_1.storeInt(src.value5, 257);
    b_0 = b_0.storeRef(b_1.endCell());
    return b_0.endCell();
}

export function packStackSomeGenericStruct(src: SomeGenericStruct, __stack: StackItem[]) {
    __stack.push({ type: 'int', value: src.value1 });
    __stack.push({ type: 'int', value: src.value2 });
    __stack.push({ type: 'int', value: src.value3 });
    __stack.push({ type: 'int', value: src.value4 });
    __stack.push({ type: 'int', value: src.value5 });
}

export function unpackStackSomeGenericStruct(slice: TupleSlice4): SomeGenericStruct {
    const value1 = slice.readBigNumber();
    const value2 = slice.readBigNumber();
    const value3 = slice.readBigNumber();
    const value4 = slice.readBigNumber();
    const value5 = slice.readBigNumber();
    return { $$type: 'SomeGenericStruct', value1: value1, value2: value2, value3: value3, value4: value4, value5: value5 };
}
export type StructWithOptionals = {
    $$type: 'StructWithOptionals';
    a: BN | null;
    b: boolean | null;
    c: Cell | null;
    d: Address | null;
    e: SomeGenericStruct | null;
}

export function packStructWithOptionals(src: StructWithOptionals): Cell {
    let b_0 = new Builder();
    if (src.a !== null) {
        b_0 = b_0.storeBit(true);
        b_0 = b_0.storeInt(src.a, 257);
    } else {
        b_0 = b_0.storeBit(false);
    }
    if (src.b !== null) {
        b_0 = b_0.storeBit(true);
        b_0 = b_0.storeBit(src.b);
    } else {
        b_0 = b_0.storeBit(false);
    }
    if (src.c !== null) {
        b_0 = b_0.storeBit(true);
        b_0 = b_0.storeRef(src.c);
    } else {
        b_0 = b_0.storeBit(false);
    }
    if (src.d !== null) {
        b_0 = b_0.storeBit(true);
        b_0 = b_0.storeAddress(src.d);
    } else {
        b_0 = b_0.storeBit(false);
    }
    let b_1 = new Builder();
    if (src.e !== null) {
        b_1 = b_1.storeBit(true);
        b_1 = b_1.storeCellCopy(packSomeGenericStruct(src.e));
    } else {
        b_1 = b_1.storeBit(false);
    }
    b_0 = b_0.storeRef(b_1.endCell());
    return b_0.endCell();
}

export function packStackStructWithOptionals(src: StructWithOptionals, __stack: StackItem[]) {
    if (src.a !== null) {
        __stack.push({ type: 'int', value: src.a });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.b !== null) {
        __stack.push({ type: 'int', value: src.b ? new BN(-1) : new BN(0) });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.c !== null) {
        __stack.push({ type: 'cell', cell: src.c });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.d !== null) {
        __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.d).endCell() });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.e !== null) {
        packStackSomeGenericStruct(src.e, __stack);
    } else {
        __stack.push({ type: 'null' });
    }
}

export function unpackStackStructWithOptionals(slice: TupleSlice4): StructWithOptionals {
    const a = slice.readBigNumberOpt();
    const b = slice.readBooleanOpt();
    const c = slice.readCellOpt();
    const d = slice.readAddressOpt();
    const e = unpackStackSomeGenericStruct(slice);
    return { $$type: 'StructWithOptionals', a: a, b: b, c: c, d: d, e: e };
}
export async function ContractWithOptionals_init() {
    const __code = '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';
    const depends = new Map<string, Cell>();
    let systemCell = beginCell().storeDict(null).endCell();
    let __stack: StackItem[] = [];
    __stack.push({ type: 'cell', cell: systemCell });
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let executor = await createExecutorFromCode({ code: codeCell, data: new Cell() });
    let res = await executor.get('init_ContractWithOptionals', __stack, { debug: true });
    let data = res.stack.readCell();
    return { code: codeCell, data };
}

export class ContractWithOptionals {
    readonly executor: ContractExecutor; 
    constructor(executor: ContractExecutor) { this.executor = executor; } 
    
    async getIsNotNullA() {
        let __stack: StackItem[] = [];
        let result = await this.executor.get('isNotNullA', __stack);
        return result.stack.readBoolean();
    }
    async getIsNotNullB() {
        let __stack: StackItem[] = [];
        let result = await this.executor.get('isNotNullB', __stack);
        return result.stack.readBoolean();
    }
    async getIsNotNullC() {
        let __stack: StackItem[] = [];
        let result = await this.executor.get('isNotNullC', __stack);
        return result.stack.readBoolean();
    }
    async getIsNotNullD() {
        let __stack: StackItem[] = [];
        let result = await this.executor.get('isNotNullD', __stack);
        return result.stack.readBoolean();
    }
    async getIsNotNullE() {
        let __stack: StackItem[] = [];
        let result = await this.executor.get('isNotNullE', __stack);
        return result.stack.readBoolean();
    }
    async getNotNullA() {
        let __stack: StackItem[] = [];
        let result = await this.executor.get('notNullA', __stack);
        return result.stack.readBigNumber();
    }
    async getNotNullB() {
        let __stack: StackItem[] = [];
        let result = await this.executor.get('notNullB', __stack);
        return result.stack.readBoolean();
    }
    async getNotNullC() {
        let __stack: StackItem[] = [];
        let result = await this.executor.get('notNullC', __stack);
        return result.stack.readCell();
    }
    async getNotNullD() {
        let __stack: StackItem[] = [];
        let result = await this.executor.get('notNullD', __stack);
        return result.stack.readAddress();
    }
    async getNotNullE() {
        let __stack: StackItem[] = [];
        let result = await this.executor.get('notNullE', __stack);
        return unpackStackSomeGenericStruct(result.stack);
    }
}