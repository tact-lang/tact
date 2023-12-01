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

export type EntryFirst = {
    $$type: 'EntryFirst';
    amountToAdd: bigint;
    toAddress: Address;
}

export function storeEntryFirst(src: EntryFirst) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(2757457064, 32);
        b_0.storeUint(src.amountToAdd, 32);
        b_0.storeAddress(src.toAddress);
    };
}

export function loadEntryFirst(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 2757457064) { throw Error('Invalid prefix'); }
    let _amountToAdd = sc_0.loadUintBig(32);
    let _toAddress = sc_0.loadAddress();
    return { $$type: 'EntryFirst' as const, amountToAdd: _amountToAdd, toAddress: _toAddress };
}

function loadTupleEntryFirst(source: TupleReader) {
    let _amountToAdd = source.readBigNumber();
    let _toAddress = source.readAddress();
    return { $$type: 'EntryFirst' as const, amountToAdd: _amountToAdd, toAddress: _toAddress };
}

function storeTupleEntryFirst(source: EntryFirst) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.amountToAdd);
    builder.writeAddress(source.toAddress);
    return builder.build();
}

function dictValueParserEntryFirst(): DictionaryValue<EntryFirst> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeEntryFirst(src)).endCell());
        },
        parse: (src) => {
            return loadEntryFirst(src.loadRef().beginParse());
        }
    }
}

export type EntrySecond = {
    $$type: 'EntrySecond';
    amountToAdd: bigint;
    toAddress: Address;
}

export function storeEntrySecond(src: EntrySecond) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(4282440720, 32);
        b_0.storeUint(src.amountToAdd, 32);
        b_0.storeAddress(src.toAddress);
    };
}

export function loadEntrySecond(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 4282440720) { throw Error('Invalid prefix'); }
    let _amountToAdd = sc_0.loadUintBig(32);
    let _toAddress = sc_0.loadAddress();
    return { $$type: 'EntrySecond' as const, amountToAdd: _amountToAdd, toAddress: _toAddress };
}

function loadTupleEntrySecond(source: TupleReader) {
    let _amountToAdd = source.readBigNumber();
    let _toAddress = source.readAddress();
    return { $$type: 'EntrySecond' as const, amountToAdd: _amountToAdd, toAddress: _toAddress };
}

function storeTupleEntrySecond(source: EntrySecond) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.amountToAdd);
    builder.writeAddress(source.toAddress);
    return builder.build();
}

function dictValueParserEntrySecond(): DictionaryValue<EntrySecond> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeEntrySecond(src)).endCell());
        },
        parse: (src) => {
            return loadEntrySecond(src.loadRef().beginParse());
        }
    }
}

export type First = {
    $$type: 'First';
    amount: bigint;
    myCoins: bigint;
    myBool3: boolean;
    anAddress: Address;
}

export function storeFirst(src: First) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(3200290616, 32);
        b_0.storeUint(src.amount, 32);
        b_0.storeCoins(src.myCoins);
        b_0.storeBit(src.myBool3);
        b_0.storeAddress(src.anAddress);
    };
}

export function loadFirst(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 3200290616) { throw Error('Invalid prefix'); }
    let _amount = sc_0.loadUintBig(32);
    let _myCoins = sc_0.loadCoins();
    let _myBool3 = sc_0.loadBit();
    let _anAddress = sc_0.loadAddress();
    return { $$type: 'First' as const, amount: _amount, myCoins: _myCoins, myBool3: _myBool3, anAddress: _anAddress };
}

function loadTupleFirst(source: TupleReader) {
    let _amount = source.readBigNumber();
    let _myCoins = source.readBigNumber();
    let _myBool3 = source.readBoolean();
    let _anAddress = source.readAddress();
    return { $$type: 'First' as const, amount: _amount, myCoins: _myCoins, myBool3: _myBool3, anAddress: _anAddress };
}

function storeTupleFirst(source: First) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.amount);
    builder.writeNumber(source.myCoins);
    builder.writeBoolean(source.myBool3);
    builder.writeAddress(source.anAddress);
    return builder.build();
}

function dictValueParserFirst(): DictionaryValue<First> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeFirst(src)).endCell());
        },
        parse: (src) => {
            return loadFirst(src.loadRef().beginParse());
        }
    }
}

