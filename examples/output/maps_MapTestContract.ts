import { 
    Cell,
    Slice, 
    Address, 
    Builder, 
    beginCell, 
    ComputeError, 
    TupleItem, 
    TupleReader, 
    Dictionary, 
    contractAddress, 
    ContractProvider, 
    Sender, 
    Contract, 
    ContractABI, 
    ABIType,
    ABIGetter,
    ABIReceiver,
    TupleBuilder,
    DictionaryValue
} from '@ton/core';

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

export type SetIntMap1 = {
    $$type: 'SetIntMap1';
    key: bigint;
    value: bigint | null;
}

export function storeSetIntMap1(src: SetIntMap1) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(1510253336, 32);
        b_0.storeInt(src.key, 257);
        if (src.value !== null && src.value !== undefined) { b_0.storeBit(true).storeInt(src.value, 257); } else { b_0.storeBit(false); }
    };
}

export function loadSetIntMap1(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 1510253336) { throw Error('Invalid prefix'); }
    let _key = sc_0.loadIntBig(257);
    let _value = sc_0.loadBit() ? sc_0.loadIntBig(257) : null;
    return { $$type: 'SetIntMap1' as const, key: _key, value: _value };
}

function loadTupleSetIntMap1(source: TupleReader) {
    let _key = source.readBigNumber();
    let _value = source.readBigNumberOpt();
    return { $$type: 'SetIntMap1' as const, key: _key, value: _value };
}

function storeTupleSetIntMap1(source: SetIntMap1) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.key);
    builder.writeNumber(source.value);
    return builder.build();
}

function dictValueParserSetIntMap1(): DictionaryValue<SetIntMap1> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeSetIntMap1(src)).endCell());
        },
        parse: (src) => {
            return loadSetIntMap1(src.loadRef().beginParse());
        }
    }
}

export type SetIntMap2 = {
    $$type: 'SetIntMap2';
    key: bigint;
    value: boolean | null;
}

export function storeSetIntMap2(src: SetIntMap2) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(1629867766, 32);
        b_0.storeInt(src.key, 257);
        if (src.value !== null && src.value !== undefined) { b_0.storeBit(true).storeBit(src.value); } else { b_0.storeBit(false); }
    };
}

export function loadSetIntMap2(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 1629867766) { throw Error('Invalid prefix'); }
    let _key = sc_0.loadIntBig(257);
    let _value = sc_0.loadBit() ? sc_0.loadBit() : null;
    return { $$type: 'SetIntMap2' as const, key: _key, value: _value };
}

function loadTupleSetIntMap2(source: TupleReader) {
    let _key = source.readBigNumber();
    let _value = source.readBooleanOpt();
    return { $$type: 'SetIntMap2' as const, key: _key, value: _value };
}

function storeTupleSetIntMap2(source: SetIntMap2) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.key);
    builder.writeBoolean(source.value);
    return builder.build();
}

function dictValueParserSetIntMap2(): DictionaryValue<SetIntMap2> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeSetIntMap2(src)).endCell());
        },
        parse: (src) => {
            return loadSetIntMap2(src.loadRef().beginParse());
        }
    }
}

export type SetIntMap3 = {
    $$type: 'SetIntMap3';
    key: bigint;
    value: Cell | null;
}

export function storeSetIntMap3(src: SetIntMap3) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(3613954633, 32);
        b_0.storeInt(src.key, 257);
        if (src.value !== null && src.value !== undefined) { b_0.storeBit(true).storeRef(src.value); } else { b_0.storeBit(false); }
    };
}

export function loadSetIntMap3(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 3613954633) { throw Error('Invalid prefix'); }
    let _key = sc_0.loadIntBig(257);
    let _value = sc_0.loadBit() ? sc_0.loadRef() : null;
    return { $$type: 'SetIntMap3' as const, key: _key, value: _value };
}

function loadTupleSetIntMap3(source: TupleReader) {
    let _key = source.readBigNumber();
    let _value = source.readCellOpt();
    return { $$type: 'SetIntMap3' as const, key: _key, value: _value };
}

function storeTupleSetIntMap3(source: SetIntMap3) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.key);
    builder.writeCell(source.value);
    return builder.build();
}

function dictValueParserSetIntMap3(): DictionaryValue<SetIntMap3> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeSetIntMap3(src)).endCell());
        },
        parse: (src) => {
            return loadSetIntMap3(src.loadRef().beginParse());
        }
    }
}

