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
    TupleBuilder,
    DictionaryValue
} from 'ton-core';

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

export type Shoko = {
    $$type: 'Shoko';
    amount: bigint;
    thisDoesNotFit: bigint;
}

export function storeShoko(src: Shoko) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(3744520988, 32);
        b_0.storeUint(src.amount, 32);
        b_0.storeUint(src.thisDoesNotFit, 256);
    };
}

export function loadShoko(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 3744520988) { throw Error('Invalid prefix'); }
    let _amount = sc_0.loadUintBig(32);
    let _thisDoesNotFit = sc_0.loadUintBig(256);
    return { $$type: 'Shoko' as const, amount: _amount, thisDoesNotFit: _thisDoesNotFit };
}

function loadTupleShoko(source: TupleReader) {
    let _amount = source.readBigNumber();
    let _thisDoesNotFit = source.readBigNumber();
    return { $$type: 'Shoko' as const, amount: _amount, thisDoesNotFit: _thisDoesNotFit };
}

function storeTupleShoko(source: Shoko) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.amount);
    builder.writeNumber(source.thisDoesNotFit);
    return builder.build();
}

function dictValueParserShoko(): DictionaryValue<Shoko> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeShoko(src)).endCell());
        },
        parse: (src) => {
            return loadShoko(src.loadRef().beginParse());
        }
    }
}

export type Koko = {
    $$type: 'Koko';
    amount_bigger: bigint;
    thisDoesNotFit: bigint;
}

export function storeKoko(src: Koko) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(994470181, 32);
        b_0.storeUint(src.amount_bigger, 64);
        b_0.storeUint(src.thisDoesNotFit, 256);
    };
}

export function loadKoko(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 994470181) { throw Error('Invalid prefix'); }
    let _amount_bigger = sc_0.loadUintBig(64);
    let _thisDoesNotFit = sc_0.loadUintBig(256);
    return { $$type: 'Koko' as const, amount_bigger: _amount_bigger, thisDoesNotFit: _thisDoesNotFit };
}

function loadTupleKoko(source: TupleReader) {
    let _amount_bigger = source.readBigNumber();
    let _thisDoesNotFit = source.readBigNumber();
    return { $$type: 'Koko' as const, amount_bigger: _amount_bigger, thisDoesNotFit: _thisDoesNotFit };
}

function storeTupleKoko(source: Koko) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.amount_bigger);
    builder.writeNumber(source.thisDoesNotFit);
    return builder.build();
}

function dictValueParserKoko(): DictionaryValue<Koko> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeKoko(src)).endCell());
        },
        parse: (src) => {
            return loadKoko(src.loadRef().beginParse());
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
    const __code = Cell.fromBase64('te6ccgECCAEAAVwAART/APSkE/S88sgLAQIBYgIDAo7QAdDTAwFxsKMB+kABINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiFRQUwNvBPhhAvhi2zxZ2zwwMMj4QwHMfwHKAMntVAQFAJWhd6ME4LnYerpZXPY9CdhzrJUKNs0E4TusalpWyPlmRadeW/vixHME4ECrgDcAzscpnLB1XI5LZYcE4TsunLVmnZbmdB0s2yjN0UkBNO1E0NQB+GPSADCRbeD4KNcLCoMJuvLgids8BgHG7aLt+3Ah10nCH5UwINcLH94CkzEwf+AhghDfMNscuo4XMdMfAYIQ3zDbHLry4IHTH9P/WWwSW3/gIYIQO0ZpJbqOFzHTHwGCEDtGaSW68uCB0z/T/1lsElt/4AHAAJEw4w1wBwACbQBU+QGC8M3Q9ZZqN5IiOKaVTukYoWLMWQQJ72XwlM7oHp0LxSu0upN/2zHg');
    const __system = Cell.fromBase64('te6cckECCgEAAWYAAQHAAQEFoIcVAgEU/wD0pBP0vPLICwMCAWIFBACVoXejBOC52Hq6WVz2PQnYc6yVCjbNBOE7rGpaVsj5ZkWnXlv74sRzBOBAq4A3AM7HKZywdVyOS2WHBOE7Lpy1Zp2W5nQdLNsozdFJAo7QAdDTAwFxsKMB+kABINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiFRQUwNvBPhhAvhi2zxZ2zwwMMj4QwHMfwHKAMntVAgGAcbtou37cCHXScIflTAg1wsf3gKTMTB/4CGCEN8w2xy6jhcx0x8BghDfMNscuvLggdMf0/9ZbBJbf+AhghA7Rmkluo4XMdMfAYIQO0ZpJbry4IHTP9P/WWwSW3/gAcAAkTDjDXAHAFT5AYLwzdD1lmo3kiI4ppVO6RihYsxZBAnvZfCUzugenQvFK7S6k3/bMeABNO1E0NQB+GPSADCRbeD4KNcLCoMJuvLgids8CQACbXGxxIQ=');
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
        errors: SampleContract_errors
    };
    
    private constructor(address: Address, init?: { code: Cell, data: Cell }) {
        this.address = address;
        this.init = init;
    }
    
    async send(provider: ContractProvider, via: Sender, args: { value: bigint, bounce?: boolean| null | undefined }, message: Shoko | Koko | 'Increment') {
        
        let body: Cell | null = null;
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'Shoko') {
            body = beginCell().store(storeShoko(message)).endCell();
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'Koko') {
            body = beginCell().store(storeKoko(message)).endCell();
        }
        if (message === 'Increment') {
            body = beginCell().storeUint(0, 32).storeStringTail(message).endCell();
        }
        if (body === null) { throw new Error('Invalid message type'); }
        
        await provider.internal(via, { ...args, body: body });
        
    }
    
}