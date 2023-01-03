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

export function packStackSomeGenericStruct(src: SomeGenericStruct, __stack: TupleItem[]) {
    __stack.push({ type: 'int', value: src.value1 });
    __stack.push({ type: 'int', value: src.value2 });
    __stack.push({ type: 'int', value: src.value3 });
    __stack.push({ type: 'int', value: src.value4 });
    __stack.push({ type: 'int', value: src.value5 });
}

export function packTupleSomeGenericStruct(src: SomeGenericStruct): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'int', value: src.value1 });
    __stack.push({ type: 'int', value: src.value2 });
    __stack.push({ type: 'int', value: src.value3 });
    __stack.push({ type: 'int', value: src.value4 });
    __stack.push({ type: 'int', value: src.value5 });
    return __stack;
}

export function unpackStackSomeGenericStruct(slice: TupleReader): SomeGenericStruct {
    const value1 = slice.readBigNumber();
    const value2 = slice.readBigNumber();
    const value3 = slice.readBigNumber();
    const value4 = slice.readBigNumber();
    const value5 = slice.readBigNumber();
    return { $$type: 'SomeGenericStruct', value1: value1, value2: value2, value3: value3, value4: value4, value5: value5 };
}
export function unpackTupleSomeGenericStruct(slice: TupleReader): SomeGenericStruct {
    const value1 = slice.readBigNumber();
    const value2 = slice.readBigNumber();
    const value3 = slice.readBigNumber();
    const value4 = slice.readBigNumber();
    const value5 = slice.readBigNumber();
    return { $$type: 'SomeGenericStruct', value1: value1, value2: value2, value3: value3, value4: value4, value5: value5 };
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
        if (src.a !== null) {
            b_0.storeBit(true);
            b_0.storeInt(src.a, 257);
        } else {
            b_0.storeBit(false);
        }
        if (src.b !== null) {
            b_0.storeBit(true);
            b_0.storeBit(src.b);
        } else {
            b_0.storeBit(false);
        }
        if (src.c !== null) {
            b_0.storeBit(true);
            b_0.storeRef(src.c);
        } else {
            b_0.storeBit(false);
        }
        b_0.storeAddress(src.d);
        let b_1 = new Builder();
        if (src.e !== null) {
            b_1.storeBit(true);
            b_1.store(storeSomeGenericStruct(src.e));
        } else {
            b_1.storeBit(false);
        }
        b_0.storeRef(b_1.endCell());
    };
}

export function loadStructWithOptionals(slice: Slice) {
    let sc_0 = slice;
    let _a: bigint | null = null;
    if (sc_0.loadBit()) {
        _a = sc_0.loadIntBig(257);
    }
    let _b: boolean | null = null;
    if (sc_0.loadBit()) {
        _b = sc_0.loadBit();
    }
    let _c: Cell | null = null;
    if (sc_0.loadBit()) {
        _c = sc_0.loadRef();
    }
    let _d = sc_0.loadMaybeAddress();
    let sc_1 = sc_0.loadRef().beginParse();
    let _e: SomeGenericStruct | null = null;
    if (sc_1.loadBit()) {
        _e = loadSomeGenericStruct(sc_1);
    }
    return { $$type: 'StructWithOptionals' as const, a: _a, b: _b, c: _c, d: _d, e: _e };
}

export function packStackStructWithOptionals(src: StructWithOptionals, __stack: TupleItem[]) {
    if (src.a !== null) {
        __stack.push({ type: 'int', value: src.a });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.b !== null) {
        __stack.push({ type: 'int', value: src.b ? -1n : 0n });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.c !== null) {
        __stack.push({ type: 'cell', cell: src.c });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.d !== null) {
        __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.d).endCell() });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.e !== null) {
        __stack.push({ type: 'tuple', items: packTupleSomeGenericStruct(src.e) });
    } else {
        __stack.push({ type: 'null' });
    }
}

export function packTupleStructWithOptionals(src: StructWithOptionals): TupleItem[] {
    let __stack: TupleItem[] = [];
    if (src.a !== null) {
        __stack.push({ type: 'int', value: src.a });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.b !== null) {
        __stack.push({ type: 'int', value: src.b ? -1n : 0n });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.c !== null) {
        __stack.push({ type: 'cell', cell: src.c });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.d !== null) {
        __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.d).endCell() });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.e !== null) {
        __stack.push({ type: 'tuple', items: packTupleSomeGenericStruct(src.e) });
    } else {
        __stack.push({ type: 'null' });
    }
    return __stack;
}

