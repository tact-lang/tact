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

export type Operation = {
    $$type: 'Operation';
    seqno: bigint;
    amount: bigint;
    target: Address;
}

export function storeOperation(src: Operation) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(src.seqno, 32);
        b_0.storeCoins(src.amount);
        b_0.storeAddress(src.target);
    };
}

export function loadOperation(slice: Slice) {
    let sc_0 = slice;
    let _seqno = sc_0.loadUintBig(32);
    let _amount = sc_0.loadCoins();
    let _target = sc_0.loadAddress();
    return { $$type: 'Operation' as const, seqno: _seqno, amount: _amount, target: _target };
}

function loadTupleOperation(source: TupleReader) {
    const _seqno = source.readBigNumber();
    const _amount = source.readBigNumber();
    const _target = source.readAddress();
    return { $$type: 'Operation' as const, seqno: _seqno, amount: _amount, target: _target };
}

export function packStackOperation(src: Operation, __stack: TupleItem[]) {
    __stack.push({ type: 'int', value: src.seqno });
    __stack.push({ type: 'int', value: src.amount });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.target).endCell() });
}

export function packTupleOperation(src: Operation): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'int', value: src.seqno });
    __stack.push({ type: 'int', value: src.amount });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.target).endCell() });
    return __stack;
}

export type Execute = {
    $$type: 'Execute';
    operation: Operation;
    signature1: Cell;
    signature2: Cell;
    signature3: Cell;
}

export function storeExecute(src: Execute) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(819865922, 32);
        b_0.store(storeOperation(src.operation));
        b_0.storeRef(src.signature1);
        b_0.storeRef(src.signature2);
        b_0.storeRef(src.signature3);
    };
}

export function loadExecute(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 819865922) { throw Error('Invalid prefix'); }
    let _operation = loadOperation(sc_0);
    let _signature1 = sc_0.loadRef();
    let _signature2 = sc_0.loadRef();
    let _signature3 = sc_0.loadRef();
    return { $$type: 'Execute' as const, operation: _operation, signature1: _signature1, signature2: _signature2, signature3: _signature3 };
}

function loadTupleExecute(source: TupleReader) {
    const _operation = loadTupleOperation(source.readTuple());
    const _signature1 = source.readCell();
    const _signature2 = source.readCell();
    const _signature3 = source.readCell();
    return { $$type: 'Execute' as const, operation: _operation, signature1: _signature1, signature2: _signature2, signature3: _signature3 };
}

export function packStackExecute(src: Execute, __stack: TupleItem[]) {
    packStackOperation(src.operation, __stack);
    __stack.push({ type: 'slice', cell: src.signature1 });
    __stack.push({ type: 'slice', cell: src.signature2 });
    __stack.push({ type: 'slice', cell: src.signature3 });
}

export function packTupleExecute(src: Execute): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'tuple', items: packTupleOperation(src.operation) });
    __stack.push({ type: 'slice', cell: src.signature1 });
    __stack.push({ type: 'slice', cell: src.signature2 });
    __stack.push({ type: 'slice', cell: src.signature3 });
    return __stack;
}

export type Executed = {
    $$type: 'Executed';
    seqno: bigint;
}

export function storeExecuted(src: Executed) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(4174937, 32);
        b_0.storeUint(src.seqno, 32);
    };
}

export function loadExecuted(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 4174937) { throw Error('Invalid prefix'); }
    let _seqno = sc_0.loadUintBig(32);
    return { $$type: 'Executed' as const, seqno: _seqno };
}

function loadTupleExecuted(source: TupleReader) {
    const _seqno = source.readBigNumber();
    return { $$type: 'Executed' as const, seqno: _seqno };
}

export function packStackExecuted(src: Executed, __stack: TupleItem[]) {
    __stack.push({ type: 'int', value: src.seqno });
}

export function packTupleExecuted(src: Executed): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'int', value: src.seqno });
    return __stack;
}

