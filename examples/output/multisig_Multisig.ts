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
async function Multisig_init(members: Dictionary<Address, bigint>, totalWeight: bigint, requiredWeight: bigint) {
    const __init = 'te6ccgEBBwEARwABFP8A9KQT9LzyyAsBAgFiAgMCAs4EBQAJoUrd4AUAAUgBG0MW1wBMjMUERDE9s8yYBgAmUDSBAQHPAPQAgQEBzwCBAQHPAA==';
    const __code = 'te6ccgECJQEAA3QAART/APSkE/S88sgLAQIBYgIDAgLLBAUCASAfIAIBzgYHAgEgDQ4EnRwIddJwh+VMCDXCx/eAtDTAwFxsMABkX+RcOIB+kAiUGZvBPhhApFb4CCCEP5RmIO6j5Mw2zwE2zw3EJoQiRB4VQXwG9s84IIQg+pVmbqAjCwoIAAsIG7y0ICADMo+S2zwE2zw3EJoQiRB4VQXwHNs84DDywIIjCQoBHtMfAYIQg+pVmbry4IHbPAsBGMj4QgHMVTDbPMntVAwAUNMfAYIQ/lGYg7ry4IH6QAEB+kABAfoA0x/SANMH0gABkdSSbQHiVWAAJlA0gQEBzwD0AIEBAc8AgQEBzwACAVgPEAIBIBcYAEtXBZyHABywFzAcsBcAHLABLMzMn5AMhyAcsBcAHLABLKB8v/ydCAIBIBESAvcyHEBygFQBwHKAHABygJQBc8WUAP6AnABymgjbrMlbrOxjkZ/AcoAyHABygBwAcoAJG6zmn8BygAE8AFQBMyWNANwAcoA4iRus5p/AcoABPABUATMljQDcAHKAOJwAcoAAn8BygACyVjMlzMzAXABygDiIW6z4w/JAfsAgExQBJRwcAzIzAwHBVCTUAgGRBTbPMmAVABJ/AcoAAfABAcwACjFwAcoAAUJQy88WGfQAF4EBAc8AFYEBAc8AE8oAyEYXEDUY2zzJAcwWAFSCEP5RmINQCMsfUAbPFlAEzxZY+gLLH8oAywchbrOVfwHKAMyUcDLKAOICASAZGgBn18ILeSCBGvgfwhfBQqEGGqLd0qPUwp1PgMeArAiKaEY4KL+XpAiUmB/BHeCfl6Aja2+AtAIBIBscAgEgHR4AUwK0PQEMG0BggCTuQGAEPQPb6Hy4IcBggCTuSICgBD0F8j0AMlVkAvwF4AAxDRbgQELWIEBAUEz9ApvoZQB1wAwkltt4oAAJBAjXwOAAjz4QW8kECNfA4EBCysCgQEBQTP0Cm+hlAHXADCSW23i8AGCALTjAcIA8vT4QvgoVBh7UXoHVSPwGFzwFX9wUEKAQlBCbQLwFoAERvKQu2eKoH4DMIwIBSCEiAQ23KDtnngNQIwBNt3owTgudh6ullc9j0J2HOslQo2zQThO6xqWlbI+WZFp15b++LEcwARbtRNDUAfhi2zxsFCQAJoEBAdcA9ASBAQHXAIEBAdcAVTA=';
    const __system = 'te6cckECQQEABVoAAQHAAQIBIBsCAQW8ncwDART/APSkE/S88sgLBAIBYggFAgJ1BwYATbL0YJwXOw9XSyuex6E7DnWSoUbZoJwndY1LStkfLMi068t/fFiOYAERsL+2zzwE/APgGQICyxEJAgFIDwoCAUgOCwHDIESkyT4I7zy9IIAn2oos/L0+EFvJBAjXwMrgQELIoEBAUEz9ApvoZQB1wAwkltt4vABHIEBC1ANbYEBAfAHUKugUwi+jpk3f3BwgQCCVHmHVHmHVhLbPC9VIG1t8BIH3gmAMAQzIVWDbPMkNARqCEIPqVZlQCMsfB9s8MgABIAIBWDMQAAUbFeACASATEgAB/AIBIBUUACPxC3Sq2s+iyYcGQA54AgmfogwCAUgWOAOPO37cCHXScIflTAg1wsf3gLQ0wMBcbDAAZF/kXDiAfpAIlBmbwT4YQKRW+AgwAAi10nBIbCPB1vbPPAU2zzgwACRMOMN8sCCgGRgXAmD5AYLwIq7m0KbcFGV3J33VjQauMJCjzdPYqIVhGEIIrl9usDm6jwjbPPAV2zzbMeAZGAEYyPhCAcxVsNs8ye1UMQEW7UTQ1AH4Yts8bBwaAUj6QAEB9ASBAQHXAIEBAdcA0gDUAdDbPDcQfBB7EHoQeRB4VQU+AQW82DwcART/APSkE/S88sgLHQIBYiMeAgEgIh8CAUghIABNt3owTgudh6ullc9j0J2HOslQo2zQThO6xqWlbI+WZFp15b++LEcwAQ23KDtnngNQPwERvKQu2eKoH4DMPwICyzckAgEgLiUCASAnJgBn18ILeSCBGvgfwhfBQqEGGqLd0qPUwp1PgMeArAiKaEY4KL+XpAiUmB/BHeCfl6Aja2+AtAIBICsoAgEgKikAjz4QW8kECNfA4EBCysCgQEBQTP0Cm+hlAHXADCSW23i8AGCALTjAcIA8vT4QvgoVBh7UXoHVSPwGFzwFX9wUEKAQlBCbQLwFoAAJBAjXwOACASAtLAAxDRbgQELWIEBAUEz9ApvoZQB1wAwkltt4oABTArQ9AQwbQGCAJO5AYAQ9A9vofLghwGCAJO5IgKAEPQXyPQAyVWQC/AXgAgFYNi8CASAzMAElHBwDMjMDAcFUJNQCAZEFNs8yYDEBQlDLzxYZ9AAXgQEBzwAVgQEBzwATygDIRhcQNRjbPMkBzDIAVIIQ/lGYg1AIyx9QBs8WUATPFlj6AssfygDLByFus5V/AcoAzJRwMsoA4gL3MhxAcoBUAcBygBwAcoCUAXPFlAD+gJwAcpoI26zJW6zsY5GfwHKAMhwAcoAcAHKACRus5p/AcoABPABUATMljQDcAHKAOIkbrOafwHKAATwAVAEzJY0A3ABygDicAHKAAJ/AcoAAslYzJczMwFwAcoA4iFus+MPyQH7AIDU0AAoxcAHKAAASfwHKAAHwAQHMAEtXBZyHABywFzAcsBcAHLABLMzMn5AMhyAcsBcAHLABLKB8v/ydCAIBzjk4AAsIG7y0ICAEnRwIddJwh+VMCDXCx/eAtDTAwFxsMABkX+RcOIB+kAiUGZvBPhhApFb4CCCEP5RmIO6j5Mw2zwE2zw3EJoQiRB4VQXwG9s84IIQg+pVmbqA/Pjw6AzKPkts8BNs8NxCaEIkQeFUF8BzbPOAw8sCCPzs8AR7THwGCEIPqVZm68uCB2zw+ARjI+EIBzFUw2zzJ7VQ9ACZQNIEBAc8A9ACBAQHPAIEBAc8AAFDTHwGCEP5RmIO68uCB+kABAfpAAQH6ANMf0gDTB9IAAZHUkm0B4lVgARbtRNDUAfhi2zxsFEAAJoEBAdcA9ASBAQHXAIEBAdcAVTAIkHB8';
    let systemCell = Cell.fromBase64(__system);
    let builder = new TupleBuilder();
    builder.writeCell(systemCell);
    builder.writeCell(members.size > 0 ? beginCell().storeDictDirect(members, Dictionary.Keys.Address(), Dictionary.Values.BigInt(257)).endCell() : null);
    builder.writeNumber(totalWeight);
    builder.writeNumber(requiredWeight);
    let __stack = builder.build();
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let initCell = Cell.fromBoc(Buffer.from(__init, 'base64'))[0];
    let system = await ContractSystem.create();
    let executor = await ContractExecutor.create({ code: initCell, data: new Cell() }, system);
    let res = await executor.get('init', __stack);
    if (!res.success) { throw Error(res.error); }
    if (res.exitCode !== 0 && res.exitCode !== 1) {
        if (Multisig_errors[res.exitCode]) {
            throw new ComputeError(Multisig_errors[res.exitCode].message, res.exitCode, { logs: res.vmLogs });
        } else {
            throw new ComputeError('Exit code: ' + res.exitCode, res.exitCode, { logs: res.vmLogs });
        }
    }
    
    let data = res.stack.readCell();
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
    
    static async init(members: Dictionary<Address, bigint>, totalWeight: bigint, requiredWeight: bigint) {
        return await Multisig_init(members,totalWeight,requiredWeight);
    }
    
    static async fromInit(members: Dictionary<Address, bigint>, totalWeight: bigint, requiredWeight: bigint) {
        const init = await Multisig_init(members,totalWeight,requiredWeight);
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