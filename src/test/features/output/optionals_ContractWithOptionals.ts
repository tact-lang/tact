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
        b_0.storeRef(src.code);
        b_0.storeRef(src.data);
    };
}

export function loadStateInit(slice: Slice) {
    let sc_0 = slice;
    let _code = sc_0.loadRef();
    let _data = sc_0.loadRef();
    return { $$type: 'StateInit' as const, code: _code, data: _data };
}

function loadTupleStateInit(source: TupleReader) {
    const _code = source.readCell();
    const _data = source.readCell();
    return { $$type: 'StateInit' as const, code: _code, data: _data };
}

function storeTupleStateInit(source: StateInit) {
    let __tuple: TupleItem[] = [];
    __tuple.push({ type: 'cell', cell: source.code });
    __tuple.push({ type: 'cell', cell: source.data });
    return __tuple;
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
        b_0.storeBit(src.bounced);
        b_0.storeAddress(src.sender);
        b_0.storeInt(src.value, 257);
        b_0.storeRef(src.raw);
    };
}

export function loadContext(slice: Slice) {
    let sc_0 = slice;
    let _bounced = sc_0.loadBit();
    let _sender = sc_0.loadAddress();
    let _value = sc_0.loadIntBig(257);
    let _raw = sc_0.loadRef();
    return { $$type: 'Context' as const, bounced: _bounced, sender: _sender, value: _value, raw: _raw };
}

function loadTupleContext(source: TupleReader) {
    const _bounced = source.readBoolean();
    const _sender = source.readAddress();
    const _value = source.readBigNumber();
    const _raw = source.readCell();
    return { $$type: 'Context' as const, bounced: _bounced, sender: _sender, value: _value, raw: _raw };
}

function storeTupleContext(source: Context) {
    let __tuple: TupleItem[] = [];
    __tuple.push({ type: 'int', value: source.bounced ? -1n : 0n });
    __tuple.push({ type: 'slice', cell: beginCell().storeAddress(source.sender).endCell() });
    __tuple.push({ type: 'int', value: source.value });
    __tuple.push({ type: 'slice', cell: source.raw });
    return __tuple;
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
        b_0.storeBit(src.bounce);
        b_0.storeAddress(src.to);
        b_0.storeInt(src.value, 257);
        b_0.storeInt(src.mode, 257);
        if (src.body !== null) {
            b_0.storeBit(true);
            b_0.storeRef(src.body);
        } else {
            b_0.storeBit(false);
        }
        if (src.code !== null) {
            b_0.storeBit(true);
            b_0.storeRef(src.code);
        } else {
            b_0.storeBit(false);
        }
        if (src.data !== null) {
            b_0.storeBit(true);
            b_0.storeRef(src.data);
        } else {
            b_0.storeBit(false);
        }
    };
}

export function loadSendParameters(slice: Slice) {
    let sc_0 = slice;
    let _bounce = sc_0.loadBit();
    let _to = sc_0.loadAddress();
    let _value = sc_0.loadIntBig(257);
    let _mode = sc_0.loadIntBig(257);
    let _body: Cell | null = null;
    if (sc_0.loadBit()) {
        _body = sc_0.loadRef();
    }
    let _code: Cell | null = null;
    if (sc_0.loadBit()) {
        _code = sc_0.loadRef();
    }
    let _data: Cell | null = null;
    if (sc_0.loadBit()) {
        _data = sc_0.loadRef();
    }
    return { $$type: 'SendParameters' as const, bounce: _bounce, to: _to, value: _value, mode: _mode, body: _body, code: _code, data: _data };
}

function loadTupleSendParameters(source: TupleReader) {
    const _bounce = source.readBoolean();
    const _to = source.readAddress();
    const _value = source.readBigNumber();
    const _mode = source.readBigNumber();
    const _body = source.readCellOpt();
    const _code = source.readCellOpt();
    const _data = source.readCellOpt();
    return { $$type: 'SendParameters' as const, bounce: _bounce, to: _to, value: _value, mode: _mode, body: _body, code: _code, data: _data };
}

