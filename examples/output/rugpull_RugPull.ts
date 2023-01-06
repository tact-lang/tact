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
        b_0.storeBit(src.sender);
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
        b_0.storeBit(src.to);
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

export type ChangeOwner = {
    $$type: 'ChangeOwner';
    newOwner: Address;
}

export function storeChangeOwner(src: ChangeOwner) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(3067051791, 32);
        b_0.storeBit(src.newOwner);
    };
}

export function loadChangeOwner(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 3067051791) { throw Error('Invalid prefix'); }
    let _newOwner = sc_0.loadAddress();
    return { $$type: 'ChangeOwner' as const, newOwner: _newOwner };
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

async function RugPull_init(owner: Address, investment: bigint, returns: bigint, fee: bigint) {
    const __init = 'te6ccgEBBgEAagABFP8A9KQT9LzyyAsBAgFiAgMCAs0EBQAJoUrd4AkAAdQAjdNra4OCowBWRmBQKBgihU54sLwICA54AKwICA54AB5ECAgOeACUCAgOeAZQAJZQAJQICA54AB5ECAgOeACXoAZKxmZIDmZM';
    const __code = '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';
    const __system = 'te6cckEBAQEAAwAAAUD20kA0';
    let systemCell = Cell.fromBase64(__system);
    let __tuple: TupleItem[] = [];
    __tuple.push({ type: 'cell', cell: systemCell });
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let initCell = Cell.fromBoc(Buffer.from(__init, 'base64'))[0];
    let system = await ContractSystem.create();
    let executor = await ContractExecutor.create({ code: initCell, data: new Cell() }, system);
    let res = await executor.get('init', __tuple);
    if (!res.success) { throw Error(res.error); }
    if (res.exitCode !== 0 && res.exitCode !== 1) {
        if (RugPull_errors[res.exitCode]) {
            throw new ComputeError(RugPull_errors[res.exitCode].message, res.exitCode, { logs: res.vmLogs });
        } else {
            throw new ComputeError('Exit code: ' + res.exitCode, res.exitCode, { logs: res.vmLogs });
        }
    }
    
    let data = res.stack.readCell();
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
    16059: { message: `Invalid value` },
    40368: { message: `Contract stopped` },
    53296: { message: `Contract not stopped` },
}

export class RugPull implements Contract {
    
    static async init(owner: Address, investment: bigint, returns: bigint, fee: bigint) {
        return await RugPull_init(owner,investment,returns,fee);
    }
    
    static async fromInit(owner: Address, investment: bigint, returns: bigint, fee: bigint) {
        const init = await RugPull_init(owner,investment,returns,fee);
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
    
}