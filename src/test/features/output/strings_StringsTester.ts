import { Cell, Slice, Address, Builder, beginCell, ComputeError, TupleItem, TupleReader, Dictionary, contractAddress, ContractProvider, Sender, Contract, ContractABI, TupleBuilder, DictionaryValue } from 'ton-core';
import { ContractSystem, ContractExecutor } from 'ton-emulator';

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
async function StringsTester_init() {
    const __init = 'te6ccgEBBwEAOgABFP8A9KQT9LzyyAsBAgFiAgMCAs4EBQAJoUrd4AUAAUgBG0ghBHhowAAcjMAds8yYBgAMAYEBAc8A';
    const __code = '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';
    const __system = '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';
    let systemCell = Cell.fromBase64(__system);
    let builder = new TupleBuilder();
    builder.writeCell(systemCell);
    let __stack = builder.build();
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let initCell = Cell.fromBoc(Buffer.from(__init, 'base64'))[0];
    let system = await ContractSystem.create();
    let executor = await ContractExecutor.create({ code: initCell, data: new Cell() }, system);
    let res = await executor.get('init', __stack);
    if (!res.success) { throw Error(res.error); }
    if (res.exitCode !== 0 && res.exitCode !== 1) {
        if (StringsTester_errors[res.exitCode]) {
            throw new ComputeError(StringsTester_errors[res.exitCode].message, res.exitCode, { logs: res.vmLogs });
        } else {
            throw new ComputeError('Exit code: ' + res.exitCode, res.exitCode, { logs: res.vmLogs });
        }
    }
    
    let data = res.stack.readCell();
    return { code: codeCell, data };
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