function storeTupleSendParameters(source: SendParameters) {
    let __tuple: TupleItem[] = [];
    __tuple.push({ type: 'int', value: source.bounce ? -1n : 0n });
    __tuple.push({ type: 'slice', cell: beginCell().storeAddress(source.to).endCell() });
    __tuple.push({ type: 'int', value: source.value });
    __tuple.push({ type: 'int', value: source.mode });
    if (source.body !== null) {
        __tuple.push({ type: 'cell', cell: source.body });
    } else {
        __tuple.push({ type: 'null' });
    }
    if (source.code !== null) {
        __tuple.push({ type: 'cell', cell: source.code });
    } else {
        __tuple.push({ type: 'null' });
    }
    if (source.data !== null) {
        __tuple.push({ type: 'cell', cell: source.data });
    } else {
        __tuple.push({ type: 'null' });
    }
    return __tuple;
}

export type SomeGenericStruct = {
    $$type: 'SomeGenericStruct';
    value1: bigint;
    value2: bigint;
    value3: bigint;
    value4: bigint;
    value5: bigint;
}

export function storeSomeGenericStruct(src: SomeGenericStruct) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeInt(src.value1, 257);
        b_0.storeInt(src.value2, 257);
        b_0.storeInt(src.value3, 257);
        let b_1 = new Builder();
        b_1.storeInt(src.value4, 257);
        b_1.storeInt(src.value5, 257);
        b_0.storeRef(b_1.endCell());
    };
}

export function loadSomeGenericStruct(slice: Slice) {
    let sc_0 = slice;
    let _value1 = sc_0.loadIntBig(257);
    let _value2 = sc_0.loadIntBig(257);
    let _value3 = sc_0.loadIntBig(257);
    let sc_1 = sc_0.loadRef().beginParse();
    let _value4 = sc_1.loadIntBig(257);
    let _value5 = sc_1.loadIntBig(257);
    return { $$type: 'SomeGenericStruct' as const, value1: _value1, value2: _value2, value3: _value3, value4: _value4, value5: _value5 };
}

function loadTupleSomeGenericStruct(source: TupleReader) {
    const _value1 = source.readBigNumber();
    const _value2 = source.readBigNumber();
    const _value3 = source.readBigNumber();
    const _value4 = source.readBigNumber();
    const _value5 = source.readBigNumber();
    return { $$type: 'SomeGenericStruct' as const, value1: _value1, value2: _value2, value3: _value3, value4: _value4, value5: _value5 };
}

function storeTupleSomeGenericStruct(source: SomeGenericStruct) {
    let __tuple: TupleItem[] = [];
    __tuple.push({ type: 'int', value: source.value1 });
    __tuple.push({ type: 'int', value: source.value2 });
    __tuple.push({ type: 'int', value: source.value3 });
    __tuple.push({ type: 'int', value: source.value4 });
    __tuple.push({ type: 'int', value: source.value5 });
    return __tuple;
}

export type StructWithOptionals = {
    $$type: 'StructWithOptionals';
    a: bigint | null;
    b: boolean | null;
    c: Cell | null;
    d: Address | null;
    e: SomeGenericStruct | null;
}

export function storeStructWithOptionals(src: StructWithOptionals) {
    return (builder: Builder) => {
        let b_0 = builder;
        if (src.a !== null) {
            b_0.storeBit(true);
            b_0.storeInt(src.a, 257);
        } else {
            b_0.storeBit(false);
        }
        if (src.b !== null) {
            b_0.storeBit(true);
            b_0.storeBit(src.b);
        } else {
            b_0.storeBit(false);
        }
        if (src.c !== null) {
            b_0.storeBit(true);
            b_0.storeRef(src.c);
        } else {
            b_0.storeBit(false);
        }
        b_0.storeAddress(src.d);
        let b_1 = new Builder();
        if (src.e !== null) {
            b_1.storeBit(true);
            b_1.store(storeSomeGenericStruct(src.e));
        } else {
            b_1.storeBit(false);
        }
        b_0.storeRef(b_1.endCell());
    };
}