export type Second = {
    $$type: 'Second';
    amount_bigger: bigint;
    myBool: boolean;
    thisDoesNotFit: bigint;
    myAddress: Address;
    myBool2: boolean;
    myStruct: MyStruct;
    myStruct2: MyStruct;
}

export function storeSecond(src: Second) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(391585480, 32);
        b_0.storeUint(src.amount_bigger, 64);
        b_0.storeBit(src.myBool);
        b_0.storeUint(src.thisDoesNotFit, 256);
        b_0.storeAddress(src.myAddress);
        b_0.storeBit(src.myBool2);
        b_0.store(storeMyStruct(src.myStruct));
        let b_1 = new Builder();
        b_1.store(storeMyStruct(src.myStruct2));
        b_0.storeRef(b_1.endCell());
    };
}

export function loadSecond(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 391585480) { throw Error('Invalid prefix'); }
    let _amount_bigger = sc_0.loadUintBig(64);
    let _myBool = sc_0.loadBit();
    let _thisDoesNotFit = sc_0.loadUintBig(256);
    let _myAddress = sc_0.loadAddress();
    let _myBool2 = sc_0.loadBit();
    let _myStruct = loadMyStruct(sc_0);
    let sc_1 = sc_0.loadRef().beginParse();
    let _myStruct2 = loadMyStruct(sc_1);
    return { $$type: 'Second' as const, amount_bigger: _amount_bigger, myBool: _myBool, thisDoesNotFit: _thisDoesNotFit, myAddress: _myAddress, myBool2: _myBool2, myStruct: _myStruct, myStruct2: _myStruct2 };
}

function loadTupleSecond(source: TupleReader) {
    let _amount_bigger = source.readBigNumber();
    let _myBool = source.readBoolean();
    let _thisDoesNotFit = source.readBigNumber();
    let _myAddress = source.readAddress();
    let _myBool2 = source.readBoolean();
    const _myStruct = loadTupleMyStruct(source.readTuple());
    const _myStruct2 = loadTupleMyStruct(source.readTuple());
    return { $$type: 'Second' as const, amount_bigger: _amount_bigger, myBool: _myBool, thisDoesNotFit: _thisDoesNotFit, myAddress: _myAddress, myBool2: _myBool2, myStruct: _myStruct, myStruct2: _myStruct2 };
}

function storeTupleSecond(source: Second) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.amount_bigger);
    builder.writeBoolean(source.myBool);
    builder.writeNumber(source.thisDoesNotFit);
    builder.writeAddress(source.myAddress);
    builder.writeBoolean(source.myBool2);
    builder.writeTuple(storeTupleMyStruct(source.myStruct));
    builder.writeTuple(storeTupleMyStruct(source.myStruct2));
    return builder.build();
}

function dictValueParserSecond(): DictionaryValue<Second> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeSecond(src)).endCell());
        },
        parse: (src) => {
            return loadSecond(src.loadRef().beginParse());
        }
    }
}

export type Large = {
    $$type: 'Large';
    address: Address;
    value: bigint;
}

export function storeLarge(src: Large) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(618480963, 32);
        b_0.storeAddress(src.address);
        b_0.storeCoins(src.value);
    };
}

export function loadLarge(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 618480963) { throw Error('Invalid prefix'); }
    let _address = sc_0.loadAddress();
    let _value = sc_0.loadCoins();
    return { $$type: 'Large' as const, address: _address, value: _value };
}

function loadTupleLarge(source: TupleReader) {
    let _address = source.readAddress();
    let _value = source.readBigNumber();
    return { $$type: 'Large' as const, address: _address, value: _value };
}

function storeTupleLarge(source: Large) {
    let builder = new TupleBuilder();
    builder.writeAddress(source.address);
    builder.writeNumber(source.value);
    return builder.build();
}

function dictValueParserLarge(): DictionaryValue<Large> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeLarge(src)).endCell());
        },
        parse: (src) => {
            return loadLarge(src.loadRef().beginParse());
        }
    }
}

export type SmallBounce = {
    $$type: 'SmallBounce';
    amount: bigint;
    myBool3: boolean;
}

