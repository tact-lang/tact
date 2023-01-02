import { Cell, Slice, Address, Builder, beginCell, ComputeError, TupleItem, TupleReader, Dictionary, contractAddress, ContractProvider, Sender, Contract, ContractABI } from 'ton-core';
import { ContractSystem, ContractExecutor } from 'ton-emulator';

export type StateInit = {
    $$type: 'StateInit';
    code: Cell;
    data: Cell;
}

export function storeStateInit(src: StateInit) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0 = b_0.storeRef(src.code);
        b_0 = b_0.storeRef(src.data);
    };
}

export function packStackStateInit(src: StateInit, __stack: TupleItem[]) {
    __stack.push({ type: 'cell', cell: src.code });
    __stack.push({ type: 'cell', cell: src.data });
}

export function packTupleStateInit(src: StateInit): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'cell', cell: src.code });
    __stack.push({ type: 'cell', cell: src.data });
    return __stack;
}

export function unpackStackStateInit(slice: TupleReader): StateInit {
    const code = slice.readCell();
    const data = slice.readCell();
    return { $$type: 'StateInit', code: code, data: data };
}
export function unpackTupleStateInit(slice: TupleReader): StateInit {
    const code = slice.readCell();
    const data = slice.readCell();
    return { $$type: 'StateInit', code: code, data: data };
}
export type Context = {
    $$type: 'Context';
    bounced: boolean;
    sender: Address;
    value: bigint;
    raw: Cell;
}

export function storeContext(src: Context) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0 = b_0.storeBit(src.bounced);
        b_0 = b_0.storeAddress(src.sender);
        b_0 = b_0.storeInt(src.value, 257);
        b_0 = b_0.storeRef(src.raw);
    };
}

export function packStackContext(src: Context, __stack: TupleItem[]) {
    __stack.push({ type: 'int', value: src.bounced ? -1n : 0n });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.sender).endCell() });
    __stack.push({ type: 'int', value: src.value });
    __stack.push({ type: 'slice', cell: src.raw });
}

export function packTupleContext(src: Context): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'int', value: src.bounced ? -1n : 0n });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.sender).endCell() });
    __stack.push({ type: 'int', value: src.value });
    __stack.push({ type: 'slice', cell: src.raw });
    return __stack;
}

export function unpackStackContext(slice: TupleReader): Context {
    const bounced = slice.readBoolean();
    const sender = slice.readAddress();
    const value = slice.readBigNumber();
    const raw = slice.readCell();
    return { $$type: 'Context', bounced: bounced, sender: sender, value: value, raw: raw };
}
export function unpackTupleContext(slice: TupleReader): Context {
    const bounced = slice.readBoolean();
    const sender = slice.readAddress();
    const value = slice.readBigNumber();
    const raw = slice.readCell();
    return { $$type: 'Context', bounced: bounced, sender: sender, value: value, raw: raw };
}
export type SendParameters = {
    $$type: 'SendParameters';
    bounce: boolean;
    to: Address;
    value: bigint;
    mode: bigint;
    body: Cell | null;
    code: Cell | null;
    data: Cell | null;
}

export function storeSendParameters(src: SendParameters) {
    return (builder: Builder) => {
        let b_0 = builder;
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
    };
}

export function packStackSendParameters(src: SendParameters, __stack: TupleItem[]) {
    __stack.push({ type: 'int', value: src.bounce ? -1n : 0n });
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

export function packTupleSendParameters(src: SendParameters): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'int', value: src.bounce ? -1n : 0n });
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

export function unpackStackSendParameters(slice: TupleReader): SendParameters {
    const bounce = slice.readBoolean();
    const to = slice.readAddress();
    const value = slice.readBigNumber();
    const mode = slice.readBigNumber();
    const body = slice.readCellOpt();
    const code = slice.readCellOpt();
    const data = slice.readCellOpt();
    return { $$type: 'SendParameters', bounce: bounce, to: to, value: value, mode: mode, body: body, code: code, data: data };
}
export function unpackTupleSendParameters(slice: TupleReader): SendParameters {
    const bounce = slice.readBoolean();
    const to = slice.readAddress();
    const value = slice.readBigNumber();
    const mode = slice.readBigNumber();
    const body = slice.readCellOpt();
    const code = slice.readCellOpt();
    const data = slice.readCellOpt();
    return { $$type: 'SendParameters', bounce: bounce, to: to, value: value, mode: mode, body: body, code: code, data: data };
}
export type Vars = {
    $$type: 'Vars';
    a: bigint;
    b: bigint;
    c: bigint;
    d: bigint;
    e: bigint;
}

