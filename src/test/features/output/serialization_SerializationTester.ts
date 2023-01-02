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
export type Update = {
    $$type: 'Update';
    a: bigint;
    b: bigint;
    c: bigint;
    d: bigint;
    e: bigint;
    f: bigint;
    g: bigint;
    h: bigint;
    i: bigint;
}

export function storeUpdate(src: Update) {
    return (builder: Builder) => {
        let b_0 = builder;
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
    };
}

export function packStackUpdate(src: Update, __stack: TupleItem[]) {
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

export function packTupleUpdate(src: Update): TupleItem[] {
    let __stack: TupleItem[] = [];
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

export function unpackStackUpdate(slice: TupleReader): Update {
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
export function unpackTupleUpdate(slice: TupleReader): Update {
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
async function SerializationTester_init(a: bigint, b: bigint, c: bigint, d: bigint, e: bigint, f: bigint, g: bigint, h: bigint, i: bigint) {
    const __code = 'te6ccgECGgEABJEAART/APSkE/S88sgLAQIBYgIDAfjQcCHXScIflTAg1wsf3gLQ0wMBcbDAAZF/kXDiAfpAIlBmbwT4YQKRW+CCEJ+JME66jsTtRNDUAfhigQEB1wCBAQHXAIEBAdcA1AHQgQEB1wCBAQHXAIEBAdcA1DDQgQEB1wCBAQHXAIEBAdcAMBBpEGgQZ2wZCeAw8sCCBAIBIAYHAdTTHwGCEJ+JME668uCBgQEB1wCBAQHXAIEBAdcA1AHQgQEB1wCBAQHXAIEBAdcA1DDQgQEB1wCBAQHXAIEBAdcAMBBpEGgQZzkREBERERAPERAPEO8Q3hDNELwQqxCaVQcyODg5OTk5OTkBBQCQyPhCAcxVgFCJgQEBzwAWgQEBzwAUgQEBzwACyIEBAc8AgQEBzwASgQEBzwACyIEBAc8AE4EBAc8AE4EBAc8AyVjMyQHMye1UAgFuCAkCASAMDQIDlVAKCwCRsU17UTQ1AH4YoEBAdcAgQEB1wCBAQHXANQB0IEBAdcAgQEB1wCBAQHXANQw0IEBAdcAgQEB1wCBAQHXADAQaRBoEGdsGRhfCIACNsp2omhqAPwxQICA64BAgIDrgECAgOuAagDoQICA64BAgIDrgECAgOuAahhoQICA64BAgIDrgECAgOuAGAg0iDQIM7YMtkDAAibLhORmBKhEwICA54ALQICA54AKQICA54ABZECAgOeAQICA54AJQICA54ABZECAgOeACcCAgOeACcCAgOeAZKxmZIDmZMAIBIA4PAgEgFhcCASAQEQIBIBITAJOxNrtRNDUAfhigQEB1wCBAQHXAIEBAdcA1AHQgQEB1wCBAQHXAIEBAdcA1DDQgQEB1wCBAQHXAIEBAdcAMBBpEGgQZ2wZEChfCIACTsT77UTQ1AH4YoEBAdcAgQEB1wCBAQHXANQB0IEBAdcAgQEB1wCBAQHXANQw0IEBAdcAgQEB1wCBAQHXADAQaRBoEGdsGRA4XwiAAk7EmO1E0NQB+GKBAQHXAIEBAdcAgQEB1wDUAdCBAQHXAIEBAdcAgQEB1wDUMNCBAQHXAIEBAdcAgQEB1wAwEGkQaBBnbBkQSF8IgAgEgFBUAk65c9qJoagD8MUCAgOuAQICA64BAgIDrgGoA6ECAgOuAQICA64BAgIDrgGoYaECAgOuAQICA64BAgIDrgBgINIg0CDO2DIgsL4RAAE2t6ME4LnYerpZXPY9CdhzrJUKNs0E4TusalpWyPlmRadeW/vixHMACASAYGQCPtIOdqJoagD8MUCAgOuAQICA64BAgIDrgGoA6ECAgOuAQICA64BAgIDrgGoYaECAgOuAQICA64BAgIDrgBgINIg0CDO2DK+EQAJOxF7tRNDUAfhigQEB1wCBAQHXAIEBAdcA1AHQgQEB1wCBAQHXAIEBAdcA1DDQgQEB1wCBAQHXAIEBAdcAMBBpEGgQZ2wZEGhfCIACTsR/7UTQ1AH4YoEBAdcAgQEB1wCBAQHXANQB0IEBAdcAgQEB1wCBAQHXANQw0IEBAdcAgQEB1wCBAQHXADAQaRBoEGdsGRB4XwiA=';
    const depends = Dictionary.empty(Dictionary.Keys.Uint(16), Dictionary.Values.Cell());
    let systemCell = beginCell().storeDict(depends).endCell();
    let __stack: TupleItem[] = [];
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
    let system = await ContractSystem.create();
    let executor = await ContractExecutor.create({ code: codeCell, data: new Cell() }, system);
    let res = await executor.get('init_SerializationTester', __stack);
    if (!res.success) { throw Error(res.error); }
    let data = res.stack.readCell();
    return { code: codeCell, data };
}

const SerializationTester_errors: { [key: number]: { message: string } } = {
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

export class SerializationTester implements Contract {
    
    static async init(a: bigint, b: bigint, c: bigint, d: bigint, e: bigint, f: bigint, g: bigint, h: bigint, i: bigint) {
        return await SerializationTester_init(a,b,c,d,e,f,g,h,i);
    }
    
    static async fromInit(a: bigint, b: bigint, c: bigint, d: bigint, e: bigint, f: bigint, g: bigint, h: bigint, i: bigint) {
        const init = await SerializationTester_init(a,b,c,d,e,f,g,h,i);
        const address = contractAddress(0, init);
        return new SerializationTester(address, init);
    }
    
    static fromAddress(address: Address) {
        return new SerializationTester(address);
    }
    
    readonly address: Address; 
    readonly init?: { code: Cell, data: Cell };
    readonly abi: ContractABI = {
        errors: SerializationTester_errors
    };
    
    private constructor(address: Address, init?: { code: Cell, data: Cell }) {
        this.address = address;
        this.init = init;
    }
    
    async send(provider: ContractProvider, via: Sender, args: { value: bigint, bounce?: boolean| null | undefined }, message: Update) {
        
        let body: Cell | null = null;
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'Update') {
            body = beginCell().store(storeUpdate(message)).endCell();
        }
        if (body === null) { throw new Error('Invalid message type'); }
        
        await provider.internal(via, { ...args, body: body });
        
    }
    
    async getGetA(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('getA', __stack);
        return result.stack.readBigNumber();
    }
    
    async getGetB(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('getB', __stack);
        return result.stack.readBigNumber();
    }
    
    async getGetC(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('getC', __stack);
        return result.stack.readBigNumber();
    }
    
    async getGetD(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('getD', __stack);
        return result.stack.readBigNumber();
    }
    
    async getGetE(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('getE', __stack);
        return result.stack.readBigNumber();
    }
    
    async getGetF(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('getF', __stack);
        return result.stack.readBigNumber();
    }
    
    async getGetG(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('getG', __stack);
        return result.stack.readBigNumber();
    }
    
    async getGetH(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('getH', __stack);
        return result.stack.readBigNumber();
    }
    
    async getGetI(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('getI', __stack);
        return result.stack.readBigNumber();
    }
    
}