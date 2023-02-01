import { Cell, Slice, Address, Builder, beginCell, ComputeError, TupleItem, TupleReader, Dictionary, contractAddress, ContractProvider, Sender, Contract, ContractABI, TupleBuilder, DictionaryValue } from 'ton-core';
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

function dictValueParserStateInit(): DictionaryValue<StateInit> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeStateInit(src)).endCell());
        },
        parse: (src) => {
            return loadStateInit(src.loadRef().beginParse());
        }
    }
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

function dictValueParserContext(): DictionaryValue<Context> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeContext(src)).endCell());
        },
        parse: (src) => {
            return loadContext(src.loadRef().beginParse());
        }
    }
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

function dictValueParserSendParameters(): DictionaryValue<SendParameters> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeSendParameters(src)).endCell());
        },
        parse: (src) => {
            return loadSendParameters(src.loadRef().beginParse());
        }
    }
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

function loadTupleSomeGenericStruct(source: TupleReader) {
    let _value1 = source.readBigNumber();
    let _value2 = source.readBigNumber();
    let _value3 = source.readBigNumber();
    let _value4 = source.readBigNumber();
    let _value5 = source.readBigNumber();
    return { $$type: 'SomeGenericStruct' as const, value1: _value1, value2: _value2, value3: _value3, value4: _value4, value5: _value5 };
}

function storeTupleSomeGenericStruct(source: SomeGenericStruct) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.value1);
    builder.writeNumber(source.value2);
    builder.writeNumber(source.value3);
    builder.writeNumber(source.value4);
    builder.writeNumber(source.value5);
    return builder.build();
}

function dictValueParserSomeGenericStruct(): DictionaryValue<SomeGenericStruct> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeSomeGenericStruct(src)).endCell());
        },
        parse: (src) => {
            return loadSomeGenericStruct(src.loadRef().beginParse());
        }
    }
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
        b_0.storeAddress(src.d);
        let b_1 = new Builder();
        if (src.e !== null && src.e !== undefined) { b_1.storeBit(true); b_1.store(storeSomeGenericStruct(src.e)); } else { b_1.storeBit(false); }
        b_0.storeRef(b_1.endCell());
    };
}

export function loadStructWithOptionals(slice: Slice) {
    let sc_0 = slice;
    let _a = sc_0.loadBit() ? sc_0.loadIntBig(257) : null;
    let _b = sc_0.loadBit() ? sc_0.loadBit() : null;
    let _c = sc_0.loadBit() ? sc_0.loadRef() : null;
    let _d = sc_0.loadMaybeAddress();
    let sc_1 = sc_0.loadRef().beginParse();
    let _e = sc_1.loadBit() ? loadSomeGenericStruct(sc_1) : null;
    return { $$type: 'StructWithOptionals' as const, a: _a, b: _b, c: _c, d: _d, e: _e };
}

function loadTupleStructWithOptionals(source: TupleReader) {
    let _a = source.readBigNumberOpt();
    let _b = source.readBooleanOpt();
    let _c = source.readCellOpt();
    let _d = source.readAddressOpt();
    const _e_p = source.readTupleOpt();
    const _e = _e_p ? loadTupleSomeGenericStruct(_e_p) : null;
    return { $$type: 'StructWithOptionals' as const, a: _a, b: _b, c: _c, d: _d, e: _e };
}

function storeTupleStructWithOptionals(source: StructWithOptionals) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.a);
    builder.writeBoolean(source.b);
    builder.writeCell(source.c);
    builder.writeAddress(source.d);
    if (source.e !== null && source.e !== undefined) {
        builder.writeTuple(storeTupleSomeGenericStruct(source.e));
    } else {
        builder.writeTuple(null);
    }
    return builder.build();
}

