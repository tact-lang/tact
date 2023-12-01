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

export type Struct2 = {
    $$type: 'Struct2';
    v: bigint;
}

export function storeStruct2(src: Struct2) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(2971230874, 32);
        b_0.storeInt(src.v, 257);
    };
}

export function loadStruct2(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 2971230874) { throw Error('Invalid prefix'); }
    let _v = sc_0.loadIntBig(257);
    return { $$type: 'Struct2' as const, v: _v };
}

function loadTupleStruct2(source: TupleReader) {
    let _v = source.readBigNumber();
    return { $$type: 'Struct2' as const, v: _v };
}

function storeTupleStruct2(source: Struct2) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.v);
    return builder.build();
}

function dictValueParserStruct2(): DictionaryValue<Struct2> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeStruct2(src)).endCell());
        },
        parse: (src) => {
            return loadStruct2(src.loadRef().beginParse());
        }
    }
}

export type OptStruct = {
    $$type: 'OptStruct';
    s: Struct2 | null;
}

export function storeOptStruct(src: OptStruct) {
    return (builder: Builder) => {
        let b_0 = builder;
        if (src.s !== null && src.s !== undefined) { b_0.storeBit(true); b_0.store(storeStruct2(src.s)); } else { b_0.storeBit(false); }
    };
}

export function loadOptStruct(slice: Slice) {
    let sc_0 = slice;
    let _s = sc_0.loadBit() ? loadStruct2(sc_0) : null;
    return { $$type: 'OptStruct' as const, s: _s };
}

function loadTupleOptStruct(source: TupleReader) {
    const _s_p = source.readTupleOpt();
    const _s = _s_p ? loadTupleStruct2(_s_p) : null;
    return { $$type: 'OptStruct' as const, s: _s };
}

function storeTupleOptStruct(source: OptStruct) {
    let builder = new TupleBuilder();
    if (source.s !== null && source.s !== undefined) {
        builder.writeTuple(storeTupleStruct2(source.s));
    } else {
        builder.writeTuple(null);
    }
    return builder.build();
}

