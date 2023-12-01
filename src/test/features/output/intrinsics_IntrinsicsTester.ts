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

 type IntrinsicsTester_init_args = {
    $$type: 'IntrinsicsTester_init_args';
}

function initIntrinsicsTester_init_args(src: IntrinsicsTester_init_args) {
    return (builder: Builder) => {
        let b_0 = builder;
    };
}

async function IntrinsicsTester_init() {
    const __code = Cell.fromBase64('te6ccgECOwEABFEAART/APSkE/S88sgLAQIBYgIDA3rQAdDTAwFxsKMB+kABINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiFRQUwNvBPhhAvhi2zxVFds88uCCNwQFAgEgBwgBOu2i7fsBkjB/4HAh10nCH5UwINcLH97AAJEw4w1wBgCayPhDAcx/AcoAVVBQVoEBAc8AyFAEzxbJUAPMASDXSYEBC7ry4Igg1wsKIIEE/7ry0ImDCbry4IjPFsyBAQHPAAHIgQEBzwDJAczJ7VQB3PkBIILwhdKIOEwAQ0WLAoA8siBZ9ogDxVPDZWNENGRo2slh8ka6lDB/2zHggvBR6g7FqQKZ9haWbvIVyt7FqC/xdfjW6n50wiRWyfXW3bqOnIjIgljAAAAAAAAAAAAAAAABActnzMlw+wB/2zHgLQIBIAkKAgEgHyACAUgLDAIBIA8QAhGx/PbPNs8bGGA3DQIRslZ2zzbPGxhgNw4ASI0IYAQe/qqXMblNo5fl5kYi9eYzSLgSrFtHY6k/DdIB0HmNRAACJQIBSBESAgEgFRYCEa447Z5tnjYwwDcTAhGuQ22ebZ42MMA3FAECiDoADIISW2bTQAIBIBcYAhGzVjbPNs8bGGA3HgIRr7ztnm2eNjDANxkCAW4aGwACIQIPo/Ns82zxsYY3HAIPoUds82zxsYY3HQAEgwgAAiIAGou0hlbGxvIHdvcmxkgCASAhIgIBICYnAgEgIyQAubd6ME4LnYerpZXPY9CdhzrJUKNs0E4TusalpWyPlmRadeW/vixHME4ECrgDcAzscpnLB1XI5LZYcE4DepO98qiy3jjqenvAqzhk0E4TsunLVmnZbmdB0s2yjN0UkAIVsoP2zxVBds8bGGA3OAIRsX22zzbPGxhgNyUAAiMCASAoKQIBIDEyAgFIKisCASAuLwAQqr7tRNDSAAECEKpP2zzbPGxhNywBAogtAB4AAAAASGVsbG8gd29ybGQCEa6z7Z5tnjYwwDcwAHWs3caGrS4MzmdF5eotrGjmLMwrLa8uDoipDMpmjm9GjCxtLUyO5mhtT0aNZmoNzc9Myo4KTMxMaItQQABEgvC5TSe5k00+CKUuUtfafav6xITv43pTgO6QiPes4u/N6QIBIDM0AhWyujbPFUF2zxsYYDc4AhGsle2ebZ42MMA3NQIRrWTtnm2eNjDANzYAAiQAAiABtO1E0NQB+GPSAAGOP4EBAdcA1AHQAfpAASDXSYEBC7ry4Igg1wsKIIEE/7ry0ImDCbry4IgB1IEBAdcA1AHQgQEB1wAwFhUUQzBsFuAw+CjXCwqDCbry4InbPDkABPkCAbiCEltm00CLtIZWxsbyB3b3JsZIjQhgBB7+qpcxuU2jl+XmRiL15jNIuBKsW0djqT8N0gHQeY1EiIMIgvC5TSe5k00+CKUuUtfafav6xITv43pTgO6QiPes4u/N6ToAGEhlbGxvIHdvcmxkIQ==');
    const __system = Cell.fromBase64('te6cckECPQEABFsAAQHAAQEFoOvtAgEU/wD0pBP0vPLICwMCAWI1BAIBIB4FAgEgFwYCASAOBwIBIAkIAhWyujbPFUF2zxsYYDodAgEgDAoCEa1k7Z5tnjYwwDoLAAIgAhGsle2ebZ42MMA6DQACJAIBIBMPAgEgERAAdazdxoatLgzOZ0Xl6i2saOYszCstry4OiKkMymaOb0aMLG0tTI7maG1PRo1mag3Nz0zKjgpMzExoi1BAAhGus+2ebZ42MMA6EgBEgvC5TSe5k00+CKUuUtfafav6xITv43pTgO6QiPes4u/N6QIBSBYUAhCqT9s82zxsYToVAQKIOQAQqr7tRNDSAAECASAZGAC5t3owTgudh6ullc9j0J2HOslQo2zQThO6xqWlbI+WZFp15b++LEcwTgQKuANwDOxymcsHVcjktlhwTgN6k73yqLLeOOp6e8CrOGTQThOy6ctWadluZ0HSzbKM3RSQAgEgHBoCEbF9ts82zxsYYDobAAIjAhWyg/bPFUF2zxsYYDodAAT5AgIBIDAfAgEgKyACASAjIQIRs1Y2zzbPGxhgOiIAGou0hlbGxvIHdvcmxkgCASApJAIBbiclAg+hR2zzbPGxhjomAAIiAg+j82zzbPGxhjooAASDCAIRr7ztnm2eNjDAOioAAiECAUguLAIRrkNtnm2eNjDAOi0ADIISW2bTQAIRrjjtnm2eNjDAOi8BAog8AgFIMzECEbJWds82zxsYYDoyAAIlAhGx/PbPNs8bGGA6NABIjQhgBB7+qpcxuU2jl+XmRiL15jNIuBKsW0djqT8N0gHQeY1EA3rQAdDTAwFxsKMB+kABINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiFRQUwNvBPhhAvhi2zxVFds88uCCOjc2AJrI+EMBzH8BygBVUFBWgQEBzwDIUATPFslQA8wBINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiM8WzIEBAc8AAciBAQHPAMkBzMntVAE67aLt+wGSMH/gcCHXScIflTAg1wsf3sAAkTDjDXA4Adz5ASCC8IXSiDhMAENFiwKAPLIgWfaIA8VTw2VjRDRkaNrJYfJGupQwf9sx4ILwUeoOxakCmfYWlm7yFcrexagv8XX41up+dMIkVsn11t26jpyIyIJYwAAAAAAAAAAAAAAAAQHLZ8zJcPsAf9sx4DkAHgAAAABIZWxsbyB3b3JsZAG07UTQ1AH4Y9IAAY4/gQEB1wDUAdAB+kABINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiAHUgQEB1wDUAdCBAQHXADAWFRRDMGwW4DD4KNcLCoMJuvLgids8OwG4ghJbZtNAi7SGVsbG8gd29ybGSI0IYAQe/qqXMblNo5fl5kYi9eYzSLgSrFtHY6k/DdIB0HmNRIiDCILwuU0nuZNNPgilLlLX2n2r+sSE7+N6U4DukIj3rOLvzek8ABhIZWxsbyB3b3JsZCGSrrvk');
    let builder = beginCell();
    builder.storeRef(__system);
    builder.storeUint(0, 1);
    initIntrinsicsTester_init_args({ $$type: 'IntrinsicsTester_init_args' })(builder);
    const __data = builder.endCell();
    return { code: __code, data: __data };
}

