import { Cell, Slice, StackItem, Address, Builder, InternalMessage, CommonMessageInfo, CellMessage, beginCell, serializeDict, TupleSlice4, readString, stringToCell } from 'ton';
import { ContractExecutor, createExecutorFromCode, ExecuteError } from 'ton-nodejs';
import BN from 'bn.js';

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
export type ChangeOwner = {
    $$type: 'ChangeOwner';
    newOwner: Address;
}

export function packChangeOwner(src: ChangeOwner): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(3067051791, 32);
    b_0 = b_0.storeAddress(src.newOwner);
    return b_0.endCell();
}

export function packStackChangeOwner(src: ChangeOwner, __stack: StackItem[]) {
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.newOwner).endCell() });
}

export function packTupleChangeOwner(src: ChangeOwner): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.newOwner).endCell() });
    return __stack;
}

export function unpackStackChangeOwner(slice: TupleSlice4): ChangeOwner {
    const newOwner = slice.readAddress();
    return { $$type: 'ChangeOwner', newOwner: newOwner };
}
export function unpackTupleChangeOwner(slice: TupleSlice4): ChangeOwner {
    const newOwner = slice.readAddress();
    return { $$type: 'ChangeOwner', newOwner: newOwner };
}
export type RugParams = {
    $$type: 'RugParams';
    investment: BN;
    returns: BN;
    fee: BN;
}

export function packRugParams(src: RugParams): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeInt(src.investment, 257);
    b_0 = b_0.storeInt(src.returns, 257);
    b_0 = b_0.storeInt(src.fee, 257);
    return b_0.endCell();
}

export function packStackRugParams(src: RugParams, __stack: StackItem[]) {
    __stack.push({ type: 'int', value: src.investment });
    __stack.push({ type: 'int', value: src.returns });
    __stack.push({ type: 'int', value: src.fee });
}

export function packTupleRugParams(src: RugParams): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: src.investment });
    __stack.push({ type: 'int', value: src.returns });
    __stack.push({ type: 'int', value: src.fee });
    return __stack;
}

export function unpackStackRugParams(slice: TupleSlice4): RugParams {
    const investment = slice.readBigNumber();
    const returns = slice.readBigNumber();
    const fee = slice.readBigNumber();
    return { $$type: 'RugParams', investment: investment, returns: returns, fee: fee };
}
export function unpackTupleRugParams(slice: TupleSlice4): RugParams {
    const investment = slice.readBigNumber();
    const returns = slice.readBigNumber();
    const fee = slice.readBigNumber();
    return { $$type: 'RugParams', investment: investment, returns: returns, fee: fee };
}
export async function RugPull_init(owner: Address, investment: BN, returns: BN, fee: BN) {
    const __code = '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';
    const depends = new Map<string, Cell>();
    let systemCell = beginCell().storeDict(null).endCell();
    let __stack: StackItem[] = [];
    __stack.push({ type: 'cell', cell: systemCell });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(owner).endCell() });
    __stack.push({ type: 'int', value: investment });
    __stack.push({ type: 'int', value: returns });
    __stack.push({ type: 'int', value: fee });
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let executor = await createExecutorFromCode({ code: codeCell, data: new Cell() });
    let res = await executor.get('init_RugPull', __stack, { debug: true });
    if (res.debugLogs.length > 0) { console.warn(res.debugLogs); }
    let data = res.stack.readCell();
    return { code: codeCell, data };
}

export const RugPull_errors: { [key: string]: string } = {
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
    '131': `Constraints error`,
    '132': `Access denied`,
    '133': `Contract stopped`,
    '134': `Invalid argument`,
    '16059': `Invalid value`,
    '40368': `Contract stopped`,
    '53296': `Contract not stopped`,
}

export class RugPull {
    readonly executor: ContractExecutor; 
    constructor(executor: ContractExecutor) { this.executor = executor; } 
    
    async send(args: { amount: BN, from?: Address, debug?: boolean }, message: null | 'withdraw' | 'rugpull' | ChangeOwner | 'Stop') {
        let body: Cell | null = null;
        if (message === null) {
            body = new Cell();
        }
        if (message === 'withdraw') {
            body = beginCell().storeUint(0, 32).storeBuffer(Buffer.from(message)).endCell();
        }
        if (message === 'rugpull') {
            body = beginCell().storeUint(0, 32).storeBuffer(Buffer.from(message)).endCell();
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'ChangeOwner') {
            body = packChangeOwner(message);
        }
        if (message === 'Stop') {
            body = beginCell().storeUint(0, 32).storeBuffer(Buffer.from(message)).endCell();
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
                if (RugPull_errors[e.exitCode.toString()]) {
                    throw new Error(RugPull_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getParams() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('params', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return unpackStackRugParams(result.stack);
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (RugPull_errors[e.exitCode.toString()]) {
                    throw new Error(RugPull_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getOwner() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('owner', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return result.stack.readAddress();
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (RugPull_errors[e.exitCode.toString()]) {
                    throw new Error(RugPull_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getStopped() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('stopped', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return result.stack.readBoolean();
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (RugPull_errors[e.exitCode.toString()]) {
                    throw new Error(RugPull_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
}