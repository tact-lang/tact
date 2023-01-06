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

export type SomeGenericStruct = {
    $$type: 'SomeGenericStruct';
    value1: bigint;
    value2: bigint;
    value3: bigint;
    value4: bigint;
    value5: bigint;
}

export function storeSomeGenericStruct(src: SomeGenericStruct) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeInt(src.value1, 257);
        b_0.storeInt(src.value2, 257);
        b_0.storeInt(src.value3, 257);
        let b_1 = new Builder();
        b_1.storeInt(src.value4, 257);
        b_1.storeInt(src.value5, 257);
        b_0.storeRef(b_1.endCell());
    };
}

export function loadSomeGenericStruct(slice: Slice) {
    let sc_0 = slice;
    let _value1 = sc_0.loadIntBig(257);
    let _value2 = sc_0.loadIntBig(257);
    let _value3 = sc_0.loadIntBig(257);
    let sc_1 = sc_0.loadRef().beginParse();
    let _value4 = sc_1.loadIntBig(257);
    let _value5 = sc_1.loadIntBig(257);
    return { $$type: 'SomeGenericStruct' as const, value1: _value1, value2: _value2, value3: _value3, value4: _value4, value5: _value5 };
}

export type StructWithOptionals = {
    $$type: 'StructWithOptionals';
    a: bigint | null;
    b: boolean | null;
    c: Cell | null;
    d: Address | null;
    e: SomeGenericStruct | null;
}

export function storeStructWithOptionals(src: StructWithOptionals) {
    return (builder: Builder) => {
        let b_0 = builder;
        if (src.a !== null && src.a !== undefined) { b_0.storeBit(true).storeInt(src.a, 257); } else { b_0.storeBit(false); }
        if (src.b !== null && src.b !== undefined) { b_0.storeBit(true).storeBit(src.b); } else { b_0.storeBit(false); }
        if (src.c !== null && src.c !== undefined) { b_0.storeBit(true).storeRef(src.c); } else { b_0.storeBit(false); }
        if (src.d !== null && src.d !== undefined) { b_0.storeBit(true).storeAddress(src.d); } else { b_0.storeBit(false); }
        let b_1 = new Builder();
        if (src.e !== null) { b_1.storeBit(true); storeSomeGenericStruct(src.e, b_1); } else { b_1.storeBit(false); }
        b_0.storeRef(b_1.endCell());
    };
}

export function loadStructWithOptionals(slice: Slice) {
    let sc_0 = slice;
    let _a = sc_0.loadBit() ? sc_0.loadIntBig(257) : null;
    let _b = sc_0.loadBit() ? sc_0.loadBit() : null;
    let _c = sc_0.loadBit() ? sc_0.loadRef() : null;
    let _d = sc_0.loadBit() ? sc_0.loadAddress() : null;
    let sc_1 = sc_0.loadRef().beginParse();
    _e = sc_1.loadBit() ? loadSomeGenericStruct(sc_1) : null;
    return { $$type: 'StructWithOptionals' as const, a: _a, b: _b, c: _c, d: _d, e: _e };
}

export type Update = {
    $$type: 'Update';
    a: bigint | null;
    b: boolean | null;
    c: Cell | null;
    d: Address | null;
    e: SomeGenericStruct | null;
    f: StructWithOptionals | null;
}

export function storeUpdate(src: Update) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(2676568142, 32);
        if (src.a !== null && src.a !== undefined) { b_0.storeBit(true).storeInt(src.a, 257); } else { b_0.storeBit(false); }
        if (src.b !== null && src.b !== undefined) { b_0.storeBit(true).storeBit(src.b); } else { b_0.storeBit(false); }
        if (src.c !== null && src.c !== undefined) { b_0.storeBit(true).storeRef(src.c); } else { b_0.storeBit(false); }
        if (src.d !== null && src.d !== undefined) { b_0.storeBit(true).storeAddress(src.d); } else { b_0.storeBit(false); }
        let b_1 = new Builder();
        if (src.e !== null) { b_1.storeBit(true); storeSomeGenericStruct(src.e, b_1); } else { b_1.storeBit(false); }
        let b_2 = new Builder();
        if (src.f !== null) { b_2.storeBit(true); storeStructWithOptionals(src.f, b_2); } else { b_2.storeBit(false); }
        b_1.storeRef(b_2.endCell());
        b_0.storeRef(b_1.endCell());
    };
}