export function loadStructWithOptionals(slice: Slice) {
    let sc_0 = slice;
    let _a: bigint | null = null;
    if (sc_0.loadBit()) {
        _a = sc_0.loadIntBig(257);
    }
    let _b: boolean | null = null;
    if (sc_0.loadBit()) {
        _b = sc_0.loadBit();
    }
    let _c: Cell | null = null;
    if (sc_0.loadBit()) {
        _c = sc_0.loadRef();
    }
    let _d = sc_0.loadMaybeAddress();
    let sc_1 = sc_0.loadRef().beginParse();
    let _e: SomeGenericStruct | null = null;
    if (sc_1.loadBit()) {
        _e = loadSomeGenericStruct(sc_1);
    }
    return { $$type: 'StructWithOptionals' as const, a: _a, b: _b, c: _c, d: _d, e: _e };
}

function loadTupleStructWithOptionals(source: TupleReader) {
    const _a = source.readBigNumberOpt();
    const _b = source.readBooleanOpt();
    const _c = source.readCellOpt();
    const _d = source.readAddressOpt();
    const _e_p = source.readTupleOpt();
    const _e = _e_p ? loadTupleSomeGenericStruct(_e_p) : null;
    return { $$type: 'StructWithOptionals' as const, a: _a, b: _b, c: _c, d: _d, e: _e };
}

function storeTupleStructWithOptionals(source: StructWithOptionals) {
    let __tuple: TupleItem[] = [];
    if (source.a !== null) {
        __tuple.push({ type: 'int', value: source.a });
    } else {
        __tuple.push({ type: 'null' });
    }
    if (source.b !== null) {
        __tuple.push({ type: 'int', value: source.b ? -1n : 0n });
    } else {
        __tuple.push({ type: 'null' });
    }
    if (source.c !== null) {
        __tuple.push({ type: 'cell', cell: source.c });
    } else {
        __tuple.push({ type: 'null' });
    }
    if (source.d !== null) {
        __tuple.push({ type: 'slice', cell: beginCell().storeAddress(source.d).endCell() });
    } else {
        __tuple.push({ type: 'null' });
    }
    if (source.e !== null) {
        __tuple.push({ type: 'tuple', items: storeTupleSomeGenericStruct(source.e) });
    } else {
        __tuple.push({ type: 'null' });
    }
    return __tuple;
}

export type Update = {
    $$type: 'Update';
    a: bigint | null;
    b: boolean | null;
    c: Cell | null;
    d: Address | null;
    e: SomeGenericStruct | null;
    f: StructWithOptionals | null;
}

export function storeUpdate(src: Update) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(2676568142, 32);
        if (src.a !== null) {
            b_0.storeBit(true);
            b_0.storeInt(src.a, 257);
        } else {
            b_0.storeBit(false);
        }
        if (src.b !== null) {
            b_0.storeBit(true);
            b_0.storeBit(src.b);
        } else {
            b_0.storeBit(false);
        }
        if (src.c !== null) {
            b_0.storeBit(true);
            b_0.storeRef(src.c);
        } else {
            b_0.storeBit(false);
        }
        b_0.storeAddress(src.d);
        let b_1 = new Builder();
        if (src.e !== null) {
            b_1.storeBit(true);
            b_1.store(storeSomeGenericStruct(src.e));
        } else {
            b_1.storeBit(false);
        }
        let b_2 = new Builder();
        if (src.f !== null) {
            b_2.storeBit(true);
            b_2.store(storeStructWithOptionals(src.f));
        } else {
            b_2.storeBit(false);
        }
        b_1.storeRef(b_2.endCell());
        b_0.storeRef(b_1.endCell());
    };
}

