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
export type SetIntMap1 = {
    $$type: 'SetIntMap1';
    key: BN;
    value: BN | null;
}

export function packSetIntMap1(src: SetIntMap1): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(1056067080, 32);
    b_0 = b_0.storeInt(src.key, 257);
    if (src.value !== null) {
        b_0 = b_0.storeBit(true);
        b_0 = b_0.storeInt(src.value, 257);
    } else {
        b_0 = b_0.storeBit(false);
    }
    return b_0.endCell();
}

export function packStackSetIntMap1(src: SetIntMap1, __stack: StackItem[]) {
    __stack.push({ type: 'int', value: src.key });
    if (src.value !== null) {
        __stack.push({ type: 'int', value: src.value });
    } else {
        __stack.push({ type: 'null' });
    }
}

export function unpackStackSetIntMap1(slice: TupleSlice4): SetIntMap1 {
    const key = slice.readBigNumber();
    const value = slice.readBigNumberOpt();
    return { $$type: 'SetIntMap1', key: key, value: value };
}
export type SetIntMap2 = {
    $$type: 'SetIntMap2';
    key: BN;
    value: boolean | null;
}

export function packSetIntMap2(src: SetIntMap2): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(2818252722, 32);
    b_0 = b_0.storeInt(src.key, 257);
    if (src.value !== null) {
        b_0 = b_0.storeBit(true);
        b_0 = b_0.storeBit(src.value);
    } else {
        b_0 = b_0.storeBit(false);
    }
    return b_0.endCell();
}

export function packStackSetIntMap2(src: SetIntMap2, __stack: StackItem[]) {
    __stack.push({ type: 'int', value: src.key });
    if (src.value !== null) {
        __stack.push({ type: 'int', value: src.value ? new BN(-1) : new BN(0) });
    } else {
        __stack.push({ type: 'null' });
    }
}

export function unpackStackSetIntMap2(slice: TupleSlice4): SetIntMap2 {
    const key = slice.readBigNumber();
    const value = slice.readBooleanOpt();
    return { $$type: 'SetIntMap2', key: key, value: value };
}
export type SetIntMap3 = {
    $$type: 'SetIntMap3';
    key: BN;
    value: Cell | null;
}

export function packSetIntMap3(src: SetIntMap3): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(3506188068, 32);
    b_0 = b_0.storeInt(src.key, 257);
    if (src.value !== null) {
        b_0 = b_0.storeBit(true);
        b_0 = b_0.storeRef(src.value);
    } else {
        b_0 = b_0.storeBit(false);
    }
    return b_0.endCell();
}

export function packStackSetIntMap3(src: SetIntMap3, __stack: StackItem[]) {
    __stack.push({ type: 'int', value: src.key });
    if (src.value !== null) {
        __stack.push({ type: 'cell', cell: src.value });
    } else {
        __stack.push({ type: 'null' });
    }
}

export function unpackStackSetIntMap3(slice: TupleSlice4): SetIntMap3 {
    const key = slice.readBigNumber();
    const value = slice.readCellOpt();
    return { $$type: 'SetIntMap3', key: key, value: value };
}
export type SomeStruct = {
    $$type: 'SomeStruct';
    value: BN;
}

export function packSomeStruct(src: SomeStruct): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeInt(src.value, 257);
    return b_0.endCell();
}

export function packStackSomeStruct(src: SomeStruct, __stack: StackItem[]) {
    __stack.push({ type: 'int', value: src.value });
}

