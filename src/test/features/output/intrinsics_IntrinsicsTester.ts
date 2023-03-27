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

 type IntrinsicsTester_init_args = {
    $$type: 'IntrinsicsTester_init_args';
}

function initIntrinsicsTester_init_args(src: IntrinsicsTester_init_args) {
    return (builder: Builder) => {
        let b_0 = builder;
    };
}

async function IntrinsicsTester_init() {
    const __code = Cell.fromBase64('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');
    const __system = Cell.fromBase64('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');
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
        errors: IntrinsicsTester_errors
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
    
}