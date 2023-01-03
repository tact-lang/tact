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
export type SetIntMap1 = {
    $$type: 'SetIntMap1';
    key: bigint;
    value: bigint | null;
}

export function storeSetIntMap1(src: SetIntMap1) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(1056067080, 32);
        b_0.storeInt(src.key, 257);
        if (src.value !== null) {
            b_0.storeBit(true);
            b_0.storeInt(src.value, 257);
        } else {
            b_0.storeBit(false);
        }
    };
}

export function loadSetIntMap1(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 1056067080) { throw Error('Invalid prefix'); }
    let _key = sc_0.loadIntBig(257);
    let _value: bigint | null = null;
    if (sc_0.loadBit()) {
        _value = sc_0.loadIntBig(257);
    }
    return { $$type: 'SetIntMap1' as const, key: _key, value: _value };
}

export function packStackSetIntMap1(src: SetIntMap1, __stack: TupleItem[]) {
    __stack.push({ type: 'int', value: src.key });
    if (src.value !== null) {
        __stack.push({ type: 'int', value: src.value });
    } else {
        __stack.push({ type: 'null' });
    }
}

export function packTupleSetIntMap1(src: SetIntMap1): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'int', value: src.key });
    if (src.value !== null) {
        __stack.push({ type: 'int', value: src.value });
    } else {
        __stack.push({ type: 'null' });
    }
    return __stack;
}

export function unpackStackSetIntMap1(slice: TupleReader): SetIntMap1 {
    const key = slice.readBigNumber();
    const value = slice.readBigNumberOpt();
    return { $$type: 'SetIntMap1', key: key, value: value };
}
export function unpackTupleSetIntMap1(slice: TupleReader): SetIntMap1 {
    const key = slice.readBigNumber();
    const value = slice.readBigNumberOpt();
    return { $$type: 'SetIntMap1', key: key, value: value };
}
export type SetIntMap2 = {
    $$type: 'SetIntMap2';
    key: bigint;
    value: boolean | null;
}

export function storeSetIntMap2(src: SetIntMap2) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(2818252722, 32);
        b_0.storeInt(src.key, 257);
        if (src.value !== null) {
            b_0.storeBit(true);
            b_0.storeBit(src.value);
        } else {
            b_0.storeBit(false);
        }
    };
}

export function loadSetIntMap2(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 2818252722) { throw Error('Invalid prefix'); }
    let _key = sc_0.loadIntBig(257);
    let _value: boolean | null = null;
    if (sc_0.loadBit()) {
        _value = sc_0.loadBit();
    }
    return { $$type: 'SetIntMap2' as const, key: _key, value: _value };
}

export function packStackSetIntMap2(src: SetIntMap2, __stack: TupleItem[]) {
    __stack.push({ type: 'int', value: src.key });
    if (src.value !== null) {
        __stack.push({ type: 'int', value: src.value ? -1n : 0n });
    } else {
        __stack.push({ type: 'null' });
    }
}

export function packTupleSetIntMap2(src: SetIntMap2): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'int', value: src.key });
    if (src.value !== null) {
        __stack.push({ type: 'int', value: src.value ? -1n : 0n });
    } else {
        __stack.push({ type: 'null' });
    }
    return __stack;
}

export function unpackStackSetIntMap2(slice: TupleReader): SetIntMap2 {
    const key = slice.readBigNumber();
    const value = slice.readBooleanOpt();
    return { $$type: 'SetIntMap2', key: key, value: value };
}
export function unpackTupleSetIntMap2(slice: TupleReader): SetIntMap2 {
    const key = slice.readBigNumber();
    const value = slice.readBooleanOpt();
    return { $$type: 'SetIntMap2', key: key, value: value };
}
export type SetIntMap3 = {
    $$type: 'SetIntMap3';
    key: bigint;
    value: Cell | null;
}

export function storeSetIntMap3(src: SetIntMap3) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(3506188068, 32);
        b_0.storeInt(src.key, 257);
        if (src.value !== null) {
            b_0.storeBit(true);
            b_0.storeRef(src.value);
        } else {
            b_0.storeBit(false);
        }
    };
}

export function loadSetIntMap3(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 3506188068) { throw Error('Invalid prefix'); }
    let _key = sc_0.loadIntBig(257);
    let _value: Cell | null = null;
    if (sc_0.loadBit()) {
        _value = sc_0.loadRef();
    }
    return { $$type: 'SetIntMap3' as const, key: _key, value: _value };
}

