import { Cell, Slice, Address, Builder, beginCell, ComputeError, TupleItem, TupleReader, Dictionary, contractAddress, ContractProvider, Sender, Contract, ContractABI, TupleBuilder } from 'ton-core';
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

export type ChangeOwner = {
    $$type: 'ChangeOwner';
    newOwner: Address;
}

export function storeChangeOwner(src: ChangeOwner) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(3067051791, 32);
        b_0.storeAddress(src.newOwner);
    };
}

export function loadChangeOwner(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 3067051791) { throw Error('Invalid prefix'); }
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

export type CanPayout = {
    $$type: 'CanPayout';
    amount: bigint;
}

export function storeCanPayout(src: CanPayout) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(1050587494, 32);
        b_0.storeInt(src.amount, 257);
    };
}

export function loadCanPayout(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 1050587494) { throw Error('Invalid prefix'); }
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

export type CanPayoutResponse = {
    $$type: 'CanPayoutResponse';
    amount: bigint;
    address: Address;
    ok: boolean;
}

export function storeCanPayoutResponse(src: CanPayoutResponse) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(1861678417, 32);
        b_0.storeInt(src.amount, 257);
        b_0.storeAddress(src.address);
        b_0.storeBit(src.ok);
    };
}

export function loadCanPayoutResponse(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 1861678417) { throw Error('Invalid prefix'); }
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

async function Payouts_init(owner: Address, publicKey: bigint) {
    const __init = 'te6ccgEBBgEAMQABFP8A9KQT9LzyyAsBAgFiAgMCAs0EBQAJoUrd4AkAAdQAG9AWRmASzni0CAgOeAZM';
    const __code = 'te6ccgECMAEABN4AART/APSkE/S88sgLAQIBYgIDAgLKBAUCASAuLwIBIAYHAgFiIiMCASAICQIBWBITAgEgCgsCAWoQEQIBIAwNAEf2Q4AOWAuYDlgLgA5YAJZmZk/IBkOQDlgLgA5YAJZQPl/+ToQB907ftwIddJwh+VMCDXCx/eAtDTAwFxsMABkX+RcOIB+kAiUGZvBPhhApFb4CCCEG729VG6jkYw7UTQ1AH4YvpAAQGBAQHXAFlsEgLTHwGCEG729VG68uCBgQEB1wD6QAEB0gBVIDMQNFjwJcj4QgHMWVnPFoEBAc8Aye1UgOAAtCBu8tCAgBnuAgghC2z38Puo46MO1E0NQB+GL6QAEBgQEB1wBZbBIC0x8BghC2z38PuvLggfpAATES8CbI+EIBzFlZzxaBAQHPAMntVODAAJEw4w3ywIIPAG4g10nCH44u7UTQ1AH4YvpAAQGBAQHXAFlsEgKAINchEvAkyPhCAcxZWc8WgQEBzwDJ7VTbMeAwACMbyIByZMhbrOWAW8iWczJ6DGAAuwg10oh10mXIMIAIsIAsY5KA28igH8izzGrAqEFqwJRVbYIIMIAnCCqAhXXGFAzzxZAFN5ZbwJTQaHCAJnIAW8CUEShqgKOEjEzwgCZ1DDQINdKIddJknAg4uLoXwOACASAUFQIBIBscAgEgFhcCASAYGQAVJR/AcoA4HABygCAACRwWfAHgAfcyHEBygFQB/AYcAHKAlAFzxZQA/oCcAHKaCNusyVus7GOPX/wGMhw8Bhw8BgkbrOZf/AYBPACUATMlTQDcPAY4iRus5l/8BgE8AJQBMyVNANw8BjicPAYAn/wGALJWMyWMzMBcPAY4iFus5h/8BgB8AIBzJQxcPAY4skBgGgAFMnQgAAT7AAIBIB0eAgEgICEAAzJgAfUINdJqwLIAY5gAdMHIcJAIsFbsJYBpr9YywWOTCHCYCLBe7CWAaa5WMsFjjshwi8iwTqwlgGmBFjLBY4qIcAtIsArsZaAPjICywWOGSHAXyLAL7GWgD8yAssFmQHAPZPywIbfAeLi4uLi5DEgzzEgqTgCIMMA4wJb8BuAfABAC8BsCodcYMAAtH/IAZRwAcsf3m8AAW+MbW+MAfAN8AyAABTwHYAIBICQlAgEgKisCASAmJwIBICgpAB0cAPIzANazxZYzxbKAMmAAOQC0PQEMIIAoPoBgBD0D2+h8uBkbcj0AMlAA/AggAB0+EFvJBAjXwMixwXy4ISAAAwwgAgEgLC0ACUWfAiMYALE+EFvJDCBPrszghA7msoAvhLy9AHwH/oAgwjXGDDII88WIvoC8Bz5AIIAvRFRJfkQ8vT4QvgoVQLwIfAZf3CAQgTIAYIQPp6xZljLH4EBAc8AyUFAbW3wGoADLPhBbyQwMvhC+Cgl8CHwGQGBEU0CxwXy9AGOK4IA9fz4J28QWKGCEDuaygChI6HCAPL0cIBCi3U3VjY2Vzc48B4QJG1t8BqOHDAxcHCAQovEFscmVhZHkgcGFpZI8B4QNG1t8BrigAC++KO9qJoagD8MX0gAIDAgIDrgCy2CXgRwAlb3ejBOC52Hq6WVz2PQnYc6yVCjbNBOE7rGpaVsj5ZkWnXlv74sRzBOFALHuhMolza1VSFYUsAFgNBOCBnOrTzivzpKFgOsLcTI9lA==';
    const __system = 'te6cckECGAEAAlYAAQHAAQEFoUH1AgEU/wD0pBP0vPLICwMCAWIHBAIBIAYFAHG93owTgudh6ullc9j0J2HOslQo2zQThO6xqWlbI+WZFp15b++LEcwTggZzq084r86ShYDrC3EyPZQAM74o72omhqAPwxfSAAgP0gAIDpACqQNgn4CMAgLLDwgCAWIMCQIBIAsKAAUW3CAAsz4QW8kW4ERTTIlxwXy9IIQBfXhAHD7AiGOH38yIn/IVSCCEG729VFQBMsfEoEBAc8AAc8WygDJ8BCOHSJwyFUgghBu9vVRUATLHxKBAQHPAAHPFsoAyfAQ4oAIBIA4NAAUMDGAAJT4QW8kECNfA38CcIBCWG1t8A+ACASAUEAIB9BMRAfcyHEBygFQB/AOcAHKAlAFzxZQA/oCcAHKaCNusyVus7GOPX/wDshw8A5w8A4kbrOZf/AOBPABUATMlTQDcPAO4iRus5l/8A4E8AFQBMyVNANw8A7icPAOAn/wDgLJWMyWMzMBcPAO4iFus5h/8A4B8AEBzJQxcPAO4skBgEgAE+wAAFSUfwHKAOBwAcoAgAgHUFhUACwgbvLQgIAHFHAh10nCH5UwINcLH94C0NMDAXGwwAGRf5Fw4gH6QCJQZm8E+GECjiww7UTQ1AH4YvpAAQH6QAEB0gBVIGwTVQLwE8j4QgHMVSBazxZYzxbKAMntVOCCED6esWa64wIw8sCCgFwCA7UTQ1AH4YvpAAQH6QAEB0gBVIGwTA9MfAYIQPp6xZrry4IGBAQHXAAExQTDwEsj4QgHMVSBazxZYzxbKAMntVN3DXM0=';
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