export type SetIntMap4 = {
    $$type: 'SetIntMap4';
    key: bigint;
    value: SomeStruct | null;
}

export function storeSetIntMap4(src: SetIntMap4) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(383013829, 32);
        b_0.storeInt(src.key, 257);
        if (src.value !== null && src.value !== undefined) { b_0.storeBit(true); b_0.store(storeSomeStruct(src.value)); } else { b_0.storeBit(false); }
    };
}

export function loadSetIntMap4(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 383013829) { throw Error('Invalid prefix'); }
    let _key = sc_0.loadIntBig(257);
    let _value = sc_0.loadBit() ? loadSomeStruct(sc_0) : null;
    return { $$type: 'SetIntMap4' as const, key: _key, value: _value };
}

function loadTupleSetIntMap4(source: TupleReader) {
    let _key = source.readBigNumber();
    const _value_p = source.readTupleOpt();
    const _value = _value_p ? loadTupleSomeStruct(_value_p) : null;
    return { $$type: 'SetIntMap4' as const, key: _key, value: _value };
}

function storeTupleSetIntMap4(source: SetIntMap4) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.key);
    if (source.value !== null && source.value !== undefined) {
        builder.writeTuple(storeTupleSomeStruct(source.value));
    } else {
        builder.writeTuple(null);
    }
    return builder.build();
}

function dictValueParserSetIntMap4(): DictionaryValue<SetIntMap4> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeSetIntMap4(src)).endCell());
        },
        parse: (src) => {
            return loadSetIntMap4(src.loadRef().beginParse());
        }
    }
}

export type SetAddrMap1 = {
    $$type: 'SetAddrMap1';
    key: Address;
    value: bigint | null;
}

export function storeSetAddrMap1(src: SetAddrMap1) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(1749966413, 32);
        b_0.storeAddress(src.key);
        if (src.value !== null && src.value !== undefined) { b_0.storeBit(true).storeInt(src.value, 257); } else { b_0.storeBit(false); }
    };
}

export function loadSetAddrMap1(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 1749966413) { throw Error('Invalid prefix'); }
    let _key = sc_0.loadAddress();
    let _value = sc_0.loadBit() ? sc_0.loadIntBig(257) : null;
    return { $$type: 'SetAddrMap1' as const, key: _key, value: _value };
}

function loadTupleSetAddrMap1(source: TupleReader) {
    let _key = source.readAddress();
    let _value = source.readBigNumberOpt();
    return { $$type: 'SetAddrMap1' as const, key: _key, value: _value };
}

function storeTupleSetAddrMap1(source: SetAddrMap1) {
    let builder = new TupleBuilder();
    builder.writeAddress(source.key);
    builder.writeNumber(source.value);
    return builder.build();
}

function dictValueParserSetAddrMap1(): DictionaryValue<SetAddrMap1> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeSetAddrMap1(src)).endCell());
        },
        parse: (src) => {
            return loadSetAddrMap1(src.loadRef().beginParse());
        }
    }
}

export type SetAddrMap2 = {
    $$type: 'SetAddrMap2';
    key: Address;
    value: boolean | null;
}

export function storeSetAddrMap2(src: SetAddrMap2) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(624157584, 32);
        b_0.storeAddress(src.key);
        if (src.value !== null && src.value !== undefined) { b_0.storeBit(true).storeBit(src.value); } else { b_0.storeBit(false); }
    };
}

export function loadSetAddrMap2(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 624157584) { throw Error('Invalid prefix'); }
    let _key = sc_0.loadAddress();
    let _value = sc_0.loadBit() ? sc_0.loadBit() : null;
    return { $$type: 'SetAddrMap2' as const, key: _key, value: _value };
}

function loadTupleSetAddrMap2(source: TupleReader) {
    let _key = source.readAddress();
    let _value = source.readBooleanOpt();
    return { $$type: 'SetAddrMap2' as const, key: _key, value: _value };
}

function storeTupleSetAddrMap2(source: SetAddrMap2) {
    let builder = new TupleBuilder();
    builder.writeAddress(source.key);
    builder.writeBoolean(source.value);
    return builder.build();
}

function dictValueParserSetAddrMap2(): DictionaryValue<SetAddrMap2> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeSetAddrMap2(src)).endCell());
        },
        parse: (src) => {
            return loadSetAddrMap2(src.loadRef().beginParse());
        }
    }
}

