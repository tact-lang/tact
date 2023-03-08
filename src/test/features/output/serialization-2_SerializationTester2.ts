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

export type Vars = {
    $$type: 'Vars';
    a: bigint;
    b: bigint;
    c: bigint;
    d: bigint;
    e: bigint;
}

export function storeVars(src: Vars) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeInt(src.a, 257);
        b_0.storeInt(src.b, 257);
        b_0.storeInt(src.c, 257);
        let b_1 = new Builder();
        b_1.storeInt(src.d, 257);
        b_1.storeInt(src.e, 257);
        b_0.storeRef(b_1.endCell());
    };
}

export function loadVars(slice: Slice) {
    let sc_0 = slice;
    let _a = sc_0.loadIntBig(257);
    let _b = sc_0.loadIntBig(257);
    let _c = sc_0.loadIntBig(257);
    let sc_1 = sc_0.loadRef().beginParse();
    let _d = sc_1.loadIntBig(257);
    let _e = sc_1.loadIntBig(257);
    return { $$type: 'Vars' as const, a: _a, b: _b, c: _c, d: _d, e: _e };
}

function loadTupleVars(source: TupleReader) {
    let _a = source.readBigNumber();
    let _b = source.readBigNumber();
    let _c = source.readBigNumber();
    let _d = source.readBigNumber();
    let _e = source.readBigNumber();
    return { $$type: 'Vars' as const, a: _a, b: _b, c: _c, d: _d, e: _e };
}

function storeTupleVars(source: Vars) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.a);
    builder.writeNumber(source.b);
    builder.writeNumber(source.c);
    builder.writeNumber(source.d);
    builder.writeNumber(source.e);
    return builder.build();
}

function dictValueParserVars(): DictionaryValue<Vars> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeVars(src)).endCell());
        },
        parse: (src) => {
            return loadVars(src.loadRef().beginParse());
        }
    }
}

export type Both = {
    $$type: 'Both';
    a: Vars;
    b: Vars;
}

export function storeBoth(src: Both) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.store(storeVars(src.a));
        let b_1 = new Builder();
        b_1.store(storeVars(src.b));
        b_0.storeRef(b_1.endCell());
    };
}

export function loadBoth(slice: Slice) {
    let sc_0 = slice;
    let _a = loadVars(sc_0);
    let sc_1 = sc_0.loadRef().beginParse();
    let _b = loadVars(sc_1);
    return { $$type: 'Both' as const, a: _a, b: _b };
}

function loadTupleBoth(source: TupleReader) {
    const _a = loadTupleVars(source.readTuple());
    const _b = loadTupleVars(source.readTuple());
    return { $$type: 'Both' as const, a: _a, b: _b };
}

function storeTupleBoth(source: Both) {
    let builder = new TupleBuilder();
    builder.writeTuple(storeTupleVars(source.a));
    builder.writeTuple(storeTupleVars(source.b));
    return builder.build();
}

function dictValueParserBoth(): DictionaryValue<Both> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeBoth(src)).endCell());
        },
        parse: (src) => {
            return loadBoth(src.loadRef().beginParse());
        }
    }
}

export type Update = {
    $$type: 'Update';
    a: Vars;
    b: Vars;
}

export function storeUpdate(src: Update) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(2732768933, 32);
        b_0.store(storeVars(src.a));
        let b_1 = new Builder();
        b_1.store(storeVars(src.b));
        b_0.storeRef(b_1.endCell());
    };
}

export function loadUpdate(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 2732768933) { throw Error('Invalid prefix'); }
    let _a = loadVars(sc_0);
    let sc_1 = sc_0.loadRef().beginParse();
    let _b = loadVars(sc_1);
    return { $$type: 'Update' as const, a: _a, b: _b };
}

function loadTupleUpdate(source: TupleReader) {
    const _a = loadTupleVars(source.readTuple());
    const _b = loadTupleVars(source.readTuple());
    return { $$type: 'Update' as const, a: _a, b: _b };
}

function storeTupleUpdate(source: Update) {
    let builder = new TupleBuilder();
    builder.writeTuple(storeTupleVars(source.a));
    builder.writeTuple(storeTupleVars(source.b));
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

 type SerializationTester2_init_args = {
    $$type: 'SerializationTester2_init_args';
    a: Vars;
    b: Vars;
}

function initSerializationTester2_init_args(src: SerializationTester2_init_args) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.store(storeVars(src.a));
        let b_1 = new Builder();
        b_1.store(storeVars(src.b));
        b_0.storeRef(b_1.endCell());
    };
}

async function SerializationTester2_init(a: Vars, b: Vars) {
    const __code = Cell.fromBase64('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');
    const __system = Cell.fromBase64('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');
    let builder = beginCell();
    builder.storeRef(__system);
    builder.storeUint(0, 1);
    initSerializationTester2_init_args({ $$type: 'SerializationTester2_init_args', a, b })(builder);
    const __data = builder.endCell();
    return { code: __code, data: __data };
}

const SerializationTester2_errors: { [key: number]: { message: string } } = {
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

export class SerializationTester2 implements Contract {
    
    static async init(a: Vars, b: Vars) {
        return await SerializationTester2_init(a, b);
    }
    
    static async fromInit(a: Vars, b: Vars) {
        const init = await SerializationTester2_init(a, b);
        const address = contractAddress(0, init);
        return new SerializationTester2(address, init);
    }
    
    static fromAddress(address: Address) {
        return new SerializationTester2(address);
    }
    
    readonly address: Address; 
    readonly init?: { code: Cell, data: Cell };
    readonly abi: ContractABI = {
        errors: SerializationTester2_errors
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
        const result = loadTupleVars(source);
        return result;
    }
    
    async getGetAopt(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getAopt', builder.build())).stack;
        const result_p = source.readTupleOpt();
        const result = result_p ? loadTupleVars(result_p) : null;
        return result;
    }
    
    async getGetB(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getB', builder.build())).stack;
        const result = loadTupleVars(source);
        return result;
    }
    
    async getGetBopt(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getBopt', builder.build())).stack;
        const result_p = source.readTupleOpt();
        const result = result_p ? loadTupleVars(result_p) : null;
        return result;
    }
    
    async getGetBoth(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getBoth', builder.build())).stack;
        const result = loadTupleBoth(source);
        return result;
    }
    
    async getGetBothOpt(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getBothOpt', builder.build())).stack;
        const result_p = source.readTupleOpt();
        const result = result_p ? loadTupleBoth(result_p) : null;
        return result;
    }
    
    async getProcess(provider: ContractProvider, src: Vars, both: Both, both2: Both | null) {
        let builder = new TupleBuilder();
        builder.writeTuple(storeTupleVars(src));
        builder.writeTuple(storeTupleBoth(both));
        if (both2 !== null && both2 !== undefined) {
            builder.writeTuple(storeTupleBoth(both2));
        } else {
            builder.writeTuple(null);
        }
        let source = (await provider.get('process', builder.build())).stack;
        const result = loadTupleVars(source);
        return result;
    }
    
}