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

 type A_init_args = {
    $$type: 'A_init_args';
}

function initA_init_args(src: A_init_args) {
    return (builder: Builder) => {
        let b_0 = builder;
    };
}

async function A_init() {
    const __code = Cell.fromBase64('te6ccgECEAEAA3kAART/APSkE/S88sgLAQIBYgIDAgLLBAUCASAMDQLP0AdDTAwFxsMABkX+RcOIB+kABINdJgQELuvLgiCDXCwoggwm6IYEE/7qx8uCIgwm68uCJIkFVbwT4Ye1E0NQB+GLSADCRbY6N+CjXCwqDCbry4InbPOJZ2zwwMMj4QgHMfwHKAMntVIOBgDRooDoegIYNpDAtEMAwAh6B7fQ+XBDgMC0QxEBQAh6C4FAvFOAwAh6B7fQ+XBDiUC8U4CBQAh6C+QA5HoAZIDmOADlACwQa6TAgIXdeXBEEGuFhRBBhN0QwIJ/3Vj5cERBhN15cETni2TAA9ztou37cCHXScIflTAg1wsf3gKSW3/gAcAAj8/5AYLwtBqZMzAcHXKOZOI2hf46nHVAq5NZ73MYlDwO5eCRDV26j6f4Qvgo8BVc2zxwgEJ/i3TWVzc2FnZY2zxeI0QwEhA2EDRZ2zx/2zHgkTDicAcICQCMcFnIcAHLAXMBywFwAcsAEszMyfkAyHIBywFwAcsAEsoHy//J0CDXSYEBC7ry4Igg1wsKIIMJuiGBBP+6sfLgiIMJuvLgiQFCyHAByx9vAAFvjG1vjAHbPG8iAcmTIW6zlgFvIlnMyegxCgHOyHEBygFQBwHKAHABygJQBSDXSYEBC7ry4Igg1wsKIIMJuiGBBP+6sfLgiIMJuvLgic8WUAP6AnABymgjbrMlbrOxlzMzAXABygDjDSFus5x/AcoAASBu8tCAAcyVMXABygDiyQH7AAsAuiDXSiHXSZcgwgAiwgCxjkoDbyKAfyLPMasCoQWrAlFVtgggwgCcIKoCFdcYUDPPFkAU3llvAlNBocIAmcgBbwJQRKGqAo4SMTPCAJnUMNAg10oh10mScCDi4uhfAwCYfwHKAMhwAcoAcAHKACRus51/AcoABCBu8tCAUATMljQDcAHKAOIkbrOdfwHKAAQgbvLQgFAEzJY0A3ABygDicAHKAAJ/AcoAAslYzAJBvQvPaiaGoA/DFpABhItsdG/BRrhYVBhN15cETtnnFtnkDg8Aub3ejBOC52Hq6WVz2PQnYc6yVCjbNBOE7rGpaVsj5ZkWnXlv74sRzBOBAq4A3AM7HKZywdVyOS2WHBOA3qTvfKost446np7wKs4ZNBOE7Lpy1Zp2W5nQdLNsozdFJAACbQAOMPhC+CjwFQ==');
    const __system = Cell.fromBase64('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');
    let builder = beginCell();
    builder.storeRef(__system);
    builder.storeUint(0, 1);
    initA_init_args({ $$type: 'A_init_args' })(builder);
    const __data = builder.endCell();
    return { code: __code, data: __data };
}

const A_errors: { [key: number]: { message: string } } = {
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

export class A implements Contract {
    
    static async init() {
        return await A_init();
    }
    
    static async fromInit() {
        const init = await A_init();
        const address = contractAddress(0, init);
        return new A(address, init);
    }
    
    static fromAddress(address: Address) {
        return new A(address);
    }
    
    readonly address: Address; 
    readonly init?: { code: Cell, data: Cell };
    readonly abi: ContractABI = {
        errors: A_errors
    };
    
    private constructor(address: Address, init?: { code: Cell, data: Cell }) {
        this.address = address;
        this.init = init;
    }
    
    async send(provider: ContractProvider, via: Sender, args: { value: bigint, bounce?: boolean| null | undefined }, message: 'Message') {
        
        let body: Cell | null = null;
        if (message === 'Message') {
            body = beginCell().storeUint(0, 32).storeStringTail(message).endCell();
        }
        if (body === null) { throw new Error('Invalid message type'); }
        
        await provider.internal(via, { ...args, body: body });
        
    }
    
    async getGetNext(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getNext', builder.build())).stack;
        const result = loadTupleStateInit(source);
        return result;
    }
    
}