export type SetAddrMap3 = {
    $$type: 'SetAddrMap3';
    key: Address;
    value: Cell | null;
}

export function storeSetAddrMap3(src: SetAddrMap3) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(4276365062, 32);
        b_0.storeAddress(src.key);
        if (src.value !== null && src.value !== undefined) { b_0.storeBit(true).storeRef(src.value); } else { b_0.storeBit(false); }
    };
}

export function loadSetAddrMap3(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 4276365062) { throw Error('Invalid prefix'); }
    let _key = sc_0.loadAddress();
    let _value = sc_0.loadBit() ? sc_0.loadRef() : null;
    return { $$type: 'SetAddrMap3' as const, key: _key, value: _value };
}

function loadTupleSetAddrMap3(source: TupleReader) {
    let _key = source.readAddress();
    let _value = source.readCellOpt();
    return { $$type: 'SetAddrMap3' as const, key: _key, value: _value };
}

function storeTupleSetAddrMap3(source: SetAddrMap3) {
    let builder = new TupleBuilder();
    builder.writeAddress(source.key);
    builder.writeCell(source.value);
    return builder.build();
}

function dictValueParserSetAddrMap3(): DictionaryValue<SetAddrMap3> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeSetAddrMap3(src)).endCell());
        },
        parse: (src) => {
            return loadSetAddrMap3(src.loadRef().beginParse());
        }
    }
}

export type SetAddrMap4 = {
    $$type: 'SetAddrMap4';
    key: Address;
    value: SomeStruct | null;
}

export function storeSetAddrMap4(src: SetAddrMap4) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(1683777913, 32);
        b_0.storeAddress(src.key);
        if (src.value !== null && src.value !== undefined) { b_0.storeBit(true); b_0.store(storeSomeStruct(src.value)); } else { b_0.storeBit(false); }
    };
}

export function loadSetAddrMap4(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 1683777913) { throw Error('Invalid prefix'); }
    let _key = sc_0.loadAddress();
    let _value = sc_0.loadBit() ? loadSomeStruct(sc_0) : null;
    return { $$type: 'SetAddrMap4' as const, key: _key, value: _value };
}

function loadTupleSetAddrMap4(source: TupleReader) {
    let _key = source.readAddress();
    const _value_p = source.readTupleOpt();
    const _value = _value_p ? loadTupleSomeStruct(_value_p) : null;
    return { $$type: 'SetAddrMap4' as const, key: _key, value: _value };
}

function storeTupleSetAddrMap4(source: SetAddrMap4) {
    let builder = new TupleBuilder();
    builder.writeAddress(source.key);
    if (source.value !== null && source.value !== undefined) {
        builder.writeTuple(storeTupleSomeStruct(source.value));
    } else {
        builder.writeTuple(null);
    }
    return builder.build();
}

function dictValueParserSetAddrMap4(): DictionaryValue<SetAddrMap4> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeSetAddrMap4(src)).endCell());
        },
        parse: (src) => {
            return loadSetAddrMap4(src.loadRef().beginParse());
        }
    }
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

function loadTupleSomeStruct(source: TupleReader) {
    let _value = source.readBigNumber();
    return { $$type: 'SomeStruct' as const, value: _value };
}

function storeTupleSomeStruct(source: SomeStruct) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.value);
    return builder.build();
}

function dictValueParserSomeStruct(): DictionaryValue<SomeStruct> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeSomeStruct(src)).endCell());
        },
        parse: (src) => {
            return loadSomeStruct(src.loadRef().beginParse());
        }
    }
}

export type SomeStruct2 = {
    $$type: 'SomeStruct2';
    value: bigint;
    intMap1: Dictionary<number, number>;
}

export function storeSomeStruct2(src: SomeStruct2) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeInt(src.value, 257);
        b_0.storeDict(src.intMap1, Dictionary.Keys.Uint(8), Dictionary.Values.Uint(8));
    };
}

export function loadSomeStruct2(slice: Slice) {
    let sc_0 = slice;
    let _value = sc_0.loadIntBig(257);
    let _intMap1 = Dictionary.load(Dictionary.Keys.Uint(8), Dictionary.Values.Uint(8), sc_0);
    return { $$type: 'SomeStruct2' as const, value: _value, intMap1: _intMap1 };
}