export function loadUpdate(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 2676568142) { throw Error('Invalid prefix'); }
    let _a: bigint | null = null;
    if (sc_0.loadBit()) {
        _a = sc_0.loadIntBig(257);
    }
    let _b: boolean | null = null;
    if (sc_0.loadBit()) {
        _b = sc_0.loadBit();
    }
    let _c: Cell | null = null;
    if (sc_0.loadBit()) {
        _c = sc_0.loadRef();
    }
    let _d = sc_0.loadMaybeAddress();
    let sc_1 = sc_0.loadRef().beginParse();
    let _e: SomeGenericStruct | null = null;
    if (sc_1.loadBit()) {
        _e = loadSomeGenericStruct(sc_1);
    }
    let sc_2 = sc_1.loadRef().beginParse();
    let _f: StructWithOptionals | null = null;
    if (sc_2.loadBit()) {
        _f = loadStructWithOptionals(sc_2);
    }
    return { $$type: 'Update' as const, a: _a, b: _b, c: _c, d: _d, e: _e, f: _f };
}

function loadTupleUpdate(source: TupleReader) {
    const _a = source.readBigNumberOpt();
    const _b = source.readBooleanOpt();
    const _c = source.readCellOpt();
    const _d = source.readAddressOpt();
    const _e_p = source.readTupleOpt();
    const _e = _e_p ? loadTupleSomeGenericStruct(_e_p) : null;
    const _f_p = source.readTupleOpt();
    const _f = _f_p ? loadTupleStructWithOptionals(_f_p) : null;
    return { $$type: 'Update' as const, a: _a, b: _b, c: _c, d: _d, e: _e, f: _f };
}

function storeTupleUpdate(source: Update) {
    let __tuple: TupleItem[] = [];
    if (source.a !== null) {
        __tuple.push({ type: 'int', value: source.a });
    } else {
        __tuple.push({ type: 'null' });
    }
    if (source.b !== null) {
        __tuple.push({ type: 'int', value: source.b ? -1n : 0n });
    } else {
        __tuple.push({ type: 'null' });
    }
    if (source.c !== null) {
        __tuple.push({ type: 'cell', cell: source.c });
    } else {
        __tuple.push({ type: 'null' });
    }
    if (source.d !== null) {
        __tuple.push({ type: 'slice', cell: beginCell().storeAddress(source.d).endCell() });
    } else {
        __tuple.push({ type: 'null' });
    }
    if (source.e !== null) {
        __tuple.push({ type: 'tuple', items: storeTupleSomeGenericStruct(source.e) });
    } else {
        __tuple.push({ type: 'null' });
    }
    if (source.f !== null) {
        __tuple.push({ type: 'tuple', items: storeTupleStructWithOptionals(source.f) });
    } else {
        __tuple.push({ type: 'null' });
    }
    return __tuple;
}

