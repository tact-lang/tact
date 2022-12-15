import { Cell, Slice, StackItem, Address, Builder, InternalMessage, CommonMessageInfo, CellMessage, beginCell, serializeDict, TupleSlice4 } from 'ton';
import { ContractExecutor, createExecutorFromCode, ExecuteError } from 'ton-nodejs';
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

export function packTupleSendParameters(src: SendParameters): StackItem[] {
    let __stack: StackItem[] = [];
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
    return __stack;
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
export function unpackTupleSendParameters(slice: TupleSlice4): SendParameters {
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

export function packTupleContext(src: Context): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: src.bounced ? new BN(-1) : new BN(0) });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.sender).endCell() });
    __stack.push({ type: 'int', value: src.value });
    return __stack;
}

export function unpackStackContext(slice: TupleSlice4): Context {
    const bounced = slice.readBoolean();
    const sender = slice.readAddress();
    const value = slice.readBigNumber();
    return { $$type: 'Context', bounced: bounced, sender: sender, value: value };
}
export function unpackTupleContext(slice: TupleSlice4): Context {
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

export function packTupleStateInit(src: StateInit): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'cell', cell: src.code });
    __stack.push({ type: 'cell', cell: src.data });
    return __stack;
}

export function unpackStackStateInit(slice: TupleSlice4): StateInit {
    const code = slice.readCell();
    const data = slice.readCell();
    return { $$type: 'StateInit', code: code, data: data };
}
export function unpackTupleStateInit(slice: TupleSlice4): StateInit {
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

export function packTupleIncrement(src: Increment): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: src.key });
    __stack.push({ type: 'int', value: src.value });
    return __stack;
}

export function unpackStackIncrement(slice: TupleSlice4): Increment {
    const key = slice.readBigNumber();
    const value = slice.readBigNumber();
    return { $$type: 'Increment', key: key, value: value };
}
export function unpackTupleIncrement(slice: TupleSlice4): Increment {
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

export function packTupleToggle(src: Toggle): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: src.key });
    return __stack;
}

export function unpackStackToggle(slice: TupleSlice4): Toggle {
    const key = slice.readBigNumber();
    return { $$type: 'Toggle', key: key };
}
export function unpackTupleToggle(slice: TupleSlice4): Toggle {
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

export function packTuplePersist(src: Persist): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: src.key });
    if (src.content !== null) {
        __stack.push({ type: 'cell', cell: src.content });
    } else {
        __stack.push({ type: 'null' });
    }
    return __stack;
}

export function unpackStackPersist(slice: TupleSlice4): Persist {
    const key = slice.readBigNumber();
    const content = slice.readCellOpt();
    return { $$type: 'Persist', key: key, content: content };
}
export function unpackTuplePersist(slice: TupleSlice4): Persist {
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

export function packTupleReset(src: Reset): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: src.key });
    return __stack;
}

export function unpackStackReset(slice: TupleSlice4): Reset {
    const key = slice.readBigNumber();
    return { $$type: 'Reset', key: key };
}
export function unpackTupleReset(slice: TupleSlice4): Reset {
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

export function packTupleSomething(src: Something): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: src.value });
    return __stack;
}