export function storeSmallBounce(src: SmallBounce) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(3235833558, 32);
        b_0.storeUint(src.amount, 32);
        b_0.storeBit(src.myBool3);
    };
}

export function loadSmallBounce(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 3235833558) { throw Error('Invalid prefix'); }
    let _amount = sc_0.loadUintBig(32);
    let _myBool3 = sc_0.loadBit();
    return { $$type: 'SmallBounce' as const, amount: _amount, myBool3: _myBool3 };
}

function loadTupleSmallBounce(source: TupleReader) {
    let _amount = source.readBigNumber();
    let _myBool3 = source.readBoolean();
    return { $$type: 'SmallBounce' as const, amount: _amount, myBool3: _myBool3 };
}

function storeTupleSmallBounce(source: SmallBounce) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.amount);
    builder.writeBoolean(source.myBool3);
    return builder.build();
}

function dictValueParserSmallBounce(): DictionaryValue<SmallBounce> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeSmallBounce(src)).endCell());
        },
        parse: (src) => {
            return loadSmallBounce(src.loadRef().beginParse());
        }
    }
}

export type MyStruct = {
    $$type: 'MyStruct';
    amount: bigint;
}

export function storeMyStruct(src: MyStruct) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeInt(src.amount, 257);
    };
}

export function loadMyStruct(slice: Slice) {
    let sc_0 = slice;
    let _amount = sc_0.loadIntBig(257);
    return { $$type: 'MyStruct' as const, amount: _amount };
}

function loadTupleMyStruct(source: TupleReader) {
    let _amount = source.readBigNumber();
    return { $$type: 'MyStruct' as const, amount: _amount };
}

function storeTupleMyStruct(source: MyStruct) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.amount);
    return builder.build();
}

function dictValueParserMyStruct(): DictionaryValue<MyStruct> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeMyStruct(src)).endCell());
        },
        parse: (src) => {
            return loadMyStruct(src.loadRef().beginParse());
        }
    }
}

 type SampleContract_init_args = {
    $$type: 'SampleContract_init_args';
}

function initSampleContract_init_args(src: SampleContract_init_args) {
    return (builder: Builder) => {
        let b_0 = builder;
    };
}