async function ContractWithOptionals_init(a: bigint | null, b: boolean | null, c: Cell | null, d: Address | null, e: SomeGenericStruct | null, f: StructWithOptionals | null) {
    const __init = 'te6ccgECEgEAAZsAART/APSkE/S88sgLAQIBYgIDAgLMBAUAFaFK3APgFgPgHeAfAAHcAgEgBgcCAVgICQIBIAoLAAUbyWAAFQgbpIwbeDwCm8FgAAlW8l8AuAIBIAwNABUIG6SMG3g8A1vBYALxAbIzAYlbpY1cFAGygCdf1AHygAVgQEBzwAQReIjbpYzcFADygCXfwHKABPKAOIhbpRwMsoAlX8BygDM4gEgbpUwcAHLAZLPFuLII26WM3BQA8oA4w7IIm6VMnBYygCOkH8BygACIG7y0IBvJRBW2zziyQHMyQHMyYA4PAGB/AcoAAyBu8tCAbyUQV1BFgQEBzwASgQEBzwCBAQHPAAHIgQEBzwASgQEBzwDJAcwC9iRuljRwUAXKAJ1/UAbKABSBAQHPABA04iJulTJwWMoAl38BygASygDiIW6UcDLKAJV/AcoAzOJYIG6VMHABywGSzxbiyCJujjB/AcoAAiBu8tCAbyUQVlBFgQEBzwASgQEBzwCBAQHPAAHIgQEBzwASgQEBzwDJAczjDRARAAoycFjKAAAGyQHM';
    const __code = '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';
    const __system = 'te6cckEBAQEAAwAAAUD20kA0';
    let systemCell = Cell.fromBase64(__system);
    let __tuple: TupleItem[] = [];
    __tuple.push({ type: 'cell', cell: systemCell });
    if (a !== null) {
        __tuple.push({ type: 'int', value: a });
    } else {
        __tuple.push({ type: 'null' });
    }
    if (b !== null) {
        __tuple.push({ type: 'int', value: b ? -1n : 0n });
    } else {
        __tuple.push({ type: 'null' });
    }
    if (c !== null) {
        __tuple.push({ type: 'cell', cell: c });
    } else {
        __tuple.push({ type: 'null' });
    }
    if (d !== null) {
        __tuple.push({ type: 'slice', cell: beginCell().storeAddress(d).endCell() });
    } else {
        __tuple.push({ type: 'null' });
    }
    if (e !== null) {
        __tuple.push({ type: 'tuple', items: storeTupleSomeGenericStruct(e) });
    } else {
        __tuple.push({ type: 'null' });
    }
    if (f !== null) {
        __tuple.push({ type: 'tuple', items: storeTupleStructWithOptionals(f) });
    } else {
        __tuple.push({ type: 'null' });
    }
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let initCell = Cell.fromBoc(Buffer.from(__init, 'base64'))[0];
    let system = await ContractSystem.create();
    let executor = await ContractExecutor.create({ code: initCell, data: new Cell() }, system);
    let res = await executor.get('init', __tuple);
    if (!res.success) { throw Error(res.error); }
    if (res.exitCode !== 0 && res.exitCode !== 1) {
        if (ContractWithOptionals_errors[res.exitCode]) {
            throw new ComputeError(ContractWithOptionals_errors[res.exitCode].message, res.exitCode, { logs: res.vmLogs });
        } else {
            throw new ComputeError('Exit code: ' + res.exitCode, res.exitCode, { logs: res.vmLogs });
        }
    }
    
    let data = res.stack.readCell();
    return { code: codeCell, data };
}

