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
export type Update = {
    $$type: 'Update';
    a: BN;
    b: BN;
    c: BN;
    d: BN;
    e: BN;
    f: BN;
    g: BN;
    h: BN;
    i: BN;
}

export function packUpdate(src: Update): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(2676568142, 32);
    b_0 = b_0.storeInt(src.a, 257);
    b_0 = b_0.storeInt(src.b, 257);
    b_0 = b_0.storeInt(src.c, 257);
    let b_1 = new Builder();
    b_1 = b_1.storeInt(src.d, 257);
    b_1 = b_1.storeInt(src.e, 257);
    b_1 = b_1.storeInt(src.f, 257);
    let b_2 = new Builder();
    b_2 = b_2.storeInt(src.g, 257);
    b_2 = b_2.storeInt(src.h, 257);
    b_2 = b_2.storeInt(src.i, 257);
    b_1 = b_1.storeRef(b_2.endCell());
    b_0 = b_0.storeRef(b_1.endCell());
    return b_0.endCell();
}

export function packStackUpdate(src: Update, __stack: StackItem[]) {
    __stack.push({ type: 'int', value: src.a });
    __stack.push({ type: 'int', value: src.b });
    __stack.push({ type: 'int', value: src.c });
    __stack.push({ type: 'int', value: src.d });
    __stack.push({ type: 'int', value: src.e });
    __stack.push({ type: 'int', value: src.f });
    __stack.push({ type: 'int', value: src.g });
    __stack.push({ type: 'int', value: src.h });
    __stack.push({ type: 'int', value: src.i });
}

export function packTupleUpdate(src: Update): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: src.a });
    __stack.push({ type: 'int', value: src.b });
    __stack.push({ type: 'int', value: src.c });
    __stack.push({ type: 'int', value: src.d });
    __stack.push({ type: 'int', value: src.e });
    __stack.push({ type: 'int', value: src.f });
    __stack.push({ type: 'int', value: src.g });
    __stack.push({ type: 'int', value: src.h });
    __stack.push({ type: 'int', value: src.i });
    return __stack;
}