export function packStackSetIntMap3(src: SetIntMap3, __stack: TupleItem[]) {
    __stack.push({ type: 'int', value: src.key });
    if (src.value !== null) {
        __stack.push({ type: 'cell', cell: src.value });
    } else {
        __stack.push({ type: 'null' });
    }
}

export function packTupleSetIntMap3(src: SetIntMap3): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'int', value: src.key });
    if (src.value !== null) {
        __stack.push({ type: 'cell', cell: src.value });
    } else {
        __stack.push({ type: 'null' });
    }
    return __stack;
}

export function unpackStackSetIntMap3(slice: TupleReader): SetIntMap3 {
    const key = slice.readBigNumber();
    const value = slice.readCellOpt();
    return { $$type: 'SetIntMap3', key: key, value: value };
}
export function unpackTupleSetIntMap3(slice: TupleReader): SetIntMap3 {
    const key = slice.readBigNumber();
    const value = slice.readCellOpt();
    return { $$type: 'SetIntMap3', key: key, value: value };
}
export type SetIntMap4 = {
    $$type: 'SetIntMap4';
    key: bigint;
    value: SomeStruct | null;
}

export function storeSetIntMap4(src: SetIntMap4) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(1318632071, 32);
        b_0.storeInt(src.key, 257);
        if (src.value !== null) {
            b_0.storeBit(true);
            b_0.store(storeSomeStruct(src.value));
        } else {
            b_0.storeBit(false);
        }
    };
}

export function loadSetIntMap4(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 1318632071) { throw Error('Invalid prefix'); }
    let _key = sc_0.loadIntBig(257);
    let _value: SomeStruct | null = null;
    if (sc_0.loadBit()) {
        _value = loadSomeStruct(sc_0);
    }
    return { $$type: 'SetIntMap4' as const, key: _key, value: _value };
}

export function packStackSetIntMap4(src: SetIntMap4, __stack: TupleItem[]) {
    __stack.push({ type: 'int', value: src.key });
    if (src.value !== null) {
        __stack.push({ type: 'tuple', items: packTupleSomeStruct(src.value) });
    } else {
        __stack.push({ type: 'null' });
    }
}

export function packTupleSetIntMap4(src: SetIntMap4): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'int', value: src.key });
    if (src.value !== null) {
        __stack.push({ type: 'tuple', items: packTupleSomeStruct(src.value) });
    } else {
        __stack.push({ type: 'null' });
    }
    return __stack;
}

export function unpackStackSetIntMap4(slice: TupleReader): SetIntMap4 {
    const key = slice.readBigNumber();
    const value_p = slice.pop();
    const value = value_p.type !== 'tuple' ? null : unpackTupleSomeStruct(new TupleReader(value_p.items));
    return { $$type: 'SetIntMap4', key: key, value: value };
}
export function unpackTupleSetIntMap4(slice: TupleReader): SetIntMap4 {
    const key = slice.readBigNumber();
    const value_p = slice.pop();
    const value = value_p.type !== 'tuple' ? null : unpackTupleSomeStruct(new TupleReader(value_p.items));
    return { $$type: 'SetIntMap4', key: key, value: value };
}
export type SetAddrMap1 = {
    $$type: 'SetAddrMap1';
    key: Address;
    value: bigint | null;
}

export function storeSetAddrMap1(src: SetAddrMap1) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(3295239033, 32);
        b_0.storeAddress(src.key);
        if (src.value !== null) {
            b_0.storeBit(true);
            b_0.storeInt(src.value, 257);
        } else {
            b_0.storeBit(false);
        }
    };
}

export function loadSetAddrMap1(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 3295239033) { throw Error('Invalid prefix'); }
    let _key = sc_0.loadAddress();
    let _value: bigint | null = null;
    if (sc_0.loadBit()) {
        _value = sc_0.loadIntBig(257);
    }
    return { $$type: 'SetAddrMap1' as const, key: _key, value: _value };
}

export function packStackSetAddrMap1(src: SetAddrMap1, __stack: TupleItem[]) {
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.key).endCell() });
    if (src.value !== null) {
        __stack.push({ type: 'int', value: src.value });
    } else {
        __stack.push({ type: 'null' });
    }
}

export function packTupleSetAddrMap1(src: SetAddrMap1): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.key).endCell() });
    if (src.value !== null) {
        __stack.push({ type: 'int', value: src.value });
    } else {
        __stack.push({ type: 'null' });
    }
    return __stack;
}