async function MultisigContract_init(key1: bigint, key2: bigint, key3: bigint) {
    const __code = 'te6ccgECJwEAAvkAART/APSkE/S88sgLAQIBYgIDAgLLBAUCASAdHgIBIAYHAgFIERICAdQICQIBWAwNAn07ftwIddJwh+VMCDXCx/eAtDTAwFxsMABkX+RcOIB+kAiUGZvBPhhApFb4CCCEDDeKUK64wLAAJEw4w3ywIKAKCwALCBu8tCAgALIw7UTQ1AH4YtMf0//T/9P/VTBsFATTHwGCEDDeKUK68uCB0x/6APpAAUMwA9QB0AHUAdAB1AHQFkMwNhCJEHgQZ1UE8BbI+EIBzFUwUDTLH8v/y//L/8ntVACm+QGC8IXSiDhMAENFiwKAPLIgWfaIA8VTw2VjRDRkaNrJYfJGuo4r7UTQ1AH4YtMf0//T/9P/VTBsFPAVyPhCAcxVMFA0yx/L/8v/y//J7VTbMeAAFVlH8BygDgcAHKAIAgEgDg8B9zIcQHKAVAH8A1wAcoCUAXPFlAD+gJwAcpoI26zJW6zsY49f/ANyHDwDXDwDSRus5l/8A0E8AFQBMyVNANw8A3iJG6zmX/wDQTwAVAEzJU0A3DwDeJw8A0Cf/ANAslYzJYzMwFw8A3iIW6zmH/wDQHwAQHMlDFw8A3iyQGAQACMcATIzFUwUDTLH8v/y//L/8mAABPsAAgEgExQCASAZGgIBIBUWAgEgFxgAEx/MwFwbW1t8A6AACQQI18DgAAcE18DgAAUbDGACASAbHABvRUdUPIVSBQI8sfAfoCAc8WyfkAUgQq+RBSMyn5EFQTN/kQgUT2U2q68vQBggC9EQOwAbDy9PAQgABRfA4AABIAAvvmS/aiaGoA/DFpj+n/6f/p/6qYNgp4CkAgEgHyACASAhIgAJuKx/APgCASAjJAIBICUmAC+w6ftRNDUAfhi0x/T/9P/0/9VMGwU8BOAAL7Dhu1E0NQB+GLTH9P/0//T/1UwbBTwEoAAvsPl7UTQ1AH4YtMf0//T/9P/VTBsFPARgAE2y9GCcFzsPV0srnsehOw51kqFG2aCcJ3WNS0rZHyzItOvLf3xYjmA=';
    const depends = Dictionary.empty(Dictionary.Keys.Uint(16), Dictionary.Values.Cell());
    let systemCell = beginCell().storeDict(depends).endCell();
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'cell', cell: systemCell });
    __stack.push({ type: 'int', value: key1 });
    __stack.push({ type: 'int', value: key2 });
    __stack.push({ type: 'int', value: key3 });
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let system = await ContractSystem.create();
    let executor = await ContractExecutor.create({ code: codeCell, data: new Cell() }, system);
    let res = await executor.get('init_MultisigContract', __stack);
    if (!res.success) { throw Error(res.error); }
    let data = res.stack.readCell();
    return { code: codeCell, data };
}

const MultisigContract_errors: { [key: number]: { message: string } } = {
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
    17654: { message: `Invalid seqno` },
    48401: { message: `Invalid signature` },
}

export class MultisigContract implements Contract {
    
    static async init(key1: bigint, key2: bigint, key3: bigint) {
        return await MultisigContract_init(key1,key2,key3);
    }
    
    static async fromInit(key1: bigint, key2: bigint, key3: bigint) {
        const init = await MultisigContract_init(key1,key2,key3);
        const address = contractAddress(0, init);
        return new MultisigContract(address, init);
    }
    
    static fromAddress(address: Address) {
        return new MultisigContract(address);
    }
    
    readonly address: Address; 
    readonly init?: { code: Cell, data: Cell };
    readonly abi: ContractABI = {
        errors: MultisigContract_errors
    };
    
    private constructor(address: Address, init?: { code: Cell, data: Cell }) {
        this.address = address;
        this.init = init;
    }
    
    async send(provider: ContractProvider, via: Sender, args: { value: bigint, bounce?: boolean| null | undefined }, message: 'Deploy' | Execute) {
        
        let body: Cell | null = null;
        if (message === 'Deploy') {
            body = beginCell().storeUint(0, 32).storeBuffer(Buffer.from(message)).endCell();
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'Execute') {
            body = beginCell().store(storeExecute(message)).endCell();
        }
        if (body === null) { throw new Error('Invalid message type'); }
        
        await provider.internal(via, { ...args, body: body });
        
    }
    
    async getKey1(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('key1', __stack);
        return result.stack.readBigNumber();
    }
    
    async getKey2(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('key2', __stack);
        return result.stack.readBigNumber();
    }
    
    async getKey3(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('key3', __stack);
        return result.stack.readBigNumber();
    }
    
    async getSeqno(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('seqno', __stack);
        return result.stack.readBigNumber();
    }
    
}