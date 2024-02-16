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

 type ConstantTester_init_args = {
    $$type: 'ConstantTester_init_args';
}

function initConstantTester_init_args(src: ConstantTester_init_args) {
    return (builder: Builder) => {
        let b_0 = builder;
    };
}

async function ConstantTester_init() {
    const __code = Cell.fromBase64('te6ccgECJQEAAgYAART/APSkE/S88sgLAQIBYgIDApLQAdDTAwFxsKMB+kABINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiFRQUwNvBPhhAvhi2zxZ2zzy4IIwyPhDAcx/AcoAye1UIgQCASAFBgAaAZIwf+Ag10kxwh8wcAIPvkXe2ebZ4YwiBwIBIAgJAAJ0AgEgCgsCASAWFwIBIAwNAgEgEBECD7JN9s82zwxgIg4CD7JFts82zwxgIg8ADoIYaiu30AAAHIvEhlbGxvIHdvcmxkIYAg+yXXbPNs8MYCISAgFqExQAAnoCDaaptnm2eGMiFQC3p6ME4LnYerpZXPY9CdhzrJUKNs0E4TusalpWyPlmRadeW/vixHME4ECrgDcAzscpnLB1XI5LZYcE4DepO98qiy3jjqenvAqzhk0E4TsunLVmnZbmdB0s2yjN0UkAAnUCASAYGQIBICAhAgFIGhsCA5poHR4AEKq+7UTQ0gABAg6rYds82zwxIhwABIBkAg2sts82zwxgIh8Ac67jQ1aXBmczovL1FtY3JuNXdvVHpBZzVjSGV2NExDanRnNUxmd3E3emhrRTFBQXIzRkxtYms4NTOCAABIALAg+yfHbPNs8MYCIkAg+ydDbPNs8MYCIjATTtRNDUAfhj0gAwkW3g+CjXCwqDCbry4InbPCQADoIYHKNfDgAAAm0=');
    const __system = Cell.fromBase64('te6cckECJwEAAhAAAQHAAQEFoPkDAgEU/wD0pBP0vPLICwMCAWIjBAIBICEFAgEgFAYCASALBwIBIAoIAg+ydDbPNs8MYCUJAA6CGByjXw4AAg+yfHbPNs8MYCUmAgEgEAwCA5poDg0Ac67jQ1aXBmczovL1FtY3JuNXdvVHpBZzVjSGV2NExDanRnNUxmd3E3emhrRTFBQXIzRkxtYms4NTOCACDay2zzbPDGAlDwAEgAsCAUgTEQIOq2HbPNs8MSUSAASAZAAQqr7tRNDSAAECASAcFQIBIBoWAgFqGBcAt6ejBOC52Hq6WVz2PQnYc6yVCjbNBOE7rGpaVsj5ZkWnXlv74sRzBOBAq4A3AM7HKZywdVyOS2WHBOA3qTvfKost446np7wKs4ZNBOE7Lpy1Zp2W5nQdLNsozdFJAg2mqbZ5tnhjJRkAAnUCD7Jdds82zwxgJRsAAnoCASAfHQIPskW2zzbPDGAlHgAci8SGVsbG8gd29ybGQhgCD7JN9s82zwxgJSAADoIYaiu30AACD75F3tnm2eGMJSIAAnQCktAB0NMDAXGwowH6QAEg10mBAQu68uCIINcLCiCBBP+68tCJgwm68uCIVFBTA28E+GEC+GLbPFnbPPLggjDI+EMBzH8BygDJ7VQlJAAaAZIwf+Ag10kxwh8wcAE07UTQ1AH4Y9IAMJFt4Pgo1wsKgwm68uCJ2zwmAAJtGJ7XKA==');
    let builder = beginCell();
    builder.storeRef(__system);
    builder.storeUint(0, 1);
    initConstantTester_init_args({ $$type: 'ConstantTester_init_args' })(builder);
    const __data = builder.endCell();
    return { code: __code, data: __data };
}

const ConstantTester_errors: { [key: number]: { message: string } } = {
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

const ConstantTester_types: ABIType[] = [
    {"name":"StateInit","header":null,"fields":[{"name":"code","type":{"kind":"simple","type":"cell","optional":false}},{"name":"data","type":{"kind":"simple","type":"cell","optional":false}}]},
    {"name":"Context","header":null,"fields":[{"name":"bounced","type":{"kind":"simple","type":"bool","optional":false}},{"name":"sender","type":{"kind":"simple","type":"address","optional":false}},{"name":"value","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"raw","type":{"kind":"simple","type":"slice","optional":false}}]},
    {"name":"SendParameters","header":null,"fields":[{"name":"bounce","type":{"kind":"simple","type":"bool","optional":false}},{"name":"to","type":{"kind":"simple","type":"address","optional":false}},{"name":"value","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"mode","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"body","type":{"kind":"simple","type":"cell","optional":true}},{"name":"code","type":{"kind":"simple","type":"cell","optional":true}},{"name":"data","type":{"kind":"simple","type":"cell","optional":true}}]},
]

const ConstantTester_getters: ABIGetter[] = [
    {"name":"something1","arguments":[],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
    {"name":"something2","arguments":[],"returnType":{"kind":"simple","type":"int","optional":true,"format":257}},
    {"name":"something3","arguments":[],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
    {"name":"something4","arguments":[],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
    {"name":"something5","arguments":[],"returnType":{"kind":"simple","type":"string","optional":false}},
    {"name":"something6","arguments":[],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
    {"name":"something7","arguments":[],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
    {"name":"something8","arguments":[],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
    {"name":"globalConst","arguments":[],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
]

const ConstantTester_receivers: ABIReceiver[] = [
]

export class ConstantTester implements Contract {
    
    static async init() {
        return await ConstantTester_init();
    }
    
    static async fromInit() {
        const init = await ConstantTester_init();
        const address = contractAddress(0, init);
        return new ConstantTester(address, init);
    }
    
    static fromAddress(address: Address) {
        return new ConstantTester(address);
    }
    
    readonly address: Address; 
    readonly init?: { code: Cell, data: Cell };
    readonly abi: ContractABI = {
        types:  ConstantTester_types,
        getters: ConstantTester_getters,
        receivers: ConstantTester_receivers,
        errors: ConstantTester_errors,
    };
    
    private constructor(address: Address, init?: { code: Cell, data: Cell }) {
        this.address = address;
        this.init = init;
    }
    
    async getSomething1(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('something1', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getSomething2(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('something2', builder.build())).stack;
        let result = source.readBigNumberOpt();
        return result;
    }
    
    async getSomething3(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('something3', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getSomething4(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('something4', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getSomething5(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('something5', builder.build())).stack;
        let result = source.readString();
        return result;
    }
    
    async getSomething6(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('something6', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getSomething7(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('something7', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getSomething8(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('something8', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getGlobalConst(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('globalConst', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
}