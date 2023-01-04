import { Cell, Slice, Address, Builder, beginCell, ComputeError, TupleItem, TupleReader, Dictionary, contractAddress, ContractProvider, Sender, Contract, ContractABI } from 'ton-core';
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
    const _code = source.readCell();
    const _data = source.readCell();
    return { $$type: 'StateInit' as const, code: _code, data: _data };
}

export function packStackStateInit(src: StateInit, __stack: TupleItem[]) {
    __stack.push({ type: 'cell', cell: src.code });
    __stack.push({ type: 'cell', cell: src.data });
}

export function packTupleStateInit(src: StateInit): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'cell', cell: src.code });
    __stack.push({ type: 'cell', cell: src.data });
    return __stack;
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
    const _bounced = source.readBoolean();
    const _sender = source.readAddress();
    const _value = source.readBigNumber();
    const _raw = source.readCell();
    return { $$type: 'Context' as const, bounced: _bounced, sender: _sender, value: _value, raw: _raw };
}

export function packStackContext(src: Context, __stack: TupleItem[]) {
    __stack.push({ type: 'int', value: src.bounced ? -1n : 0n });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.sender).endCell() });
    __stack.push({ type: 'int', value: src.value });
    __stack.push({ type: 'slice', cell: src.raw });
}

export function packTupleContext(src: Context): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'int', value: src.bounced ? -1n : 0n });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.sender).endCell() });
    __stack.push({ type: 'int', value: src.value });
    __stack.push({ type: 'slice', cell: src.raw });
    return __stack;
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
        if (src.body !== null) {
            b_0.storeBit(true);
            b_0.storeRef(src.body);
        } else {
            b_0.storeBit(false);
        }
        if (src.code !== null) {
            b_0.storeBit(true);
            b_0.storeRef(src.code);
        } else {
            b_0.storeBit(false);
        }
        if (src.data !== null) {
            b_0.storeBit(true);
            b_0.storeRef(src.data);
        } else {
            b_0.storeBit(false);
        }
    };
}

export function loadSendParameters(slice: Slice) {
    let sc_0 = slice;
    let _bounce = sc_0.loadBit();
    let _to = sc_0.loadAddress();
    let _value = sc_0.loadIntBig(257);
    let _mode = sc_0.loadIntBig(257);
    let _body: Cell | null = null;
    if (sc_0.loadBit()) {
        _body = sc_0.loadRef();
    }
    let _code: Cell | null = null;
    if (sc_0.loadBit()) {
        _code = sc_0.loadRef();
    }
    let _data: Cell | null = null;
    if (sc_0.loadBit()) {
        _data = sc_0.loadRef();
    }
    return { $$type: 'SendParameters' as const, bounce: _bounce, to: _to, value: _value, mode: _mode, body: _body, code: _code, data: _data };
}

function loadTupleSendParameters(source: TupleReader) {
    const _bounce = source.readBoolean();
    const _to = source.readAddress();
    const _value = source.readBigNumber();
    const _mode = source.readBigNumber();
    const _body = source.readCellOpt();
    const _code = source.readCellOpt();
    const _data = source.readCellOpt();
    return { $$type: 'SendParameters' as const, bounce: _bounce, to: _to, value: _value, mode: _mode, body: _body, code: _code, data: _data };
}

export function packStackSendParameters(src: SendParameters, __stack: TupleItem[]) {
    __stack.push({ type: 'int', value: src.bounce ? -1n : 0n });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.to).endCell() });
    __stack.push({ type: 'int', value: src.value });
    __stack.push({ type: 'int', value: src.mode });
    if (src.body !== null) {
        __stack.push({ type: 'cell', cell: src.body });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.code !== null) {
        __stack.push({ type: 'cell', cell: src.code });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.data !== null) {
        __stack.push({ type: 'cell', cell: src.data });
    } else {
        __stack.push({ type: 'null' });
    }
}

export function packTupleSendParameters(src: SendParameters): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'int', value: src.bounce ? -1n : 0n });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.to).endCell() });
    __stack.push({ type: 'int', value: src.value });
    __stack.push({ type: 'int', value: src.mode });
    if (src.body !== null) {
        __stack.push({ type: 'cell', cell: src.body });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.code !== null) {
        __stack.push({ type: 'cell', cell: src.code });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.data !== null) {
        __stack.push({ type: 'cell', cell: src.data });
    } else {
        __stack.push({ type: 'null' });
    }
    return __stack;
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
    const _newOwner = source.readAddress();
    return { $$type: 'ChangeOwner' as const, newOwner: _newOwner };
}