async function SampleContract_init() {
    const __code = Cell.fromBase64('te6ccgECGwEABYQAART/APSkE/S88sgLAQIBYgIDAp7QAdDTAwFxsKMB+kABINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiFRQUwNvBPhhAvhi2zxZ2zzy4ILI+EMBzH8BygABAYEBAc8Aye1UFgQCAVgSEwTg7aLt+wHjAnAh10nCH5UwINcLH94gwAAi10nBIbCSW3/gIIIQpFt0qLqOsjDTHwGCEKRbdKi68uCB0x/6QAEg10mBAQu68uCIINcLCiCBBP+68tCJgwm68uCIEmwS4CCCEP9A3BC64wIgghC+wI84ugUGBwgE4IAg1yFwIddJwh+VMCDXCx/eIIIQvsCPOLqONzDTHwGCEL7Ajzi68uCB0x/6ANIAVSBsE1uNBJJbiBib3VuY2Ugb2YgZmlyc3SD+FDBmoDGm/n/gIIIQF1ceyLrjAiCCEMDe5ta64wKCECTdRUO64wIJCgsMAaZRIaGCEDuaygByf3Nw+EIQN8hVMIIQvsCPOFAFyx8Tyx8B+gLKAAEg10mBAQu68uCIINcLCiCBBP+68tCJgwm68uCIzxbJEEVBMBUUQzBtbds8fw4CsjDTHwGCEP9A3BC68uCB0x/6QAEg10mBAQu68uCIINcLCiCBBP+68tCJgwm68uCIEmwSUSGhghA7msoAcn9wcfhCcCImEGrIVWDbPMkQRUEwFRRDMG1t2zx/DQ4CsI47MNMfAYIQvsCPOLry4IHTH/oA0gD6QAEg10mBAQu68uCIINcLCiCBBP+68tCJgwm68uCIFEMwbBRfBH/gIIIQF1ceyLqOiDDbPGwXXwd/4MAAkTDjDXAQEQBmMNMfAYIQF1ceyLry4IHTP9IAWWwSMI0E0luIGJvdW5jZSBvZiBzZWNvbmSD+FDCgpvx/AHIw0x8BghDA3ubWuvLggdMf0gBZbBIwjQZSW4gYm91bmNlIG9mIHNtYWxsIGJvdW5jZYP4UMKCm/H8AYNMfAYIQJN1FQ7ry4IFtMTCNBlJbiBib3VuY2Ugb2YgbGFyZ2UgYm91bmNlg/hQwfwA2W40EUluIGdlbmVyaWMgYm91bmNlg/hQwgE1/AIyCEBdXHshQCMsfFss/FMoAEsv/ASDXSYEBC7ry4Igg1wsKIIEE/7ry0ImDCbry4IjPFsoAAQGBAQHPAMhYAYEBAc8AyQHMAcrIcQHKAVAHAcoAcAHKAlAFINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiM8WUAP6AnABymgjbrORf5MkbrPilzMzAXABygDjDSFus5x/AcoAASBu8tCAAcyVMXABygDiyQH7AA8AmH8BygDIcAHKAHABygAkbrOdfwHKAAQgbvLQgFAEzJY0A3ABygDiJG6znX8BygAEIG7y0IBQBMyWNANwAcoA4nABygACfwHKAALJWMwAmNMfAYIQF1ceyLry4IHTP9IA0//6QAEg10mBAQu68uCIINcLCiCBBP+68tCJgwm68uCIAdIAgQEB1wABAdQB0IEBAdcAATEXFhUUQzAAVPkBgvDN0PWWajeSIjimlU7pGKFizFkECe9l8JTO6B6dC8UrtLqTf9sx4AIBIBQVAgFIGRoCD7Vdm2ebZ4YwFhcAubd6ME4LnYerpZXPY9CdhzrJUKNs0E4TusalpWyPlmRadeW/vixHME4ECrgDcAzscpnLB1XI5LZYcE4DepO98qiy3jjqenvAqzhk0E4TsunLVmnZbmdB0s2yjN0UkAFC7UTQ1AH4Y9IAAZeBAQHXAAEx4DD4KNcLCoMJuvLgids8GAACIAAEgGQAEbCvu1E0NIAAYAB1sm7jQ1aXBmczovL1FtYnlLZG1VbjkxSE1uRnpicG5kVkM5bmhNM0ZrVlRSNmJLZm5SZnR2SFc3TmKCA=');
    const __system = Cell.fromBase64('te6cckECHQEABY4AAQHAAQEFoIcVAgEU/wD0pBP0vPLICwMCAWIMBAIBWAgFAgFIBwYAdbJu40NWlwZnM6Ly9RbWJ5S2RtVW45MUhNbkZ6YnBuZFZDOW5oTTNGa1ZUUjZiS2ZuUmZ0dkhXN05iggABGwr7tRNDSAAGACASAKCQC5t3owTgudh6ullc9j0J2HOslQo2zQThO6xqWlbI+WZFp15b++LEcwTgQKuANwDOxymcsHVcjktlhwTgN6k73yqLLeOOp6e8CrOGTQThOy6ctWadluZ0HSzbKM3RSQAg+1XZtnm2eGMBsLAAIgAp7QAdDTAwFxsKMB+kABINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiFRQUwNvBPhhAvhi2zxZ2zzy4ILI+EMBzH8BygABAYEBAc8Aye1UGw0E4O2i7fsB4wJwIddJwh+VMCDXCx/eIMAAItdJwSGwklt/4CCCEKRbdKi6jrIw0x8BghCkW3SouvLggdMf+kABINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiBJsEuAgghD/QNwQuuMCIIIQvsCPOLoWExEOArCOOzDTHwGCEL7Ajzi68uCB0x/6ANIA+kABINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiBRDMGwUXwR/4CCCEBdXHsi6jogw2zxsF18Hf+DAAJEw4w1wEA8AVPkBgvDN0PWWajeSIjimlU7pGKFizFkECe9l8JTO6B6dC8UrtLqTf9sx4ACY0x8BghAXVx7IuvLggdM/0gDT//pAASDXSYEBC7ry4Igg1wsKIIEE/7ry0ImDCbry4IgB0gCBAQHXAAEB1AHQgQEB1wABMRcWFRRDMAKyMNMfAYIQ/0DcELry4IHTH/pAASDXSYEBC7ry4Igg1wsKIIEE/7ry0ImDCbry4IgSbBJRIaGCEDuaygByf3Bx+EJwIiYQashVYNs8yRBFQTAVFEMwbW3bPH8SFACMghAXVx7IUAjLHxbLPxTKABLL/wEg10mBAQu68uCIINcLCiCBBP+68tCJgwm68uCIzxbKAAEBgQEBzwDIWAGBAQHPAMkBzAGmUSGhghA7msoAcn9zcPhCEDfIVTCCEL7AjzhQBcsfE8sfAfoCygABINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiM8WyRBFQTAVFEMwbW3bPH8UAcrIcQHKAVAHAcoAcAHKAlAFINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiM8WUAP6AnABymgjbrORf5MkbrPilzMzAXABygDjDSFus5x/AcoAASBu8tCAAcyVMXABygDiyQH7ABUAmH8BygDIcAHKAHABygAkbrOdfwHKAAQgbvLQgFAEzJY0A3ABygDiJG6znX8BygAEIG7y0IBQBMyWNANwAcoA4nABygACfwHKAALJWMwE4IAg1yFwIddJwh+VMCDXCx/eIIIQvsCPOLqONzDTHwGCEL7Ajzi68uCB0x/6ANIAVSBsE1uNBJJbiBib3VuY2Ugb2YgZmlyc3SD+FDBmoDGm/n/gIIIQF1ceyLrjAiCCEMDe5ta64wKCECTdRUO64wIaGRgXADZbjQRSW4gZ2VuZXJpYyBib3VuY2WD+FDCATX8AYNMfAYIQJN1FQ7ry4IFtMTCNBlJbiBib3VuY2Ugb2YgbGFyZ2UgYm91bmNlg/hQwfwByMNMfAYIQwN7m1rry4IHTH9IAWWwSMI0GUluIGJvdW5jZSBvZiBzbWFsbCBib3VuY2WD+FDCgpvx/AGYw0x8BghAXVx7IuvLggdM/0gBZbBIwjQTSW4gYm91bmNlIG9mIHNlY29uZIP4UMKCm/H8BQu1E0NQB+GPSAAGXgQEB1wABMeAw+CjXCwqDCbry4InbPBwABIBkxa7vVA==');
    let builder = beginCell();
    builder.storeRef(__system);
    builder.storeUint(0, 1);
    initSampleContract_init_args({ $$type: 'SampleContract_init_args' })(builder);
    const __data = builder.endCell();
    return { code: __code, data: __data };
}

