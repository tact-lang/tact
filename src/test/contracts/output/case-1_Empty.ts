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

export type Source = {
    $$type: 'Source';
    a: bigint;
    b: bigint;
    c: bigint;
    d: bigint;
}

export function storeSource(src: Source) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeInt(src.a, 257);
        b_0.storeInt(src.b, 257);
        b_0.storeInt(src.c, 257);
        let b_1 = new Builder();
        b_1.storeInt(src.d, 257);
        b_0.storeRef(b_1.endCell());
    };
}

export function loadSource(slice: Slice) {
    let sc_0 = slice;
    let _a = sc_0.loadIntBig(257);
    let _b = sc_0.loadIntBig(257);
    let _c = sc_0.loadIntBig(257);
    let sc_1 = sc_0.loadRef().beginParse();
    let _d = sc_1.loadIntBig(257);
    return { $$type: 'Source' as const, a: _a, b: _b, c: _c, d: _d };
}

function loadTupleSource(source: TupleReader) {
    let _a = source.readBigNumber();
    let _b = source.readBigNumber();
    let _c = source.readBigNumber();
    let _d = source.readBigNumber();
    return { $$type: 'Source' as const, a: _a, b: _b, c: _c, d: _d };
}

function storeTupleSource(source: Source) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.a);
    builder.writeNumber(source.b);
    builder.writeNumber(source.c);
    builder.writeNumber(source.d);
    return builder.build();
}

function dictValueParserSource(): DictionaryValue<Source> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeSource(src)).endCell());
        },
        parse: (src) => {
            return loadSource(src.loadRef().beginParse());
        }
    }
}

 type Empty_init_args = {
    $$type: 'Empty_init_args';
}

function initEmpty_init_args(src: Empty_init_args) {
    return (builder: Builder) => {
        let b_0 = builder;
    };
}

async function Empty_init() {
    const __code = Cell.fromBase64('te6ccgECDwEAAW4AART/APSkE/S88sgLAQIBYgIDApLQAdDTAwFxsKMB+kABINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiFRQUwNvBPhhAvhi2zxZ2zzy4IIwyPhDAcx/AcoAye1UBwQCASAFBgAaAZIwf+Ag10kxwh8wcAIXv+Q7eSbZ4qsG2eGMBwgCASALDAE07UTQ1AH4Y9IAMJFt4Pgo1wsKgwm68uCJ2zwJAQTbPAoAAm0ASltTQ6CkWKABoAKregOqCQLCAJIwcN+TAcAAkjFw4pLAAJIwcOIAlbu9GCcFzsPV0srnsehOw51kqFG2aCcJ3WNS0rZHyzItOvLf3xYjmCcCBVwBuAZ2OUzlg6rkclssOCcJ2XTlqzTstzOg6WbZRm6KSAIBSA0OABGwr7tRNDSAAGAAdbJu40NWlwZnM6Ly9RbWV2SmNBdWZ2WVlhYWZ6TXpwdzZ3SEpObWZWaHlCRGdvRmFoM1VuTThITnh4gg');
    const __system = Cell.fromBase64('te6cckECEQEAAXgAAQHAAQEFoUKBAgEU/wD0pBP0vPLICwMCAWINBAIBIAoFAgEgCQYCAUgIBwB1sm7jQ1aXBmczovL1FtZXZKY0F1ZnZZWWFhZnpNenB3NndISk5tZlZoeUJEZ29GYWgzVW5NOEhOeHiCAAEbCvu1E0NIAAYACVu70YJwXOw9XSyuex6E7DnWSoUbZoJwndY1LStkfLMi068t/fFiOYJwIFXAG4BnY5TOWDquRyWyw4JwnZdOWrNOy3M6DpZtlGbopIAhe/5Dt5JtniqwbZ4YwPCwEE2zwMAEpbU0OgpFigAaACq3oDqgkCwgCSMHDfkwHAAJIxcOKSwACSMHDiApLQAdDTAwFxsKMB+kABINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiFRQUwNvBPhhAvhi2zxZ2zzy4IIwyPhDAcx/AcoAye1UDw4AGgGSMH/gINdJMcIfMHABNO1E0NQB+GPSADCRbeD4KNcLCoMJuvLgids8EAACbZGbmhg=');
    let builder = beginCell();
    builder.storeRef(__system);
    builder.storeUint(0, 1);
    initEmpty_init_args({ $$type: 'Empty_init_args' })(builder);
    const __data = builder.endCell();
    return { code: __code, data: __data };
}

const Empty_errors: { [key: number]: { message: string } } = {
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

const Empty_types: ABIType[] = [
    {"name":"StateInit","header":null,"fields":[{"name":"code","type":{"kind":"simple","type":"cell","optional":false}},{"name":"data","type":{"kind":"simple","type":"cell","optional":false}}]},
    {"name":"Context","header":null,"fields":[{"name":"bounced","type":{"kind":"simple","type":"bool","optional":false}},{"name":"sender","type":{"kind":"simple","type":"address","optional":false}},{"name":"value","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"raw","type":{"kind":"simple","type":"slice","optional":false}}]},
    {"name":"SendParameters","header":null,"fields":[{"name":"bounce","type":{"kind":"simple","type":"bool","optional":false}},{"name":"to","type":{"kind":"simple","type":"address","optional":false}},{"name":"value","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"mode","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"body","type":{"kind":"simple","type":"cell","optional":true}},{"name":"code","type":{"kind":"simple","type":"cell","optional":true}},{"name":"data","type":{"kind":"simple","type":"cell","optional":true}}]},
    {"name":"Source","header":null,"fields":[{"name":"a","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"b","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"c","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"d","type":{"kind":"simple","type":"int","optional":false,"format":257}}]},
]

const Empty_getters: ABIGetter[] = [
    {"name":"a","arguments":[{"name":"x","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"y","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"z","type":{"kind":"simple","type":"bool","optional":false}},{"name":"m","type":{"kind":"simple","type":"Source","optional":false}}],"returnType":{"kind":"simple","type":"bool","optional":false}},
]

const Empty_receivers: ABIReceiver[] = [
]

export class Empty implements Contract {
    
    static async init() {
        return await Empty_init();
    }
    
    static async fromInit() {
        const init = await Empty_init();
        const address = contractAddress(0, init);
        return new Empty(address, init);
    }
    
    static fromAddress(address: Address) {
        return new Empty(address);
    }
    
    readonly address: Address; 
    readonly init?: { code: Cell, data: Cell };
    readonly abi: ContractABI = {
        types:  Empty_types,
        getters: Empty_getters,
        receivers: Empty_receivers,
        errors: Empty_errors,
    };
    
    private constructor(address: Address, init?: { code: Cell, data: Cell }) {
        this.address = address;
        this.init = init;
    }
    
    async getA(provider: ContractProvider, x: bigint, y: bigint, z: boolean, m: Source) {
        let builder = new TupleBuilder();
        builder.writeNumber(x);
        builder.writeNumber(y);
        builder.writeBoolean(z);
        builder.writeTuple(storeTupleSource(m));
        let source = (await provider.get('a', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
}