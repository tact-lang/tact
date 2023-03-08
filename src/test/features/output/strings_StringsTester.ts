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