export function unpackStackStructWithOptionals(slice: TupleReader): StructWithOptionals {
    const a = slice.readBigNumberOpt();
    const b = slice.readBooleanOpt();
    const c = slice.readCellOpt();
    const d = slice.readAddressOpt();
    const e_p = slice.pop();
    const e = e_p.type !== 'tuple' ? null : unpackTupleSomeGenericStruct(new TupleReader(e_p.items));
    return { $$type: 'StructWithOptionals', a: a, b: b, c: c, d: d, e: e };
}
export function unpackTupleStructWithOptionals(slice: TupleReader): StructWithOptionals {
    const a = slice.readBigNumberOpt();
    const b = slice.readBooleanOpt();
    const c = slice.readCellOpt();
    const d = slice.readAddressOpt();
    const e_p = slice.pop();
    const e = e_p.type !== 'tuple' ? null : unpackTupleSomeGenericStruct(new TupleReader(e_p.items));
    return { $$type: 'StructWithOptionals', a: a, b: b, c: c, d: d, e: e };
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
        if (src.a !== null) {
            b_0.storeBit(true);
            b_0.storeInt(src.a, 257);
        } else {
            b_0.storeBit(false);
        }
        if (src.b !== null) {
            b_0.storeBit(true);
            b_0.storeBit(src.b);
        } else {
            b_0.storeBit(false);
        }
        if (src.c !== null) {
            b_0.storeBit(true);
            b_0.storeRef(src.c);
        } else {
            b_0.storeBit(false);
        }
        b_0.storeAddress(src.d);
        let b_1 = new Builder();
        if (src.e !== null) {
            b_1.storeBit(true);
            b_1.store(storeSomeGenericStruct(src.e));
        } else {
            b_1.storeBit(false);
        }
        let b_2 = new Builder();
        if (src.f !== null) {
            b_2.storeBit(true);
            b_2.store(storeStructWithOptionals(src.f));
        } else {
            b_2.storeBit(false);
        }
        b_1.storeRef(b_2.endCell());
        b_0.storeRef(b_1.endCell());
    };
}

export function loadUpdate(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 2676568142) { throw Error('Invalid prefix'); }
    let _a: bigint | null = null;
    if (sc_0.loadBit()) {
        _a = sc_0.loadIntBig(257);
    }
    let _b: boolean | null = null;
    if (sc_0.loadBit()) {
        _b = sc_0.loadBit();
    }
    let _c: Cell | null = null;
    if (sc_0.loadBit()) {
        _c = sc_0.loadRef();
    }
    let _d = sc_0.loadMaybeAddress();
    let sc_1 = sc_0.loadRef().beginParse();
    let _e: SomeGenericStruct | null = null;
    if (sc_1.loadBit()) {
        _e = loadSomeGenericStruct(sc_1);
    }
    let sc_2 = sc_1.loadRef().beginParse();
    let _f: StructWithOptionals | null = null;
    if (sc_2.loadBit()) {
        _f = loadStructWithOptionals(sc_2);
    }
    return { $$type: 'Update' as const, a: _a, b: _b, c: _c, d: _d, e: _e, f: _f };
}

export function packStackUpdate(src: Update, __stack: TupleItem[]) {
    if (src.a !== null) {
        __stack.push({ type: 'int', value: src.a });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.b !== null) {
        __stack.push({ type: 'int', value: src.b ? -1n : 0n });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.c !== null) {
        __stack.push({ type: 'cell', cell: src.c });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.d !== null) {
        __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.d).endCell() });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.e !== null) {
        __stack.push({ type: 'tuple', items: packTupleSomeGenericStruct(src.e) });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.f !== null) {
        __stack.push({ type: 'tuple', items: packTupleStructWithOptionals(src.f) });
    } else {
        __stack.push({ type: 'null' });
    }
}

export function packTupleUpdate(src: Update): TupleItem[] {
    let __stack: TupleItem[] = [];
    if (src.a !== null) {
        __stack.push({ type: 'int', value: src.a });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.b !== null) {
        __stack.push({ type: 'int', value: src.b ? -1n : 0n });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.c !== null) {
        __stack.push({ type: 'cell', cell: src.c });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.d !== null) {
        __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.d).endCell() });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.e !== null) {
        __stack.push({ type: 'tuple', items: packTupleSomeGenericStruct(src.e) });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.f !== null) {
        __stack.push({ type: 'tuple', items: packTupleStructWithOptionals(src.f) });
    } else {
        __stack.push({ type: 'null' });
    }
    return __stack;
}