const SampleContract_errors: { [key: number]: { message: string } } = {
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

const SampleContract_types: ABIType[] = [
    {"name":"StateInit","header":null,"fields":[{"name":"code","type":{"kind":"simple","type":"cell","optional":false}},{"name":"data","type":{"kind":"simple","type":"cell","optional":false}}]},
    {"name":"Context","header":null,"fields":[{"name":"bounced","type":{"kind":"simple","type":"bool","optional":false}},{"name":"sender","type":{"kind":"simple","type":"address","optional":false}},{"name":"value","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"raw","type":{"kind":"simple","type":"slice","optional":false}}]},
    {"name":"SendParameters","header":null,"fields":[{"name":"bounce","type":{"kind":"simple","type":"bool","optional":false}},{"name":"to","type":{"kind":"simple","type":"address","optional":false}},{"name":"value","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"mode","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"body","type":{"kind":"simple","type":"cell","optional":true}},{"name":"code","type":{"kind":"simple","type":"cell","optional":true}},{"name":"data","type":{"kind":"simple","type":"cell","optional":true}}]},
    {"name":"EntryFirst","header":2757457064,"fields":[{"name":"amountToAdd","type":{"kind":"simple","type":"uint","optional":false,"format":32}},{"name":"toAddress","type":{"kind":"simple","type":"address","optional":false}}]},
    {"name":"EntrySecond","header":4282440720,"fields":[{"name":"amountToAdd","type":{"kind":"simple","type":"uint","optional":false,"format":32}},{"name":"toAddress","type":{"kind":"simple","type":"address","optional":false}}]},
    {"name":"First","header":3200290616,"fields":[{"name":"amount","type":{"kind":"simple","type":"uint","optional":false,"format":32}},{"name":"myCoins","type":{"kind":"simple","type":"uint","optional":false,"format":"coins"}},{"name":"myBool3","type":{"kind":"simple","type":"bool","optional":false}},{"name":"anAddress","type":{"kind":"simple","type":"address","optional":false}}]},
    {"name":"Second","header":391585480,"fields":[{"name":"amount_bigger","type":{"kind":"simple","type":"uint","optional":false,"format":64}},{"name":"myBool","type":{"kind":"simple","type":"bool","optional":false}},{"name":"thisDoesNotFit","type":{"kind":"simple","type":"uint","optional":false,"format":256}},{"name":"myAddress","type":{"kind":"simple","type":"address","optional":false}},{"name":"myBool2","type":{"kind":"simple","type":"bool","optional":false}},{"name":"myStruct","type":{"kind":"simple","type":"MyStruct","optional":false}},{"name":"myStruct2","type":{"kind":"simple","type":"MyStruct","optional":false}}]},
    {"name":"Large","header":618480963,"fields":[{"name":"address","type":{"kind":"simple","type":"address","optional":false}},{"name":"value","type":{"kind":"simple","type":"uint","optional":false,"format":"coins"}}]},
    {"name":"SmallBounce","header":3235833558,"fields":[{"name":"amount","type":{"kind":"simple","type":"uint","optional":false,"format":32}},{"name":"myBool3","type":{"kind":"simple","type":"bool","optional":false}}]},
    {"name":"MyStruct","header":null,"fields":[{"name":"amount","type":{"kind":"simple","type":"int","optional":false,"format":257}}]},
]

const SampleContract_getters: ABIGetter[] = [
    {"name":"amount","arguments":[],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
]

const SampleContract_receivers: ABIReceiver[] = [
    {"receiver":"internal","message":{"kind":"empty"}},
    {"receiver":"internal","message":{"kind":"typed","type":"EntryFirst"}},
    {"receiver":"internal","message":{"kind":"typed","type":"EntrySecond"}},
    {"receiver":"internal","message":{"kind":"typed","type":"First"}},
    {"receiver":"internal","message":{"kind":"typed","type":"Second"}},
    {"receiver":"internal","message":{"kind":"text","text":"Increment"}},
]

export class SampleContract implements Contract {
    
    static async init() {
        return await SampleContract_init();
    }
    
    static async fromInit() {
        const init = await SampleContract_init();
        const address = contractAddress(0, init);
        return new SampleContract(address, init);
    }
    
    static fromAddress(address: Address) {
        return new SampleContract(address);
    }
    
    readonly address: Address; 
    readonly init?: { code: Cell, data: Cell };
    readonly abi: ContractABI = {
        types:  SampleContract_types,
        getters: SampleContract_getters,
        receivers: SampleContract_receivers,
        errors: SampleContract_errors,
    };
    
    private constructor(address: Address, init?: { code: Cell, data: Cell }) {
        this.address = address;
        this.init = init;
    }
    
    async send(provider: ContractProvider, via: Sender, args: { value: bigint, bounce?: boolean| null | undefined }, message: null | EntryFirst | EntrySecond | First | Second | 'Increment') {
        
        let body: Cell | null = null;
        if (message === null) {
            body = new Cell();
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'EntryFirst') {
            body = beginCell().store(storeEntryFirst(message)).endCell();
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'EntrySecond') {
            body = beginCell().store(storeEntrySecond(message)).endCell();
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'First') {
            body = beginCell().store(storeFirst(message)).endCell();
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'Second') {
            body = beginCell().store(storeSecond(message)).endCell();
        }
        if (message === 'Increment') {
            body = beginCell().storeUint(0, 32).storeStringTail(message).endCell();
        }
        if (body === null) { throw new Error('Invalid message type'); }
        
        await provider.internal(via, { ...args, body: body });
        
    }
    
    async getAmount(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('amount', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
}