export function packStackChangeOwner(src: ChangeOwner, __stack: TupleItem[]) {
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.newOwner).endCell() });
}

export function packTupleChangeOwner(src: ChangeOwner): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.newOwner).endCell() });
    return __stack;
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
    const _amount = source.readBigNumber();
    return { $$type: 'CanPayout' as const, amount: _amount };
}

export function packStackCanPayout(src: CanPayout, __stack: TupleItem[]) {
    __stack.push({ type: 'int', value: src.amount });
}

export function packTupleCanPayout(src: CanPayout): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'int', value: src.amount });
    return __stack;
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
    const _amount = source.readBigNumber();
    const _address = source.readAddress();
    const _ok = source.readBoolean();
    return { $$type: 'CanPayoutResponse' as const, amount: _amount, address: _address, ok: _ok };
}

export function packStackCanPayoutResponse(src: CanPayoutResponse, __stack: TupleItem[]) {
    __stack.push({ type: 'int', value: src.amount });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.address).endCell() });
    __stack.push({ type: 'int', value: src.ok ? -1n : 0n });
}

export function packTupleCanPayoutResponse(src: CanPayoutResponse): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'int', value: src.amount });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.address).endCell() });
    __stack.push({ type: 'int', value: src.ok ? -1n : 0n });
    return __stack;
}

