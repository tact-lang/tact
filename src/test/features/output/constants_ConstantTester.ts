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

 type ConstantTester_init_args = {
    $$type: 'ConstantTester_init_args';
}

function initConstantTester_init_args(src: ConstantTester_init_args) {
    return (builder: Builder) => {
        let b_0 = builder;
    };
}

async function ConstantTester_init() {
    const __code = Cell.fromBase64('te6ccgECHAEAAcsAART/APSkE/S88sgLAQIBYgIDApLQAdDTAwFxsKMB+kABINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiFRQUwNvBPhhAvhi2zxZ2zzy4IIwyPhDAcx/AcoAye1UGQQCAVgFBgAaAZIwf+Ag10kxwh8wcAIBIAcIAgEgDQ4CASAJCgC5t3owTgudh6ullc9j0J2HOslQo2zQThO6xqWlbI+WZFp15b++LEcwTgQKuANwDOxymcsHVcjktlhwTgN6k73yqLLeOOp6e8CrOGTQThOy6ctWadluZ0HSzbKM3RSQAg+yTfbPNs8MYBkLAg+yRbbPNs8MYBkMAA6CGGort9AAAByLxIZWxsbyB3b3JsZCGAIBIA8QAgEgFxgCAUgREgIDmmgUFQAQqr7tRNDSAAECDqth2zzbPDEZEwAEgGQCDay2zzbPDGAZFgBzruNDVpcGZzOi8vUW1kZnREdVc3a2dlVVVqQ2FnYndhQkFZOUppamJwYWo1TDRxR3FNUlMxQ0R2UoIAACegIPsnx2zzbPDGAZGwIPsnQ2zzbPDGAZGgE07UTQ1AH4Y9IAMJFt4Pgo1wsKgwm68uCJ2zwbAA6CGByjXw4AAAJt');
    const __system = Cell.fromBase64('te6cckECHgEAAdUAAQHAAQEFoPkDAgEU/wD0pBP0vPLICwMCAWIaBAIBWBMFAgEgCgYCASAJBwIPsnQ2zzbPDGAcCAAOghgco18OAAIPsnx2zzbPDGAcHQIBIA8LAgOaaA0MAHOu40NWlwZnM6Ly9RbWRmdER1VzdrZ2VVVWpDYWdid2FCQVk5SmlqYnBhajVMNHFHcU1SUzFDRHZSggAg2sts82zwxgHA4AAnoCAUgSEAIOq2HbPNs8MRwRAASAZAAQqr7tRNDSAAECASAVFAC5t3owTgudh6ullc9j0J2HOslQo2zQThO6xqWlbI+WZFp15b++LEcwTgQKuANwDOxymcsHVcjktlhwTgN6k73yqLLeOOp6e8CrOGTQThOy6ctWadluZ0HSzbKM3RSQAgEgGBYCD7JFts82zwxgHBcAHIvEhlbGxvIHdvcmxkIYAg+yTfbPNs8MYBwZAA6CGGort9AAApLQAdDTAwFxsKMB+kABINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiFRQUwNvBPhhAvhi2zxZ2zzy4IIwyPhDAcx/AcoAye1UHBsAGgGSMH/gINdJMcIfMHABNO1E0NQB+GPSADCRbeD4KNcLCoMJuvLgids8HQACbWpdcvw=');
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
        errors: ConstantTester_errors
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
    
    async getGlobalConst(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('globalConst', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
}