function dictValueParserOptStruct(): DictionaryValue<OptStruct> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeOptStruct(src)).endCell());
        },
        parse: (src) => {
            return loadOptStruct(src.loadRef().beginParse());
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

 type ContractWithOptionals_init_args = {
    $$type: 'ContractWithOptionals_init_args';
    a: bigint | null;
    b: boolean | null;
    c: Cell | null;
    d: Address | null;
    e: SomeGenericStruct | null;
    f: StructWithOptionals | null;
}

function initContractWithOptionals_init_args(src: ContractWithOptionals_init_args) {
    return (builder: Builder) => {
        let b_0 = builder;
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

async function ContractWithOptionals_init(a: bigint | null, b: boolean | null, c: Cell | null, d: Address | null, e: SomeGenericStruct | null, f: StructWithOptionals | null) {
    const __code = Cell.fromBase64('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');
    const __system = Cell.fromBase64('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');
    let builder = beginCell();
    builder.storeRef(__system);
    builder.storeUint(0, 1);
    initContractWithOptionals_init_args({ $$type: 'ContractWithOptionals_init_args', a, b, c, d, e, f })(builder);
    const __data = builder.endCell();
    return { code: __code, data: __data };
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
    137: { message: `Masterchain support is not enabled for this contract` },
}

const ContractWithOptionals_types: ABIType[] = [
    {"name":"StateInit","header":null,"fields":[{"name":"code","type":{"kind":"simple","type":"cell","optional":false}},{"name":"data","type":{"kind":"simple","type":"cell","optional":false}}]},
    {"name":"Context","header":null,"fields":[{"name":"bounced","type":{"kind":"simple","type":"bool","optional":false}},{"name":"sender","type":{"kind":"simple","type":"address","optional":false}},{"name":"value","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"raw","type":{"kind":"simple","type":"slice","optional":false}}]},
    {"name":"SendParameters","header":null,"fields":[{"name":"bounce","type":{"kind":"simple","type":"bool","optional":false}},{"name":"to","type":{"kind":"simple","type":"address","optional":false}},{"name":"value","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"mode","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"body","type":{"kind":"simple","type":"cell","optional":true}},{"name":"code","type":{"kind":"simple","type":"cell","optional":true}},{"name":"data","type":{"kind":"simple","type":"cell","optional":true}}]},
    {"name":"Struct2","header":2971230874,"fields":[{"name":"v","type":{"kind":"simple","type":"int","optional":false,"format":257}}]},
    {"name":"OptStruct","header":null,"fields":[{"name":"s","type":{"kind":"simple","type":"Struct2","optional":true}}]},
    {"name":"SomeGenericStruct","header":null,"fields":[{"name":"value1","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"value2","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"value3","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"value4","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"value5","type":{"kind":"simple","type":"int","optional":false,"format":257}}]},
    {"name":"StructWithOptionals","header":null,"fields":[{"name":"a","type":{"kind":"simple","type":"int","optional":true,"format":257}},{"name":"b","type":{"kind":"simple","type":"bool","optional":true}},{"name":"c","type":{"kind":"simple","type":"cell","optional":true}},{"name":"d","type":{"kind":"simple","type":"address","optional":true}},{"name":"e","type":{"kind":"simple","type":"SomeGenericStruct","optional":true}}]},
    {"name":"Update","header":357891325,"fields":[{"name":"a","type":{"kind":"simple","type":"int","optional":true,"format":257}},{"name":"b","type":{"kind":"simple","type":"bool","optional":true}},{"name":"c","type":{"kind":"simple","type":"cell","optional":true}},{"name":"d","type":{"kind":"simple","type":"address","optional":true}},{"name":"e","type":{"kind":"simple","type":"SomeGenericStruct","optional":true}},{"name":"f","type":{"kind":"simple","type":"StructWithOptionals","optional":true}}]},
]

const ContractWithOptionals_getters: ABIGetter[] = [
    {"name":"isNotNullA","arguments":[],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"isNotNullB","arguments":[],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"isNotNullC","arguments":[],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"isNotNullD","arguments":[],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"isNotNullE","arguments":[],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"isNotNullF","arguments":[],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"nullA","arguments":[],"returnType":{"kind":"simple","type":"int","optional":true,"format":257}},
    {"name":"nullB","arguments":[],"returnType":{"kind":"simple","type":"bool","optional":true}},
    {"name":"nullC","arguments":[],"returnType":{"kind":"simple","type":"cell","optional":true}},
    {"name":"nullD","arguments":[],"returnType":{"kind":"simple","type":"address","optional":true}},
    {"name":"nullE","arguments":[],"returnType":{"kind":"simple","type":"SomeGenericStruct","optional":true}},
    {"name":"nullF","arguments":[],"returnType":{"kind":"simple","type":"StructWithOptionals","optional":true}},
    {"name":"notNullA","arguments":[],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
    {"name":"notNullB","arguments":[],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"notNullC","arguments":[],"returnType":{"kind":"simple","type":"cell","optional":false}},
    {"name":"notNullD","arguments":[],"returnType":{"kind":"simple","type":"address","optional":false}},
    {"name":"notNullE","arguments":[],"returnType":{"kind":"simple","type":"SomeGenericStruct","optional":false}},
    {"name":"notNullF","arguments":[],"returnType":{"kind":"simple","type":"StructWithOptionals","optional":false}},
    {"name":"testVariables","arguments":[],"returnType":{"kind":"simple","type":"SomeGenericStruct","optional":false}},
]

const ContractWithOptionals_receivers: ABIReceiver[] = [
    {"receiver":"internal","message":{"kind":"empty"}},
    {"receiver":"internal","message":{"kind":"typed","type":"Update"}},
]

export class ContractWithOptionals implements Contract {
    
    static async init(a: bigint | null, b: boolean | null, c: Cell | null, d: Address | null, e: SomeGenericStruct | null, f: StructWithOptionals | null) {
        return await ContractWithOptionals_init(a, b, c, d, e, f);
    }
    
    static async fromInit(a: bigint | null, b: boolean | null, c: Cell | null, d: Address | null, e: SomeGenericStruct | null, f: StructWithOptionals | null) {
        const init = await ContractWithOptionals_init(a, b, c, d, e, f);
        const address = contractAddress(0, init);
        return new ContractWithOptionals(address, init);
    }
    
    static fromAddress(address: Address) {
        return new ContractWithOptionals(address);
    }
    
    readonly address: Address; 
    readonly init?: { code: Cell, data: Cell };
    readonly abi: ContractABI = {
        types:  ContractWithOptionals_types,
        getters: ContractWithOptionals_getters,
        receivers: ContractWithOptionals_receivers,
        errors: ContractWithOptionals_errors,
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