import { 
    Cell,
    Slice, 
    Address, 
    Builder, 
    beginCell, 
    ComputeError, 
    TupleItem, 
    TupleReader, 
    Dictionary, 
    contractAddress, 
    ContractProvider, 
    Sender, 
    Contract, 
    ContractABI, 
    ABIType,
    ABIGetter,
    ABIReceiver,
    TupleBuilder,
    DictionaryValue
} from '@ton/core';

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
    let _code = source.readCell();
    let _data = source.readCell();
    return { $$type: 'StateInit' as const, code: _code, data: _data };
}

function storeTupleStateInit(source: StateInit) {
    let builder = new TupleBuilder();
    builder.writeCell(source.code);
    builder.writeCell(source.data);
    return builder.build();
}

function dictValueParserStateInit(): DictionaryValue<StateInit> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeStateInit(src)).endCell());
        },
        parse: (src) => {
            return loadStateInit(src.loadRef().beginParse());
        }
    }
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
    let _bounced = source.readBoolean();
    let _sender = source.readAddress();
    let _value = source.readBigNumber();
    let _raw = source.readCell();
    return { $$type: 'Context' as const, bounced: _bounced, sender: _sender, value: _value, raw: _raw };
}

function storeTupleContext(source: Context) {
    let builder = new TupleBuilder();
    builder.writeBoolean(source.bounced);
    builder.writeAddress(source.sender);
    builder.writeNumber(source.value);
    builder.writeSlice(source.raw);
    return builder.build();
}

function dictValueParserContext(): DictionaryValue<Context> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeContext(src)).endCell());
        },
        parse: (src) => {
            return loadContext(src.loadRef().beginParse());
        }
    }
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
        if (src.body !== null && src.body !== undefined) { b_0.storeBit(true).storeRef(src.body); } else { b_0.storeBit(false); }
        if (src.code !== null && src.code !== undefined) { b_0.storeBit(true).storeRef(src.code); } else { b_0.storeBit(false); }
        if (src.data !== null && src.data !== undefined) { b_0.storeBit(true).storeRef(src.data); } else { b_0.storeBit(false); }
    };
}

export function loadSendParameters(slice: Slice) {
    let sc_0 = slice;
    let _bounce = sc_0.loadBit();
    let _to = sc_0.loadAddress();
    let _value = sc_0.loadIntBig(257);
    let _mode = sc_0.loadIntBig(257);
    let _body = sc_0.loadBit() ? sc_0.loadRef() : null;
    let _code = sc_0.loadBit() ? sc_0.loadRef() : null;
    let _data = sc_0.loadBit() ? sc_0.loadRef() : null;
    return { $$type: 'SendParameters' as const, bounce: _bounce, to: _to, value: _value, mode: _mode, body: _body, code: _code, data: _data };
}

function loadTupleSendParameters(source: TupleReader) {
    let _bounce = source.readBoolean();
    let _to = source.readAddress();
    let _value = source.readBigNumber();
    let _mode = source.readBigNumber();
    let _body = source.readCellOpt();
    let _code = source.readCellOpt();
    let _data = source.readCellOpt();
    return { $$type: 'SendParameters' as const, bounce: _bounce, to: _to, value: _value, mode: _mode, body: _body, code: _code, data: _data };
}

function storeTupleSendParameters(source: SendParameters) {
    let builder = new TupleBuilder();
    builder.writeBoolean(source.bounce);
    builder.writeAddress(source.to);
    builder.writeNumber(source.value);
    builder.writeNumber(source.mode);
    builder.writeCell(source.body);
    builder.writeCell(source.code);
    builder.writeCell(source.data);
    return builder.build();
}

function dictValueParserSendParameters(): DictionaryValue<SendParameters> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeSendParameters(src)).endCell());
        },
        parse: (src) => {
            return loadSendParameters(src.loadRef().beginParse());
        }
    }
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
        b_0.storeUint(849061239, 32);
        b_0.storeInt(src.a, 257);
        b_0.storeInt(src.b, 257);
        b_0.storeInt(src.c, 257);
        let b_1 = new Builder();
        b_1.storeInt(src.d, 257);
        b_1.storeInt(src.e, 257);
        b_1.storeInt(src.f, 257);
        let b_2 = new Builder();
        b_2.storeInt(src.g, 257);
        b_2.storeInt(src.h, 257);
        b_2.storeInt(src.i, 257);
        b_1.storeRef(b_2.endCell());
        b_0.storeRef(b_1.endCell());
    };
}