export function unpackStackSomeStruct(slice: TupleSlice4): SomeStruct {
    const value = slice.readBigNumber();
    return { $$type: 'SomeStruct', value: value };
}
export async function MapTestContract_init() {
    const __code = 'te6ccgECRwEABW8AART/APSkE/S88sgLAQIBYgIDAgLLHB0CASAEBQIBIAYHAgEgGBkCASAICQIBIBARAgEgCgsCASAMDQBLsaH7UTQ1AH4YvQE9ATUMND0BPQE9ATUMND0BPQE9ARVcGwY8A6AAT7IpO1E0NQB+GL0BPQE1DDQ9AT0BPQE1DDQ9AT0BPQEVXBsGFUH8BOAAS7Gxe1E0NQB+GL0BPQE1DDQ9AT0BPQE1DDQ9AT0BPQEVXBsGPASgAgEgDg8AS69ydqJoagD8MXoCegJqGGh6AnoCegJqGGh6AnoCegIquDYMeAhAAEuu4naiaGoA/DF6AnoCahhoegJ6AnoCahhoegJ6AnoCKrg2DHgMwAIBIBITAEu1rD2omhqAPwxegJ6AmoYaHoCegJ6AmoYaHoCegJ6Aiq4Ngx4C0ABLs0j7UTQ1AH4YvQE9ATUMND0BPQE9ATUMND0BPQE9ARVcGwY8BiACASAUFQBLrxF2omhqAPwxegJ6AmoYaHoCegJ6AmoYaHoCegJ6Aiq4Ngx4CkACA6KCFhcAR2u1E0NQB+GL0BPQE1DDQ9AT0BPQE1DDQ9AT0BPQEVXBsGPAXgBL12omhqAPwxegJ6AmoYaHoCegJ6AmoYaHoCegJ6Aiq4Ngwqg/gIwCAnIaGwBPuQ5e1E0NQB+GL0BPQE1DDQ9AT0BPQE1DDQ9AT0BPQEVXBsGFUH8BWABOq+TtRNDUAfhi9AT0BNQw0PQE9AT0BNQw0PQE9AT0BFVwbBhVB/APAAio2fANAgEgHh8CASAvMAIBICAhAgFYKywCASAiIwAR0s+ga30O4YNsAgEgJCUCASApKgOXHAh10nCH5UwINcLH94C0NMDAXGwwAGRf5Fw4gH6QDBUQRVvA/hhApFb4CCCED7yTgi64wIgghCn+x+yuuMCghDQ/C8kuuMCMPLAZICYnKAAjCFulVtZ9Fow4MgBzwBBM/RCgAPww7UTQ1AH4YvQE9ATUMND0BPQE9ATUMND0BPQE9ARVcGwYCNMfAYIQPvJOCLry4GSBAQHXAG0B0gABljGBAQHXAN5ZMhCJEHgQZxBWEEUQNEMA8BrI+EIBzFVwUHj0ABX0AAPI9AAS9AD0AALI9AAT9AAT9ADJWMzJAczJ7VQA9jDtRNDUAfhi9AT0BNQw0PQE9AT0BNQw0PQE9AT0BFVwbBgI0x8BghCn+x+yuvLgZIEBAdcAbQHSAAGTMdIA3lkyEIkQeBBnEFYQRRA0QwDwG8j4QgHMVXBQePQAFfQAA8j0ABL0APQAAsj0ABP0ABP0AMlYzMkBzMntVADy7UTQ1AH4YvQE9ATUMND0BPQE9ATUMND0BPQE9ARVcGwYCNMfAYIQ0PwvJLry4GSBAQHXAG0B0gABkjHU3lkyEIkQeBBnEFYQRRA0QwDwHMj4QgHMVXBQePQAFfQAA8j0ABL0APQAAsj0ABP0ABP0AMlYzMkBzMntVAAdEEz9AxvoZQB1wAw4FttgABsIG6VMFn0WjDgQTP0FYABbVtbW1tbW1tbQjIzAhQePQAFfQAA8j0ABL0APQAAsj0ABP0ABP0AMlYzMkBzMmAIBIC0uAAUXweAAERscYEBAWbwAoAIBIDEyAgEgP0ACASAzNAIBIDk6AgEgNTYCASA3OAAJBBnXweAAFQ4XwaBAQFYcfACgAAkEFdfB4AAVDdfBTKBAQEB8ASACASA7PAIBID0+AAkEEdfB4AAxDZfBDOBAQEy8AQgbpIwbZfQgQEB1wAw4oAAJBA3XweAACQQJ18HgAgEgQUIAE9CBPAgICs+AGCwCASBDRAIBIEVGAAcF18HgAAUbHGAAFyBAQEgEEtDMPABB4AAVBAogQEBWXHwAQaA=';
    const depends = new Map<string, Cell>();
    let systemCell = beginCell().storeDict(null).endCell();
    let __stack: StackItem[] = [];
    __stack.push({ type: 'cell', cell: systemCell });
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let executor = await createExecutorFromCode({ code: codeCell, data: new Cell() });
    let res = await executor.get('init_MapTestContract', __stack, { debug: true });
    let data = res.stack.readCell();
    return { code: codeCell, data };
}

