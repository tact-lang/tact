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
async function Payouts_init(owner: Address, publicKey: bigint) {
    const __init = 'te6ccgEBBwEANgABFP8A9KQT9LzyyAsBAgFiAgMCAs0EBQAJoUrd4AkAAdQBD9AWRmAW2eZMBgAQWc8WgQEBzwA=';
    const __code = 'te6ccgECMwEABLAAART/APSkE/S88sgLAQIBYgIDAgLKBAUCASAvMAIBIAYHAgFIGxwCAWIICQIBWBARBJlO37cCHXScIflTAg1wsf3gLQ0wMBcbDAAZF/kXDiAfpAIlBmbwT4YQKRW+AgghD/60Deuo+OMNs8Ats8MxA0WPAn2zzgIIIQD0dNA7qDEKDgsAC0IG7y0ICAA00x8BghD/60DeuvLggYEBAdcA+kABAdIAVSAEIo+MMNs8Ats8MRLwKNs84MAAMQwODQAg0x8BghAPR00DuvLggfpAAQI+jxcg10nCH48O2zwCgCDXIRLwJts82zHgMJEw4vLAgjEOARbI+EIBzFnbPMntVA8AEFnPFoEBAc8AAEvzgs5DgA5YC5gOWAuADlgAlmZmT8gGQ5AOWAuADlgAllA+X/5OhAIBIBITAgEgFBUCASAYGQL3MhxAcoBUAcBygBwAcoCUAXPFlAD+gJwAcpoI26zJW6zsY5GfwHKAMhwAcoAcAHKACRus5p/AcoABPACUATMljQDcAHKAOIkbrOafwHKAATwAlAEzJY0A3ABygDicAHKAAJ/AcoAAslYzJczMwFwAcoA4iFus+MPyQH7AIBYXAAUydCAAEn8BygAB8AIBzAAKMXABygAAAzJgAfUINdJqwLIAY5gAdMHIcJAIsFbsJYBpr9YywWOTCHCYCLBe7CWAaa5WMsFjjshwi8iwTqwlgGmBFjLBY4qIcAtIsArsZaAPjICywWOGSHAXyLAL7GWgD8yAssFmQHAPZPywIbfAeLi4uLi5DEgzzEgqTgCIMMA4wJb8B2AaABAC8B0CodcYMAIBIB0eAAnaz4EhjAIBIB8gAgEgJygCASAhIgIBICQlAUsf8gBlHAByx/ebwABb4xtb4wB2zxvIgHJkyFus5YBbyJZzMnoMYCMABTwH4AC6INdKIddJlyDCACLCALGOSgNvIoB/Is8xqwKhBasCUVW2CCDCAJwgqgIV1xhQM88WQBTeWW8CU0GhwgCZyAFvAlBEoaoCjhIxM8IAmdQw0CDXSiHXSZJwIOLi6F8DAREcAPIzAPbPMmAmAFEAtD0BDBtAYIAoPoBgBD0D2+h8uCHAYIAoPoiAoAQ9BfI9ADJQAPwIoAAQWs8WWM8WygACASApKgIBICssAB0+EFvJBAjXwMixwXy4ISAAAwwgAZM+EFvJDCBPrszghA7msoAvhLy9AHwIfoAgwjXGDDII88WIvoC8B75AIIAvRFRJfkQ8vT4QvgoVQLwI/Abf3CAQgTbPEFAbW3wHIC0Ayz4QW8kMDL4QvgoJfAj8BsBgRFNAscF8vQBjiuCAPX8+CdvEFihghA7msoAoSOhwgDy9HCAQot1N1Y2Nlc3OPAgECRtbfAcjhwwMXBwgEKLxBbHJlYWR5IHBhaWSPAgEDRtbfAc4oAEKyAHbPMkuAByCEMQZSd9Yyx+BAQHPAAENviju2eeBLDEAlb3ejBOC52Hq6WVz2PQnYc6yVCjbNBOE7rGpaVsj5ZkWnXlv74sRzBOFALHuhMolza1VSFYUsAFgNBOCBnOrTzivzpKFgOsLcTI9lAEW7UTQ1AH4Yts8bBIyABT6QAEBgQEB1wBZ';
    const __system = 'te6cckECUQEABtcAAQHAAQIBIB0CAQW9B9QDART/APSkE/S88sgLBAIBYggFAgEgBwYAcb3ejBOC52Hq6WVz2PQnYc6yVCjbNBOE7rGpaVsj5ZkWnXlv74sRzBOCBnOrTzivzpKFgOsLcTI9lAENviju2eeAjBsCAssSCQIBYg8KAgEgDAsABRbcIAJXPhBbyRbgRFNMiXHBfL0ghAF9eEAcPsCIY6IfzIif9s88BCOhiJw2zzwEOKANDQEMyFUg2zzJDgAqghD/60DeUATLHxKBAQHPAAHPFsoAAgEgERAABQwMYAAlPhBbyQQI18DfwJwgEJYbW3wD4AIBIBUTAvf+Q4gOUAqAOA5QA4AOUBKALniygB/QE4AOU0EbdZkrdZ2McjP4DlAGQ4AOUAOADlABI3Wc0/gOUAAngAqAJmSxoBuADlAHESN1nNP4DlAAJ4AKgCZksaAbgA5QBxOADlAAE/gOUAAWSsZkuZmYC4AOUAcRC3WfGH5ID9gEFEMAEn8BygAB8AEBzAIB1BcWAAsIG7y0ICADfxwIddJwh+VMCDXCx/eAtDTAwFxsMABkX+RcOIB+kAiUGZvBPhhAo8JMNs8VQLwE9s84IIQxBlJ37rjAjDywIKAbGhgDGNs8A9s8MUEw8BLbPBsZGgAm0x8BghDEGUnfuvLggYEBAdcAAQEYyPhCAcxVINs8ye1UNAEW7UTQ1AH4Yts8bBMcABj6QAEB+kABAdIAVSABBb+LxB4BFP8A9KQT9LzyyAsfAgFiIyACASAiIQCVvd6ME4LnYerpZXPY9CdhzrJUKNs0E4TusalpWyPlmRadeW/vixHME4UAse6EyiXNrVVIVhSwAWA0E4IGc6tPOK/OkoWA6wtxMj2UAQ2+KO7Z54EsTwICyjkkAgFIJiUACdrPgSGMAgEgMCcCASAtKAIBICopAMs+EFvJDAy+EL4KCXwI/AbAYERTQLHBfL0AY4rggD1/PgnbxBYoYIQO5rKAKEjocIA8vRwgEKLdTdWNjZXNzjwIBAkbW3wHI4cMDFwcIBCi8QWxyZWFkeSBwYWlkjwIBA0bW3wHOKABkz4QW8kMIE+uzOCEDuaygC+EvL0AfAh+gCDCNcYMMgjzxYi+gLwHvkAggC9EVEl+RDy9PhC+ChVAvAj8Bt/cIBCBNs8QUBtbfAcgKwEKyAHbPMksAByCEMQZSd9Yyx+BAQHPAAIBIC8uAAMMIAAdPhBbyQQI18DIscF8uCEgAgEgNTECASAzMgBRALQ9AQwbQGCAKD6AYAQ9A9vofLghwGCAKD6IgKAEPQXyPQAyUAD8CKABERwA8jMA9s8yYDQAEFrPFljPFsoAAgEgNzYABTwH4AFLH/IAZRwAcsf3m8AAW+MbW+MAds8byIByZMhbrOWAW8iWczJ6DGA4ALog10oh10mXIMIAIsIAsY5KA28igH8izzGrAqEFqwJRVbYIIMIAnCCqAhXXGFAzzxZAFN5ZbwJTQaHCAJnIAW8CUEShqgKOEjEzwgCZ1DDQINdKIddJknAg4uLoXwMCASBGOgIBWEU7AgEgQDwCASA/PQH1CDXSasCyAGOYAHTByHCQCLBW7CWAaa/WMsFjkwhwmAiwXuwlgGmuVjLBY47IcIvIsE6sJYBpgRYywWOKiHALSLAK7GWgD4yAssFjhkhwF8iwC+xloA/MgLLBZkBwD2T8sCG3wHi4uLi4uQxIM8xIKk4AiDDAOMCW/AdgPgAQAvAdAqHXGDAAAzJgAgEgQkEABTJ0IAL3MhxAcoBUAcBygBwAcoCUAXPFlAD+gJwAcpoI26zJW6zsY5GfwHKAMhwAcoAcAHKACRus5p/AcoABPACUATMljQDcAHKAOIkbrOafwHKAATwAlAEzJY0A3ABygDicAHKAAJ/AcoAAslYzJczMwFwAcoA4iFus+MPyQH7AIERDAAoxcAHKAAASfwHKAAHwAgHMAEvzgs5DgA5YC5gOWAuADlgAlmZmT8gGQ5AOWAuADlgAllA+X/5OhAIBYkhHAAtCBu8tCAgEmU7ftwIddJwh+VMCDXCx/eAtDTAwFxsMABkX+RcOIB+kAiUGZvBPhhApFb4CCCEP/rQN66j44w2zwC2zwzEDRY8CfbPOAgghAPR00DuoT05MSQQij4ww2zwC2zwxEvAo2zzgwABPS0xKAj6PFyDXScIfjw7bPAKAINchEvAm2zzbMeAwkTDi8sCCT0wAINMfAYIQD0dNA7ry4IH6QAEBFsj4QgHMWds8ye1UTQAQWc8WgQEBzwAANNMfAYIQ/+tA3rry4IGBAQHXAPpAAQHSAFUgARbtRNDUAfhi2zxsElAAFPpAAQGBAQHXAFlaY8fO';
    let systemCell = Cell.fromBase64(__system);
    let builder = new TupleBuilder();
    builder.writeCell(systemCell);
    builder.writeAddress(owner);
    builder.writeNumber(publicKey);
    let __stack = builder.build();
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let initCell = Cell.fromBoc(Buffer.from(__init, 'base64'))[0];
    let system = await ContractSystem.create();
    let executor = await ContractExecutor.create({ code: initCell, data: new Cell() }, system);
    let res = await executor.get('init', __stack);
    if (!res.success) { throw Error(res.error); }
    if (res.exitCode !== 0 && res.exitCode !== 1) {
        if (Payouts_errors[res.exitCode]) {
            throw new ComputeError(Payouts_errors[res.exitCode].message, res.exitCode, { logs: res.vmLogs });
        } else {
            throw new ComputeError('Exit code: ' + res.exitCode, res.exitCode, { logs: res.vmLogs });
        }
    }
    
    let data = res.stack.readCell();
    return { code: codeCell, data };
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
    4429: { message: `Invalid sender` },
    16059: { message: `Invalid value` },
    48401: { message: `Invalid signature` },
    62972: { message: `Invalid balance` },
}

export class Payouts implements Contract {
    
    static async init(owner: Address, publicKey: bigint) {
        return await Payouts_init(owner,publicKey);
    }
    
    static async fromInit(owner: Address, publicKey: bigint) {
        const init = await Payouts_init(owner,publicKey);
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