export function loadUpdate(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 849061239) { throw Error('Invalid prefix'); }
    let _a = sc_0.loadIntBig(257);
    let _b = sc_0.loadIntBig(257);
    let _c = sc_0.loadIntBig(257);
    let sc_1 = sc_0.loadRef().beginParse();
    let _d = sc_1.loadIntBig(257);
    let _e = sc_1.loadIntBig(257);
    let _f = sc_1.loadIntBig(257);
    let sc_2 = sc_1.loadRef().beginParse();
    let _g = sc_2.loadIntBig(257);
    let _h = sc_2.loadIntBig(257);
    let _i = sc_2.loadIntBig(257);
    return { $$type: 'Update' as const, a: _a, b: _b, c: _c, d: _d, e: _e, f: _f, g: _g, h: _h, i: _i };
}

function loadTupleUpdate(source: TupleReader) {
    let _a = source.readBigNumber();
    let _b = source.readBigNumber();
    let _c = source.readBigNumber();
    let _d = source.readBigNumber();
    let _e = source.readBigNumber();
    let _f = source.readBigNumber();
    let _g = source.readBigNumber();
    let _h = source.readBigNumber();
    let _i = source.readBigNumber();
    return { $$type: 'Update' as const, a: _a, b: _b, c: _c, d: _d, e: _e, f: _f, g: _g, h: _h, i: _i };
}

function storeTupleUpdate(source: Update) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.a);
    builder.writeNumber(source.b);
    builder.writeNumber(source.c);
    builder.writeNumber(source.d);
    builder.writeNumber(source.e);
    builder.writeNumber(source.f);
    builder.writeNumber(source.g);
    builder.writeNumber(source.h);
    builder.writeNumber(source.i);
    return builder.build();
}

function dictValueParserUpdate(): DictionaryValue<Update> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeUpdate(src)).endCell());
        },
        parse: (src) => {
            return loadUpdate(src.loadRef().beginParse());
        }
    }
}

 type SerializationTester_init_args = {
    $$type: 'SerializationTester_init_args';
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

function initSerializationTester_init_args(src: SerializationTester_init_args) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeInt(src.a, 257);
        b_0.storeInt(src.b, 257);
        b_0.storeInt(src.c, 257);
        let b_1 = new Builder();
        b_1.storeInt(src.d, 257);
        b_1.storeInt(src.e, 257);
        b_1.storeInt(src.f, 257);
        let b_2 = new Builder();
        b_2.storeInt(src.g, 257);
        b_2.storeInt(src.h, 257);
        b_2.storeInt(src.i, 257);
        b_1.storeRef(b_2.endCell());
        b_0.storeRef(b_1.endCell());
    };
}