const IntrinsicsTester_errors: { [key: number]: { message: string } } = {
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

const IntrinsicsTester_types: ABIType[] = [
    {"name":"StateInit","header":null,"fields":[{"name":"code","type":{"kind":"simple","type":"cell","optional":false}},{"name":"data","type":{"kind":"simple","type":"cell","optional":false}}]},
    {"name":"Context","header":null,"fields":[{"name":"bounced","type":{"kind":"simple","type":"bool","optional":false}},{"name":"sender","type":{"kind":"simple","type":"address","optional":false}},{"name":"value","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"raw","type":{"kind":"simple","type":"slice","optional":false}}]},
    {"name":"SendParameters","header":null,"fields":[{"name":"bounce","type":{"kind":"simple","type":"bool","optional":false}},{"name":"to","type":{"kind":"simple","type":"address","optional":false}},{"name":"value","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"mode","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"body","type":{"kind":"simple","type":"cell","optional":true}},{"name":"code","type":{"kind":"simple","type":"cell","optional":true}},{"name":"data","type":{"kind":"simple","type":"cell","optional":true}}]},
]

const IntrinsicsTester_getters: ABIGetter[] = [
    {"name":"getTons","arguments":[],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
    {"name":"getTons2","arguments":[],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
    {"name":"getString","arguments":[],"returnType":{"kind":"simple","type":"string","optional":false}},
    {"name":"getString2","arguments":[],"returnType":{"kind":"simple","type":"string","optional":false}},
    {"name":"getAddress","arguments":[],"returnType":{"kind":"simple","type":"address","optional":false}},
    {"name":"getAddress2","arguments":[],"returnType":{"kind":"simple","type":"address","optional":false}},
    {"name":"getCell","arguments":[],"returnType":{"kind":"simple","type":"cell","optional":false}},
    {"name":"getCell2","arguments":[],"returnType":{"kind":"simple","type":"cell","optional":false}},
    {"name":"getPow","arguments":[],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
    {"name":"getPow2","arguments":[],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
    {"name":"getComment","arguments":[],"returnType":{"kind":"simple","type":"cell","optional":false}},
    {"name":"getHash","arguments":[],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
    {"name":"getHash2","arguments":[],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
    {"name":"getHash3","arguments":[{"name":"src","type":{"kind":"simple","type":"slice","optional":false}}],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
    {"name":"getHash4","arguments":[{"name":"src","type":{"kind":"simple","type":"string","optional":false}}],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
]

const IntrinsicsTester_receivers: ABIReceiver[] = [
    {"receiver":"internal","message":{"kind":"text","text":"Deploy"}},
    {"receiver":"internal","message":{"kind":"text","text":"emit_1"}},
]

export class IntrinsicsTester implements Contract {
    
    static async init() {
        return await IntrinsicsTester_init();
    }
    
    static async fromInit() {
        const init = await IntrinsicsTester_init();
        const address = contractAddress(0, init);
        return new IntrinsicsTester(address, init);
    }
    
    static fromAddress(address: Address) {
        return new IntrinsicsTester(address);
    }
    
    readonly address: Address; 
    readonly init?: { code: Cell, data: Cell };
    readonly abi: ContractABI = {
        types:  IntrinsicsTester_types,
        getters: IntrinsicsTester_getters,
        receivers: IntrinsicsTester_receivers,
        errors: IntrinsicsTester_errors,
    };
    
    private constructor(address: Address, init?: { code: Cell, data: Cell }) {
        this.address = address;
        this.init = init;
    }
    
    async send(provider: ContractProvider, via: Sender, args: { value: bigint, bounce?: boolean| null | undefined }, message: 'Deploy' | 'emit_1') {
        
        let body: Cell | null = null;
        if (message === 'Deploy') {
            body = beginCell().storeUint(0, 32).storeStringTail(message).endCell();
        }
        if (message === 'emit_1') {
            body = beginCell().storeUint(0, 32).storeStringTail(message).endCell();
        }
        if (body === null) { throw new Error('Invalid message type'); }
        
        await provider.internal(via, { ...args, body: body });
        
    }
    
    async getGetTons(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getTons', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getGetTons2(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getTons2', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getGetString(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getString', builder.build())).stack;
        let result = source.readString();
        return result;
    }
    
    async getGetString2(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getString2', builder.build())).stack;
        let result = source.readString();
        return result;
    }
    
    async getGetAddress(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getAddress', builder.build())).stack;
        let result = source.readAddress();
        return result;
    }
    
    async getGetAddress2(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getAddress2', builder.build())).stack;
        let result = source.readAddress();
        return result;
    }
    
    async getGetCell(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getCell', builder.build())).stack;
        let result = source.readCell();
        return result;
    }
    
    async getGetCell2(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getCell2', builder.build())).stack;
        let result = source.readCell();
        return result;
    }
    
    async getGetPow(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getPow', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getGetPow2(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getPow2', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getGetComment(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getComment', builder.build())).stack;
        let result = source.readCell();
        return result;
    }
    
    async getGetHash(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getHash', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getGetHash2(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getHash2', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getGetHash3(provider: ContractProvider, src: Cell) {
        let builder = new TupleBuilder();
        builder.writeSlice(src);
        let source = (await provider.get('getHash3', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getGetHash4(provider: ContractProvider, src: string) {
        let builder = new TupleBuilder();
        builder.writeString(src);
        let source = (await provider.get('getHash4', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
}