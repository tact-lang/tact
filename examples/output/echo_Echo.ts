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

export type EchoMessage = {
    $$type: 'EchoMessage';
}

export function storeEchoMessage(src: EchoMessage) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(2074217921, 32);
    };
}

export function loadEchoMessage(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 2074217921) { throw Error('Invalid prefix'); }
    return { $$type: 'EchoMessage' as const };
}

function loadTupleEchoMessage(source: TupleReader) {
    return { $$type: 'EchoMessage' as const };
}

function storeTupleEchoMessage(source: EchoMessage) {
    let builder = new TupleBuilder();
    return builder.build();
}

function dictValueParserEchoMessage(): DictionaryValue<EchoMessage> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeEchoMessage(src)).endCell());
        },
        parse: (src) => {
            return loadEchoMessage(src.loadRef().beginParse());
        }
    }
}

 type Echo_init_args = {
    $$type: 'Echo_init_args';
    a: bigint;
}

function initEcho_init_args(src: Echo_init_args) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeInt(src.a, 257);
    };
}

async function Echo_init(a: bigint) {
    const __code = Cell.fromBase64('te6ccgECFwEAA1AAART/APSkE/S88sgLAQIBYgIDApLQAdDTAwFxsKMB+kABINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiFRQUwNvBPhhAvhi2zxZ2zzy4IIwyPhDAcx/AcoAye1UEwQCAVgKCwTG7aLt+wGSMH/gcCHXScIflTAg1wsf3iCCEHuiDcG6jqUw0x8BghB7og3BuvLggW0xyAEwghB7og3BAcsfyfhCAX9t2zx/4MAAjxgg10nCH48QgCDXIds8+EIBf23bPH/bMeDeBwUHBgFCyHAByx9vAAFvjG1vjAHbPG8iAcmTIW6zlgFvIlnMyegxFgEayAHPFsn4QgF/bds8fwcBOm1tIm6zmVsgbvLQgG8iAZEy4hAkcAMEgEJQI9s8CAHKyHEBygFQBwHKAHABygJQBSDXSYEBC7ry4Igg1wsKIIEE/7ry0ImDCbry4IjPFlAD+gJwAcpoI26zkX+TJG6z4pczMwFwAcoA4w0hbrOcfwHKAAEgbvLQgAHMlTFwAcoA4skB+wAJAJh/AcoAyHABygBwAcoAJG6znX8BygAEIG7y0IBQBMyWNANwAcoA4iRus51/AcoABCBu8tCAUATMljQDcAHKAOJwAcoAAn8BygACyVjMAgEgDA0CAUgPEAIRt6fbZ4A7Z4YwEw4Albd6ME4LnYerpZXPY9CdhzrJUKNs0E4TusalpWyPlmRadeW/vixHME4ECrgDcAzscpnLB1XI5LZYcE4TsunLVmnZbmdB0s2yjN0UkAAKqgmAILACAnEREgB1sm7jQ1aXBmczovL1FtZUhjelpqWnVORWRVb2t4MzI5R3VDU05veWVaNU0zOUNqWkhiamhYQ2p3a1OCAAD6L7tRNDSAAGAg+hi2zwB2zwxhMUAUbtRNDUAfhj0gABkjBt4Pgo1wsKgwm68uCJgQEB1wABAdHbPBUCUshvAAFvjG1vjIt0hlbGxvLCCNs8Ads8byIByZMhbrOWAW8iWczJ6DHQFhYABDBtALog10oh10mXIMIAIsIAsY5KA28igH8izzGrAqEFqwJRVbYIIMIAnCCqAhXXGFAzzxZAFN5ZbwJTQaHCAJnIAW8CUEShqgKOEjEzwgCZ1DDQINdKIddJknAg4uLoXwM=');
    const __system = Cell.fromBase64('te6cckECGQEAA1oAAQHAAQEFoB5RAgEU/wD0pBP0vPLICwMCAWIPBAIBWAsFAgFIBwYAdbJu40NWlwZnM6Ly9RbWVIY3paalp1TkVkVW9reDMyOUd1Q1NOb3llWjVNMzlDalpIYmpoWENqd2tTggAgJxCggCD6GLbPAHbPDGFwkCUshvAAFvjG1vjIt0hlbGxvLCCNs8Ads8byIByZMhbrOWAW8iWczJ6DHQExMAD6L7tRNDSAAGAgEgDQwAlbd6ME4LnYerpZXPY9CdhzrJUKNs0E4TusalpWyPlmRadeW/vixHME4ECrgDcAzscpnLB1XI5LZYcE4TsunLVmnZbmdB0s2yjN0UkAIRt6fbZ4A7Z4YwFw4ACqoJgCCwApLQAdDTAwFxsKMB+kABINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiFRQUwNvBPhhAvhi2zxZ2zzy4IIwyPhDAcx/AcoAye1UFxAExu2i7fsBkjB/4HAh10nCH5UwINcLH94gghB7og3Buo6lMNMfAYIQe6INwbry4IFtMcgBMIIQe6INwQHLH8n4QgF/bds8f+DAAI8YINdJwh+PEIAg1yHbPPhCAX9t2zx/2zHg3hQSFBEBGsgBzxbJ+EIBf23bPH8UAULIcAHLH28AAW+MbW+MAds8byIByZMhbrOWAW8iWczJ6DETALog10oh10mXIMIAIsIAsY5KA28igH8izzGrAqEFqwJRVbYIIMIAnCCqAhXXGFAzzxZAFN5ZbwJTQaHCAJnIAW8CUEShqgKOEjEzwgCZ1DDQINdKIddJknAg4uLoXwMBOm1tIm6zmVsgbvLQgG8iAZEy4hAkcAMEgEJQI9s8FQHKyHEBygFQBwHKAHABygJQBSDXSYEBC7ry4Igg1wsKIIEE/7ry0ImDCbry4IjPFlAD+gJwAcpoI26zkX+TJG6z4pczMwFwAcoA4w0hbrOcfwHKAAEgbvLQgAHMlTFwAcoA4skB+wAWAJh/AcoAyHABygBwAcoAJG6znX8BygAEIG7y0IBQBMyWNANwAcoA4iRus51/AcoABCBu8tCAUATMljQDcAHKAOJwAcoAAn8BygACyVjMAUbtRNDUAfhj0gABkjBt4Pgo1wsKgwm68uCJgQEB1wABAdHbPBgABDBtvzqZEw==');
    let builder = beginCell();
    builder.storeRef(__system);
    builder.storeUint(0, 1);
    initEcho_init_args({ $$type: 'Echo_init_args', a })(builder);
    const __data = builder.endCell();
    return { code: __code, data: __data };
}