async function SerializationTester_init(a: bigint, b: bigint, c: bigint, d: bigint, e: bigint, f: bigint, g: bigint, h: bigint, i: bigint) {
    const __code = Cell.fromBase64('te6ccgECKAEAAy0AART/APSkE/S88sgLAQIBYgIDA3rQAdDTAwFxsKMB+kABINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiFRQUwNvBPhhAvhi2zxVGNs88uCCJQQFAgEgBwgBdAGSMH/gcCHXScIflTAg1wsf3iDAACLXScEhsJJbf+CCEDKbpXe6jo/bPGwZMjg4OTk5OTk5AX/gMHAGAJjI+EMBzH8BygBVgFCJgQEBzwAWgQEBzwAUgQEBzwACyIEBAc8AgQEBzwASgQEBzwACyIEBAc8AE4EBAc8AE4EBAc8AyVjMyQHMye1UAI7THwGCEDKbpXe68uCBgQEB1wCBAQHXAIEBAdcA1AHQgQEB1wCBAQHXAIEBAdcA1DDQgQEB1wCBAQHXAIEBAdcAMBBpEGgQZwIBbgkKAgEgDQ4CEbFFNs82zxskYCULAhGxTXbPNs8bJGAlDAACIAACIQIBIA8QAgEgGxwCASAREgIBIBUWAhGxNrbPNs8bJGAlEwIRsT72zzbPGyRgJRQAAiIAAiMCEbEmNs82zxskYCUXAgEgGBkAAiQCEa5c7Z5tnjZIwCUaALmt6ME4LnYerpZXPY9CdhzrJUKNs0E4TusalpWyPlmRadeW/vixHME4ECrgDcAzscpnLB1XI5LZYcE4DepO98qiy3jjqenvAqzhk0E4TsunLVmnZbmdB0s2yjN0UkAAAiUCASAdHgIRtIObZ5tnjZIwJSYCAUgfIAIBICIjABCqvu1E0NIAAQIQqF7bPNs8bJElIQACJgIRrj/tnm2eNkjAJSQAdazdxoatLgzOZ0Xl6i2sairprCjuDSzHLQxISwjODgovSq8mrOkN7IcHDWjPDU7Oim8sTwqPTW7qxnBAAAInAbTtRNDUAfhj0gABjjyBAQHXAIEBAdcAgQEB1wDUAdCBAQHXAIEBAdcAgQEB1wDUMNCBAQHXAIEBAdcAgQEB1wAwEGkQaBBnbBng+CjXCwqDCbry4InbPAnRVQcnAAIoAHSBAQHXAIEBAdcAgQEB1wDUAdCBAQHXAIEBAdcAgQEB1wDUMNCBAQHXAIEBAdcAgQEB1wAwEGkQaBBn');
    const __system = Cell.fromBase64('te6cckECKgEAAzcAAQHAAQEFoBg3AgEU/wD0pBP0vPLICwMCAWIkBAIBIB8FAgEgEgYCASAJBwIRtIObZ5tnjZIwKAgAAigCASAOCgIBIAwLAHWs3caGrS4MzmdF5eotrGoq6awo7g0sxy0MSEsIzg4KL0qvJqzpDeyHBw1ozw1OzopvLE8Kj01u6sZwQAIRrj/tnm2eNkjAKA0AAicCAUgRDwIQqF7bPNs8bJEoEAACJgAQqr7tRNDSAAECASAaEwIBIBgUAgEgFhUAua3owTgudh6ullc9j0J2HOslQo2zQThO6xqWlbI+WZFp15b++LEcwTgQKuANwDOxymcsHVcjktlhwTgN6k73yqLLeOOp6e8CrOGTQThOy6ctWadluZ0HSzbKM3RSQAIRrlztnm2eNkjAKBcAAiUCEbEmNs82zxskYCgZAAIkAgEgHRsCEbE+9s82zxskYCgcAAIjAhGxNrbPNs8bJGAoHgACIgIBbiIgAhGxTXbPNs8bJGAoIQACIQIRsUU2zzbPGyRgKCMAAiADetAB0NMDAXGwowH6QAEg10mBAQu68uCIINcLCiCBBP+68tCJgwm68uCIVFBTA28E+GEC+GLbPFUY2zzy4IIoJiUAmMj4QwHMfwHKAFWAUImBAQHPABaBAQHPABSBAQHPAALIgQEBzwCBAQHPABKBAQHPAALIgQEBzwATgQEBzwATgQEBzwDJWMzJAczJ7VQBdAGSMH/gcCHXScIflTAg1wsf3iDAACLXScEhsJJbf+CCEDKbpXe6jo/bPGwZMjg4OTk5OTk5AX/gMHAnAI7THwGCEDKbpXe68uCBgQEB1wCBAQHXAIEBAdcA1AHQgQEB1wCBAQHXAIEBAdcA1DDQgQEB1wCBAQHXAIEBAdcAMBBpEGgQZwG07UTQ1AH4Y9IAAY48gQEB1wCBAQHXAIEBAdcA1AHQgQEB1wCBAQHXAIEBAdcA1DDQgQEB1wCBAQHXAIEBAdcAMBBpEGgQZ2wZ4Pgo1wsKgwm68uCJ2zwJ0VUHKQB0gQEB1wCBAQHXAIEBAdcA1AHQgQEB1wCBAQHXAIEBAdcA1DDQgQEB1wCBAQHXAIEBAdcAMBBpEGgQZy+R5gE=');
    let builder = beginCell();
    builder.storeRef(__system);
    builder.storeUint(0, 1);
    initSerializationTester_init_args({ $$type: 'SerializationTester_init_args', a, b, c, d, e, f, g, h, i })(builder);
    const __data = builder.endCell();
    return { code: __code, data: __data };
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
    135: { message: `Code of a contract was not found` },
    136: { message: `Invalid address` },
    137: { message: `Masterchain support is not enabled for this contract` },
}

