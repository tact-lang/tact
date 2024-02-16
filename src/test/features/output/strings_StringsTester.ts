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

 type StringsTester_init_args = {
    $$type: 'StringsTester_init_args';
}

function initStringsTester_init_args(src: StringsTester_init_args) {
    return (builder: Builder) => {
        let b_0 = builder;
    };
}

async function StringsTester_init() {
    const __code = Cell.fromBase64('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');
    const __system = Cell.fromBase64('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');
    let builder = beginCell();
    builder.storeRef(__system);
    builder.storeUint(0, 1);
    initStringsTester_init_args({ $$type: 'StringsTester_init_args' })(builder);
    const __data = builder.endCell();
    return { code: __code, data: __data };
}

const StringsTester_errors: { [key: number]: { message: string } } = {
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

const StringsTester_types: ABIType[] = [
    {"name":"StateInit","header":null,"fields":[{"name":"code","type":{"kind":"simple","type":"cell","optional":false}},{"name":"data","type":{"kind":"simple","type":"cell","optional":false}}]},
    {"name":"Context","header":null,"fields":[{"name":"bounced","type":{"kind":"simple","type":"bool","optional":false}},{"name":"sender","type":{"kind":"simple","type":"address","optional":false}},{"name":"value","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"raw","type":{"kind":"simple","type":"slice","optional":false}}]},
    {"name":"SendParameters","header":null,"fields":[{"name":"bounce","type":{"kind":"simple","type":"bool","optional":false}},{"name":"to","type":{"kind":"simple","type":"address","optional":false}},{"name":"value","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"mode","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"body","type":{"kind":"simple","type":"cell","optional":true}},{"name":"code","type":{"kind":"simple","type":"cell","optional":true}},{"name":"data","type":{"kind":"simple","type":"cell","optional":true}}]},
]

const StringsTester_getters: ABIGetter[] = [
    {"name":"constantString","arguments":[],"returnType":{"kind":"simple","type":"string","optional":false}},
    {"name":"constantStringUnicode","arguments":[],"returnType":{"kind":"simple","type":"string","optional":false}},
    {"name":"constantStringUnicodeLong","arguments":[],"returnType":{"kind":"simple","type":"string","optional":false}},
    {"name":"dynamicStringCell","arguments":[],"returnType":{"kind":"simple","type":"cell","optional":false}},
    {"name":"dynamicCommentCell","arguments":[],"returnType":{"kind":"simple","type":"cell","optional":false}},
    {"name":"dynamicCommentCellLarge","arguments":[],"returnType":{"kind":"simple","type":"cell","optional":false}},
    {"name":"dynamicCommentStringLarge","arguments":[],"returnType":{"kind":"simple","type":"string","optional":false}},
    {"name":"stringWithNumber","arguments":[],"returnType":{"kind":"simple","type":"string","optional":false}},
    {"name":"stringWithNegativeNumber","arguments":[],"returnType":{"kind":"simple","type":"string","optional":false}},
    {"name":"stringWithLargeNumber","arguments":[],"returnType":{"kind":"simple","type":"string","optional":false}},
    {"name":"stringWithFloat","arguments":[],"returnType":{"kind":"simple","type":"string","optional":false}},
    {"name":"base64","arguments":[],"returnType":{"kind":"simple","type":"slice","optional":false}},
    {"name":"processBase64","arguments":[{"name":"src","type":{"kind":"simple","type":"string","optional":false}}],"returnType":{"kind":"simple","type":"slice","optional":false}},
]

const StringsTester_receivers: ABIReceiver[] = [
    {"receiver":"internal","message":{"kind":"empty"}},
]

export class StringsTester implements Contract {
    
    static async init() {
        return await StringsTester_init();
    }
    
    static async fromInit() {
        const init = await StringsTester_init();
        const address = contractAddress(0, init);
        return new StringsTester(address, init);
    }
    
    static fromAddress(address: Address) {
        return new StringsTester(address);
    }
    
    readonly address: Address; 
    readonly init?: { code: Cell, data: Cell };
    readonly abi: ContractABI = {
        types:  StringsTester_types,
        getters: StringsTester_getters,
        receivers: StringsTester_receivers,
        errors: StringsTester_errors,
    };
    
    private constructor(address: Address, init?: { code: Cell, data: Cell }) {
        this.address = address;
        this.init = init;
    }
    
    async send(provider: ContractProvider, via: Sender, args: { value: bigint, bounce?: boolean| null | undefined }, message: null) {
        
        let body: Cell | null = null;
        if (message === null) {
            body = new Cell();
        }
        if (body === null) { throw new Error('Invalid message type'); }
        
        await provider.internal(via, { ...args, body: body });
        
    }
    
    async getConstantString(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('constantString', builder.build())).stack;
        let result = source.readString();
        return result;
    }
    
    async getConstantStringUnicode(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('constantStringUnicode', builder.build())).stack;
        let result = source.readString();
        return result;
    }
    
    async getConstantStringUnicodeLong(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('constantStringUnicodeLong', builder.build())).stack;
        let result = source.readString();
        return result;
    }
    
    async getDynamicStringCell(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('dynamicStringCell', builder.build())).stack;
        let result = source.readCell();
        return result;
    }
    
    async getDynamicCommentCell(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('dynamicCommentCell', builder.build())).stack;
        let result = source.readCell();
        return result;
    }
    
    async getDynamicCommentCellLarge(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('dynamicCommentCellLarge', builder.build())).stack;
        let result = source.readCell();
        return result;
    }
    
    async getDynamicCommentStringLarge(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('dynamicCommentStringLarge', builder.build())).stack;
        let result = source.readString();
        return result;
    }
    
    async getStringWithNumber(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('stringWithNumber', builder.build())).stack;
        let result = source.readString();
        return result;
    }
    
    async getStringWithNegativeNumber(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('stringWithNegativeNumber', builder.build())).stack;
        let result = source.readString();
        return result;
    }
    
    async getStringWithLargeNumber(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('stringWithLargeNumber', builder.build())).stack;
        let result = source.readString();
        return result;
    }
    
    async getStringWithFloat(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('stringWithFloat', builder.build())).stack;
        let result = source.readString();
        return result;
    }
    
    async getBase64(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('base64', builder.build())).stack;
        let result = source.readCell();
        return result;
    }
    
    async getProcessBase64(provider: ContractProvider, src: string) {
        let builder = new TupleBuilder();
        builder.writeString(src);
        let source = (await provider.get('processBase64', builder.build())).stack;
        let result = source.readCell();
        return result;
    }
    
}