export function unpackStackUpdate(slice: TupleReader): Update {
    const a = slice.readBigNumberOpt();
    const b = slice.readBooleanOpt();
    const c = slice.readCellOpt();
    const d = slice.readAddressOpt();
    const e_p = slice.pop();
    const e = e_p.type !== 'tuple' ? null : unpackTupleSomeGenericStruct(new TupleReader(e_p.items));
    const f_p = slice.pop();
    const f = f_p.type !== 'tuple' ? null : unpackTupleStructWithOptionals(new TupleReader(f_p.items));
    return { $$type: 'Update', a: a, b: b, c: c, d: d, e: e, f: f };
}
export function unpackTupleUpdate(slice: TupleReader): Update {
    const a = slice.readBigNumberOpt();
    const b = slice.readBooleanOpt();
    const c = slice.readCellOpt();
    const d = slice.readAddressOpt();
    const e_p = slice.pop();
    const e = e_p.type !== 'tuple' ? null : unpackTupleSomeGenericStruct(new TupleReader(e_p.items));
    const f_p = slice.pop();
    const f = f_p.type !== 'tuple' ? null : unpackTupleStructWithOptionals(new TupleReader(f_p.items));
    return { $$type: 'Update', a: a, b: b, c: c, d: d, e: e, f: f };
}
async function ContractWithOptionals_init(a: bigint | null, b: boolean | null, c: Cell | null, d: Address | null, e: SomeGenericStruct | null, f: StructWithOptionals | null) {
    const __code = 'te6ccgECZwEABZ0AART/APSkE/S88sgLAQIBYgIDAgLKBAUCASAUFQIBICAhAgFiBgcCASAICQIBIA4PAgEgCgsCASAMDQAJF8F8AGAADQQRV8F8AGAADQQNV8F8AGAADQQJV8F8AGACASAQEQIBIBITAAsFV8F8AiAACRsUfAOgAAEgAAUbGaACASAWFwIBIEpLAgEgGBkCASAcHQIBIBobAQ20WjtnngKQZAENsKT2zzwFoGQBDbCsts88BWBkAQ22RttnngMwZAIBIB4fAQ2wlXbPPAYgZAENsJ02zzwF4GQCASAiIwIBIC0uAgHUJCUCASApKgOnHAh10nCH5UwINcLH94C0NMDAXGwwAGRf5Fw4gH6QCJQZm8E+GECkVvgIMAAItdJwSGwjxFb2zzwJsj4QgHMVVDbPMntVOCCEJ+JME664wIw8sCCgZDEmAAsIG7y0ICADQNs8Bts8NhCrEJoQiRB4EGdVBPAnyPhCAcxVUNs8ye1UZCcxAvTTHwGCEJ+JME668uCBbQHSAAGWMYEBAdcA3m0B0gABkzHSAN5tAdIAAZIx1N76QCHXCwHDAJEBkjFt4gHUAdBtAdIAAY4nMYEBAdcAgQEB1wCBAQHXANQB0IEBAdcAgQEB1wAwECUQJBAj8AoB3tQw0G0B0gABkTDjDWYoABAQJhAlECQQIwIBICwrAgEgKywABUbwWAAPQgbvLQgG8lgCASAvMAIBIDw9AQ/wNkZgNtnmTDECASA2NwL0JW6WNXBQBsoAnX9QB8oAFYEBAc8AEEXiI26WM3BQA8oAl38BygATygDiIW6UcDLKAJV/AcoAzOIBIG6VMHABywGSzxbiyCNujit/AcoAA/AIEFdQRYEBAc8AEoEBAc8AgQEBzwAByIEBAc8AEoEBAc8AyQHM4w3IIm4yMwAMM3BQA8oAATSVMnBYygCOi38BygAC8A4QVts84skBzMkBzDQB9iRuljRwUAXKAJ1/UAbKABSBAQHPABA04iJulTJwWMoAl38BygASygDiIW6UcDLKAJV/AcoAzOJYIG6VMHABywGSzxbiyCJulTJwWMoAjit/AcoAAvAIEFZQRYEBAc8AEoEBAc8AgQEBzwAByIEBAc8AEoEBAc8AyQHM4jUABskBzAIBIDg5AgEgOjsACRfBW6zgAA0EEVfBW6zgAA0EDVfBW6zgAA0ECVfBW6zgAgEgPj8CASBERQIBIEBBAgEgQkMACwVXwVus4AAJGxRbrOAABRfBYAAJBBFXwWACASBGRwIBIEhJAAkEDVfBYAAJBAlXwWAABwVXwWAABRsUYAIBIExNAgEgWFkCASBOTwIBIFRVAgHHUFECAcdSUwELoSds88B2ZAELoXNs88CGZAELoaNs88B6ZAELofds88CKZAENsAL2zzwH4GQCASBWVwENrJ/tnngQQGQATa3owTgudh6ullc9j0J2HOslQo2zQThO6xqWlbI+WZFp15b++LEcwAIBIFpbAgEgXl8CAWJcXQENsDs2zzwGoGQBC6extnngS2QAB6Vp4CcCAcdgYQIBx2JjAQuiP2zzwG5kAQuia2zzwI5kAQuiu2zzwHJkAQui72zzwJJkAQ7tRNDUAfhiZQHubQHSAAGWMYEBAdcA3m0B0gABkzHSAN5tAdIAAZIx1N76QCHXCwHDAJEBkjFt4gHUAdBtAdIAAY4nMYEBAdcAgQEB1wCBAQHXANQB0IEBAdcAgQEB1wAwECUQJBAj8AoB3tQw0G0B0gABkTDjDRAmECUQJBAjbBZmANoxbQHSAAGWMYEBAdcA3m0B0gABkzHSAN5tAdIAAZIx1N76QCHXCwHDAJEBkjFt4gHUAdBtAdIAAY4oMYEBAdcAgQEB1wCBAQHXANQB0IEBAdcAgQEB1wAwECUQJBAjbBXwCpEw4hUUQzBsFfAM';
    const depends = Dictionary.empty(Dictionary.Keys.Uint(16), Dictionary.Values.Cell());
    let systemCell = beginCell().storeDict(depends).endCell();
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'cell', cell: systemCell });
    if (a !== null) {
        __stack.push({ type: 'int', value: a });
    } else {
        __stack.push({ type: 'null' });
    }
    if (b !== null) {
        __stack.push({ type: 'int', value: b ? -1n : 0n });
    } else {
        __stack.push({ type: 'null' });
    }
    if (c !== null) {
        __stack.push({ type: 'cell', cell: c });
    } else {
        __stack.push({ type: 'null' });
    }
    if (d !== null) {
        __stack.push({ type: 'slice', cell: beginCell().storeAddress(d).endCell() });
    } else {
        __stack.push({ type: 'null' });
    }
    if (e !== null) {
        __stack.push({ type: 'tuple', items: packTupleSomeGenericStruct(e) });
    } else {
        __stack.push({ type: 'null' });
    }
    if (f !== null) {
        __stack.push({ type: 'tuple', items: packTupleStructWithOptionals(f) });
    } else {
        __stack.push({ type: 'null' });
    }
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let system = await ContractSystem.create();
    let executor = await ContractExecutor.create({ code: codeCell, data: new Cell() }, system);
    let res = await executor.get('init_ContractWithOptionals', __stack);
    if (!res.success) { throw Error(res.error); }
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
    
    async send(provider: ContractProvider, via: Sender, args: { value: bigint, bounce?: boolean| null | undefined }, message: null | Update) {
        
        let body: Cell | null = null;
        if (message === null) {
            body = new Cell();
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'Update') {
            body = beginCell().store(storeUpdate(message)).endCell();
        }
        if (body === null) { throw new Error('Invalid message type'); }
        
        await provider.internal(via, { ...args, body: body });
        
    }
    
    async getIsNotNullA(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('isNotNullA', __stack);
        return result.stack.readBoolean();
    }
    
    async getIsNotNullB(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('isNotNullB', __stack);
        return result.stack.readBoolean();
    }
    
    async getIsNotNullC(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('isNotNullC', __stack);
        return result.stack.readBoolean();
    }
    
    async getIsNotNullD(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('isNotNullD', __stack);
        return result.stack.readBoolean();
    }
    
    async getIsNotNullE(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('isNotNullE', __stack);
        return result.stack.readBoolean();
    }
    
    async getIsNotNullF(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('isNotNullF', __stack);
        return result.stack.readBoolean();
    }
    
    async getNullA(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('nullA', __stack);
        return result.stack.readBigNumberOpt();
    }
    
    async getNullB(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('nullB', __stack);
        return result.stack.readBooleanOpt();
    }
    
    async getNullC(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('nullC', __stack);
        return result.stack.readCellOpt();
    }
    
    async getNullD(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('nullD', __stack);
        return result.stack.readAddressOpt();
    }
    
    async getNullE(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('nullE', __stack);
        let pp = result.stack.pop();
        if (pp.type !== 'tuple') { return null; }
        return unpackTupleSomeGenericStruct(new TupleReader(pp.items));
    }
    
    async getNullF(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('nullF', __stack);
        let pp = result.stack.pop();
        if (pp.type !== 'tuple') { return null; }
        return unpackTupleStructWithOptionals(new TupleReader(pp.items));
    }
    
    async getNotNullA(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('notNullA', __stack);
        return result.stack.readBigNumber();
    }
    
    async getNotNullB(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('notNullB', __stack);
        return result.stack.readBoolean();
    }
    
    async getNotNullC(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('notNullC', __stack);
        return result.stack.readCell();
    }
    
    async getNotNullD(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('notNullD', __stack);
        return result.stack.readAddress();
    }
    
    async getNotNullE(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('notNullE', __stack);
        return unpackStackSomeGenericStruct(result.stack);
    }
    
    async getNotNullF(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('notNullF', __stack);
        return unpackStackStructWithOptionals(result.stack);
    }
    
}