export function unpackStackSomething(slice: TupleSlice4): Something {
    const value = slice.readBigNumber();
    return { $$type: 'Something', value: value };
}
export function unpackTupleSomething(slice: TupleSlice4): Something {
    const value = slice.readBigNumber();
    return { $$type: 'Something', value: value };
}
export async function IncrementContract_init() {
    const __code = 'te6ccgECKAEAA8AAART/APSkE/S88sgLAQIBYgIDAgLLBAUCAUgkJQIBIAYHAgEgGBkCASAICQAPvEDd5aEA3kMCASAKCwIBIBITAgEgDA0AI1IW6VW1n0WjDgyAHPAEEz9EKASfHAh10nCH5UwINcLH94C0NMDAXGwwAGRf5Fw4gH6QDBUQRVvA/hhApFb4CCCENd5xO264wIgghAiRqi9uuMCIIIQCGR7QrrjAoIQkVyQSbqAODxARAAsIG7y0ICAAvDDtRNDUAfhi9AT0BNQB0PQE9AT0BDAQNRA0bBUF0x8BghDXecTtuvLggYEBAdcAgQEB1wBZMhBWEEUQNEMA8BjI+EIBzFVAUEX0ABL0AAHI9AAS9AAS9ADJAczJ7VQArjDtRNDUAfhi9AT0BNQB0PQE9AT0BDAQNRA0bBUF0x8BghAiRqi9uvLggYEBAdcAATEQRRA0QTDwGcj4QgHMVUBQRfQAEvQAAcj0ABL0ABL0AMkBzMntVADEMO1E0NQB+GL0BPQE1AHQ9AT0BPQEMBA1EDRsFQXTHwGCEAhke0K68uCBgQEB1wBtAdIAAZIx1N5ZMhBWEEUQNEMA8BrI+EIBzFVAUEX0ABL0AAHI9AAS9AAS9ADJAczJ7VQAuo5W7UTQ1AH4YvQE9ATUAdD0BPQE9AQwEDUQNGwVBdMfAYIQkVyQSbry4IGBAQHXAAExEEUQNEEw8BvI+EIBzFVAUEX0ABL0AAHI9AAS9AAS9ADJAczJ7VTgMPLAggIBIBQVAgEgFhcAHRBM/QMb6GUAdcAMOBbbYAAbCBulTBZ9Fow4EEz9BWAAERZ9A1vodwwbYAAjCFulVtZ9Fkw4MgBzwBBM/RBgAgFYGhsCAUgeHwA9VtbW1tbQXIzAVQRfQAEvQAAcj0ABL0ABL0AMkBzMmAIBIBwdAAUXwSAABwUXwSACASAgIQIBICIjAD8+EFvIzAxgQEBIBA5QUBSkPADECOBAQtAB4EBAfAHAYABLCSBAQEicfAEIG6aMBSBAQEBf3HwA52BAQEB8AGzEDYScfAD4gOAAKQkgQEBI/AGbvLgZBAkgQEBWfAFAoACXIEBAW1TEhBJWfADBIEBASZtcfADA4EBASZt8AWBAQv4QW8jMDEQJG2BAQHwB4EBAW0gbpIwbZvwDsgBAYEBAc8AyeJBcPAFEDRBMIAIBICYnAD+7QH7UTQ1AH4YvQE9ATUAdD0BPQE9AQwEDUQNGwV8BaAAJtD7+ArAAP7XgXaiaGoA/DF6AnoCagDoegJ6AnoCGAgaiBo2CvgLw';
    const depends = new Map<string, Cell>();
    let systemCell = beginCell().storeDict(null).endCell();
    let __stack: StackItem[] = [];
    __stack.push({ type: 'cell', cell: systemCell });
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let executor = await createExecutorFromCode({ code: codeCell, data: new Cell() });
    let res = await executor.get('init_IncrementContract', __stack, { debug: true });
    if (res.debugLogs.length > 0) { console.warn(res.debugLogs); }
    let data = res.stack.readCell();
    return { code: codeCell, data };
}

export const IncrementContract_errors: { [key: string]: string } = {
    '2': `Stack undeflow`,
    '3': `Stack overflow`,
    '4': `Integer overflow`,
    '5': `Integer out of expected range`,
    '6': `Invalid opcode`,
    '7': `Type check error`,
    '8': `Cell overflow`,
    '9': `Cell underflow`,
    '10': `Dictionary error`,
    '13': `Out of gas error`,
    '32': `Method ID not found`,
    '34': `Action is invalid or not supported`,
    '37': `Not enough TON`,
    '38': `Not enough extra-currencies`,
    '128': `Null reference exception`,
    '129': `Invalid serialization prefix`,
    '130': `Invalid incoming message`,
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
        try {
            let r = await this.executor.internal(new InternalMessage({
                to: this.executor.address,
                from: args.from || this.executor.address,
                bounce: false,
                value: args.amount,
                body: new CommonMessageInfo({
                    body: new CellMessage(body!)
                })
            }), { debug: args.debug });
            if (r.debugLogs.length > 0) { console.warn(r.debugLogs); }
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (IncrementContract_errors[e.exitCode.toString()]) {
                    throw new Error(IncrementContract_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getCounters() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('counters', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return result.stack.readCellOpt();
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (IncrementContract_errors[e.exitCode.toString()]) {
                    throw new Error(IncrementContract_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getCounters2() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('counters2', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return result.stack.readCellOpt();
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (IncrementContract_errors[e.exitCode.toString()]) {
                    throw new Error(IncrementContract_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
}