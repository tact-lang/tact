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
import { ExecutorEngine, getDefaultExecutorEngine } from '@tact-lang/runtime';

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
export type RugParams = {
    $$type: 'RugParams';
    investment: bigint;
    returns: bigint;
    fee: bigint;
}

export function storeRugParams(src: RugParams) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeInt(src.investment, 257);
        b_0.storeInt(src.returns, 257);
        b_0.storeInt(src.fee, 257);
    };
}

export function loadRugParams(slice: Slice) {
    let sc_0 = slice;
    let _investment = sc_0.loadIntBig(257);
    let _returns = sc_0.loadIntBig(257);
    let _fee = sc_0.loadIntBig(257);
    return { $$type: 'RugParams' as const, investment: _investment, returns: _returns, fee: _fee };
}

function loadTupleRugParams(source: TupleReader) {
    let _investment = source.readBigNumber();
    let _returns = source.readBigNumber();
    let _fee = source.readBigNumber();
    return { $$type: 'RugParams' as const, investment: _investment, returns: _returns, fee: _fee };
}

function storeTupleRugParams(source: RugParams) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.investment);
    builder.writeNumber(source.returns);
    builder.writeNumber(source.fee);
    return builder.build();
}

function dictValueParserRugParams(): DictionaryValue<RugParams> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeRugParams(src)).endCell());
        },
        parse: (src) => {
            return loadRugParams(src.loadRef().beginParse());
        }
    }
}
async function RugPull_init(owner: Address, investment: bigint, returns: bigint, fee: bigint, opts?: { engine?: ExecutorEngine }) {
    const __init = 'te6ccgEBBgEAagABFP8A9KQT9LzyyAsBAgFiAgMCAs0EBQAJoUrd4AkAAdQAjdNra4OCowBWRmBQKBgihU54sLwICA54AKwICA54AB5ECAgOeACUCAgOeAZQAJZQAJQICA54AB5ECAgOeACXoAZKxmZIDmZM';
    const __code = 'te6ccgECHgEABiUAART/APSkE/S88sgLAQIBYgIDAvLQ7aLt+3Ah10nCH5UwINcLH94C0NMDAXGwwAGRf5Fw4gH6QCJQZm8E+GHtRNDUAfhi+kABAYEBAdcAgQEB1wDUAdCBAQHXAIEBAdcA0gDSAIEBAdcA1DDQgQEB1wD0BDAQehB5EHhsGgySXwzgKsAAKtdJwSGw4wIqBAUCASAVFgTiOTkQaVUl2zwkjop/KnCDBm1tbds8jtn4QW8kMDKBPrtTuaATvhLy9IEBAVIyIG6VMFn0WjCUQTP0FOIBpFFYoJlTB7xTY6HCALCOoSGBAQEkWfQMb6GSMG3fIG7y0IBRGKEDpFE4F0Mw2zxQBehQVeIOEwYHAvyCEA9HTQO6juk6CNMfAYIQD0dNA7ry4IH6QAExEHoQaRBYEEcQNkVAECNVkNs8bBnI+EIBzFWQUKnPFheBAQHPABWBAQHPAAPIgQEBzwASgQEBzwDKABLKABKBAQHPAAPIgQEBzwAS9ADJWMzJAczJ7VTgCsAAkl8L4w3ywIINCAEQf1lybW1t2zwTAITI+EIBzFWQUKnPFheBAQHPABWBAQHPAAPIgQEBzwASgQEBzwDKABLKABKBAQHPAAPIgQEBzwAS9ADJWMzJAczJ7VQD7Aj5ASCC8AlRkBlK7mEc6JXFUDrfhf2GTeeQV0YUL2CNPrL6rRTkuuMCIILwzeJCxsrFYKmf8tJoPuD7FimoGK7A8RZlEc2CLPINpOq64wKC8Lz693aQfHGcyNN52PGUqqon6Moocc1ZF4FyHyFaRUUBuuMCXwoJCgsCvDAQaVUlEts8JLOUJXD7At5/KnCDBm1tbds8yPhCAcxVkFCpzxYXgQEBzwAVgQEBzwADyIEBAc8AEoEBAc8AygASygASgQEBzwADyIEBAc8AEvQAyVjMyQHMye1U2zENEwGuMBBpVSUSNH9/KnCDBm1tbds8BMj4QgHMVZBQqc8WF4EBAc8AFYEBAc8AA8iBAQHPABKBAQHPAMoAEsoAEoEBAc8AA8iBAQHPABL0AMlYzMkBzMntVNsxEwGWEGlVJRLbPMj4QgHMVZBQqc8WF4EBAc8AFYEBAc8AA8iBAQHPABKBAQHPAMoAEsoAEoEBAc8AA8iBAQHPABL0AMlYzMkBzMntVNsxDAQi2zzbPDN/i3U3RvcHBlZI2zwNDg8QABz4QW8kECNfAyrHBfLghAAQggCdsCSz8vQBQshwAcsfbwABb4xtb4wB2zxvIgHJkyFus5YBbyJZzMnoMREBBts8AxIAuiDXSiHXSZcgwgAiwgCxjkoDbyKAfyLPMasCoQWrAlFVtgggwgCcIKoCFdcYUDPPFkAU3llvAlNBocIAmcgBbwJQRKGqAo4SMTPCAJnUMNAg10oh10mScCDi4uhfAwEk+EFvJBAjXwN/AnCAQlhtbds8EwH2yHEBygFQBwHKAHABygJQBc8WUAP6AnABymgjbrMlbrOxjkx/AcoAyHABygBwAcoAJG6znX8BygAEIG7y0IBQBMyWNANwAcoA4iRus51/AcoABCBu8tCAUATMljQDcAHKAOJwAcoAAn8BygACyVjMlzMzAXABygDiIW6zFAAwnH8BygABIG7y0IABzJUxcAHKAOLJAfsAAgEgFxgCASAbHAGFuhe+1E0NQB+GL6QAEBgQEB1wCBAQHXANQB0IEBAdcAgQEB1wDSANIAgQEB1wDUMNCBAQHXAPQEMBB6EHkQeGwa2zyBkBhbhR3tRNDUAfhi+kABAYEBAdcAgQEB1wDUAdCBAQHXAIEBAdcA0gDSAIEBAdcA1DDQgQEB1wD0BDAQehB5EHhsGts8gaAAgQOV8JAARfCQDdu70YJwXOw9XSyuex6E7DnWSoUbZoJwndY1LStkfLMi068t/fFiOYJwIFXAG4BnY5TOWDquRyWyw4JwoBY90JlEubWqqQrClgAsBoJwQM51aecV+dJQsB1hbiZHsoJwkTBoZqbopDZ+4Ee+BVGPiYAYW4bV7UTQ1AH4YvpAAQGBAQHXAIEBAdcA1AHQgQEB1wCBAQHXANIA0gCBAQHXANQw0IEBAdcA9AQwEHoQeRB4bBrbPIHQAIXwZsEw==';
    const __system = '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';
    let systemCell = Cell.fromBase64(__system);
    let builder = new TupleBuilder();
    builder.writeCell(systemCell);
    builder.writeAddress(owner);
    builder.writeNumber(investment);
    builder.writeNumber(returns);
    builder.writeNumber(fee);
    let __stack = builder.build();
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let initCell = Cell.fromBoc(Buffer.from(__init, 'base64'))[0];
    let executor = opts && opts.engine ? opts.engine : getDefaultExecutorEngine();
    let res = await executor.get({ method: 'init', stack: __stack, code: initCell, data: new Cell() });
    if (!res.success) { throw Error(res.error); }
    if (res.exitCode !== 0 && res.exitCode !== 1) {
        if (RugPull_errors[res.exitCode]) {
            throw new ComputeError(RugPull_errors[res.exitCode].message, res.exitCode, { logs: res.logs });
        } else {
            throw new ComputeError('Exit code: ' + res.exitCode, res.exitCode, { logs: res.logs });
        }
    }
    let data = new TupleReader(res.stack).readCell();
    return { code: codeCell, data };
}