async function Payouts_init(owner: Address, publicKey: bigint) {
    const __code = 'te6ccgECNAEABP8AART/APSkE/S88sgLAQIBYgIDAgLKBAUCASAwMQIBIAYHAgFiIiMCASAICQIBWBITAgEgCgsCAWoQEQIBIAwNAEf2Q4AOWAuYDlgLgA5YAJZmZk/IBkOQDlgLgA5YAJZQPl/+ToQB907ftwIddJwh+VMCDXCx/eAtDTAwFxsMABkX+RcOIB+kAiUGZvBPhhApFb4CCCEG729VG6jkYw7UTQ1AH4YvpAAQGBAQHXAFlsEgLTHwGCEG729VG68uCBgQEB1wD6QAEB0gBVIDMQNFjwJsj4QgHMWVnPFoEBAc8Aye1UgOAAtCBu8tCAgBnuAgghC2z38Puo46MO1E0NQB+GL6QAEBgQEB1wBZbBIC0x8BghC2z38PuvLggfpAATES8CfI+EIBzFlZzxaBAQHPAMntVODAAJEw4w3ywIIPAG4g10nCH44u7UTQ1AH4YvpAAQGBAQHXAFlsEgKAINchEvAlyPhCAcxZWc8WgQEBzwDJ7VTbMeAwACMbyIByZMhbrOWAW8iWczJ6DGAAuwg10oh10mXIMIAIsIAsY5KA28igH8izzGrAqEFqwJRVbYIIMIAnCCqAhXXGFAzzxZAFN5ZbwJTQaHCAJnIAW8CUEShqgKOEjEzwgCZ1DDQINdKIddJknAg4uLoXwOACASAUFQIBIBscAgEgFhcCASAYGQAVJR/AcoA4HABygCAACRwWfAHgAfcyHEBygFQB/AYcAHKAlAFzxZQA/oCcAHKaCNusyVus7GOPX/wGMhw8Bhw8BgkbrOZf/AYBPACUATMlTQDcPAY4iRus5l/8BgE8AJQBMyVNANw8BjicPAYAn/wGALJWMyWMzMBcPAY4iFus5h/8BgB8AIBzJQxcPAY4skBgGgAFMnQgAAT7AAIBIB0eAgEgICEAAzJgAfUINdJqwLIAY5gAdMHIcJAIsFbsJYBpr9YywWOTCHCYCLBe7CWAaa5WMsFjjshwi8iwTqwlgGmBFjLBY4qIcAtIsArsZaAPjICywWOGSHAXyLAL7GWgD8yAssFmQHAPZPywIbfAeLi4uLi5DEgzzEgqTgCIMMA4wJb8BuAfABAC8BsCodcYMAAtH/IAZRwAcsf3m8AAW+MbW+MAfAN8AyAABTwHYAIBICQlAgEgKisCASAmJwIBICgpAB0cAPIzANazxZYzxbKAMmAAOQC0PQEMIIAoPoBgBD0D2+h8uBkbcj0AMlAA/AggABsAsjMAlnPFoEBAc8AyYAAdPhBbyQQI18DIscF8uCEgAgEgLC0CASAuLwADDCAAsT4QW8kMIE+uzOCEDuaygC+EvL0AfAf+gCDCNcYMMgjzxYi+gLwHPkAggC9EVEl+RDy9PhC+ChVAvAh8Bl/cIBCBMgBghA+nrFmWMsfgQEBzwDJQUBtbfAagAMs+EFvJDAy+EL4KCXwIfAZAYERTQLHBfL0AY4rggD1/PgnbxBYoYIQO5rKAKEjocIA8vRwgEKLdTdWNjZXNzjwHhAkbW3wGo4cMDFwcIBCi8QWxyZWFkeSBwYWlkjwHhA0bW3wGuKAACRZ8CMxgAgEgMjMAlb3ejBOC52Hq6WVz2PQnYc6yVCjbNBOE7rGpaVsj5ZkWnXlv74sRzBOFALHuhMolza1VSFYUsAFgNBOCBnOrTzivzpKFgOsLcTI9lAAJusG/AigAL7hR3tRNDUAfhi+kABAYEBAdcAWWwS8CSA==';
    const depends = Dictionary.empty(Dictionary.Keys.Uint(16), Dictionary.Values.Cell());
    depends.set(41210, Cell.fromBoc(Buffer.from('te6ccgECGgEAAm4AART/APSkE/S88sgLAQIBYgIDAgLLBAUCASAWFwIBIAYHAgFIDg8CAdQICQIB9AsMAcUcCHXScIflTAg1wsf3gLQ0wMBcbDAAZF/kXDiAfpAIlBmbwT4YQKOLDDtRNDUAfhi+kABAfpAAQHSAFUgbBNVAvAUyPhCAcxVIFrPFljPFsoAye1U4IIQPp6xZrrjAjDywIKAKAAsIG7y0ICAAgO1E0NQB+GL6QAEB+kABAdIAVSBsEwPTHwGCED6esWa68uCBgQEB1wABMUEw8BPI+EIBzFUgWs8WWM8WygDJ7VQAFSUfwHKAOBwAcoAgAfcyHEBygFQB/AOcAHKAlAFzxZQA/oCcAHKaCNusyVus7GOPX/wDshw8A5w8A4kbrOZf/AOBPABUATMlTQDcPAO4iRus5l/8A4E8AFQBMyVNANw8A7icPAOAn/wDgLJWMyWMzMBcPAO4iFus5h/8A4B8AEBzJQxcPAO4skBgDQAE+wACASAQEQAF0tuEAgEgEhMCASAUFQAlPhBbyQQI18DfwJwgEJYbW3wD4AAdHADyMwDWs8WWM8WygDJgAAUMDGAAsz4QW8kW4ERTTIlxwXy9IIQBfXhAHD7AiGOH38yIn/IVSCCEG729VFQBMsfEoEBAc8AAc8WygDJ8BCOHSJwyFUgghBu9vVRUATLHxKBAQHPAAHPFsoAyfAQ4oAAzvijvaiaGoA/DF9IACA/SAAgOkAKpA2CfgJQCAWYYGQAJsOX8BGAAcbL0YJwXOw9XSyuex6E7DnWSoUbZoJwndY1LStkfLMi068t/fFiOYJwQM51aecV+dJQsB1hbiZHsoA==', 'base64'))[0]);
    let systemCell = beginCell().storeDict(depends).endCell();
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'cell', cell: systemCell });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(owner).endCell() });
    __stack.push({ type: 'int', value: publicKey });
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let system = await ContractSystem.create();
    let executor = await ContractExecutor.create({ code: codeCell, data: new Cell() }, system);
    let res = await executor.get('init_Payouts', __stack);
    if (!res.success) { throw Error(res.error); }
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
    
    async send(provider: ContractProvider, via: Sender, args: { value: bigint, bounce?: boolean| null | undefined }, message: CanPayoutResponse | ChangeOwner) {
        
        let body: Cell | null = null;
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
        let __stack: TupleItem[] = [];
        let result = await provider.get('owner', __stack);
        return result.stack.readAddress();
    }
    
}