function dictValueParserStructWithOptionals(): DictionaryValue<StructWithOptionals> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeStructWithOptionals(src)).endCell());
        },
        parse: (src) => {
            return loadStructWithOptionals(src.loadRef().beginParse());
        }
    }
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
        b_0.storeUint(357891325, 32);
        if (src.a !== null && src.a !== undefined) { b_0.storeBit(true).storeInt(src.a, 257); } else { b_0.storeBit(false); }
        if (src.b !== null && src.b !== undefined) { b_0.storeBit(true).storeBit(src.b); } else { b_0.storeBit(false); }
        if (src.c !== null && src.c !== undefined) { b_0.storeBit(true).storeRef(src.c); } else { b_0.storeBit(false); }
        b_0.storeAddress(src.d);
        let b_1 = new Builder();
        if (src.e !== null && src.e !== undefined) { b_1.storeBit(true); b_1.store(storeSomeGenericStruct(src.e)); } else { b_1.storeBit(false); }
        let b_2 = new Builder();
        if (src.f !== null && src.f !== undefined) { b_2.storeBit(true); b_2.store(storeStructWithOptionals(src.f)); } else { b_2.storeBit(false); }
        b_1.storeRef(b_2.endCell());
        b_0.storeRef(b_1.endCell());
    };
}

export function loadUpdate(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 357891325) { throw Error('Invalid prefix'); }
    let _a = sc_0.loadBit() ? sc_0.loadIntBig(257) : null;
    let _b = sc_0.loadBit() ? sc_0.loadBit() : null;
    let _c = sc_0.loadBit() ? sc_0.loadRef() : null;
    let _d = sc_0.loadMaybeAddress();
    let sc_1 = sc_0.loadRef().beginParse();
    let _e = sc_1.loadBit() ? loadSomeGenericStruct(sc_1) : null;
    let sc_2 = sc_1.loadRef().beginParse();
    let _f = sc_2.loadBit() ? loadStructWithOptionals(sc_2) : null;
    return { $$type: 'Update' as const, a: _a, b: _b, c: _c, d: _d, e: _e, f: _f };
}

function loadTupleUpdate(source: TupleReader) {
    let _a = source.readBigNumberOpt();
    let _b = source.readBooleanOpt();
    let _c = source.readCellOpt();
    let _d = source.readAddressOpt();
    const _e_p = source.readTupleOpt();
    const _e = _e_p ? loadTupleSomeGenericStruct(_e_p) : null;
    const _f_p = source.readTupleOpt();
    const _f = _f_p ? loadTupleStructWithOptionals(_f_p) : null;
    return { $$type: 'Update' as const, a: _a, b: _b, c: _c, d: _d, e: _e, f: _f };
}

function storeTupleUpdate(source: Update) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.a);
    builder.writeBoolean(source.b);
    builder.writeCell(source.c);
    builder.writeAddress(source.d);
    if (source.e !== null && source.e !== undefined) {
        builder.writeTuple(storeTupleSomeGenericStruct(source.e));
    } else {
        builder.writeTuple(null);
    }
    if (source.f !== null && source.f !== undefined) {
        builder.writeTuple(storeTupleStructWithOptionals(source.f));
    } else {
        builder.writeTuple(null);
    }
    return builder.build();
}