export function unpackStackSetAddrMap1(slice: TupleReader): SetAddrMap1 {
    const key = slice.readAddress();
    const value = slice.readBigNumberOpt();
    return { $$type: 'SetAddrMap1', key: key, value: value };
}
export function unpackTupleSetAddrMap1(slice: TupleReader): SetAddrMap1 {
    const key = slice.readAddress();
    const value = slice.readBigNumberOpt();
    return { $$type: 'SetAddrMap1', key: key, value: value };
}
export type SetAddrMap2 = {
    $$type: 'SetAddrMap2';
    key: Address;
    value: boolean | null;
}

export function storeSetAddrMap2(src: SetAddrMap2) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(1566575299, 32);
        b_0.storeAddress(src.key);
        if (src.value !== null) {
            b_0.storeBit(true);
            b_0.storeBit(src.value);
        } else {
            b_0.storeBit(false);
        }
    };
}

export function loadSetAddrMap2(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 1566575299) { throw Error('Invalid prefix'); }
    let _key = sc_0.loadAddress();
    let _value: boolean | null = null;
    if (sc_0.loadBit()) {
        _value = sc_0.loadBit();
    }
    return { $$type: 'SetAddrMap2' as const, key: _key, value: _value };
}

export function packStackSetAddrMap2(src: SetAddrMap2, __stack: TupleItem[]) {
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.key).endCell() });
    if (src.value !== null) {
        __stack.push({ type: 'int', value: src.value ? -1n : 0n });
    } else {
        __stack.push({ type: 'null' });
    }
}

export function packTupleSetAddrMap2(src: SetAddrMap2): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.key).endCell() });
    if (src.value !== null) {
        __stack.push({ type: 'int', value: src.value ? -1n : 0n });
    } else {
        __stack.push({ type: 'null' });
    }
    return __stack;
}

export function unpackStackSetAddrMap2(slice: TupleReader): SetAddrMap2 {
    const key = slice.readAddress();
    const value = slice.readBooleanOpt();
    return { $$type: 'SetAddrMap2', key: key, value: value };
}
export function unpackTupleSetAddrMap2(slice: TupleReader): SetAddrMap2 {
    const key = slice.readAddress();
    const value = slice.readBooleanOpt();
    return { $$type: 'SetAddrMap2', key: key, value: value };
}
export type SetAddrMap3 = {
    $$type: 'SetAddrMap3';
    key: Address;
    value: Cell | null;
}

export function storeSetAddrMap3(src: SetAddrMap3) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(711408213, 32);
        b_0.storeAddress(src.key);
        if (src.value !== null) {
            b_0.storeBit(true);
            b_0.storeRef(src.value);
        } else {
            b_0.storeBit(false);
        }
    };
}

export function loadSetAddrMap3(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 711408213) { throw Error('Invalid prefix'); }
    let _key = sc_0.loadAddress();
    let _value: Cell | null = null;
    if (sc_0.loadBit()) {
        _value = sc_0.loadRef();
    }
    return { $$type: 'SetAddrMap3' as const, key: _key, value: _value };
}

export function packStackSetAddrMap3(src: SetAddrMap3, __stack: TupleItem[]) {
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.key).endCell() });
    if (src.value !== null) {
        __stack.push({ type: 'cell', cell: src.value });
    } else {
        __stack.push({ type: 'null' });
    }
}

export function packTupleSetAddrMap3(src: SetAddrMap3): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.key).endCell() });
    if (src.value !== null) {
        __stack.push({ type: 'cell', cell: src.value });
    } else {
        __stack.push({ type: 'null' });
    }
    return __stack;
}

export function unpackStackSetAddrMap3(slice: TupleReader): SetAddrMap3 {
    const key = slice.readAddress();
    const value = slice.readCellOpt();
    return { $$type: 'SetAddrMap3', key: key, value: value };
}
export function unpackTupleSetAddrMap3(slice: TupleReader): SetAddrMap3 {
    const key = slice.readAddress();
    const value = slice.readCellOpt();
    return { $$type: 'SetAddrMap3', key: key, value: value };
}
export type SetAddrMap4 = {
    $$type: 'SetAddrMap4';
    key: Address;
    value: SomeStruct | null;
}

export function storeSetAddrMap4(src: SetAddrMap4) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(3020140534, 32);
        b_0.storeAddress(src.key);
        if (src.value !== null) {
            b_0.storeBit(true);
            b_0.store(storeSomeStruct(src.value));
        } else {
            b_0.storeBit(false);
        }
    };
}