function loadTupleSomeStruct2(source: TupleReader) {
    let _value = source.readBigNumber();
    let _intMap1 = Dictionary.loadDirect(Dictionary.Keys.Uint(8), Dictionary.Values.Uint(8), source.readCellOpt());
    return { $$type: 'SomeStruct2' as const, value: _value, intMap1: _intMap1 };
}

function storeTupleSomeStruct2(source: SomeStruct2) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.value);
    builder.writeCell(source.intMap1.size > 0 ? beginCell().storeDictDirect(source.intMap1, Dictionary.Keys.Uint(8), Dictionary.Values.Uint(8)).endCell() : null);
    return builder.build();
}

function dictValueParserSomeStruct2(): DictionaryValue<SomeStruct2> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeSomeStruct2(src)).endCell());
        },
        parse: (src) => {
            return loadSomeStruct2(src.loadRef().beginParse());
        }
    }
}

 type MapTestContract_init_args = {
    $$type: 'MapTestContract_init_args';
}

function initMapTestContract_init_args(src: MapTestContract_init_args) {
    return (builder: Builder) => {
        let b_0 = builder;
    };
}

async function MapTestContract_init() {
    const __code = Cell.fromBase64('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');
    const __system = Cell.fromBase64('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');
    let builder = beginCell();
    builder.storeRef(__system);
    builder.storeUint(0, 1);
    initMapTestContract_init_args({ $$type: 'MapTestContract_init_args' })(builder);
    const __data = builder.endCell();
    return { code: __code, data: __data };
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
    135: { message: `Code of a contract was not found` },
    136: { message: `Invalid address` },
    137: { message: `Masterchain support is not enabled for this contract` },
}