export function loadUpdate(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 2676568142) { throw Error('Invalid prefix'); }
    let _a = sc_0.loadBit() ? sc_0.loadIntBig(257) : null;
    let _b = sc_0.loadBit() ? sc_0.loadBit() : null;
    let _c = sc_0.loadBit() ? sc_0.loadRef() : null;
    let _d = sc_0.loadBit() ? sc_0.loadAddress() : null;
    let sc_1 = sc_0.loadRef().beginParse();
    _e = sc_1.loadBit() ? loadSomeGenericStruct(sc_1) : null;
    let sc_2 = sc_1.loadRef().beginParse();
    _f = sc_2.loadBit() ? loadStructWithOptionals(sc_2) : null;
    return { $$type: 'Update' as const, a: _a, b: _b, c: _c, d: _d, e: _e, f: _f };
}

async function ContractWithOptionals_init(a: bigint | null, b: boolean | null, c: Cell | null, d: Address | null, e: SomeGenericStruct | null, f: StructWithOptionals | null) {
    const __init = 'te6ccgECEAEAAWsAART/APSkE/S88sgLAQIBYgIDAgLMBAUAFaFK3APgFgPgHeAfAAHcAgEgBgcCAVgICQIBIAoLAAUbyWAAFQgbpIwbeDwCm8FgAAlW8l8AuAIBIAwNABUIG6SMG3g8A1vBYALZAbIzAYlbrObf1AHygAVgQEBzwCYNXBQBsoAEEXiI26zl38BygATygCWM3BQA8oA4iFus5V/AcoAzJRwMsoA4gEgbpUwcAHLAZLPFuLIIm6zlTJwWMoA4w3II26zljNwUAPKAOMNyVjMyQHMyYA8OAch/AcoAAyBu8tCAbyUQVyRus5t/UAbKABSBAQHPAJg0cFAFygAQNOIibrOXfwHKABLKAJUycFjKAOIhbrOVfwHKAMyUcDLKAOIBIG6VMHABywGSzxbiyCJus5UycFjKAOMNyQHMDwBgfwHKAAIgbvLQgG8lEFZQRYEBAc8AEoEBAc8AgQEBzwAByIEBAc8AEoEBAc8AyQHM';
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
        if (ContractWithOptionals_errors[res.exitCode]) {
            throw new ComputeError(ContractWithOptionals_errors[res.exitCode].message, res.exitCode, { logs: res.vmLogs });
        } else {
            throw new ComputeError('Exit code: ' + res.exitCode, res.exitCode, { logs: res.vmLogs });
        }
    }
    
    let data = res.stack.readCell();
    return { code: codeCell, data };
}

const ContractWithOptionals_errors: { [key: number]: { message: string } } = {
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
}

export class ContractWithOptionals implements Contract {
    
    static async init(a: bigint | null, b: boolean | null, c: Cell | null, d: Address | null, e: SomeGenericStruct | null, f: StructWithOptionals | null) {
        return await ContractWithOptionals_init(a,b,c,d,e,f);
    }
    
    static async fromInit(a: bigint | null, b: boolean | null, c: Cell | null, d: Address | null, e: SomeGenericStruct | null, f: StructWithOptionals | null) {
        const init = await ContractWithOptionals_init(a,b,c,d,e,f);
        const address = contractAddress(0, init);
        return new ContractWithOptionals(address, init);
    }
    
    static fromAddress(address: Address) {
        return new ContractWithOptionals(address);
    }
    
    readonly address: Address; 
    readonly init?: { code: Cell, data: Cell };
    readonly abi: ContractABI = {
        errors: ContractWithOptionals_errors
    };
    
    private constructor(address: Address, init?: { code: Cell, data: Cell }) {
        this.address = address;
        this.init = init;
    }
    
}