export function unpackStackUpdate(slice: TupleSlice4): Update {
    const a = slice.readBigNumber();
    const b = slice.readBigNumber();
    const c = slice.readBigNumber();
    const d = slice.readBigNumber();
    const e = slice.readBigNumber();
    const f = slice.readBigNumber();
    const g = slice.readBigNumber();
    const h = slice.readBigNumber();
    const i = slice.readBigNumber();
    return { $$type: 'Update', a: a, b: b, c: c, d: d, e: e, f: f, g: g, h: h, i: i };
}
export function unpackTupleUpdate(slice: TupleSlice4): Update {
    const a = slice.readBigNumber();
    const b = slice.readBigNumber();
    const c = slice.readBigNumber();
    const d = slice.readBigNumber();
    const e = slice.readBigNumber();
    const f = slice.readBigNumber();
    const g = slice.readBigNumber();
    const h = slice.readBigNumber();
    const i = slice.readBigNumber();
    return { $$type: 'Update', a: a, b: b, c: c, d: d, e: e, f: f, g: g, h: h, i: i };
}
export async function SerializationTester_init(a: BN, b: BN, c: BN, d: BN, e: BN, f: BN, g: BN, h: BN, i: BN) {
    const __code = 'te6ccgECGwEABJUAART/APSkE/S88sgLAQIBYgIDAvTQcCHXScIflTAg1wsf3gLQ0wMBcbDAAZF/kXDiAfpAMFRBFW8D+GECkVvgghCfiTBOuo7E7UTQ1AH4YoEBAdcAgQEB1wCBAQHXANQB0IEBAdcAgQEB1wCBAQHXANQw0IEBAdcAgQEB1wCBAQHXADAQaRBoEGdsGQngMAQFAgEgBwgB1NMfAYIQn4kwTrry4IGBAQHXAIEBAdcAgQEB1wDUAdCBAQHXAIEBAdcAgQEB1wDUMNCBAQHXAIEBAdcAgQEB1wAwEGkQaBBnOREQEREREA8REA8Q7xDeEM0QvBCrEJpVBzI4ODk5OTk5OQEGAAbywIIAkMj4QgHMVYBQiYEBAc8AFoEBAc8AFIEBAc8AAsiBAQHPAIEBAc8AEoEBAc8AAsiBAQHPABOBAQHPABOBAQHPAMlYzMkBzMntVAIBbgkKAgEgDQ4CA5VQCwwAkbFNe1E0NQB+GKBAQHXAIEBAdcAgQEB1wDUAdCBAQHXAIEBAdcAgQEB1wDUMNCBAQHXAIEBAdcAgQEB1wAwEGkQaBBnbBkYXwiAAjbKdqJoagD8MUCAgOuAQICA64BAgIDrgGoA6ECAgOuAQICA64BAgIDrgGoYaECAgOuAQICA64BAgIDrgBgINIg0CDO2DLZAwAImy4TkZgSoRMCAgOeAC0CAgOeACkCAgOeAAWRAgIDngECAgOeACUCAgOeAAWRAgIDngAnAgIDngAnAgIDngGSsZmSA5mTACASAPEAIBIBcYAgEgERICASATFACTsTa7UTQ1AH4YoEBAdcAgQEB1wCBAQHXANQB0IEBAdcAgQEB1wCBAQHXANQw0IEBAdcAgQEB1wCBAQHXADAQaRBoEGdsGRAoXwiAAk7E++1E0NQB+GKBAQHXAIEBAdcAgQEB1wDUAdCBAQHXAIEBAdcAgQEB1wDUMNCBAQHXAIEBAdcAgQEB1wAwEGkQaBBnbBkQOF8IgAJOxJjtRNDUAfhigQEB1wCBAQHXAIEBAdcA1AHQgQEB1wCBAQHXAIEBAdcA1DDQgQEB1wCBAQHXAIEBAdcAMBBpEGgQZ2wZEEhfCIAIBIBUWAJOuXPaiaGoA/DFAgIDrgECAgOuAQICA64BqAOhAgIDrgECAgOuAQICA64BqGGhAgIDrgECAgOuAQICA64AYCDSINAgztgyILC+EQABNrejBOC52Hq6WVz2PQnYc6yVCjbNBOE7rGpaVsj5ZkWnXlv74sRzAAgEgGRoAj7SDnaiaGoA/DFAgIDrgECAgOuAQICA64BqAOhAgIDrgECAgOuAQICA64BqGGhAgIDrgECAgOuAQICA64AYCDSINAgztgyvhEACTsRe7UTQ1AH4YoEBAdcAgQEB1wCBAQHXANQB0IEBAdcAgQEB1wCBAQHXANQw0IEBAdcAgQEB1wCBAQHXADAQaRBoEGdsGRBoXwiAAk7Ef+1E0NQB+GKBAQHXAIEBAdcAgQEB1wDUAdCBAQHXAIEBAdcAgQEB1wDUMNCBAQHXAIEBAdcAgQEB1wAwEGkQaBBnbBkQeF8Ig';
    const depends = new Map<string, Cell>();
    let systemCell = beginCell().storeDict(null).endCell();
    let __stack: StackItem[] = [];
    __stack.push({ type: 'cell', cell: systemCell });
    __stack.push({ type: 'int', value: a });
    __stack.push({ type: 'int', value: b });
    __stack.push({ type: 'int', value: c });
    __stack.push({ type: 'int', value: d });
    __stack.push({ type: 'int', value: e });
    __stack.push({ type: 'int', value: f });
    __stack.push({ type: 'int', value: g });
    __stack.push({ type: 'int', value: h });
    __stack.push({ type: 'int', value: i });
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let executor = await createExecutorFromCode({ code: codeCell, data: new Cell() });
    let res = await executor.get('init_SerializationTester', __stack, { debug: true });
    if (res.debugLogs.length > 0) { console.warn(res.debugLogs); }
    let data = res.stack.readCell();
    return { code: codeCell, data };
}

export const SerializationTester_errors: { [key: string]: string } = {
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

export class SerializationTester {
    readonly executor: ContractExecutor; 
    constructor(executor: ContractExecutor) { this.executor = executor; } 
    
    async send(args: { amount: BN, from?: Address, debug?: boolean }, message: Update) {
        let body: Cell | null = null;
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'Update') {
            body = packUpdate(message);
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
                if (SerializationTester_errors[e.exitCode.toString()]) {
                    throw new Error(SerializationTester_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getGetA() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('getA', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return result.stack.readBigNumber();
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (SerializationTester_errors[e.exitCode.toString()]) {
                    throw new Error(SerializationTester_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getGetB() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('getB', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return result.stack.readBigNumber();
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (SerializationTester_errors[e.exitCode.toString()]) {
                    throw new Error(SerializationTester_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getGetC() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('getC', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return result.stack.readBigNumber();
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (SerializationTester_errors[e.exitCode.toString()]) {
                    throw new Error(SerializationTester_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getGetD() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('getD', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return result.stack.readBigNumber();
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (SerializationTester_errors[e.exitCode.toString()]) {
                    throw new Error(SerializationTester_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getGetE() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('getE', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return result.stack.readBigNumber();
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (SerializationTester_errors[e.exitCode.toString()]) {
                    throw new Error(SerializationTester_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getGetF() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('getF', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return result.stack.readBigNumber();
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (SerializationTester_errors[e.exitCode.toString()]) {
                    throw new Error(SerializationTester_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getGetG() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('getG', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return result.stack.readBigNumber();
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (SerializationTester_errors[e.exitCode.toString()]) {
                    throw new Error(SerializationTester_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getGetH() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('getH', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return result.stack.readBigNumber();
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (SerializationTester_errors[e.exitCode.toString()]) {
                    throw new Error(SerializationTester_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getGetI() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('getI', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return result.stack.readBigNumber();
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (SerializationTester_errors[e.exitCode.toString()]) {
                    throw new Error(SerializationTester_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
}