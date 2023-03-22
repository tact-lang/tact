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

export type ChangeOwner = {
    $$type: 'ChangeOwner';
    newOwner: Address;
}

export function storeChangeOwner(src: ChangeOwner) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(256331011, 32);
        b_0.storeAddress(src.newOwner);
    };
}

export function loadChangeOwner(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 256331011) { throw Error('Invalid prefix'); }
    let _newOwner = sc_0.loadAddress();
    return { $$type: 'ChangeOwner' as const, newOwner: _newOwner };
}

function loadTupleChangeOwner(source: TupleReader) {
    let _newOwner = source.readAddress();
    return { $$type: 'ChangeOwner' as const, newOwner: _newOwner };
}

function storeTupleChangeOwner(source: ChangeOwner) {
    let builder = new TupleBuilder();
    builder.writeAddress(source.newOwner);
    return builder.build();
}

function dictValueParserChangeOwner(): DictionaryValue<ChangeOwner> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeChangeOwner(src)).endCell());
        },
        parse: (src) => {
            return loadChangeOwner(src.loadRef().beginParse());
        }
    }
}

export type CanPayout = {
    $$type: 'CanPayout';
    amount: bigint;
}

export function storeCanPayout(src: CanPayout) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(3289991647, 32);
        b_0.storeInt(src.amount, 257);
    };
}

export function loadCanPayout(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 3289991647) { throw Error('Invalid prefix'); }
    let _amount = sc_0.loadIntBig(257);
    return { $$type: 'CanPayout' as const, amount: _amount };
}

function loadTupleCanPayout(source: TupleReader) {
    let _amount = source.readBigNumber();
    return { $$type: 'CanPayout' as const, amount: _amount };
}

function storeTupleCanPayout(source: CanPayout) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.amount);
    return builder.build();
}

function dictValueParserCanPayout(): DictionaryValue<CanPayout> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeCanPayout(src)).endCell());
        },
        parse: (src) => {
            return loadCanPayout(src.loadRef().beginParse());
        }
    }
}

export type CanPayoutResponse = {
    $$type: 'CanPayoutResponse';
    amount: bigint;
    address: Address;
    ok: boolean;
}

export function storeCanPayoutResponse(src: CanPayoutResponse) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(4293607646, 32);
        b_0.storeInt(src.amount, 257);
        b_0.storeAddress(src.address);
        b_0.storeBit(src.ok);
    };
}

export function loadCanPayoutResponse(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 4293607646) { throw Error('Invalid prefix'); }
    let _amount = sc_0.loadIntBig(257);
    let _address = sc_0.loadAddress();
    let _ok = sc_0.loadBit();
    return { $$type: 'CanPayoutResponse' as const, amount: _amount, address: _address, ok: _ok };
}

function loadTupleCanPayoutResponse(source: TupleReader) {
    let _amount = source.readBigNumber();
    let _address = source.readAddress();
    let _ok = source.readBoolean();
    return { $$type: 'CanPayoutResponse' as const, amount: _amount, address: _address, ok: _ok };
}

function storeTupleCanPayoutResponse(source: CanPayoutResponse) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.amount);
    builder.writeAddress(source.address);
    builder.writeBoolean(source.ok);
    return builder.build();
}

function dictValueParserCanPayoutResponse(): DictionaryValue<CanPayoutResponse> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeCanPayoutResponse(src)).endCell());
        },
        parse: (src) => {
            return loadCanPayoutResponse(src.loadRef().beginParse());
        }
    }
}

 type Payouts_init_args = {
    $$type: 'Payouts_init_args';
    owner: Address;
    publicKey: bigint;
}

function initPayouts_init_args(src: Payouts_init_args) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeAddress(src.owner);
        b_0.storeInt(src.publicKey, 257);
    };
}