export class MapTestContract {
    readonly executor: ContractExecutor; 
    constructor(executor: ContractExecutor) { this.executor = executor; } 
    
    async send(args: { amount: BN, from?: Address, debug?: boolean }, message: SetIntMap1 | SetIntMap2 | SetIntMap3) {
        let body: Cell | null = null;
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'SetIntMap1') {
            body = packSetIntMap1(message);
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'SetIntMap2') {
            body = packSetIntMap2(message);
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'SetIntMap3') {
            body = packSetIntMap3(message);
        }
        if (body === null) { throw new Error('Invalid message type'); }
        let r = await this.executor.internal(new InternalMessage({
            to: this.executor.address,
            from: args.from || this.executor.address,
            bounce: false,
            value: args.amount,
            body: new CommonMessageInfo({
                body: new CellMessage(body!)
            })
        }), { debug: args.debug });
        if (args.debug && r.debugLogs.length > 0) { console.warn(r.debugLogs); }
    }
    async getIntMap1() {
        let __stack: StackItem[] = [];
        let result = await this.executor.get('intMap1', __stack);
        return result.stack.readCellOpt();
    }
    async getIntMap1Value(key: BN) {
        let __stack: StackItem[] = [];
        __stack.push({ type: 'int', value: key });
        let result = await this.executor.get('intMap1Value', __stack);
        return result.stack.readBigNumberOpt();
    }
    async getIntMap2() {
        let __stack: StackItem[] = [];
        let result = await this.executor.get('intMap2', __stack);
        return result.stack.readCellOpt();
    }
    async getIntMap2Value(key: BN) {
        let __stack: StackItem[] = [];
        __stack.push({ type: 'int', value: key });
        let result = await this.executor.get('intMap2Value', __stack);
        return result.stack.readBooleanOpt();
    }
    async getIntMap3() {
        let __stack: StackItem[] = [];
        let result = await this.executor.get('intMap3', __stack);
        return result.stack.readCellOpt();
    }
    async getIntMap3Value(key: BN) {
        let __stack: StackItem[] = [];
        __stack.push({ type: 'int', value: key });
        let result = await this.executor.get('intMap3Value', __stack);
        return result.stack.readCellOpt();
    }
    async getIntMap4() {
        let __stack: StackItem[] = [];
        let result = await this.executor.get('intMap4', __stack);
        return result.stack.readCellOpt();
    }
    async getIntMap4Value(key: BN) {
        let __stack: StackItem[] = [];
        __stack.push({ type: 'int', value: key });
        let result = await this.executor.get('intMap4Value', __stack);
        if (result.stackRaw[0].type === 'null') { return null; }
        return unpackStackSomeStruct(result.stack);
    }
    async getAddrMap1() {
        let __stack: StackItem[] = [];
        let result = await this.executor.get('addrMap1', __stack);
        return result.stack.readCellOpt();
    }
    async getAddrMap2() {
        let __stack: StackItem[] = [];
        let result = await this.executor.get('addrMap2', __stack);
        return result.stack.readCellOpt();
    }
    async getAddrMap3() {
        let __stack: StackItem[] = [];
        let result = await this.executor.get('addrMap3', __stack);
        return result.stack.readCellOpt();
    }
    async getAddrMap4() {
        let __stack: StackItem[] = [];
        let result = await this.executor.get('addrMap4', __stack);
        return result.stack.readCellOpt();
    }
}