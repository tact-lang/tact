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

export function packTupleSomeGenericStruct(src: SomeGenericStruct): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: src.value1 });
    __stack.push({ type: 'int', value: src.value2 });
    __stack.push({ type: 'int', value: src.value3 });
    __stack.push({ type: 'int', value: src.value4 });
    __stack.push({ type: 'int', value: src.value5 });
    return __stack;
}

export function unpackStackSomeGenericStruct(slice: TupleSlice4): SomeGenericStruct {
    const value1 = slice.readBigNumber();
    const value2 = slice.readBigNumber();
    const value3 = slice.readBigNumber();
    const value4 = slice.readBigNumber();
    const value5 = slice.readBigNumber();
    return { $$type: 'SomeGenericStruct', value1: value1, value2: value2, value3: value3, value4: value4, value5: value5 };
}
export function unpackTupleSomeGenericStruct(slice: TupleSlice4): SomeGenericStruct {
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
        __stack.push({ type: 'tuple', items: packTupleSomeGenericStruct(src.e) });
    } else {
        __stack.push({ type: 'null' });
    }
}

export function packTupleStructWithOptionals(src: StructWithOptionals): StackItem[] {
    let __stack: StackItem[] = [];
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
        __stack.push({ type: 'tuple', items: packTupleSomeGenericStruct(src.e) });
    } else {
        __stack.push({ type: 'null' });
    }
    return __stack;
}

export function unpackStackStructWithOptionals(slice: TupleSlice4): StructWithOptionals {
    const a = slice.readBigNumberOpt();
    const b = slice.readBooleanOpt();
    const c = slice.readCellOpt();
    const d = slice.readAddressOpt();
    const e_p = slice.pop();
    const e = e_p.type !== 'tuple' ? null : unpackTupleSomeGenericStruct(new TupleSlice4(e_p.items));
    return { $$type: 'StructWithOptionals', a: a, b: b, c: c, d: d, e: e };
}
export function unpackTupleStructWithOptionals(slice: TupleSlice4): StructWithOptionals {
    const a = slice.readBigNumberOpt();
    const b = slice.readBooleanOpt();
    const c = slice.readCellOpt();
    const d = slice.readAddressOpt();
    const e_p = slice.pop();
    const e = e_p.type !== 'tuple' ? null : unpackTupleSomeGenericStruct(new TupleSlice4(e_p.items));
    return { $$type: 'StructWithOptionals', a: a, b: b, c: c, d: d, e: e };
}
export type Update = {
    $$type: 'Update';
    a: BN | null;
    b: boolean | null;
    c: Cell | null;
    d: Address | null;
    e: SomeGenericStruct | null;
    f: StructWithOptionals | null;
}

export function packUpdate(src: Update): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(2676568142, 32);
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
    let b_2 = new Builder();
    if (src.f !== null) {
        b_2 = b_2.storeBit(true);
        b_2 = b_2.storeCellCopy(packStructWithOptionals(src.f));
    } else {
        b_2 = b_2.storeBit(false);
    }
    b_1 = b_1.storeRef(b_2.endCell());
    b_0 = b_0.storeRef(b_1.endCell());
    return b_0.endCell();
}

export function packStackUpdate(src: Update, __stack: StackItem[]) {
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
        __stack.push({ type: 'tuple', items: packTupleSomeGenericStruct(src.e) });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.f !== null) {
        __stack.push({ type: 'tuple', items: packTupleStructWithOptionals(src.f) });
    } else {
        __stack.push({ type: 'null' });
    }
}

export function packTupleUpdate(src: Update): StackItem[] {
    let __stack: StackItem[] = [];
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
        __stack.push({ type: 'tuple', items: packTupleSomeGenericStruct(src.e) });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.f !== null) {
        __stack.push({ type: 'tuple', items: packTupleStructWithOptionals(src.f) });
    } else {
        __stack.push({ type: 'null' });
    }
    return __stack;
}

export function unpackStackUpdate(slice: TupleSlice4): Update {
    const a = slice.readBigNumberOpt();
    const b = slice.readBooleanOpt();
    const c = slice.readCellOpt();
    const d = slice.readAddressOpt();
    const e_p = slice.pop();
    const e = e_p.type !== 'tuple' ? null : unpackTupleSomeGenericStruct(new TupleSlice4(e_p.items));
    const f_p = slice.pop();
    const f = f_p.type !== 'tuple' ? null : unpackTupleStructWithOptionals(new TupleSlice4(f_p.items));
    return { $$type: 'Update', a: a, b: b, c: c, d: d, e: e, f: f };
}
export function unpackTupleUpdate(slice: TupleSlice4): Update {
    const a = slice.readBigNumberOpt();
    const b = slice.readBooleanOpt();
    const c = slice.readCellOpt();
    const d = slice.readAddressOpt();
    const e_p = slice.pop();
    const e = e_p.type !== 'tuple' ? null : unpackTupleSomeGenericStruct(new TupleSlice4(e_p.items));
    const f_p = slice.pop();
    const f = f_p.type !== 'tuple' ? null : unpackTupleStructWithOptionals(new TupleSlice4(f_p.items));
    return { $$type: 'Update', a: a, b: b, c: c, d: d, e: e, f: f };
}
export async function ContractWithOptionals_init(a: BN | null, b: boolean | null, c: Cell | null, d: Address | null, e: SomeGenericStruct | null, f: StructWithOptionals | null) {
    const __code = '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';
    const depends = new Map<string, Cell>();
    let systemCell = beginCell().storeDict(null).endCell();
    let __stack: StackItem[] = [];
    __stack.push({ type: 'cell', cell: systemCell });
    if (a !== null) {
        __stack.push({ type: 'int', value: a });
    } else {
        __stack.push({ type: 'null' });
    }
    if (b !== null) {
        __stack.push({ type: 'int', value: b ? new BN(-1) : new BN(0) });
    } else {
        __stack.push({ type: 'null' });
    }
    if (c !== null) {
        __stack.push({ type: 'cell', cell: c });
    } else {
        __stack.push({ type: 'null' });
    }
    if (d !== null) {
        __stack.push({ type: 'slice', cell: beginCell().storeAddress(d).endCell() });
    } else {
        __stack.push({ type: 'null' });
    }
    if (e !== null) {
        __stack.push({ type: 'tuple', items: packTupleSomeGenericStruct(e) });
    } else {
        __stack.push({ type: 'null' });
    }
    if (f !== null) {
        __stack.push({ type: 'tuple', items: packTupleStructWithOptionals(f) });
    } else {
        __stack.push({ type: 'null' });
    }
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let executor = await createExecutorFromCode({ code: codeCell, data: new Cell() });
    let res = await executor.get('init_ContractWithOptionals', __stack, { debug: true });
    if (res.debugLogs.length > 0) { console.warn(res.debugLogs); }
    let data = res.stack.readCell();
    return { code: codeCell, data };
}