async function Payouts_init(owner: Address, publicKey: bigint) {
    const __code = Cell.fromBase64('te6ccgECJgEABS0AART/APSkE/S88sgLAQIBYgIDAgLKBAUCASAjJAIBIAYHAgFiHyACAUgICQIBYh0eAefQDoaYGAuNhgAMi/yLhxAP0gAJBrpMCAhd15cEQQa4WFEEGE3RDAgn/dWPlwREGE3XlwRKooKYG3gnwwgXwxdqJoagD8MekAAMp4ETYJRwh8FGuFhUGE3XlwRPgSAWiA8S1tnhhkfCGA5j+A5QAs+BHk9qpAoAJWchyAcsBcAHLABLKB8v/ydDwEYD3u2i7ftwIddJwh+VMCDXCx/eApJbf+AhghD/60Deuo6iMdMfAYIQ/+tA3rry4IGBAQHXAPpAAfARAdIAVSBsE9s8f+AhghAPR00Duo6ZMdMfAYIQD0dNA7ry4IH6QAHwETFZ2zwxf+ABwACRMOMNcAsMDQMy+EFvJDAy+EP4KCXbPNs8AYERTQLHBfL0ARUaDgAQ+EIixwXy4IQBJCDXScIfjomAINch2zx/2zHgMBIDQo8dMDFwgEJwi8QWxyZWFkeSBwYWlkjbPBRDMG1t2zzjDRAbDwJcggD1/PgnbxBYoYIQO5rKAKEjocIA8vSAQnCLdTdWNjZXNzjbPBA0FEMwbW3bPBAbAULIcAHLH28AAW+MbW+MAds8byIByZMhbrOWAW8iWczJ6DERALog10oh10mXIMIAIsIAsY5KA28igH8izzGrAqEFqwJRVbYIIMIAnCCqAhXXGFAzzxZAFN5ZbwJTQaHCAJnIAW8CUEShqgKOEjEzwgCZ1DDQINdKIddJknAg4uLoXwMEePhBbyQwgT67M4IQO5rKAL4S8vQB2zz6AIMI1xgwyCPwEc8WIvoC2zz5AIIAvRFRJfkQ8vT4Q/goVQLbPBMUFRYBBNs8FwACyQBiAtD0BDBtAYIAoPoBgBD0D2+h8uCHAYIAoPoiAoAQ9BfIAcj0AMkBzHABygBAA/ATyQJG2zxwgEJ/BMgBghDEGUnfWMsfgQEBzwDJEDRBMBRDMG1t2zwaGwL0INdJqwLIAY5gAdMHIcJAIsFbsJYBpr9YywWOTCHCYCLBe7CWAaa5WMsFjjshwi8iwTqwlgGmBFjLBY4qIcAtIsArsZaAPjICywWOGSHAXyLAL7GWgD8yAssFmQHAPZPywIbfAeLi4uLi5DEgzzEgqTgCIMMA4wJb2zwYGQEQAts8AqHXGDAZAATJ0AAucFnIcAHLAXMBywFwAcsAEszMyfkA8AUB9shxAcoBUAcBygBwAcoCUAXwEc8WUAP6AnABymgjbrMlbrOxjkx/AcoAyHABygBwAcoAJG6znX8BygAEIG7y0IBQBMyWNANwAcoA4iRus51/AcoABCBu8tCAUATMljQDcAHKAOJwAcoAAn8BygACyVjMlzMzAXABygDiIRwANG6znH8BygABIG7y0IABzJUxcAHKAOLJAfsAAENSDXSYEBC7ry4Igg1wsKIIMJuiGBBP+6sfLgiIMJuvLgiYABVVnwEc8WAfARzxaAIBWCEiABnX0gAPgIgMCAgOuALMABk+kAB8BEBgQEB1wBZgABUWfARzxaBAQHPAIAFRvijvaiaGoA/DHpAADKeBE2CUcIfBRrhYVBhN15cET4EgFogPFtnjYQwlAN293owTgudh6ullc9j0J2HOslQo2zQThO6xqWlbI+WZFp15b++LEcwTgQKuANwDOxymcsHVcjktlhwThOy6ctWadluZ0HSzbKM3RSQThQCx7oTKJc2tVUhWFLABYDQTggZzq084r86ShYDrC3EyPZQAAiE=');
    const __system = Cell.fromBase64('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');
    let builder = beginCell();
    builder.storeRef(__system);
    builder.storeUint(0, 1);
    initPayouts_init_args({ $$type: 'Payouts_init_args', owner, publicKey })(builder);
    const __data = builder.endCell();
    return { code: __code, data: __data };
}

const Payouts_errors: { [key: number]: { message: string } } = {
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
    16059: { message: `Invalid value` },
    48401: { message: `Invalid signature` },
    62972: { message: `Invalid balance` },
}

export class Payouts implements Contract {
    
    static async init(owner: Address, publicKey: bigint) {
        return await Payouts_init(owner, publicKey);
    }
    
    static async fromInit(owner: Address, publicKey: bigint) {
        const init = await Payouts_init(owner, publicKey);
        const address = contractAddress(0, init);
        return new Payouts(address, init);
    }
    
    static fromAddress(address: Address) {
        return new Payouts(address);
    }
    
    readonly address: Address; 
    readonly init?: { code: Cell, data: Cell };
    readonly abi: ContractABI = {
        errors: Payouts_errors
    };
    
    private constructor(address: Address, init?: { code: Cell, data: Cell }) {
        this.address = address;
        this.init = init;
    }
    
    async send(provider: ContractProvider, via: Sender, args: { value: bigint, bounce?: boolean| null | undefined }, message: string | CanPayoutResponse | ChangeOwner) {
        
        let body: Cell | null = null;
        if (typeof message === 'string') {
            body = beginCell().storeUint(0, 32).storeStringTail(message).endCell();
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'CanPayoutResponse') {
            body = beginCell().store(storeCanPayoutResponse(message)).endCell();
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'ChangeOwner') {
            body = beginCell().store(storeChangeOwner(message)).endCell();
        }
        if (body === null) { throw new Error('Invalid message type'); }
        
        await provider.internal(via, { ...args, body: body });
        
    }
    
    async getOwner(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('owner', builder.build())).stack;
        let result = source.readAddress();
        return result;
    }
    
}