const SerializationTester_types: ABIType[] = [
    {"name":"StateInit","header":null,"fields":[{"name":"code","type":{"kind":"simple","type":"cell","optional":false}},{"name":"data","type":{"kind":"simple","type":"cell","optional":false}}]},
    {"name":"Context","header":null,"fields":[{"name":"bounced","type":{"kind":"simple","type":"bool","optional":false}},{"name":"sender","type":{"kind":"simple","type":"address","optional":false}},{"name":"value","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"raw","type":{"kind":"simple","type":"slice","optional":false}}]},
    {"name":"SendParameters","header":null,"fields":[{"name":"bounce","type":{"kind":"simple","type":"bool","optional":false}},{"name":"to","type":{"kind":"simple","type":"address","optional":false}},{"name":"value","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"mode","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"body","type":{"kind":"simple","type":"cell","optional":true}},{"name":"code","type":{"kind":"simple","type":"cell","optional":true}},{"name":"data","type":{"kind":"simple","type":"cell","optional":true}}]},
    {"name":"Update","header":849061239,"fields":[{"name":"a","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"b","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"c","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"d","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"e","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"f","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"g","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"h","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"i","type":{"kind":"simple","type":"int","optional":false,"format":257}}]},
]

const SerializationTester_getters: ABIGetter[] = [
    {"name":"getA","arguments":[],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
    {"name":"getB","arguments":[],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
    {"name":"getC","arguments":[],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
    {"name":"getD","arguments":[],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
    {"name":"getE","arguments":[],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
    {"name":"getF","arguments":[],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
    {"name":"getG","arguments":[],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
    {"name":"getH","arguments":[],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
    {"name":"getI","arguments":[],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
]

const SerializationTester_receivers: ABIReceiver[] = [
    {"receiver":"internal","message":{"kind":"empty"}},
    {"receiver":"internal","message":{"kind":"typed","type":"Update"}},
]

export class SerializationTester implements Contract {
    
    static async init(a: bigint, b: bigint, c: bigint, d: bigint, e: bigint, f: bigint, g: bigint, h: bigint, i: bigint) {
        return await SerializationTester_init(a, b, c, d, e, f, g, h, i);
    }
    
    static async fromInit(a: bigint, b: bigint, c: bigint, d: bigint, e: bigint, f: bigint, g: bigint, h: bigint, i: bigint) {
        const init = await SerializationTester_init(a, b, c, d, e, f, g, h, i);
        const address = contractAddress(0, init);
        return new SerializationTester(address, init);
    }
    
    static fromAddress(address: Address) {
        return new SerializationTester(address);
    }
    
    readonly address: Address; 
    readonly init?: { code: Cell, data: Cell };
    readonly abi: ContractABI = {
        types:  SerializationTester_types,
        getters: SerializationTester_getters,
        receivers: SerializationTester_receivers,
        errors: SerializationTester_errors,
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
        let builder = new TupleBuilder();
        let source = (await provider.get('getA', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getGetB(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getB', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getGetC(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getC', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getGetD(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getD', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getGetE(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getE', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getGetF(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getF', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getGetG(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getG', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getGetH(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getH', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getGetI(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getI', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
}