export const ContractWithOptionals_errors: { [key: string]: string } = {
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

export class ContractWithOptionals {
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
                if (ContractWithOptionals_errors[e.exitCode.toString()]) {
                    throw new Error(ContractWithOptionals_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getIsNotNullA() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('isNotNullA', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return result.stack.readBoolean();
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (ContractWithOptionals_errors[e.exitCode.toString()]) {
                    throw new Error(ContractWithOptionals_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getIsNotNullB() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('isNotNullB', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return result.stack.readBoolean();
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (ContractWithOptionals_errors[e.exitCode.toString()]) {
                    throw new Error(ContractWithOptionals_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getIsNotNullC() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('isNotNullC', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return result.stack.readBoolean();
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (ContractWithOptionals_errors[e.exitCode.toString()]) {
                    throw new Error(ContractWithOptionals_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getIsNotNullD() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('isNotNullD', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return result.stack.readBoolean();
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (ContractWithOptionals_errors[e.exitCode.toString()]) {
                    throw new Error(ContractWithOptionals_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getIsNotNullE() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('isNotNullE', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return result.stack.readBoolean();
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (ContractWithOptionals_errors[e.exitCode.toString()]) {
                    throw new Error(ContractWithOptionals_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getIsNotNullF() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('isNotNullF', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return result.stack.readBoolean();
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (ContractWithOptionals_errors[e.exitCode.toString()]) {
                    throw new Error(ContractWithOptionals_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getNullA() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('nullA', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return result.stack.readBigNumberOpt();
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (ContractWithOptionals_errors[e.exitCode.toString()]) {
                    throw new Error(ContractWithOptionals_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getNullB() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('nullB', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return result.stack.readBooleanOpt();
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (ContractWithOptionals_errors[e.exitCode.toString()]) {
                    throw new Error(ContractWithOptionals_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getNullC() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('nullC', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return result.stack.readCellOpt();
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (ContractWithOptionals_errors[e.exitCode.toString()]) {
                    throw new Error(ContractWithOptionals_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getNullD() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('nullD', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return result.stack.readAddressOpt();
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (ContractWithOptionals_errors[e.exitCode.toString()]) {
                    throw new Error(ContractWithOptionals_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getNullE() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('nullE', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            let pp = result.stack.pop();
            if (pp.type !== 'tuple') { return null; }
            return unpackTupleSomeGenericStruct(new TupleSlice4(pp.items));
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (ContractWithOptionals_errors[e.exitCode.toString()]) {
                    throw new Error(ContractWithOptionals_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getNullF() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('nullF', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            let pp = result.stack.pop();
            if (pp.type !== 'tuple') { return null; }
            return unpackTupleStructWithOptionals(new TupleSlice4(pp.items));
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (ContractWithOptionals_errors[e.exitCode.toString()]) {
                    throw new Error(ContractWithOptionals_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getNotNullA() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('notNullA', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return result.stack.readBigNumber();
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (ContractWithOptionals_errors[e.exitCode.toString()]) {
                    throw new Error(ContractWithOptionals_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getNotNullB() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('notNullB', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return result.stack.readBoolean();
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (ContractWithOptionals_errors[e.exitCode.toString()]) {
                    throw new Error(ContractWithOptionals_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getNotNullC() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('notNullC', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return result.stack.readCell();
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (ContractWithOptionals_errors[e.exitCode.toString()]) {
                    throw new Error(ContractWithOptionals_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getNotNullD() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('notNullD', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return result.stack.readAddress();
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (ContractWithOptionals_errors[e.exitCode.toString()]) {
                    throw new Error(ContractWithOptionals_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getNotNullE() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('notNullE', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return unpackStackSomeGenericStruct(result.stack);
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (ContractWithOptionals_errors[e.exitCode.toString()]) {
                    throw new Error(ContractWithOptionals_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getNotNullF() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('notNullF', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return unpackStackStructWithOptionals(result.stack);
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (ContractWithOptionals_errors[e.exitCode.toString()]) {
                    throw new Error(ContractWithOptionals_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
}