const ContractWithOptionals_errors: { [key: number]: { message: string } } = {
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

export class ContractWithOptionals implements Contract {
    
    static async init(a: bigint | null, b: boolean | null, c: Cell | null, d: Address | null, e: SomeGenericStruct | null, f: StructWithOptionals | null) {
        return await ContractWithOptionals_init(a,b,c,d,e,f);
    }
    
    static async fromInit(a: bigint | null, b: boolean | null, c: Cell | null, d: Address | null, e: SomeGenericStruct | null, f: StructWithOptionals | null) {
        const init = await ContractWithOptionals_init(a,b,c,d,e,f);
        const address = contractAddress(0, init);
        return new ContractWithOptionals(address, init);
    }
    
    static fromAddress(address: Address) {
        return new ContractWithOptionals(address);
    }
    
    readonly address: Address; 
    readonly init?: { code: Cell, data: Cell };
    readonly abi: ContractABI = {
        errors: ContractWithOptionals_errors
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
    
    async getIsNotNullA(provider: ContractProvider) {
        let __tuple: TupleItem[] = [];
        let result = await provider.get('isNotNullA', __tuple);
        return result.stack.readBoolean();
    }
    
    async getIsNotNullB(provider: ContractProvider) {
        let __tuple: TupleItem[] = [];
        let result = await provider.get('isNotNullB', __tuple);
        return result.stack.readBoolean();
    }
    
    async getIsNotNullC(provider: ContractProvider) {
        let __tuple: TupleItem[] = [];
        let result = await provider.get('isNotNullC', __tuple);
        return result.stack.readBoolean();
    }
    
    async getIsNotNullD(provider: ContractProvider) {
        let __tuple: TupleItem[] = [];
        let result = await provider.get('isNotNullD', __tuple);
        return result.stack.readBoolean();
    }
    
    async getIsNotNullE(provider: ContractProvider) {
        let __tuple: TupleItem[] = [];
        let result = await provider.get('isNotNullE', __tuple);
        return result.stack.readBoolean();
    }
    
    async getIsNotNullF(provider: ContractProvider) {
        let __tuple: TupleItem[] = [];
        let result = await provider.get('isNotNullF', __tuple);
        return result.stack.readBoolean();
    }
    
    async getNullA(provider: ContractProvider) {
        let __tuple: TupleItem[] = [];
        let result = await provider.get('nullA', __tuple);
        return result.stack.readBigNumberOpt();
    }
    
    async getNullB(provider: ContractProvider) {
        let __tuple: TupleItem[] = [];
        let result = await provider.get('nullB', __tuple);
        return result.stack.readBooleanOpt();
    }
    
    async getNullC(provider: ContractProvider) {
        let __tuple: TupleItem[] = [];
        let result = await provider.get('nullC', __tuple);
        return result.stack.readCellOpt();
    }
    
    async getNullD(provider: ContractProvider) {
        let __tuple: TupleItem[] = [];
        let result = await provider.get('nullD', __tuple);
        return result.stack.readAddressOpt();
    }
    
    async getNullE(provider: ContractProvider) {
        let __tuple: TupleItem[] = [];
        let result = await provider.get('nullE', __tuple);
        let pp = result.stack.readTupleOpt();
        if (!pp) { return null; }
        return loadTupleSomeGenericStruct(pp);
    }
    
    async getNullF(provider: ContractProvider) {
        let __tuple: TupleItem[] = [];
        let result = await provider.get('nullF', __tuple);
        let pp = result.stack.readTupleOpt();
        if (!pp) { return null; }
        return loadTupleStructWithOptionals(pp);
    }
    
    async getNotNullA(provider: ContractProvider) {
        let __tuple: TupleItem[] = [];
        let result = await provider.get('notNullA', __tuple);
        return result.stack.readBigNumber();
    }
    
    async getNotNullB(provider: ContractProvider) {
        let __tuple: TupleItem[] = [];
        let result = await provider.get('notNullB', __tuple);
        return result.stack.readBoolean();
    }
    
    async getNotNullC(provider: ContractProvider) {
        let __tuple: TupleItem[] = [];
        let result = await provider.get('notNullC', __tuple);
        return result.stack.readCell();
    }
    
    async getNotNullD(provider: ContractProvider) {
        let __tuple: TupleItem[] = [];
        let result = await provider.get('notNullD', __tuple);
        return result.stack.readAddress();
    }
    
    async getNotNullE(provider: ContractProvider) {
        let __tuple: TupleItem[] = [];
        let result = await provider.get('notNullE', __tuple);
        return loadTupleSomeGenericStruct(result.stack);
    }
    
    async getNotNullF(provider: ContractProvider) {
        let __tuple: TupleItem[] = [];
        let result = await provider.get('notNullF', __tuple);
        return loadTupleStructWithOptionals(result.stack);
    }
    
    async getTestVariables(provider: ContractProvider) {
        let __tuple: TupleItem[] = [];
        let result = await provider.get('testVariables', __tuple);
        return loadTupleSomeGenericStruct(result.stack);
    }
    
}