function dictValueParserUpdate(): DictionaryValue<Update> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeUpdate(src)).endCell());
        },
        parse: (src) => {
            return loadUpdate(src.loadRef().beginParse());
        }
    }
}
async function ContractWithOptionals_init(a: bigint | null, b: boolean | null, c: Cell | null, d: Address | null, e: SomeGenericStruct | null, f: StructWithOptionals | null) {
    const __init = 'te6ccgECCAEAAU4AART/APSkE/S88sgLAQIBYgIDAgLMBAUAT6FK3AJA3SRg2yjeSt4LxAJA3SRg2z7eSkDdJGDbKN5K3gvE3gvF4B8AAdwC2fg2RmAxK3Wc2/qAPlAArAgIDngEwauCgDZQAIIvERt1nLv4DlAAnlAEsZuCgB5QBxELdZyr+A5QBmSjgZZQBxAJA3Spg4AOWAyWeLcWQRN1nKmTgsZQBxhuQRt1nLGbgoAeUAcYbkrGZkgOZkwHBgHIfwHKAAMgbvLQgG8lEFckbrObf1AGygAUgQEBzwCYNHBQBcoAEDTiIm6zl38BygASygCVMnBYygDiIW6zlX8BygDMlHAyygDiASBulTBwAcsBks8W4sgibrOVMnBYygDjDckBzAcAYH8BygACIG7y0IBvJRBWUEWBAQHPABKBAQHPAIEBAc8AAciBAQHPABKBAQHPAMkBzA==';
    const __code = 'te6ccgECSQEABaYAART/APSkE/S88sgLAQIBYgIDAgLPBAUCASANDgKDHAh10nCH5UwINcLH94C0NMDAXGwwAGRf5Fw4gH6QCJQZm8E+GECkVvgIMAAItdJwSGw4wKCEBVU/P264wIw8sCCgBgcACwgbvLQgIAPoW9s8yPhCAcxVUCVus5t/UAfKABWBAQHPAJg1cFAGygAQReIjbrOXfwHKABPKAJYzcFADygDiIW6zlX8BygDMlHAyygDiASBulTBwAcsBks8W4sgibrOVMnBYygDjDcgjbrOWM3BQA8oA4w3JWMzJAczJ7VRFDAsDKNs8Bts8NhCrEJoQiRB4EGdVBGxmRQgJAvTTHwGCEBVU/P268uCB0gABlYEBAdcAkm0B4tIAAZLSAJJtAeLSAAGR1JJtAeL6QCHXCwHDAJEBkjFt4gHUAdDSAAGOJYEBAdcAgQEB1wCBAQHXANQB0IEBAdcAgQEB1wAwECUQJBAjbwWRbeIB1DDQ0gABkjBt4w0QJkcKAuLI+EIBzFVQJW6zm39QB8oAFYEBAc8AmDVwUAbKABBF4iNus5d/AcoAE8oAljNwUAPKAOIhbrOVfwHKAMyUcDLKAOIBIG6VMHABywGSzxbiyCJus5UycFjKAOMNyCNus5YzcFADygDjDclYzMkBzMntVAwLAAwQJRAkECMByH8BygADIG7y0IBvJRBXJG6zm39QBsoAFIEBAc8AmDRwUAXKABA04iJus5d/AcoAEsoAlTJwWMoA4iFus5V/AcoAzJRwMsoA4gEgbpUwcAHLAZLPFuLIIm6zlTJwWMoA4w3JAcwMAGB/AcoAAiBu8tCAbyUQVlBFgQEBzwASgQEBzwCBAQHPAAHIgQEBzwASgQEBzwDJAcwCASAREgIBIA8QAgEgJCUCASA2NwIBIBMUAgEgGhsCASAVFgINtFo7Z5tnkEUZAg2wpPbPNs8gRRcCDbCsts82zyBFGAAMEDVfBW6zAAwQRV8FbrMACF8FbrMCAWocHQIBICAhAgyqNts82zxFHgIMqJbbPNs8RR8ACGxRbrMAIF8GcXJzdHVvBSBu8tCAbyUCDbCVds82zyBFIgINsJ02zzbPIEUjAAoVXwVuswAMECVfBW6zAgEgJicCASAwMQIBxygpAgHHLC0CC6EnbPNs8kUqAguhc2zzbPJFKwAIECVfBQAMEEVfBfABAjeho2zzbPCBukjBtmSBu8tCAbyVvBeIgbpIwbd6RS4CC6H3bPNs8kUvAAYVXwUADBA1XwXwAQJbsAL2zzbPCBukjBtjhkgbvLQgG8lIG6SMG2ZIG7y0IBvJW8F4m8F4iBukjBt3oEUyAgEgMzQABGxRAg2sn+2ebZ5ARTUATa3owTgudh6ullc9j0J2HOslQo2zQThO6xqWlbI+WZFp15b++LEcwAAIXwXwAQIBIDg5AgEgPD0CLbB2Ns82zwgbpIwbZkgbvLQgG8lbwXigRToCDbA7Ns82zyBFOwASbFEgbvLQgG8lAARfBQIBxz4/AgHHQkMCC6I/bPNs8kVAAguia2zzbPJFQQAIEEVfBQAMECVfBfABAguiu2zzbPJFRAILou9s82zyRUYACBA1XwUC9O1E0NQB+GLSAAGVgQEB1wCSbQHi0gABktIAkm0B4tIAAZHUkm0B4vpAIdcLAcMAkQGSMW3iAdQB0NIAAY4lgQEB1wCBAQHXAIEBAdcA1AHQgQEB1wCBAQHXADAQJRAkECNvBZFt4gHUMNDSAAGSMG3jDRAmECUQJBAjR0gAFBVfBSBu8tCAbyUA1NIAAZWBAQHXAJJtAeLSAAGS0gCSbQHi0gABkdSSbQHi+kAh1wsBwwCRAZIxbeIB1AHQ0gABjieBAQHXAIEBAdcAgQEB1wDUAdCBAQHXAIEBAdcAMBAlECQQI2wVbwWSMG3iFRRDMGwVbwUABGwW';
    const __system = 'te6cckECSwEABbAAAQHAAQEFofSdAgEU/wD0pBP0vPLICwMCAWI+BAIBICoFAgEgFwYCASASBwIBIA0IAgHHCwkCC6LvbPNs8kgKABQVXwUgbvLQgG8lAguiu2zzbPJIDAAIEDVfBQIBxxAOAguia2zzbPJIDwAMECVfBfABAguiP2zzbPJIEQAIEEVfBQIBIBUTAg2wOzbPNs8gSBQABF8FAi2wdjbPNs8IG6SMG2ZIG7y0IBvJW8F4oEgWABJsUSBu8tCAbyUCASAfGAIBIB0ZAgEgGxoATa3owTgudh6ullc9j0J2HOslQo2zQThO6xqWlbI+WZFp15b++LEcwAINrJ/tnm2eQEgcAAhfBfABAluwAvbPNs8IG6SMG2OGSBu8tCAbyUgbpIwbZkgbvLQgG8lbwXibwXiIG6SMG3egSB4ABGxRAgEgJSACAccjIQILofds82zySCIADBA1XwXwAQI3oaNs82zwgbpIwbZkgbvLQgG8lbwXiIG6SMG3ekgkAAYVXwUCAccoJgILoXNs82zySCcADBBFXwXwAQILoSds82zySCkACBAlXwUCASA2KwIBIDEsAgEgLy0CDbCdNs82zyBILgAMECVfBW6zAg2wlXbPNs8gSDAAChVfBW6zAgFqNDICDKiW2zzbPEgzACBfBnFyc3R1bwUgbvLQgG8lAgyqNts82zxINQAIbFFuswIBIDk3Ag20Wjtnm2eQSDgACF8FbrMCASA8OgINsKy2zzbPIEg7AAwQRV8FbrMCDbCk9s82zyBIPQAMEDVfBW6zAgLPQD8ACwgbvLQgIAKDHAh10nCH5UwINcLH94C0NMDAXGwwAGRf5Fw4gH6QCJQZm8E+GECkVvgIMAAItdJwSGw4wKCEBVU/P264wIw8sCCgRUEDKNs8Bts8NhCrEJoQiRB4EGdVBGxmSENCAuLI+EIBzFVQJW6zm39QB8oAFYEBAc8AmDVwUAbKABBF4iNus5d/AcoAE8oAljNwUAPKAOIhbrOVfwHKAMyUcDLKAOIBIG6VMHABywGSzxbiyCJus5UycFjKAOMNyCNus5YzcFADygDjDclYzMkBzMntVEdGAvTTHwGCEBVU/P268uCB0gABlYEBAdcAkm0B4tIAAZLSAJJtAeLSAAGR1JJtAeL6QCHXCwHDAJEBkjFt4gHUAdDSAAGOJYEBAdcAgQEB1wCBAQHXANQB0IEBAdcAgQEB1wAwECUQJBAjbwWRbeIB1DDQ0gABkjBt4w0QJkpEAAwQJRAkECMD6FvbPMj4QgHMVVAlbrObf1AHygAVgQEBzwCYNXBQBsoAEEXiI26zl38BygATygCWM3BQA8oA4iFus5V/AcoAzJRwMsoA4gEgbpUwcAHLAZLPFuLIIm6zlTJwWMoA4w3II26zljNwUAPKAOMNyVjMyQHMye1USEdGAch/AcoAAyBu8tCAbyUQVyRus5t/UAbKABSBAQHPAJg0cFAFygAQNOIibrOXfwHKABLKAJUycFjKAOIhbrOVfwHKAMyUcDLKAOIBIG6VMHABywGSzxbiyCJus5UycFjKAOMNyQHMRwBgfwHKAAIgbvLQgG8lEFZQRYEBAc8AEoEBAc8AgQEBzwAByIEBAc8AEoEBAc8AyQHMAvTtRNDUAfhi0gABlYEBAdcAkm0B4tIAAZLSAJJtAeLSAAGR1JJtAeL6QCHXCwHDAJEBkjFt4gHUAdDSAAGOJYEBAdcAgQEB1wCBAQHXANQB0IEBAdcAgQEB1wAwECUQJBAjbwWRbeIB1DDQ0gABkjBt4w0QJhAlECQQI0pJAARsFgDU0gABlYEBAdcAkm0B4tIAAZLSAJJtAeLSAAGR1JJtAeL6QCHXCwHDAJEBkjFt4gHUAdDSAAGOJ4EBAdcAgQEB1wCBAQHXANQB0IEBAdcAgQEB1wAwECUQJBAjbBVvBZIwbeIVFEMwbBVvBZdLjlY=';
    let systemCell = Cell.fromBase64(__system);
    let builder = new TupleBuilder();
    builder.writeCell(systemCell);
    builder.writeNumber(a);
    builder.writeBoolean(b);
    builder.writeCell(c);
    builder.writeAddress(d);
    if (e !== null && e !== undefined) {
        builder.writeTuple(storeTupleSomeGenericStruct(e));
    } else {
        builder.writeTuple(null);
    }
    if (f !== null && f !== undefined) {
        builder.writeTuple(storeTupleStructWithOptionals(f));
    } else {
        builder.writeTuple(null);
    }
    let __stack = builder.build();
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let initCell = Cell.fromBoc(Buffer.from(__init, 'base64'))[0];
    let system = await ContractSystem.create();
    let executor = await ContractExecutor.create({ code: initCell, data: new Cell() }, system);
    let res = await executor.get('init', __stack);
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
    135: { message: `Code of a contract was not found` },
    136: { message: `Invalid address` },
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
        let builder = new TupleBuilder();
        let source = (await provider.get('isNotNullA', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getIsNotNullB(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('isNotNullB', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getIsNotNullC(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('isNotNullC', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getIsNotNullD(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('isNotNullD', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getIsNotNullE(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('isNotNullE', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getIsNotNullF(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('isNotNullF', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getNullA(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('nullA', builder.build())).stack;
        let result = source.readBigNumberOpt();
        return result;
    }
    
    async getNullB(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('nullB', builder.build())).stack;
        let result = source.readBooleanOpt();
        return result;
    }
    
    async getNullC(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('nullC', builder.build())).stack;
        let result = source.readCellOpt();
        return result;
    }
    
    async getNullD(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('nullD', builder.build())).stack;
        let result = source.readAddressOpt();
        return result;
    }
    
    async getNullE(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('nullE', builder.build())).stack;
        const result_p = source.readTupleOpt();
        const result = result_p ? loadTupleSomeGenericStruct(result_p) : null;
        return result;
    }
    
    async getNullF(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('nullF', builder.build())).stack;
        const result_p = source.readTupleOpt();
        const result = result_p ? loadTupleStructWithOptionals(result_p) : null;
        return result;
    }
    
    async getNotNullA(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('notNullA', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getNotNullB(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('notNullB', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getNotNullC(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('notNullC', builder.build())).stack;
        let result = source.readCell();
        return result;
    }
    
    async getNotNullD(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('notNullD', builder.build())).stack;
        let result = source.readAddress();
        return result;
    }
    
    async getNotNullE(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('notNullE', builder.build())).stack;
        const result = loadTupleSomeGenericStruct(source);
        return result;
    }
    
    async getNotNullF(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('notNullF', builder.build())).stack;
        const result = loadTupleStructWithOptionals(source);
        return result;
    }
    
    async getTestVariables(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('testVariables', builder.build())).stack;
        const result = loadTupleSomeGenericStruct(source);
        return result;
    }
    
}