export function storeVars(src: Vars) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0 = b_0.storeInt(src.a, 257);
        b_0 = b_0.storeInt(src.b, 257);
        b_0 = b_0.storeInt(src.c, 257);
        let b_1 = new Builder();
        b_1 = b_1.storeInt(src.d, 257);
        b_1 = b_1.storeInt(src.e, 257);
        b_0 = b_0.storeRef(b_1.endCell());
    };
}

export function packStackVars(src: Vars, __stack: TupleItem[]) {
    __stack.push({ type: 'int', value: src.a });
    __stack.push({ type: 'int', value: src.b });
    __stack.push({ type: 'int', value: src.c });
    __stack.push({ type: 'int', value: src.d });
    __stack.push({ type: 'int', value: src.e });
}

export function packTupleVars(src: Vars): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'int', value: src.a });
    __stack.push({ type: 'int', value: src.b });
    __stack.push({ type: 'int', value: src.c });
    __stack.push({ type: 'int', value: src.d });
    __stack.push({ type: 'int', value: src.e });
    return __stack;
}

export function unpackStackVars(slice: TupleReader): Vars {
    const a = slice.readBigNumber();
    const b = slice.readBigNumber();
    const c = slice.readBigNumber();
    const d = slice.readBigNumber();
    const e = slice.readBigNumber();
    return { $$type: 'Vars', a: a, b: b, c: c, d: d, e: e };
}
export function unpackTupleVars(slice: TupleReader): Vars {
    const a = slice.readBigNumber();
    const b = slice.readBigNumber();
    const c = slice.readBigNumber();
    const d = slice.readBigNumber();
    const e = slice.readBigNumber();
    return { $$type: 'Vars', a: a, b: b, c: c, d: d, e: e };
}
export type Update = {
    $$type: 'Update';
    a: Vars;
    b: Vars;
}

export function storeUpdate(src: Update) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0 = b_0.storeUint(2676568142, 32);
        b_0 = b_0.store(storeVars(src.a));
        let b_1 = new Builder();
        b_1 = b_1.store(storeVars(src.b));
        b_0 = b_0.storeRef(b_1.endCell());
    };
}

export function packStackUpdate(src: Update, __stack: TupleItem[]) {
    packStackVars(src.a, __stack);
    packStackVars(src.b, __stack);
}

export function packTupleUpdate(src: Update): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'tuple', items: packTupleVars(src.a) });
    __stack.push({ type: 'tuple', items: packTupleVars(src.b) });
    return __stack;
}

