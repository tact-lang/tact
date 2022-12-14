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
export type Increment = {
    $$type: 'Increment';
    key: BN;
    value: BN;
}

export function packIncrement(src: Increment): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(3615081709, 32);
    b_0 = b_0.storeInt(src.key, 257);
    b_0 = b_0.storeInt(src.value, 257);
    return b_0.endCell();
}

export function packStackIncrement(src: Increment, __stack: StackItem[]) {
    __stack.push({ type: 'int', value: src.key });
    __stack.push({ type: 'int', value: src.value });
}

export function unpackStackIncrement(slice: TupleSlice4): Increment {
    const key = slice.readBigNumber();
    const value = slice.readBigNumber();
    return { $$type: 'Increment', key: key, value: value };
}
export type Toggle = {
    $$type: 'Toggle';
    key: BN;
}

export function packToggle(src: Toggle): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(575056061, 32);
    b_0 = b_0.storeInt(src.key, 257);
    return b_0.endCell();
}

export function packStackToggle(src: Toggle, __stack: StackItem[]) {
    __stack.push({ type: 'int', value: src.key });
}

export function unpackStackToggle(slice: TupleSlice4): Toggle {
    const key = slice.readBigNumber();
    return { $$type: 'Toggle', key: key };
}
export type Persist = {
    $$type: 'Persist';
    key: BN;
    content: Cell | null;
}

export function packPersist(src: Persist): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(140802882, 32);
    b_0 = b_0.storeInt(src.key, 257);
    if (src.content !== null) {
        b_0 = b_0.storeBit(true);
        b_0 = b_0.storeRef(src.content);
    } else {
        b_0 = b_0.storeBit(false);
    }
    return b_0.endCell();
}

export function packStackPersist(src: Persist, __stack: StackItem[]) {
    __stack.push({ type: 'int', value: src.key });
    if (src.content !== null) {
        __stack.push({ type: 'cell', cell: src.content });
    } else {
        __stack.push({ type: 'null' });
    }
}

export function unpackStackPersist(slice: TupleSlice4): Persist {
    const key = slice.readBigNumber();
    const content = slice.readCellOpt();
    return { $$type: 'Persist', key: key, content: content };
}
export type Reset = {
    $$type: 'Reset';
    key: BN;
}

export function packReset(src: Reset): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(2438762569, 32);
    b_0 = b_0.storeInt(src.key, 257);
    return b_0.endCell();
}

export function packStackReset(src: Reset, __stack: StackItem[]) {
    __stack.push({ type: 'int', value: src.key });
}

export function unpackStackReset(slice: TupleSlice4): Reset {
    const key = slice.readBigNumber();
    return { $$type: 'Reset', key: key };
}
export type Something = {
    $$type: 'Something';
    value: BN;
}

export function packSomething(src: Something): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeInt(src.value, 257);
    return b_0.endCell();
}

export function packStackSomething(src: Something, __stack: StackItem[]) {
    __stack.push({ type: 'int', value: src.value });
}

export function unpackStackSomething(slice: TupleSlice4): Something {
    const value = slice.readBigNumber();
    return { $$type: 'Something', value: value };
}
export async function IncrementContract_init() {
    const __code = 'te6ccgECJgEAA5wAART/APSkE/S88sgLAQIBYgIDAgLLBAUCAUgiIwIBSAYHAgEgFhcCASAICQIBIBARAgEgCgsAI1IW6VW1n0WjDgyAHPAEEz9EKASfHAh10nCH5UwINcLH94C0NMDAXGwwAGRf5Fw4gH6QDBUQRVvA/hhApFb4CCCENd5xO264wIgghAiRqi9uuMCIIIQCGR7QrrjAoIQkVyQSbqAMDQ4PAAkIG7yToAC2MO1E0NQB+GL0BPQE1DDQ9AT0BPQEVUBsFQXTHwGCENd5xO268uBkgQEB1wCBAQHXAFkyEFYQRRA0QwDwF8j4QgHMVUBQRfQAEvQAAcj0ABL0ABL0AMkBzMntVACoMO1E0NQB+GL0BPQE1DDQ9AT0BPQEVUBsFQXTHwGCECJGqL268uBkgQEB1wABMRBFEDRBMPAYyPhCAcxVQFBF9AAS9AAByPQAEvQAEvQAyQHMye1UAL4w7UTQ1AH4YvQE9ATUMND0BPQE9ARVQGwVBdMfAYIQCGR7Qrry4GSBAQHXAG0B0gABkjHU3lkyEFYQRRA0QwDwGcj4QgHMVUBQRfQAEvQAAcj0ABL0ABL0AMkBzMntVAC0jlPtRNDUAfhi9AT0BNQw0PQE9AT0BFVAbBUF0x8BghCRXJBJuvLgZIEBAdcAATEQRRA0QTDwGsj4QgHMVUBQRfQAEvQAAcj0ABL0ABL0AMkBzMntVOAw8sBkAgEgEhMCASAUFQAdEEz9AxvoZQB1wAw4FttgABsIG6VMFn0WjDgQTP0FYAARFn0DW+h3DBtgACMIW6VW1n0WTDgyAHPAEEz9EGACAVgYGQIBSB4fAgEgGhsCASAcHQA9G1tbW1tBcjMBVBF9AAS9AAByPQAEvQAEvQAyQHMyYAAFF8EgAAcFF8EgAD8+EFvIzAxgQEBIBA5QUBSkPADECOBAQtAB4EBAfAHAYAIBICAhAJNIEBAW1TEhBJWfADBIEBASZtcfADA4EBASZt8AWBAQv4QW8jMDEQJG2BAQHwB4EBAW0gbpIwbZnIAQGBAQHPAMniQXDwBRA0QTCABLCSBAQEicfAEIG6aMBSBAQEBf3HwA52BAQEB8AGzEDYScfAD4gOAAKQkgQEBI/AGbvLgZBAkgQEBWfAFAoAIBICQlADm7QH7UTQ1AH4YvQE9ATUMND0BPQE9ARVQGwV8BWAAJtD7+ApAAObXgXaiaGoA/DF6AnoCahhoegJ6AnoCKqA2CvgLQ';
    const depends = new Map<string, Cell>();
    let systemCell = beginCell().storeDict(null).endCell();
    let __stack: StackItem[] = [];
    __stack.push({ type: 'cell', cell: systemCell });
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let executor = await createExecutorFromCode({ code: codeCell, data: new Cell() });
    let res = await executor.get('init_IncrementContract', __stack, { debug: true });
    let data = res.stack.readCell();
    return { code: codeCell, data };
}

export class IncrementContract {
    readonly executor: ContractExecutor; 
    constructor(executor: ContractExecutor) { this.executor = executor; } 
    
    async send(args: { amount: BN, from?: Address, debug?: boolean }, message: Increment | Toggle | Persist | Reset) {
        let body: Cell | null = null;
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'Increment') {
            body = packIncrement(message);
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'Toggle') {
            body = packToggle(message);
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'Persist') {
            body = packPersist(message);
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'Reset') {
            body = packReset(message);
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
    async getCounters() {
        let __stack: StackItem[] = [];
        let result = await this.executor.get('counters', __stack);
        return result.stack.readCellOpt();
    }
    async getCounters2() {
        let __stack: StackItem[] = [];
        let result = await this.executor.get('counters2', __stack);
        return result.stack.readCellOpt();
    }
}