const Echo_errors: { [key: number]: { message: string } } = {
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

const Echo_types: ABIType[] = [
    {"name":"StateInit","header":null,"fields":[{"name":"code","type":{"kind":"simple","type":"cell","optional":false}},{"name":"data","type":{"kind":"simple","type":"cell","optional":false}}]},
    {"name":"Context","header":null,"fields":[{"name":"bounced","type":{"kind":"simple","type":"bool","optional":false}},{"name":"sender","type":{"kind":"simple","type":"address","optional":false}},{"name":"value","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"raw","type":{"kind":"simple","type":"slice","optional":false}}]},
    {"name":"SendParameters","header":null,"fields":[{"name":"bounce","type":{"kind":"simple","type":"bool","optional":false}},{"name":"to","type":{"kind":"simple","type":"address","optional":false}},{"name":"value","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"mode","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"body","type":{"kind":"simple","type":"cell","optional":true}},{"name":"code","type":{"kind":"simple","type":"cell","optional":true}},{"name":"data","type":{"kind":"simple","type":"cell","optional":true}}]},
    {"name":"EchoMessage","header":2074217921,"fields":[]},
]

const Echo_getters: ABIGetter[] = [
    {"name":"hello","arguments":[{"name":"src","type":{"kind":"simple","type":"string","optional":false}}],"returnType":{"kind":"simple","type":"string","optional":false}},
    {"name":"hello2","arguments":[{"name":"src","type":{"kind":"simple","type":"int","optional":false,"format":257}}],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
]

const Echo_receivers: ABIReceiver[] = [
    {"receiver":"internal","message":{"kind":"typed","type":"EchoMessage"}},
    {"receiver":"internal","message":{"kind":"text"}},
    {"receiver":"internal","message":{"kind":"any"}},
]

export class Echo implements Contract {
    
    static async init(a: bigint) {
        return await Echo_init(a);
    }
    
    static async fromInit(a: bigint) {
        const init = await Echo_init(a);
        const address = contractAddress(0, init);
        return new Echo(address, init);
    }
    
    static fromAddress(address: Address) {
        return new Echo(address);
    }
    
    readonly address: Address; 
    readonly init?: { code: Cell, data: Cell };
    readonly abi: ContractABI = {
        types:  Echo_types,
        getters: Echo_getters,
        receivers: Echo_receivers,
        errors: Echo_errors,
    };
    
    private constructor(address: Address, init?: { code: Cell, data: Cell }) {
        this.address = address;
        this.init = init;
    }
    
    async send(provider: ContractProvider, via: Sender, args: { value: bigint, bounce?: boolean| null | undefined }, message: EchoMessage | string | Slice) {
        
        let body: Cell | null = null;
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'EchoMessage') {
            body = beginCell().store(storeEchoMessage(message)).endCell();
        }
        if (typeof message === 'string') {
            body = beginCell().storeUint(0, 32).storeStringTail(message).endCell();
        }
        if (message && typeof message === 'object' && message instanceof Slice) {
            body = message.asCell();
        }
        if (body === null) { throw new Error('Invalid message type'); }
        
        await provider.internal(via, { ...args, body: body });
        
    }
    
    async getHello(provider: ContractProvider, src: string) {
        let builder = new TupleBuilder();
        builder.writeString(src);
        let source = (await provider.get('hello', builder.build())).stack;
        let result = source.readString();
        return result;
    }
    
    async getHello2(provider: ContractProvider, src: bigint) {
        let builder = new TupleBuilder();
        builder.writeNumber(src);
        let source = (await provider.get('hello2', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
}