export function unpackStackUpdate(slice: TupleReader): Update {
    const a = unpackStackVars(slice);
    const b = unpackStackVars(slice);
    return { $$type: 'Update', a: a, b: b };
}
export function unpackTupleUpdate(slice: TupleReader): Update {
    const a = unpackTupleVars(slice);
    const b = unpackTupleVars(slice);
    return { $$type: 'Update', a: a, b: b };
}
async function SerializationTester2_init(a: Vars, b: Vars) {
    const __code = 'te6ccgECGQEAA9cAART/APSkE/S88sgLAQIBYgIDAgLMBAUCASATFAKD24EOuk4Q/KmBBrhY/vAWhpgYC42GAAyL/IuHEA/SARKDM3gnwwgUit8BBgABFrpOCQ2HGBQQhPxJgnXXGBGHlgQUBgcCASALDAG2W+1E0NQB+GKBAQHXAIEBAdcAgQEB1wDUAdCBAQHXAIEBAdcAMBAlECQQIwXUAdCBAQHXAIEBAdcAgQEB1wDUAdCBAQHXAIEBAdcAMBAlECQQIzUQWlUDbBrwCwgBsu1E0NQB+GKBAQHXAIEBAdcAgQEB1wDUAdCBAQHXAIEBAdcAMBAlECQQIwXUAdCBAQHXAIEBAdcAgQEB1wDUAdCBAQHXAIEBAdcAMBAlECQQIzUQWlUDbBoKCQC6yPhCAcxVkBBaEEkQOEdqUEWBAQHPABKBAQHPAIEBAc8AAciBAQHPABKBAQHPAMkBzMhVQAZQRYEBAc8AEoEBAc8AgQEBzwAByIEBAc8AEoEBAc8AyQHMyQHMye1UAf7THwGCEJ+JME668uCBgQEB1wCBAQHXAIEBAdcA1AHQgQEB1wCBAQHXADAQJRAkECMF1AHQgQEB1wCBAQHXAIEBAdcA1AHQgQEB1wCBAQHXADAQJRAkECM1EFpVAzoREhETERIRERESEREREBERERAPERAPEO8Q3hDNELwQq1UICgC+8AzI+EIBzFWQEFoQSRA4R2pQRYEBAc8AEoEBAc8AgQEBzwAByIEBAc8AEoEBAc8AyQHMyFVABlBFgQEBzwASgQEBzwCBAQHPAAHIgQEBzwASgQEBzwDJAczJAczJ7VQCASANDgAF02VUAgEgDxACASAREgCxArIzAoQWhBJEDhHalBFgQEBzwASgQEBzwCBAQHPAAHIgQEBzwASgQEBzwDJAczIVUAGUEWBAQHPABKBAQHPAIEBAc8AAciBAQHPABKBAQHPAMkBzMkBzMmAABRfBYAAFGxVgAAEgAAm/6JeARAIBIBUWAE27vRgnBc7D1dLK57HoTsOdZKhRtmgnCd1jUtK2R8syLTry398WI5gCASAXGAC5to/9qJoagD8MUCAgOuAQICA64BAgIDrgGoA6ECAgOuAQICA64AYCBKIEggRguoA6ECAgOuAQICA64BAgIDrgGoA6ECAgOuAQICA64AYCBKIEggRmogtKoG2DXgFQALm0g52omhqAPwxQICA64BAgIDrgECAgOuAagDoQICA64BAgIDrgBgIEogSCBGC6gDoQICA64BAgIDrgECAgOuAagDoQICA64BAgIDrgBgIEogSCBGaiC0qgbYNeATA=';
    const depends = Dictionary.empty(Dictionary.Keys.Uint(16), Dictionary.Values.Cell());
    let systemCell = beginCell().storeDict(depends).endCell();
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'cell', cell: systemCell });
    packStackVars(a, __stack);
    packStackVars(b, __stack);
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let system = await ContractSystem.create();
    let executor = await ContractExecutor.create({ code: codeCell, data: new Cell() }, system);
    let res = await executor.get('init_SerializationTester2', __stack);
    if (!res.success) { throw Error(res.error); }
    let data = res.stack.readCell();
    return { code: codeCell, data };
}

const SerializationTester2_errors: { [key: number]: { message: string } } = {
    2: { message: `Stack undeflow` },
    3: { message: `Stack overflow` },
    4: { message: `Integer overflow` },
    5: { message: `Integer out of expected range` },
    6: { message: `Invalid opcode` },
    7: { message: `Type check error` },
    8: { message: `Cell overflow` },
    9: { message: `Cell underflow` },
    10: { message: `Dictionary error` },
    13: { message: `Out of gas error` },
    32: { message: `Method ID not found` },
    34: { message: `Action is invalid or not supported` },
    37: { message: `Not enough TON` },
    38: { message: `Not enough extra-currencies` },
    128: { message: `Null reference exception` },
    129: { message: `Invalid serialization prefix` },
    130: { message: `Invalid incoming message` },
    131: { message: `Constraints error` },
    132: { message: `Access denied` },
    133: { message: `Contract stopped` },
    134: { message: `Invalid argument` },
}

export class SerializationTester2 implements Contract {
    
    static async init(a: Vars, b: Vars) {
        return await SerializationTester2_init(a,b);
    }
    
    static async fromInit(a: Vars, b: Vars) {
        const init = await SerializationTester2_init(a,b);
        const address = contractAddress(0, init);
        return new SerializationTester2(address, init);
    }
    
    static fromAddress(address: Address) {
        return new SerializationTester2(address);
    }
    
    readonly address: Address; 
    readonly init?: { code: Cell, data: Cell };
    readonly abi: ContractABI = {
        errors: SerializationTester2_errors
    };
    
    private constructor(address: Address, init?: { code: Cell, data: Cell }) {
        this.address = address;
        this.init = init;
    }
    
    async send(provider: ContractProvider, via: Sender, args: { value: bigint, bounce?: boolean| null | undefined }, message: null | Update) {
        
        let body: Cell | null = null;
        if (message === null) {
            body = new Cell();
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'Update') {
            body = beginCell().store(storeUpdate(message)).endCell();
        }
        if (body === null) { throw new Error('Invalid message type'); }
        
        await provider.internal(via, { ...args, body: body });
        
    }
    
    async getGetA(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('getA', __stack);
        return unpackStackVars(result.stack);
    }
    
    async getGetB(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('getB', __stack);
        return unpackStackVars(result.stack);
    }
    
}