export function loadSetAddrMap4(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 3020140534) { throw Error('Invalid prefix'); }
    let _key = sc_0.loadAddress();
    let _value: SomeStruct | null = null;
    if (sc_0.loadBit()) {
        _value = loadSomeStruct(sc_0);
    }
    return { $$type: 'SetAddrMap4' as const, key: _key, value: _value };
}

export function packStackSetAddrMap4(src: SetAddrMap4, __stack: TupleItem[]) {
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.key).endCell() });
    if (src.value !== null) {
        __stack.push({ type: 'tuple', items: packTupleSomeStruct(src.value) });
    } else {
        __stack.push({ type: 'null' });
    }
}

export function packTupleSetAddrMap4(src: SetAddrMap4): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.key).endCell() });
    if (src.value !== null) {
        __stack.push({ type: 'tuple', items: packTupleSomeStruct(src.value) });
    } else {
        __stack.push({ type: 'null' });
    }
    return __stack;
}

export function unpackStackSetAddrMap4(slice: TupleReader): SetAddrMap4 {
    const key = slice.readAddress();
    const value_p = slice.pop();
    const value = value_p.type !== 'tuple' ? null : unpackTupleSomeStruct(new TupleReader(value_p.items));
    return { $$type: 'SetAddrMap4', key: key, value: value };
}
export function unpackTupleSetAddrMap4(slice: TupleReader): SetAddrMap4 {
    const key = slice.readAddress();
    const value_p = slice.pop();
    const value = value_p.type !== 'tuple' ? null : unpackTupleSomeStruct(new TupleReader(value_p.items));
    return { $$type: 'SetAddrMap4', key: key, value: value };
}
export type SomeStruct = {
    $$type: 'SomeStruct';
    value: bigint;
}

export function storeSomeStruct(src: SomeStruct) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeInt(src.value, 257);
    };
}

export function loadSomeStruct(slice: Slice) {
    let sc_0 = slice;
    let _value = sc_0.loadIntBig(257);
    return { $$type: 'SomeStruct' as const, value: _value };
}

export function packStackSomeStruct(src: SomeStruct, __stack: TupleItem[]) {
    __stack.push({ type: 'int', value: src.value });
}

export function packTupleSomeStruct(src: SomeStruct): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'int', value: src.value });
    return __stack;
}

export function unpackStackSomeStruct(slice: TupleReader): SomeStruct {
    const value = slice.readBigNumber();
    return { $$type: 'SomeStruct', value: value };
}
export function unpackTupleSomeStruct(slice: TupleReader): SomeStruct {
    const value = slice.readBigNumber();
    return { $$type: 'SomeStruct', value: value };
}
async function MapTestContract_init() {
    const __code = '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';
    const depends = Dictionary.empty(Dictionary.Keys.Uint(16), Dictionary.Values.Cell());
    let systemCell = beginCell().storeDict(depends).endCell();
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'cell', cell: systemCell });
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let system = await ContractSystem.create();
    let executor = await ContractExecutor.create({ code: codeCell, data: new Cell() }, system);
    let res = await executor.get('init_MapTestContract', __stack);
    if (!res.success) { throw Error(res.error); }
    let data = res.stack.readCell();
    return { code: codeCell, data };
}