const RugPull_errors: { [key: number]: { message: string } } = {
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
    16059: { message: `Invalid value` },
    40368: { message: `Contract stopped` },
    53296: { message: `Contract not stopped` },
}

export class RugPull implements Contract {
    
    static async init(owner: Address, investment: bigint, returns: bigint, fee: bigint, opts?: { engine?: ExecutorEngine }) {
        return await RugPull_init(owner, investment, returns, fee, opts);
    }
    
    static async fromInit(owner: Address, investment: bigint, returns: bigint, fee: bigint, opts?: { engine?: ExecutorEngine }) {
        const init = await RugPull_init(owner, investment, returns, fee, opts);
        const address = contractAddress(0, init);
        return new RugPull(address, init);
    }
    
    static fromAddress(address: Address) {
        return new RugPull(address);
    }
    
    readonly address: Address; 
    readonly init?: { code: Cell, data: Cell };
    readonly abi: ContractABI = {
        errors: RugPull_errors
    };
    
    private constructor(address: Address, init?: { code: Cell, data: Cell }) {
        this.address = address;
        this.init = init;
    }
    
    async send(provider: ContractProvider, via: Sender, args: { value: bigint, bounce?: boolean| null | undefined }, message: null | 'withdraw' | 'rugpull' | ChangeOwner | 'Stop') {
        
        let body: Cell | null = null;
        if (message === null) {
            body = new Cell();
        }
        if (message === 'withdraw') {
            body = beginCell().storeUint(0, 32).storeStringTail(message).endCell();
        }
        if (message === 'rugpull') {
            body = beginCell().storeUint(0, 32).storeStringTail(message).endCell();
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'ChangeOwner') {
            body = beginCell().store(storeChangeOwner(message)).endCell();
        }
        if (message === 'Stop') {
            body = beginCell().storeUint(0, 32).storeStringTail(message).endCell();
        }
        if (body === null) { throw new Error('Invalid message type'); }
        
        await provider.internal(via, { ...args, body: body });
        
    }
    
    async getParams(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('params', builder.build())).stack;
        const result = loadTupleRugParams(source);
        return result;
    }
    
    async getOwner(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('owner', builder.build())).stack;
        let result = source.readAddress();
        return result;
    }
    
    async getStopped(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('stopped', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
}