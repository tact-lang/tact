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
    const _investment = source.readBigNumber();
    const _returns = source.readBigNumber();
    const _fee = source.readBigNumber();
    return { $$type: 'RugParams' as const, investment: _investment, returns: _returns, fee: _fee };
}

export function packStackRugParams(src: RugParams, __stack: TupleItem[]) {
    __stack.push({ type: 'int', value: src.investment });
    __stack.push({ type: 'int', value: src.returns });
    __stack.push({ type: 'int', value: src.fee });
}

export function packTupleRugParams(src: RugParams): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'int', value: src.investment });
    __stack.push({ type: 'int', value: src.returns });
    __stack.push({ type: 'int', value: src.fee });
    return __stack;
}

async function RugPull_init(owner: Address, investment: bigint, returns: bigint, fee: bigint) {
    const __code = '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';
    const depends = Dictionary.empty(Dictionary.Keys.Uint(16), Dictionary.Values.Cell());
    let systemCell = beginCell().storeDict(depends).endCell();
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'cell', cell: systemCell });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(owner).endCell() });
    __stack.push({ type: 'int', value: investment });
    __stack.push({ type: 'int', value: returns });
    __stack.push({ type: 'int', value: fee });
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let system = await ContractSystem.create();
    let executor = await ContractExecutor.create({ code: codeCell, data: new Cell() }, system);
    let res = await executor.get('init_RugPull', __stack);
    if (!res.success) { throw Error(res.error); }
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
    
    async send(provider: ContractProvider, via: Sender, args: { value: bigint, bounce?: boolean| null | undefined }, message: null | 'withdraw' | 'rugpull' | ChangeOwner | 'Stop') {
        
        let body: Cell | null = null;
        if (message === null) {
            body = new Cell();
        }
        if (message === 'withdraw') {
            body = beginCell().storeUint(0, 32).storeBuffer(Buffer.from(message)).endCell();
        }
        if (message === 'rugpull') {
            body = beginCell().storeUint(0, 32).storeBuffer(Buffer.from(message)).endCell();
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'ChangeOwner') {
            body = beginCell().store(storeChangeOwner(message)).endCell();
        }
        if (message === 'Stop') {
            body = beginCell().storeUint(0, 32).storeBuffer(Buffer.from(message)).endCell();
        }
        if (body === null) { throw new Error('Invalid message type'); }
        
        await provider.internal(via, { ...args, body: body });
        
    }
    
    async getParams(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('params', __stack);
        return loadTupleRugParams(result.stack);
    }
    
    async getOwner(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('owner', __stack);
        return result.stack.readAddress();
    }
    
    async getStopped(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('stopped', __stack);
        return result.stack.readBoolean();
    }
    
}