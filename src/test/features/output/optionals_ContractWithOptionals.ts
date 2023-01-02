import { Cell, Slice, Address, Builder, beginCell, ComputeError, TupleItem, TupleReader, Dictionary, contractAddress, ContractProvider, Sender } from 'ton-core';
import { ContractSystem, ContractExecutor } from 'ton-emulator';

export type StateInit = {
    $$type: 'StateInit';
    code: Cell;
    data: Cell;
}

export function storeStateInit(src: StateInit) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0 = b_0.storeRef(src.code);
        b_0 = b_0.storeRef(src.data);
    };
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
        b_0 = b_0.storeBit(src.bounced);
        b_0 = b_0.storeAddress(src.sender);
        b_0 = b_0.storeInt(src.value, 257);
        b_0 = b_0.storeRef(src.raw);
    };
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
        b_0 = b_0.storeBit(src.bounce);
        b_0 = b_0.storeAddress(src.to);
        b_0 = b_0.storeInt(src.value, 257);
        b_0 = b_0.storeInt(src.mode, 257);
        if (src.body !== null) {
            b_0 = b_0.storeBit(true);
            b_0 = b_0.storeRef(src.body);
        } else {
            b_0 = b_0.storeBit(false);
        }
        if (src.code !== null) {
            b_0 = b_0.storeBit(true);
            b_0 = b_0.storeRef(src.code);
        } else {
            b_0 = b_0.storeBit(false);
        }
        if (src.data !== null) {
            b_0 = b_0.storeBit(true);
            b_0 = b_0.storeRef(src.data);
        } else {
            b_0 = b_0.storeBit(false);
        }
    };
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
        b_0 = b_0.storeInt(src.value1, 257);
        b_0 = b_0.storeInt(src.value2, 257);
        b_0 = b_0.storeInt(src.value3, 257);
        let b_1 = new Builder();
        b_1 = b_1.storeInt(src.value4, 257);
        b_1 = b_1.storeInt(src.value5, 257);
        b_0 = b_0.storeRef(b_1.endCell());
    };
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
            b_0 = b_0.storeBit(true);
            b_0 = b_0.storeInt(src.a, 257);
        } else {
            b_0 = b_0.storeBit(false);
        }
        if (src.b !== null) {
            b_0 = b_0.storeBit(true);
            b_0 = b_0.storeBit(src.b);
        } else {
            b_0 = b_0.storeBit(false);
        }
        if (src.c !== null) {
            b_0 = b_0.storeBit(true);
            b_0 = b_0.storeRef(src.c);
        } else {
            b_0 = b_0.storeBit(false);
        }
        b_0 = b_0.storeAddress(src.d);
        let b_1 = new Builder();
        if (src.e !== null) {
            b_1 = b_1.storeBit(true);
            b_1 = b_1.store(storeSomeGenericStruct(src.e));
        } else {
            b_1 = b_1.storeBit(false);
        }
        b_0 = b_0.storeRef(b_1.endCell());
    };
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
    const e = e_p.type !== 'tuple' ? null : unpackTupleSomeGenericStruct(new TupleSlice4(e_p.items));
    return { $$type: 'StructWithOptionals', a: a, b: b, c: c, d: d, e: e };
}
export function unpackTupleStructWithOptionals(slice: TupleReader): StructWithOptionals {
    const a = slice.readBigNumberOpt();
    const b = slice.readBooleanOpt();
    const c = slice.readCellOpt();
    const d = slice.readAddressOpt();
    const e_p = slice.pop();
    const e = e_p.type !== 'tuple' ? null : unpackTupleSomeGenericStruct(new TupleSlice4(e_p.items));
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
        b_0 = b_0.storeUint(2676568142, 32);
        if (src.a !== null) {
            b_0 = b_0.storeBit(true);
            b_0 = b_0.storeInt(src.a, 257);
        } else {
            b_0 = b_0.storeBit(false);
        }
        if (src.b !== null) {
            b_0 = b_0.storeBit(true);
            b_0 = b_0.storeBit(src.b);
        } else {
            b_0 = b_0.storeBit(false);
        }
        if (src.c !== null) {
            b_0 = b_0.storeBit(true);
            b_0 = b_0.storeRef(src.c);
        } else {
            b_0 = b_0.storeBit(false);
        }
        b_0 = b_0.storeAddress(src.d);
        let b_1 = new Builder();
        if (src.e !== null) {
            b_1 = b_1.storeBit(true);
            b_1 = b_1.store(storeSomeGenericStruct(src.e));
        } else {
            b_1 = b_1.storeBit(false);
        }
        let b_2 = new Builder();
        if (src.f !== null) {
            b_2 = b_2.storeBit(true);
            b_2 = b_2.store(storeStructWithOptionals(src.f));
        } else {
            b_2 = b_2.storeBit(false);
        }
        b_1 = b_1.storeRef(b_2.endCell());
        b_0 = b_0.storeRef(b_1.endCell());
    };
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
    const e = e_p.type !== 'tuple' ? null : unpackTupleSomeGenericStruct(new TupleSlice4(e_p.items));
    const f_p = slice.pop();
    const f = f_p.type !== 'tuple' ? null : unpackTupleStructWithOptionals(new TupleSlice4(f_p.items));
    return { $$type: 'Update', a: a, b: b, c: c, d: d, e: e, f: f };
}
export function unpackTupleUpdate(slice: TupleReader): Update {
    const a = slice.readBigNumberOpt();
    const b = slice.readBooleanOpt();
    const c = slice.readCellOpt();
    const d = slice.readAddressOpt();
    const e_p = slice.pop();
    const e = e_p.type !== 'tuple' ? null : unpackTupleSomeGenericStruct(new TupleSlice4(e_p.items));
    const f_p = slice.pop();
    const f = f_p.type !== 'tuple' ? null : unpackTupleStructWithOptionals(new TupleSlice4(f_p.items));
    return { $$type: 'Update', a: a, b: b, c: c, d: d, e: e, f: f };
}
async function ContractWithOptionals_init(a: bigint | null, b: boolean | null, c: Cell | null, d: Address | null, e: SomeGenericStruct | null, f: StructWithOptionals | null) {
    const __code = 'te6ccgECPAEABKwAART/APSkE/S88sgLAQIBYgIDAgLMBAUCASAODwIB1AYHAgEgCgsDrxwIddJwh+VMCDXCx/eAtDTAwFxsMABkX+RcOIB+kAiUGZvBPhhApFb4IIQn4kwTrqPoNs8Bts8NhCrEJoQiRB4EGdVBGxmyPhCAcxVUNs8ye1U4DDywIKA5CC4ACwgbvLQgIAL00x8BghCfiTBOuvLggW0B0gABljGBAQHXAN5tAdIAAZMx0gDebQHSAAGSMdTe+kAh1wsBwwCRAZIxbeIB1AHQbQHSAAGOJzGBAQHXAIEBAdcAgQEB1wDUAdCBAQHXAIEBAdcAMBAlECQQI/AKAd7UMNBtAdIAAZEw4w07CQAQECYQJRAkECMCASANDAIBIAwNAAVG8FgAD0IG7y0IBvJYAgEgEBECASAaGwIBIBITAgEgFhcCASAUFQERtFo7Z4vgrdZwOQEVsKT2zwQNV8FbrOA5ARWwrLbPBBFXwVus4DkBEbZG22eNii3WcDkCASAYGQETsJV2zwVXwVus4DkBFbCdNs8ECVfBW6zgOQIBIBwdAgEgKCkCASAeHwIBICQlAgHHICECAcciIwEPoSds8ECVfBY5AROhc2zwQRV8F8AGOQENoaNs8FV8FjkBE6H3bPBA1XwXwAY5AQ2wAvbPGxRgOQIBICYnARGsn+2eL4L4AMA5AE2t6ME4LnYerpZXPY9CdhzrJUKNs0E4TusalpWyPlmRadeW/vixHMACASAqKwIBIDM0AgFiLC0BDbA7Ns8XwWA5AQ+nsbZ42KPgHTkBEaVoDZGYDbZ5ky4C9CVuljVwUAbKAJ1/UAfKABWBAQHPABBF4iNuljNwUAPKAJd/AcoAE8oA4iFulHAyygCVfwHKAMziASBulTBwAcsBks8W4sgjbo4rfwHKAAPwCBBXUEWBAQHPABKBAQHPAIEBAc8AAciBAQHPABKBAQHPAMkBzOMNyCJuLzAADDNwUAPKAAE0lTJwWMoAjot/AcoAAvAOEFbbPOLJAczJAcwxAfYkbpY0cFAFygCdf1AGygAUgQEBzwAQNOIibpUycFjKAJd/AcoAEsoA4iFulHAyygCVfwHKAMziWCBulTBwAcsBks8W4sgibpUycFjKAI4rfwHKAALwCBBWUEWBAQHPABKBAQHPAIEBAc8AAciBAQHPABKBAQHPAMkBzOIyAAbJAcwCAcc1NgIBxzc4AQ+iP2zwQRV8FjkBE6JrbPBAlXwXwAY5AQ+iu2zwQNV8FjkBEaLvbPBVfBfAIjkBDu1E0NQB+GI6Ae5tAdIAAZYxgQEB1wDebQHSAAGTMdIA3m0B0gABkjHU3vpAIdcLAcMAkQGSMW3iAdQB0G0B0gABjicxgQEB1wCBAQHXAIEBAdcA1AHQgQEB1wCBAQHXADAQJRAkECPwCgHe1DDQbQHSAAGRMOMNECYQJRAkECNsFjsA2jFtAdIAAZYxgQEB1wDebQHSAAGTMdIA3m0B0gABkjHU3vpAIdcLAcMAkQGSMW3iAdQB0G0B0gABjigxgQEB1wCBAQHXAIEBAdcA1AHQgQEB1wCBAQHXADAQJRAkECNsFfAKkTDiFRRDMGwV8Aw=';
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

export const ContractWithOptionals_errors: { [key: string]: string } = {
    '2': `Stack undeflow`,
    '3': `Stack overflow`,
    '4': `Integer overflow`,
    '5': `Integer out of expected range`,
    '6': `Invalid opcode`,
    '7': `Type check error`,
    '8': `Cell overflow`,
    '9': `Cell underflow`,
    '10': `Dictionary error`,
    '13': `Out of gas error`,
    '32': `Method ID not found`,
    '34': `Action is invalid or not supported`,
    '37': `Not enough TON`,
    '38': `Not enough extra-currencies`,
    '128': `Null reference exception`,
    '129': `Invalid serialization prefix`,
    '130': `Invalid incoming message`,
    '131': `Constraints error`,
    '132': `Access denied`,
    '133': `Contract stopped`,
    '134': `Invalid argument`,
}

export class ContractWithOptionals {
    
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
    private constructor(address: Address, init?: { code: Cell, data: Cell }) {
        this.address = address;
        this.init = init;
    }
    
    async send(provider: ContractProvider, via: Sender, args: { value: bigint, bounce?: boolean| null | undefined }, message: Update) {
        
        let body: Cell | null = null;
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'Update') {
            body = beginCell().store(storeUpdate(message)).endCell();
        }
        if (body === null) { throw new Error('Invalid message type'); }
        
        await provider.internal(via, { ...args, body: body });
        
    }
    
    async getIsNotNullA(provider: ContractProvider) {
        try {
            let __stack: TupleItem[] = [];
            let result = await provider.get('isNotNullA', __stack);
            return result.stack.readBoolean();
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (ContractWithOptionals_errors[e.exitCode.toString()]) {
                    throw new Error(ContractWithOptionals_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
    async getIsNotNullB(provider: ContractProvider) {
        try {
            let __stack: TupleItem[] = [];
            let result = await provider.get('isNotNullB', __stack);
            return result.stack.readBoolean();
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (ContractWithOptionals_errors[e.exitCode.toString()]) {
                    throw new Error(ContractWithOptionals_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
    async getIsNotNullC(provider: ContractProvider) {
        try {
            let __stack: TupleItem[] = [];
            let result = await provider.get('isNotNullC', __stack);
            return result.stack.readBoolean();
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (ContractWithOptionals_errors[e.exitCode.toString()]) {
                    throw new Error(ContractWithOptionals_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
    async getIsNotNullD(provider: ContractProvider) {
        try {
            let __stack: TupleItem[] = [];
            let result = await provider.get('isNotNullD', __stack);
            return result.stack.readBoolean();
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (ContractWithOptionals_errors[e.exitCode.toString()]) {
                    throw new Error(ContractWithOptionals_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
    async getIsNotNullE(provider: ContractProvider) {
        try {
            let __stack: TupleItem[] = [];
            let result = await provider.get('isNotNullE', __stack);
            return result.stack.readBoolean();
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (ContractWithOptionals_errors[e.exitCode.toString()]) {
                    throw new Error(ContractWithOptionals_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
    async getIsNotNullF(provider: ContractProvider) {
        try {
            let __stack: TupleItem[] = [];
            let result = await provider.get('isNotNullF', __stack);
            return result.stack.readBoolean();
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (ContractWithOptionals_errors[e.exitCode.toString()]) {
                    throw new Error(ContractWithOptionals_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
    async getNullA(provider: ContractProvider) {
        try {
            let __stack: TupleItem[] = [];
            let result = await provider.get('nullA', __stack);
            return result.stack.readBigNumberOpt();
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (ContractWithOptionals_errors[e.exitCode.toString()]) {
                    throw new Error(ContractWithOptionals_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
    async getNullB(provider: ContractProvider) {
        try {
            let __stack: TupleItem[] = [];
            let result = await provider.get('nullB', __stack);
            return result.stack.readBooleanOpt();
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (ContractWithOptionals_errors[e.exitCode.toString()]) {
                    throw new Error(ContractWithOptionals_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
    async getNullC(provider: ContractProvider) {
        try {
            let __stack: TupleItem[] = [];
            let result = await provider.get('nullC', __stack);
            return result.stack.readCellOpt();
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (ContractWithOptionals_errors[e.exitCode.toString()]) {
                    throw new Error(ContractWithOptionals_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
    async getNullD(provider: ContractProvider) {
        try {
            let __stack: TupleItem[] = [];
            let result = await provider.get('nullD', __stack);
            return result.stack.readAddressOpt();
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (ContractWithOptionals_errors[e.exitCode.toString()]) {
                    throw new Error(ContractWithOptionals_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
    async getNullE(provider: ContractProvider) {
        try {
            let __stack: TupleItem[] = [];
            let result = await provider.get('nullE', __stack);
            let pp = result.stack.pop();
            if (pp.type !== 'tuple') { return null; }
            return unpackTupleSomeGenericStruct(new TupleSlice4(pp.items));
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (ContractWithOptionals_errors[e.exitCode.toString()]) {
                    throw new Error(ContractWithOptionals_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
    async getNullF(provider: ContractProvider) {
        try {
            let __stack: TupleItem[] = [];
            let result = await provider.get('nullF', __stack);
            let pp = result.stack.pop();
            if (pp.type !== 'tuple') { return null; }
            return unpackTupleStructWithOptionals(new TupleSlice4(pp.items));
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (ContractWithOptionals_errors[e.exitCode.toString()]) {
                    throw new Error(ContractWithOptionals_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
    async getNotNullA(provider: ContractProvider) {
        try {
            let __stack: TupleItem[] = [];
            let result = await provider.get('notNullA', __stack);
            return result.stack.readBigNumber();
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (ContractWithOptionals_errors[e.exitCode.toString()]) {
                    throw new Error(ContractWithOptionals_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
    async getNotNullB(provider: ContractProvider) {
        try {
            let __stack: TupleItem[] = [];
            let result = await provider.get('notNullB', __stack);
            return result.stack.readBoolean();
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (ContractWithOptionals_errors[e.exitCode.toString()]) {
                    throw new Error(ContractWithOptionals_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
    async getNotNullC(provider: ContractProvider) {
        try {
            let __stack: TupleItem[] = [];
            let result = await provider.get('notNullC', __stack);
            return result.stack.readCell();
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (ContractWithOptionals_errors[e.exitCode.toString()]) {
                    throw new Error(ContractWithOptionals_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
    async getNotNullD(provider: ContractProvider) {
        try {
            let __stack: TupleItem[] = [];
            let result = await provider.get('notNullD', __stack);
            return result.stack.readAddress();
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (ContractWithOptionals_errors[e.exitCode.toString()]) {
                    throw new Error(ContractWithOptionals_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
    async getNotNullE(provider: ContractProvider) {
        try {
            let __stack: TupleItem[] = [];
            let result = await provider.get('notNullE', __stack);
            return unpackStackSomeGenericStruct(result.stack);
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (ContractWithOptionals_errors[e.exitCode.toString()]) {
                    throw new Error(ContractWithOptionals_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
    async getNotNullF(provider: ContractProvider) {
        try {
            let __stack: TupleItem[] = [];
            let result = await provider.get('notNullF', __stack);
            return unpackStackStructWithOptionals(result.stack);
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (ContractWithOptionals_errors[e.exitCode.toString()]) {
                    throw new Error(ContractWithOptionals_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
}