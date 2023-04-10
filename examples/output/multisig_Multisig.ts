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

export type Request = {
    $$type: 'Request';
    requested: Address;
    to: Address;
    value: bigint;
    timeout: bigint;
    bounce: boolean;
    mode: bigint;
    body: Cell | null;
}

export function storeRequest(src: Request) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(4266760323, 32);
        b_0.storeAddress(src.requested);
        b_0.storeAddress(src.to);
        b_0.storeCoins(src.value);
        b_0.storeUint(src.timeout, 32);
        b_0.storeBit(src.bounce);
        b_0.storeUint(src.mode, 8);
        if (src.body !== null && src.body !== undefined) { b_0.storeBit(true).storeRef(src.body); } else { b_0.storeBit(false); }
    };
}

export function loadRequest(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 4266760323) { throw Error('Invalid prefix'); }
    let _requested = sc_0.loadAddress();
    let _to = sc_0.loadAddress();
    let _value = sc_0.loadCoins();
    let _timeout = sc_0.loadUintBig(32);
    let _bounce = sc_0.loadBit();
    let _mode = sc_0.loadUintBig(8);
    let _body = sc_0.loadBit() ? sc_0.loadRef() : null;
    return { $$type: 'Request' as const, requested: _requested, to: _to, value: _value, timeout: _timeout, bounce: _bounce, mode: _mode, body: _body };
}

function loadTupleRequest(source: TupleReader) {
    let _requested = source.readAddress();
    let _to = source.readAddress();
    let _value = source.readBigNumber();
    let _timeout = source.readBigNumber();
    let _bounce = source.readBoolean();
    let _mode = source.readBigNumber();
    let _body = source.readCellOpt();
    return { $$type: 'Request' as const, requested: _requested, to: _to, value: _value, timeout: _timeout, bounce: _bounce, mode: _mode, body: _body };
}

function storeTupleRequest(source: Request) {
    let builder = new TupleBuilder();
    builder.writeAddress(source.requested);
    builder.writeAddress(source.to);
    builder.writeNumber(source.value);
    builder.writeNumber(source.timeout);
    builder.writeBoolean(source.bounce);
    builder.writeNumber(source.mode);
    builder.writeCell(source.body);
    return builder.build();
}

function dictValueParserRequest(): DictionaryValue<Request> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeRequest(src)).endCell());
        },
        parse: (src) => {
            return loadRequest(src.loadRef().beginParse());
        }
    }
}

export type Signed = {
    $$type: 'Signed';
    request: Request;
}

export function storeSigned(src: Signed) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(2213172633, 32);
        b_0.store(storeRequest(src.request));
    };
}

export function loadSigned(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 2213172633) { throw Error('Invalid prefix'); }
    let _request = loadRequest(sc_0);
    return { $$type: 'Signed' as const, request: _request };
}

function loadTupleSigned(source: TupleReader) {
    const _request = loadTupleRequest(source.readTuple());
    return { $$type: 'Signed' as const, request: _request };
}

function storeTupleSigned(source: Signed) {
    let builder = new TupleBuilder();
    builder.writeTuple(storeTupleRequest(source.request));
    return builder.build();
}

function dictValueParserSigned(): DictionaryValue<Signed> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeSigned(src)).endCell());
        },
        parse: (src) => {
            return loadSigned(src.loadRef().beginParse());
        }
    }
}

 type Multisig_init_args = {
    $$type: 'Multisig_init_args';
    members: Dictionary<Address, bigint>;
    totalWeight: bigint;
    requiredWeight: bigint;
}

function initMultisig_init_args(src: Multisig_init_args) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeDict(src.members, Dictionary.Keys.Address(), Dictionary.Values.BigInt(257));
        b_0.storeInt(src.totalWeight, 257);
        b_0.storeInt(src.requiredWeight, 257);
    };
}

