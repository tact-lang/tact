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
export async function IncrementContract_init() {
    const __code = 'te6ccgECGwEAAjQAART/APSkE/S88sgLAQIBYgIDAgLLBAUCAUgZGgIBIAYHAA3SBAQFZ8AKAgEgCAkCAVgTFAIBIAoLAB3SCZ+gY30MoA64AYcC22wCASAMDQIBIBESA5ccCHXScIflTAg1wsf3gLQ0wMBcbDAAZF/kXDiAfpAMFRBFW8D+GECkVvgIIIQ13nE7brjAiCCECJGqL264wKCEAhke0K64wIw8sBkgDg8QAAkIG7yToACYMO1E0NQB+GL0BPQE1DDQ9ARVIGwTA9MfAYIQ13nE7bry4GSBAQHXAIEBAdcAWTIQNEMA8A7I+EIBzFUgUCP0APQAAcj0AMkBzMntVACKMO1E0NQB+GL0BPQE1DDQ9ARVIGwTA9MfAYIQIkaovbry4GSBAQHXAAExQTDwD8j4QgHMVSBQI/QA9AAByPQAyQHMye1UAJ7tRNDUAfhi9AT0BNQw0PQEVSBsEwPTHwGCEAhke0K68uBkgQEB1wBtAdIAAZLUMd5ZMhA0QwDwEMj4QgHMVSBQI/QA9AAByPQAyQHMye1UABsIG6VMFn0WjDgQTP0FYAAjCFulVtZ9Fow4MgBzwBBM/RCgAgEgFRYCASAXGAArG1tbQPIzANQI/QA9AAByPQAyQHMyYAADFuAAFyBAQEgEEZDMPADAoABLCKBAQEicfAEIG6aMBKBAQEBf3HwA52BAQEB8AGzEDQScfAD4gGAACbgffwDIADG7QH7UTQ1AH4YvQE9ATUMND0BFUgbBPwDY';
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
    
    async send(args: { amount: BN, from?: Address, debug?: boolean }, message: Increment | Toggle | Persist) {
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
        if (body === null) { throw new Error('Invalid message type'); }
        await this.executor.internal(new InternalMessage({
            to: this.executor.address,
            from: args.from || this.executor.address,
            bounce: false,
            value: args.amount,
            body: new CommonMessageInfo({
                body: new CellMessage(body!)
            })
        }), { debug: args.debug });
    }
    async getCounters() {
        let __stack: StackItem[] = [];
        let result = await this.executor.get('counters', __stack);
        return result.stack.readCellOpt();
    }
}