import { Cell, Slice, StackItem, Address, Builder, InternalMessage, CommonMessageInfo, CellMessage, beginCell, serializeDict, TupleSlice4, readString, stringToCell } from 'ton';
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
export async function StringsTester_init() {
    const __code = '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';
    const depends = new Map<string, Cell>();
    let systemCell = beginCell().storeDict(null).endCell();
    let __stack: StackItem[] = [];
    __stack.push({ type: 'cell', cell: systemCell });
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let executor = await createExecutorFromCode({ code: codeCell, data: new Cell() });
    let res = await executor.get('init_StringsTester', __stack, { debug: true });
    if (res.debugLogs.length > 0) { console.warn(res.debugLogs); }
    let data = res.stack.readCell();
    return { code: codeCell, data };
}

export const StringsTester_errors: { [key: string]: string } = {
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
}

export class StringsTester {
    readonly executor: ContractExecutor; 
    constructor(executor: ContractExecutor) { this.executor = executor; } 
    
    async getConstantString() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('constantString', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return readString(result.stack.readCell().beginParse());
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (StringsTester_errors[e.exitCode.toString()]) {
                    throw new Error(StringsTester_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getConstantStringUnicode() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('constantStringUnicode', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return readString(result.stack.readCell().beginParse());
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (StringsTester_errors[e.exitCode.toString()]) {
                    throw new Error(StringsTester_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getConstantStringUnicodeLong() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('constantStringUnicodeLong', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return readString(result.stack.readCell().beginParse());
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (StringsTester_errors[e.exitCode.toString()]) {
                    throw new Error(StringsTester_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getDynamicStringCell() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('dynamicStringCell', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return result.stack.readCell();
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (StringsTester_errors[e.exitCode.toString()]) {
                    throw new Error(StringsTester_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getDynamicCommentCell() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('dynamicCommentCell', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return result.stack.readCell();
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (StringsTester_errors[e.exitCode.toString()]) {
                    throw new Error(StringsTester_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getDynamicCommentCellLarge() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('dynamicCommentCellLarge', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return result.stack.readCell();
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (StringsTester_errors[e.exitCode.toString()]) {
                    throw new Error(StringsTester_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getDynamicCommentStringLarge() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('dynamicCommentStringLarge', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return readString(result.stack.readCell().beginParse());
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (StringsTester_errors[e.exitCode.toString()]) {
                    throw new Error(StringsTester_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getStringWithNumber() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('stringWithNumber', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return readString(result.stack.readCell().beginParse());
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (StringsTester_errors[e.exitCode.toString()]) {
                    throw new Error(StringsTester_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getStringWithNegativeNumber() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('stringWithNegativeNumber', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return readString(result.stack.readCell().beginParse());
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (StringsTester_errors[e.exitCode.toString()]) {
                    throw new Error(StringsTester_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getStringWithLargeNumber() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('stringWithLargeNumber', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return readString(result.stack.readCell().beginParse());
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (StringsTester_errors[e.exitCode.toString()]) {
                    throw new Error(StringsTester_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getStringWithFloat() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('stringWithFloat', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return readString(result.stack.readCell().beginParse());
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (StringsTester_errors[e.exitCode.toString()]) {
                    throw new Error(StringsTester_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
}