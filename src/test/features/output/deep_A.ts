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
    TupleBuilder,
    DictionaryValue
} from 'ton-core';

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

 type A_init_args = {
    $$type: 'A_init_args';
}

function initA_init_args(src: A_init_args) {
    return (builder: Builder) => {
        let b_0 = builder;
    };
}

async function A_init() {
    const __code = Cell.fromBase64('te6ccgECEAEAA30AART/APSkE/S88sgLAQIBYgIDAgLLBAUCASAMDQLX0AdDTAwFxsMABkX+RcOIB+kABINdJgQELuvLgiCDXCwoggwm6IYEE/7qx8uCIgwm68uCJVFBTA28E+GEC+GLtRNDUAfhj0gAwkW2Ojfgo1wsKgwm68uCJ2zziWds8MDDI+EMBzH8BygDJ7VSDgYA0aKA6HoCGDaQwLRDAMAIege30PlwQ4DAtEMRAUAIeguBQLxTgMAIege30PlwQ4lAvFOAgUAIegvkAOR6AGSA5jgA5QAsEGukwICF3XlwRBBrhYUQQYTdEMCCf91Y+XBEQYTdeXBE54tkwAPc7aLt+3Ah10nCH5UwINcLH94Cklt/4AHAAI/P+QGC8LQamTMwHB1yjmTiNoX+Opx1QKuTWe9zGJQ8DuXgkQ1duo+n+EP4KPAVXNs8cIBCf4t01lc3NhZ2WNs8XiNEMBIQNhA0Wds8f9sx4JEw4nAHCAkAjHBZyHABywFzAcsBcAHLABLMzMn5AMhyAcsBcAHLABLKB8v/ydAg10mBAQu68uCIINcLCiCDCbohgQT/urHy4IiDCbry4IkBQshwAcsfbwABb4xtb4wB2zxvIgHJkyFus5YBbyJZzMnoMQoBzshxAcoBUAcBygBwAcoCUAUg10mBAQu68uCIINcLCiCDCbohgQT/urHy4IiDCbry4InPFlAD+gJwAcpoI26zJW6zsZczMwFwAcoA4w0hbrOcfwHKAAEgbvLQgAHMlTFwAcoA4skB+wALALog10oh10mXIMIAIsIAsY5KA28igH8izzGrAqEFqwJRVbYIIMIAnCCqAhXXGFAzzxZAFN5ZbwJTQaHCAJnIAW8CUEShqgKOEjEzwgCZ1DDQINdKIddJknAg4uLoXwMAmH8BygDIcAHKAHABygAkbrOdfwHKAAQgbvLQgFAEzJY0A3ABygDiJG6znX8BygAEIG7y0IBQBMyWNANwAcoA4nABygACfwHKAALJWMwCQb0Lz2omhqAPwx6QAYSLbHRvwUa4WFQYTdeXBE7Z5xbZ5A4PALm93owTgudh6ullc9j0J2HOslQo2zQThO6xqWlbI+WZFp15b++LEcwTgQKuANwDOxymcsHVcjktlhwTgN6k73yqLLeOOp6e8CrOGTQThOy6ctWadluZ0HSzbKM3RSQAAm0ADjD4Q/go8BU=');
    const __system = Cell.fromBase64('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');
    let builder = beginCell();
    builder.storeRef(__system);
    builder.storeUint(0, 1);
    initA_init_args({ $$type: 'A_init_args' })(builder);
    const __data = builder.endCell();
    return { code: __code, data: __data };
}

const A_errors: { [key: number]: { message: string } } = {
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

export class A implements Contract {
    
    static async init() {
        return await A_init();
    }
    
    static async fromInit() {
        const init = await A_init();
        const address = contractAddress(0, init);
        return new A(address, init);
    }
    
    static fromAddress(address: Address) {
        return new A(address);
    }
    
    readonly address: Address; 
    readonly init?: { code: Cell, data: Cell };
    readonly abi: ContractABI = {
        errors: A_errors
    };
    
    private constructor(address: Address, init?: { code: Cell, data: Cell }) {
        this.address = address;
        this.init = init;
    }
    
    async send(provider: ContractProvider, via: Sender, args: { value: bigint, bounce?: boolean| null | undefined }, message: 'Message') {
        
        let body: Cell | null = null;
        if (message === 'Message') {
            body = beginCell().storeUint(0, 32).storeStringTail(message).endCell();
        }
        if (body === null) { throw new Error('Invalid message type'); }
        
        await provider.internal(via, { ...args, body: body });
        
    }
    
    async getGetNext(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getNext', builder.build())).stack;
        const result = loadTupleStateInit(source);
        return result;
    }
    
}