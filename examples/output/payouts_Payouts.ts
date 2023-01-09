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
    const __code = 'te6ccgECNAEABLMAART/APSkE/S88sgLAQIBYgIDAgLKBAUCASAwMQIBIAYHAgFiHyACAWIICQIBWBARBJlO37cCHXScIflTAg1wsf3gLQ0wMBcbDAAZF/kXDiAfpAIlBmbwT4YQKRW+AgghD/60Deuo+OMNs8Ats8MxA0WPAm2zzgIIIQD0dNA7qDIKDgsAC0IG7y0ICAA00x8BghD/60DeuvLggYEBAdcA+kABAdIAVSAEIo+MMNs8Ats8MRLwJ9s84MAAMgwODQAg0x8BghAPR00DuvLggfpAAQI+jxcg10nCH48O2zwCgCDXIRLwJds82zHgMJEw4vLAgjIOARbI+EIBzFnbPMntVA8AEFnPFoEBAc8AAgEgEhMCASAXGAAVWUfwHKAOBwAcoAgCASAUFQBLHBZyHABywFzAcsBcAHLABLMzMn5AMhyAcsBcAHLABLKB8v/ydCAB9zIcQHKAVAH8BlwAcoCUAXPFlAD+gJwAcpoI26zJW6zsY49f/AZyHDwGXDwGSRus5l/8BkE8AJQBMyVNANw8BniJG6zmX/wGQTwAlAEzJU0A3DwGeJw8BkCf/AZAslYzJYzMwFw8BniIW6zmH/wGQHwAgHMlDFw8BniyQGAWAAT7AAIBIBkaAgEgGxwABTJ0IAADMmAB9Qg10mrAsgBjmAB0wchwkAiwVuwlgGmv1jLBY5MIcJgIsF7sJYBprlYywWOOyHCLyLBOrCWAaYEWMsFjiohwC0iwCuxloA+MgLLBY4ZIcBfIsAvsZaAPzICywWZAcA9k/LAht8B4uLi4uLkMSDPMSCpOAIgwwDjAlvwHIB0BSx/yAGUcAHLH95vAAFvjG1vjAHbPG8iAcmTIW6zlgFvIlnMyegxgHgAQAvAcAqHXGDAAuiDXSiHXSZcgwgAiwgCxjkoDbyKAfyLPMasCoQWrAlFVtgggwgCcIKoCFdcYUDPPFkAU3llvAlNBocIAmcgBbwJQRKGqAo4SMTPCAJnUMNAg10oh10mScCDi4uhfAwIBICEiAgEgKCkCASAjJAIBICYnAAU8B6ABERwA8jMA9s8yYCUAEFrPFljPFsoAAFEAtD0BDBtAYIAoPoBgBD0D2+h8uCHAYIAoPoiAoAQ9BfI9ADJQAPwIYAAdPhBbyQQI18DIscF8uCEgAgEgKisCASAuLwADDCABkz4QW8kMIE+uzOCEDuaygC+EvL0AfAg+gCDCNcYMMgjzxYi+gLwHfkAggC9EVEl+RDy9PhC+ChVAvAi8Bp/cIBCBNs8QUBtbfAbgLAEKyAHbPMktAByCEMQZSd9Yyx+BAQHPAADLPhBbyQwMvhC+Cgl8CLwGgGBEU0CxwXy9AGOK4IA9fz4J28QWKGCEDuaygChI6HCAPL0cIBCi3U3VjY2Vzc48B8QJG1t8BuOHDAxcHCAQovEFscmVhZHkgcGFpZI8B8QNG1t8BvigAAkWfAjMYAENviju2eeBJDIAlb3ejBOC52Hq6WVz2PQnYc6yVCjbNBOE7rGpaVsj5ZkWnXlv74sRzBOFALHuhMolza1VSFYUsAFgNBOCBnOrTzivzpKFgOsLcTI9lAEW7UTQ1AH4Yts8bBIzABT6QAEBgQEB1wBZ';
    const __system = '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';
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