const MapTestContract_types: ABIType[] = [
    {"name":"StateInit","header":null,"fields":[{"name":"code","type":{"kind":"simple","type":"cell","optional":false}},{"name":"data","type":{"kind":"simple","type":"cell","optional":false}}]},
    {"name":"Context","header":null,"fields":[{"name":"bounced","type":{"kind":"simple","type":"bool","optional":false}},{"name":"sender","type":{"kind":"simple","type":"address","optional":false}},{"name":"value","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"raw","type":{"kind":"simple","type":"slice","optional":false}}]},
    {"name":"SendParameters","header":null,"fields":[{"name":"bounce","type":{"kind":"simple","type":"bool","optional":false}},{"name":"to","type":{"kind":"simple","type":"address","optional":false}},{"name":"value","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"mode","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"body","type":{"kind":"simple","type":"cell","optional":true}},{"name":"code","type":{"kind":"simple","type":"cell","optional":true}},{"name":"data","type":{"kind":"simple","type":"cell","optional":true}}]},
    {"name":"SetIntMap1","header":1510253336,"fields":[{"name":"key","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"value","type":{"kind":"simple","type":"int","optional":true,"format":257}}]},
    {"name":"SetIntMap2","header":1629867766,"fields":[{"name":"key","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"value","type":{"kind":"simple","type":"bool","optional":true}}]},
    {"name":"SetIntMap3","header":3613954633,"fields":[{"name":"key","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"value","type":{"kind":"simple","type":"cell","optional":true}}]},
    {"name":"SetIntMap4","header":383013829,"fields":[{"name":"key","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"value","type":{"kind":"simple","type":"SomeStruct","optional":true}}]},
    {"name":"SetAddrMap1","header":1749966413,"fields":[{"name":"key","type":{"kind":"simple","type":"address","optional":false}},{"name":"value","type":{"kind":"simple","type":"int","optional":true,"format":257}}]},
    {"name":"SetAddrMap2","header":624157584,"fields":[{"name":"key","type":{"kind":"simple","type":"address","optional":false}},{"name":"value","type":{"kind":"simple","type":"bool","optional":true}}]},
    {"name":"SetAddrMap3","header":4276365062,"fields":[{"name":"key","type":{"kind":"simple","type":"address","optional":false}},{"name":"value","type":{"kind":"simple","type":"cell","optional":true}}]},
    {"name":"SetAddrMap4","header":1683777913,"fields":[{"name":"key","type":{"kind":"simple","type":"address","optional":false}},{"name":"value","type":{"kind":"simple","type":"SomeStruct","optional":true}}]},
    {"name":"SomeStruct","header":null,"fields":[{"name":"value","type":{"kind":"simple","type":"int","optional":false,"format":257}}]},
    {"name":"SomeStruct2","header":null,"fields":[{"name":"value","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"intMap1","type":{"kind":"dict","key":"uint","keyFormat":8,"value":"uint","valueFormat":8}}]},
]

const MapTestContract_getters: ABIGetter[] = [
    {"name":"intMap1","arguments":[],"returnType":{"kind":"dict","key":"uint","keyFormat":8,"value":"uint","valueFormat":8}},
    {"name":"intMap1Value","arguments":[{"name":"key","type":{"kind":"simple","type":"int","optional":false,"format":257}}],"returnType":{"kind":"simple","type":"int","optional":true,"format":257}},
    {"name":"intMap2","arguments":[],"returnType":{"kind":"dict","key":"int","value":"bool"}},
    {"name":"intMap2Value","arguments":[{"name":"key","type":{"kind":"simple","type":"int","optional":false,"format":257}}],"returnType":{"kind":"simple","type":"bool","optional":true}},
    {"name":"intMap3","arguments":[],"returnType":{"kind":"dict","key":"int","value":"cell","valueFormat":"ref"}},
    {"name":"intMap3Value","arguments":[{"name":"key","type":{"kind":"simple","type":"int","optional":false,"format":257}}],"returnType":{"kind":"simple","type":"cell","optional":true}},
    {"name":"intMap4","arguments":[],"returnType":{"kind":"dict","key":"int","value":"SomeStruct","valueFormat":"ref"}},
    {"name":"intMap4Value","arguments":[{"name":"key","type":{"kind":"simple","type":"int","optional":false,"format":257}}],"returnType":{"kind":"simple","type":"SomeStruct","optional":true}},
    {"name":"addrMap1","arguments":[],"returnType":{"kind":"dict","key":"address","value":"int"}},
    {"name":"addrMap1Value","arguments":[{"name":"key","type":{"kind":"simple","type":"address","optional":false}}],"returnType":{"kind":"simple","type":"int","optional":true,"format":257}},
    {"name":"addrMap2","arguments":[],"returnType":{"kind":"dict","key":"address","value":"bool"}},
    {"name":"addrMap2Value","arguments":[{"name":"key","type":{"kind":"simple","type":"address","optional":false}}],"returnType":{"kind":"simple","type":"bool","optional":true}},
    {"name":"addrMap3","arguments":[],"returnType":{"kind":"dict","key":"address","value":"cell","valueFormat":"ref"}},
    {"name":"addrMap3Value","arguments":[{"name":"key","type":{"kind":"simple","type":"address","optional":false}}],"returnType":{"kind":"simple","type":"cell","optional":true}},
    {"name":"addrMap4","arguments":[],"returnType":{"kind":"dict","key":"address","value":"SomeStruct","valueFormat":"ref"}},
    {"name":"addrMap4Value","arguments":[{"name":"key","type":{"kind":"simple","type":"address","optional":false}}],"returnType":{"kind":"simple","type":"SomeStruct","optional":true}},
]

const MapTestContract_receivers: ABIReceiver[] = [
    {"receiver":"internal","message":{"kind":"typed","type":"SetIntMap1"}},
    {"receiver":"internal","message":{"kind":"typed","type":"SetIntMap2"}},
    {"receiver":"internal","message":{"kind":"typed","type":"SetIntMap3"}},
    {"receiver":"internal","message":{"kind":"typed","type":"SetIntMap4"}},
    {"receiver":"internal","message":{"kind":"typed","type":"SetAddrMap1"}},
    {"receiver":"internal","message":{"kind":"typed","type":"SetAddrMap2"}},
    {"receiver":"internal","message":{"kind":"typed","type":"SetAddrMap3"}},
    {"receiver":"internal","message":{"kind":"typed","type":"SetAddrMap4"}},
]

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
        types:  MapTestContract_types,
        getters: MapTestContract_getters,
        receivers: MapTestContract_receivers,
        errors: MapTestContract_errors,
    };
    
    private constructor(address: Address, init?: { code: Cell, data: Cell }) {
        this.address = address;
        this.init = init;
    }
    
    async send(provider: ContractProvider, via: Sender, args: { value: bigint, bounce?: boolean| null | undefined }, message: SetIntMap1 | SetIntMap2 | SetIntMap3 | SetIntMap4 | SetAddrMap1 | SetAddrMap2 | SetAddrMap3 | SetAddrMap4) {
        
        let body: Cell | null = null;
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
        let builder = new TupleBuilder();
        let source = (await provider.get('intMap1', builder.build())).stack;
        let result = Dictionary.loadDirect(Dictionary.Keys.Uint(8), Dictionary.Values.Uint(8), source.readCellOpt());
        return result;
    }
    
    async getIntMap1Value(provider: ContractProvider, key: bigint) {
        let builder = new TupleBuilder();
        builder.writeNumber(key);
        let source = (await provider.get('intMap1Value', builder.build())).stack;
        let result = source.readBigNumberOpt();
        return result;
    }
    
    async getIntMap2(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('intMap2', builder.build())).stack;
        let result = Dictionary.loadDirect(Dictionary.Keys.BigInt(257), Dictionary.Values.Bool(), source.readCellOpt());
        return result;
    }
    
    async getIntMap2Value(provider: ContractProvider, key: bigint) {
        let builder = new TupleBuilder();
        builder.writeNumber(key);
        let source = (await provider.get('intMap2Value', builder.build())).stack;
        let result = source.readBooleanOpt();
        return result;
    }
    
    async getIntMap3(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('intMap3', builder.build())).stack;
        let result = Dictionary.loadDirect(Dictionary.Keys.BigInt(257), Dictionary.Values.Cell(), source.readCellOpt());
        return result;
    }
    
    async getIntMap3Value(provider: ContractProvider, key: bigint) {
        let builder = new TupleBuilder();
        builder.writeNumber(key);
        let source = (await provider.get('intMap3Value', builder.build())).stack;
        let result = source.readCellOpt();
        return result;
    }
    
    async getIntMap4(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('intMap4', builder.build())).stack;
        let result = Dictionary.loadDirect(Dictionary.Keys.BigInt(257), dictValueParserSomeStruct(), source.readCellOpt());
        return result;
    }
    
    async getIntMap4Value(provider: ContractProvider, key: bigint) {
        let builder = new TupleBuilder();
        builder.writeNumber(key);
        let source = (await provider.get('intMap4Value', builder.build())).stack;
        const result_p = source.readTupleOpt();
        const result = result_p ? loadTupleSomeStruct(result_p) : null;
        return result;
    }
    
    async getAddrMap1(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('addrMap1', builder.build())).stack;
        let result = Dictionary.loadDirect(Dictionary.Keys.Address(), Dictionary.Values.BigInt(257), source.readCellOpt());
        return result;
    }
    
    async getAddrMap1Value(provider: ContractProvider, key: Address) {
        let builder = new TupleBuilder();
        builder.writeAddress(key);
        let source = (await provider.get('addrMap1Value', builder.build())).stack;
        let result = source.readBigNumberOpt();
        return result;
    }
    
    async getAddrMap2(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('addrMap2', builder.build())).stack;
        let result = Dictionary.loadDirect(Dictionary.Keys.Address(), Dictionary.Values.Bool(), source.readCellOpt());
        return result;
    }
    
    async getAddrMap2Value(provider: ContractProvider, key: Address) {
        let builder = new TupleBuilder();
        builder.writeAddress(key);
        let source = (await provider.get('addrMap2Value', builder.build())).stack;
        let result = source.readBooleanOpt();
        return result;
    }
    
    async getAddrMap3(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('addrMap3', builder.build())).stack;
        let result = Dictionary.loadDirect(Dictionary.Keys.Address(), Dictionary.Values.Cell(), source.readCellOpt());
        return result;
    }
    
    async getAddrMap3Value(provider: ContractProvider, key: Address) {
        let builder = new TupleBuilder();
        builder.writeAddress(key);
        let source = (await provider.get('addrMap3Value', builder.build())).stack;
        let result = source.readCellOpt();
        return result;
    }
    
    async getAddrMap4(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('addrMap4', builder.build())).stack;
        let result = Dictionary.loadDirect(Dictionary.Keys.Address(), dictValueParserSomeStruct(), source.readCellOpt());
        return result;
    }
    
    async getAddrMap4Value(provider: ContractProvider, key: Address) {
        let builder = new TupleBuilder();
        builder.writeAddress(key);
        let source = (await provider.get('addrMap4Value', builder.build())).stack;
        const result_p = source.readTupleOpt();
        const result = result_p ? loadTupleSomeStruct(result_p) : null;
        return result;
    }
    
}