const MapTestContract_errors: { [key: number]: { message: string } } = {
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

export class MapTestContract implements Contract {
    
    static async init() {
        return await MapTestContract_init();
    }
    
    static async fromInit() {
        const init = await MapTestContract_init();
        const address = contractAddress(0, init);
        return new MapTestContract(address, init);
    }
    
    static fromAddress(address: Address) {
        return new MapTestContract(address);
    }
    
    readonly address: Address; 
    readonly init?: { code: Cell, data: Cell };
    readonly abi: ContractABI = {
        errors: MapTestContract_errors
    };
    
    private constructor(address: Address, init?: { code: Cell, data: Cell }) {
        this.address = address;
        this.init = init;
    }
    
    async send(provider: ContractProvider, via: Sender, args: { value: bigint, bounce?: boolean| null | undefined }, message: null | SetIntMap1 | SetIntMap2 | SetIntMap3 | SetIntMap4 | SetAddrMap1 | SetAddrMap2 | SetAddrMap3 | SetAddrMap4) {
        
        let body: Cell | null = null;
        if (message === null) {
            body = new Cell();
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'SetIntMap1') {
            body = beginCell().store(storeSetIntMap1(message)).endCell();
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'SetIntMap2') {
            body = beginCell().store(storeSetIntMap2(message)).endCell();
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'SetIntMap3') {
            body = beginCell().store(storeSetIntMap3(message)).endCell();
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'SetIntMap4') {
            body = beginCell().store(storeSetIntMap4(message)).endCell();
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'SetAddrMap1') {
            body = beginCell().store(storeSetAddrMap1(message)).endCell();
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'SetAddrMap2') {
            body = beginCell().store(storeSetAddrMap2(message)).endCell();
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'SetAddrMap3') {
            body = beginCell().store(storeSetAddrMap3(message)).endCell();
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'SetAddrMap4') {
            body = beginCell().store(storeSetAddrMap4(message)).endCell();
        }
        if (body === null) { throw new Error('Invalid message type'); }
        
        await provider.internal(via, { ...args, body: body });
        
    }
    
    async getIntMap1(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('intMap1', __stack);
        return result.stack.readCellOpt();
    }
    
    async getIntMap1Value(provider: ContractProvider, key: bigint) {
        let __stack: TupleItem[] = [];
        __stack.push({ type: 'int', value: key });
        let result = await provider.get('intMap1Value', __stack);
        return result.stack.readBigNumberOpt();
    }
    
    async getIntMap2(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('intMap2', __stack);
        return result.stack.readCellOpt();
    }
    
    async getIntMap2Value(provider: ContractProvider, key: bigint) {
        let __stack: TupleItem[] = [];
        __stack.push({ type: 'int', value: key });
        let result = await provider.get('intMap2Value', __stack);
        return result.stack.readBooleanOpt();
    }
    
    async getIntMap3(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('intMap3', __stack);
        return result.stack.readCellOpt();
    }
    
    async getIntMap3Value(provider: ContractProvider, key: bigint) {
        let __stack: TupleItem[] = [];
        __stack.push({ type: 'int', value: key });
        let result = await provider.get('intMap3Value', __stack);
        return result.stack.readCellOpt();
    }
    
    async getIntMap4(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('intMap4', __stack);
        return result.stack.readCellOpt();
    }
    
    async getIntMap4Value(provider: ContractProvider, key: bigint) {
        let __stack: TupleItem[] = [];
        __stack.push({ type: 'int', value: key });
        let result = await provider.get('intMap4Value', __stack);
        let pp = result.stack.pop();
        if (pp.type !== 'tuple') { return null; }
        return unpackTupleSomeStruct(new TupleReader(pp.items));
    }
    
    async getAddrMap1(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('addrMap1', __stack);
        return result.stack.readCellOpt();
    }
    
    async getAddrMap1Value(provider: ContractProvider, key: Address) {
        let __stack: TupleItem[] = [];
        __stack.push({ type: 'slice', cell: beginCell().storeAddress(key).endCell() });
        let result = await provider.get('addrMap1Value', __stack);
        return result.stack.readBigNumberOpt();
    }
    
    async getAddrMap2(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('addrMap2', __stack);
        return result.stack.readCellOpt();
    }
    
    async getAddrMap2Value(provider: ContractProvider, key: Address) {
        let __stack: TupleItem[] = [];
        __stack.push({ type: 'slice', cell: beginCell().storeAddress(key).endCell() });
        let result = await provider.get('addrMap2Value', __stack);
        return result.stack.readBooleanOpt();
    }
    
    async getAddrMap3(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('addrMap3', __stack);
        return result.stack.readCellOpt();
    }
    
    async getAddrMap3Value(provider: ContractProvider, key: Address) {
        let __stack: TupleItem[] = [];
        __stack.push({ type: 'slice', cell: beginCell().storeAddress(key).endCell() });
        let result = await provider.get('addrMap3Value', __stack);
        return result.stack.readCellOpt();
    }
    
    async getAddrMap4(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('addrMap4', __stack);
        return result.stack.readCellOpt();
    }
    
    async getAddrMap4Value(provider: ContractProvider, key: Address) {
        let __stack: TupleItem[] = [];
        __stack.push({ type: 'slice', cell: beginCell().storeAddress(key).endCell() });
        let result = await provider.get('addrMap4Value', __stack);
        let pp = result.stack.pop();
        if (pp.type !== 'tuple') { return null; }
        return unpackTupleSomeStruct(new TupleReader(pp.items));
    }
    
}