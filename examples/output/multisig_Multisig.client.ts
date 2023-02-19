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
async function Multisig_init(members: Dictionary<Address, bigint>, totalWeight: bigint, requiredWeight: bigint, opts?: { engine?: ExecutorEngine }) {
    const __init = 'te6ccgEBBgEAQgABFP8A9KQT9LzyyAsBAgFiAgMCAs4EBQAJoUrd4AUAAUgAPUMW1wBMjMUERDE1A0gQEBzwD0AIEBAc8AgQEBzwDJg=';
    const __code = 'te6ccgECFgEAA3oAART/APSkE/S88sgLAQIBYgIDAgLLBAUCASAQEQKB0cCHXScIflTAg1wsf3gLQ0wMBcbDAAZF/kXDiAfpAIlBmbwT4YQKRW+AgghD+UZiDuuMCghCD6lWZuuMCMPLAgoGBwIBIA0OBOYw7UTQ1AH4YoEBAdcA9ASBAQHXAIEBAdcAVTBsFATbPDcQmhCJEHhVBfhBbyQQI18DgQELKwKBAQFBM/QKb6GUAdcAMJJbbeIgbvLQgIIAtOMBwgDy9PhC+ChUGHtRegdVI/AYXNs8f3BQQoBCUEJtAts8CAkKCwTQ7UTQ1AH4YoEBAdcA9ASBAQHXAIEBAdcAVTBsFATTHwGCEIPqVZm68uCB2zw3EJoQiRB4VQX4QW8kECNfA/hC+ChUIMNUW7pUephTqfAY2zyBEU0IxwUX8vSBEpMD+CO8E/L0BG1t2zwICQoLAFDTHwGCEP5RmIO68uCB+kABAfpAAQH6ANMf0gDTB9IAAZHUkm0B4lVgAEpwWchwAcsBcwHLAXABywASzMzJ+QDIcgHLAXABywASygfL/8nQAfbIcQHKAVAHAcoAcAHKAlAFzxZQA/oCcAHKaCNusyVus7GOTH8BygDIcAHKAHABygAkbrOdfwHKAAQgbvLQgFAEzJY0A3ABygDiJG6znX8BygAEIG7y0IBQBMyWNANwAcoA4nABygACfwHKAALJWMyXMzMBcAHKAOIhbrMMADrI+EIBzFUwUDSBAQHPAPQAgQEBzwCBAQHPAMntVAAwnH8BygABIG7y0IABzJUxcAHKAOLJAfsAAWP7g4BmRmBgOCqEmoBAMiCihl54sM+gALwICA54AKwICA54AJ5QBkIwuIGoxtnmSA5mTA8AU9hWh6Ahg2gMEASdyAwAh6B7fQ+XBDgMEASdyRAUAIegvkegBkqsgF+AvABUghD+UZiDUAjLH1AGzxZQBM8WWPoCyx/KAMsHIW6zlX8BygDMlHAyygDiAUW8pC9qJoagD8MUCAgOuAegJAgIDrgECAgOuAKpg2CiqB7Z5BICAUgTFAAwNFuBAQtYgQEBQTP0Cm+hlAHXADCSW23iAUG3KD2omhqAPwxQICA64B6AkCAgOuAQICA64AqmDYKbZ5AVAE23ejBOC52Hq6WVz2PQnYc6yVCjbNBOE7rGpaVsj5ZkWnXlv74sRzAACBAjXwM=';
    const __system = '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';
    let systemCell = Cell.fromBase64(__system);
    let builder = new TupleBuilder();
    builder.writeCell(systemCell);
    builder.writeCell(members.size > 0 ? beginCell().storeDictDirect(members, Dictionary.Keys.Address(), Dictionary.Values.BigInt(257)).endCell() : null);
    builder.writeNumber(totalWeight);
    builder.writeNumber(requiredWeight);
    let __stack = builder.build();
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let initCell = Cell.fromBoc(Buffer.from(__init, 'base64'))[0];
    let executor = opts && opts.engine ? opts.engine : getDefaultExecutorEngine();
    let res = await executor.get({ method: 'init', stack: __stack, code: initCell, data: new Cell() });
    if (!res.success) { throw Error(res.error); }
    if (res.exitCode !== 0 && res.exitCode !== 1) {
        if (Multisig_errors[res.exitCode]) {
            throw new ComputeError(Multisig_errors[res.exitCode].message, res.exitCode, { logs: res.logs });
        } else {
            throw new ComputeError('Exit code: ' + res.exitCode, res.exitCode, { logs: res.logs });
        }
    }
    let data = new TupleReader(res.stack).readCell();
    return { code: codeCell, data };
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
    4429: { message: `Invalid sender` },
    4755: { message: `Timeout` },
    40810: { message: `Completed` },
    46307: { message: `Not a member` },
}

export class Multisig implements Contract {
    
    static async init(members: Dictionary<Address, bigint>, totalWeight: bigint, requiredWeight: bigint, opts?: { engine?: ExecutorEngine }) {
        return await Multisig_init(members, totalWeight, requiredWeight, opts);
    }
    
    static async fromInit(members: Dictionary<Address, bigint>, totalWeight: bigint, requiredWeight: bigint, opts?: { engine?: ExecutorEngine }) {
        const init = await Multisig_init(members, totalWeight, requiredWeight, opts);
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