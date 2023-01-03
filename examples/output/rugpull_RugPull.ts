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

export function unpackStackStateInit(slice: TupleReader): StateInit {
    const code = slice.readCell();
    const data = slice.readCell();
    return { $$type: 'StateInit', code: code, data: data };
}
export function unpackTupleStateInit(slice: TupleReader): StateInit {
    const code = slice.readCell();
    const data = slice.readCell();
    return { $$type: 'StateInit', code: code, data: data };
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

export function unpackStackContext(slice: TupleReader): Context {
    const bounced = slice.readBoolean();
    const sender = slice.readAddress();
    const value = slice.readBigNumber();
    const raw = slice.readCell();
    return { $$type: 'Context', bounced: bounced, sender: sender, value: value, raw: raw };
}
export function unpackTupleContext(slice: TupleReader): Context {
    const bounced = slice.readBoolean();
    const sender = slice.readAddress();
    const value = slice.readBigNumber();
    const raw = slice.readCell();
    return { $$type: 'Context', bounced: bounced, sender: sender, value: value, raw: raw };
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

export function unpackStackSendParameters(slice: TupleReader): SendParameters {
    const bounce = slice.readBoolean();
    const to = slice.readAddress();
    const value = slice.readBigNumber();
    const mode = slice.readBigNumber();
    const body = slice.readCellOpt();
    const code = slice.readCellOpt();
    const data = slice.readCellOpt();
    return { $$type: 'SendParameters', bounce: bounce, to: to, value: value, mode: mode, body: body, code: code, data: data };
}
export function unpackTupleSendParameters(slice: TupleReader): SendParameters {
    const bounce = slice.readBoolean();
    const to = slice.readAddress();
    const value = slice.readBigNumber();
    const mode = slice.readBigNumber();
    const body = slice.readCellOpt();
    const code = slice.readCellOpt();
    const data = slice.readCellOpt();
    return { $$type: 'SendParameters', bounce: bounce, to: to, value: value, mode: mode, body: body, code: code, data: data };
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

export function packStackChangeOwner(src: ChangeOwner, __stack: TupleItem[]) {
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.newOwner).endCell() });
}

export function packTupleChangeOwner(src: ChangeOwner): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.newOwner).endCell() });
    return __stack;
}

export function unpackStackChangeOwner(slice: TupleReader): ChangeOwner {
    const newOwner = slice.readAddress();
    return { $$type: 'ChangeOwner', newOwner: newOwner };
}
export function unpackTupleChangeOwner(slice: TupleReader): ChangeOwner {
    const newOwner = slice.readAddress();
    return { $$type: 'ChangeOwner', newOwner: newOwner };
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

export function unpackStackRugParams(slice: TupleReader): RugParams {
    const investment = slice.readBigNumber();
    const returns = slice.readBigNumber();
    const fee = slice.readBigNumber();
    return { $$type: 'RugParams', investment: investment, returns: returns, fee: fee };
}
export function unpackTupleRugParams(slice: TupleReader): RugParams {
    const investment = slice.readBigNumber();
    const returns = slice.readBigNumber();
    const fee = slice.readBigNumber();
    return { $$type: 'RugParams', investment: investment, returns: returns, fee: fee };
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
        return unpackStackRugParams(result.stack);
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