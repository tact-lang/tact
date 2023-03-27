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
        errors: StringsTester_errors
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