async function Multisig_init(members: Dictionary<Address, bigint>, totalWeight: bigint, requiredWeight: bigint) {
    const __code = Cell.fromBase64('te6ccgECGgEABO8AART/APSkE/S88sgLAQIBYgIDArzQAdDTAwFxsKMB+kABINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiFRQUwNvBPhhAvhi2zxVE9s88uCCyPhDAcx/AcoAVTBQNIEBAc8A9ACBAQHPAIEBAc8Aye1UFQQCASAODwNicCHXScIflTAg1wsf3gKSW3/gIYIQ/lGYg7qPCDHbPGwX2zx/4AGCEIPqVZm64wIwcAgFBgL2+EKBAQsrAoEBAUEz9ApvoZQB1wAwkltt4iBu8tCAggC04wHCAPL0+EP4KFQYe1F6B1Uj2zxccFnIcAHLAXMBywFwAcsAEszMyfkAyHIBywFwAcsAEsoHy//J0CDXSYEBC7ry4Igg1wsKIIEE/7ry0ImDCbry4IhwA4BCCgcCItMfAYIQg+pVmbry4IHbPGwXCAkBGEATf1kQJRAjbVnbPAsAwNMfAYIQ/lGYg7ry4IH6QAEg10mBAQu68uCIINcLCiCBBP+68tCJgwm68uCIAfpAASDXSYEBC7ry4Igg1wsKIIEE/7ry0ImDCbry4IgB+gDTH9IA0wfSAAGR1JJtAeJVYALk+EL4Q/goVCDDVFu6VHqYU6nbPHBZyHABywFzAcsBcAHLABLMzMn5AMhyAcsBcAHLABLKB8v/ydAg10mBAQu68uCIINcLCiCBBP+68tCJgwm68uCIB4ERTQjHBRfy9IESkwP4I7wT8vRVAxRDMG1t2zx/CgsBzArQ9AQwbQGCAJO5AYAQ9A9vofLghwGCAJO5IgKAEPQXyAHI9ADJAcxwAcoAVZALUKkg10mBAQu68uCIINcLCiCBBP+68tCJgwm68uCIzxYX9AAVgQEBzwDIBxBGEDVEgNs8yQHMyQwByshxAcoBUAcBygBwAcoCUAUg10mBAQu68uCIINcLCiCBBP+68tCJgwm68uCIzxZQA/oCcAHKaCNus5F/kyRus+KXMzMBcAHKAOMNIW6znH8BygABIG7y0IABzJUxcAHKAOLJAfsADQDEghD+UZiDUAjLH1AGINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiM8WUAQg10mBAQu68uCIINcLCiCBBP+68tCJgwm68uCIzxZY+gLLH8oAywchbrOVfwHKAMyUcDLKAOIAmH8BygDIcAHKAHABygAkbrOdfwHKAAQgbvLQgFAEzJY0A3ABygDiJG6znX8BygAEIG7y0IBQBMyWNANwAcoA4nABygACfwHKAALJWMwCTbykKQa6TAgIXdeXBEEGuFhRBAgn/deWhEwYTdeXBEbZ4qge2eNiDBUQAgEgERIALoEBCyQCgQEBQTP0Cm+hlAHXADCSW23iAgEgExQCAUgYGQIRtyg7Z5tnjYgwFRYAlbd6ME4LnYerpZXPY9CdhzrJUKNs0E4TusalpWyPlmRadeW/vixHME4ECrgDcAzscpnLB1XI5LZYcE4TsunLVmnZbmdB0s2yjN0UkAGA7UTQ1AH4Y9IAAY4VgQEB1wD0BIEBAdcAgQEB1wBVMGwU4Pgo1wsKgwm68uCJ9ASBAQHXAIEBAdcAVSAD0VjbPBcAAiIACjFwVCIDABGwr7tRNDSAAGAAdbJu40NWlwZnM6Ly9RbWVzTTh6cUZuN21hekpReG12WThFaFh0WjFTUW4xV0dQbmYyVm42amF0dnVCgg');
    const __system = Cell.fromBase64('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');
    let builder = beginCell();
    builder.storeRef(__system);
    builder.storeUint(0, 1);
    initMultisig_init_args({ $$type: 'Multisig_init_args', members, totalWeight, requiredWeight })(builder);
    const __data = builder.endCell();
    return { code: __code, data: __data };
}

const Multisig_errors: { [key: number]: { message: string } } = {
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
    4429: { message: `Invalid sender` },
    4755: { message: `Timeout` },
    40810: { message: `Completed` },
    46307: { message: `Not a member` },
}

export class Multisig implements Contract {
    
    static async init(members: Dictionary<Address, bigint>, totalWeight: bigint, requiredWeight: bigint) {
        return await Multisig_init(members, totalWeight, requiredWeight);
    }
    
    static async fromInit(members: Dictionary<Address, bigint>, totalWeight: bigint, requiredWeight: bigint) {
        const init = await Multisig_init(members, totalWeight, requiredWeight);
        const address = contractAddress(0, init);
        return new Multisig(address, init);
    }
    
    static fromAddress(address: Address) {
        return new Multisig(address);
    }
    
    readonly address: Address; 
    readonly init?: { code: Cell, data: Cell };
    readonly abi: ContractABI = {
        errors: Multisig_errors
    };
    
    private constructor(address: Address, init?: { code: Cell, data: Cell }) {
        this.address = address;
        this.init = init;
    }
    
    async send(provider: ContractProvider, via: Sender, args: { value: bigint, bounce?: boolean| null | undefined }, message: Request | Signed) {
        
        let body: Cell | null = null;
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'Request') {
            body = beginCell().store(storeRequest(message)).endCell();
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'Signed') {
            body = beginCell().store(storeSigned(message)).endCell();
        }
        if (body === null) { throw new Error('Invalid message type'); }
        
        await provider.internal(via, { ...args, body: body });
        
    }
    
    async getMember(provider: ContractProvider, address: Address) {
        let builder = new TupleBuilder();
        builder.writeAddress(address);
        let source = (await provider.get('member', builder.build())).stack;
        let result = source.readBigNumberOpt();
        return result;
    }
    
    async getMembers(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('members', builder.build())).stack;
        let result = Dictionary.loadDirect(Dictionary.Keys.Address(), Dictionary.Values.BigInt(257), source.readCellOpt());
        return result;
    }
    
}