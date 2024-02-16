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
    let _seqno = source.readBigNumber();
    let _amount = source.readBigNumber();
    let _target = source.readAddress();
    return { $$type: 'Operation' as const, seqno: _seqno, amount: _amount, target: _target };
}

function storeTupleOperation(source: Operation) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.seqno);
    builder.writeNumber(source.amount);
    builder.writeAddress(source.target);
    return builder.build();
}

function dictValueParserOperation(): DictionaryValue<Operation> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeOperation(src)).endCell());
        },
        parse: (src) => {
            return loadOperation(src.loadRef().beginParse());
        }
    }
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
        b_0.storeUint(520967536, 32);
        b_0.store(storeOperation(src.operation));
        b_0.storeRef(src.signature1);
        b_0.storeRef(src.signature2);
        b_0.storeRef(src.signature3);
    };
}

export function loadExecute(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 520967536) { throw Error('Invalid prefix'); }
    let _operation = loadOperation(sc_0);
    let _signature1 = sc_0.loadRef();
    let _signature2 = sc_0.loadRef();
    let _signature3 = sc_0.loadRef();
    return { $$type: 'Execute' as const, operation: _operation, signature1: _signature1, signature2: _signature2, signature3: _signature3 };
}

function loadTupleExecute(source: TupleReader) {
    const _operation = loadTupleOperation(source.readTuple());
    let _signature1 = source.readCell();
    let _signature2 = source.readCell();
    let _signature3 = source.readCell();
    return { $$type: 'Execute' as const, operation: _operation, signature1: _signature1, signature2: _signature2, signature3: _signature3 };
}

function storeTupleExecute(source: Execute) {
    let builder = new TupleBuilder();
    builder.writeTuple(storeTupleOperation(source.operation));
    builder.writeSlice(source.signature1);
    builder.writeSlice(source.signature2);
    builder.writeSlice(source.signature3);
    return builder.build();
}

function dictValueParserExecute(): DictionaryValue<Execute> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeExecute(src)).endCell());
        },
        parse: (src) => {
            return loadExecute(src.loadRef().beginParse());
        }
    }
}

export type Executed = {
    $$type: 'Executed';
    seqno: bigint;
}

export function storeExecuted(src: Executed) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(2652032952, 32);
        b_0.storeUint(src.seqno, 32);
    };
}

export function loadExecuted(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 2652032952) { throw Error('Invalid prefix'); }
    let _seqno = sc_0.loadUintBig(32);
    return { $$type: 'Executed' as const, seqno: _seqno };
}

function loadTupleExecuted(source: TupleReader) {
    let _seqno = source.readBigNumber();
    return { $$type: 'Executed' as const, seqno: _seqno };
}

function storeTupleExecuted(source: Executed) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.seqno);
    return builder.build();
}

function dictValueParserExecuted(): DictionaryValue<Executed> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeExecuted(src)).endCell());
        },
        parse: (src) => {
            return loadExecuted(src.loadRef().beginParse());
        }
    }
}

 type MultisigContract_init_args = {
    $$type: 'MultisigContract_init_args';
    key1: bigint;
    key2: bigint;
    key3: bigint;
}

function initMultisigContract_init_args(src: MultisigContract_init_args) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeInt(src.key1, 257);
        b_0.storeInt(src.key2, 257);
        b_0.storeInt(src.key3, 257);
    };
}

async function MultisigContract_init(key1: bigint, key2: bigint, key3: bigint) {
    const __code = Cell.fromBase64('te6ccgECHAEAA1oAART/APSkE/S88sgLAQIBYgIDAqrQAdDTAwFxsKMB+kABINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiFRQUwNvBPhhAvhi2zxVE9s88uCCyPhDAcx/AcoAVTBQNMsfy//L/8v/ye1UFwQCASAKCwLY7aLt+wGSMH/gcCHXScIflTAg1wsf3iCCEB8NVXC6jsQw0x8BghAfDVVwuvLggdMf+gD6QAEg10mBAQu68uCIINcLCiCBBP+68tCJgwm68uCIQzAD1AHQAdQB0AHUAdAWQzBsFuDAAJEw4w1wBQYBtFR1Q8hVIFAjyx8B+gIBINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiM8WyfkAUgQq+RBSMyn5EFQTN/kQgUT2U2q68vSCAL0RApJwM98CknAy3wHy9Ns8fwcAVPkBgvCF0og4TABDRYsCgDyyIFn2iAPFU8NlY0Q0ZGjayWHyRrqTf9sx4AESMn9ZcG1tbds8CAHKyHEBygFQBwHKAHABygJQBSDXSYEBC7ry4Igg1wsKIIEE/7ry0ImDCbry4IjPFlAD+gJwAcpoI26zkX+TJG6z4pczMwFwAcoA4w0hbrOcfwHKAAEgbvLQgAHMlTFwAcoA4skB+wAJAJh/AcoAyHABygBwAcoAJG6znX8BygAEIG7y0IBQBMyWNANwAcoA4iRus51/AcoABCBu8tCAUATMljQDcAHKAOJwAcoAAn8BygACyVjMAhG+ZL7Z5tnjYgwXDAIBIA0OAAIjAgEgDxACAUgaGwIBIBESAgEgFRYCEbDp9s82zxsQYBcTAhGw4bbPNs8bEGAXFAACIAACIQIRsPl2zzbPGxBgFxgAlbL0YJwXOw9XSyuex6E7DnWSoUbZoJwndY1LStkfLMi068t/fFiOYJwIFXAG4BnY5TOWDquRyWyw4JwnZdOWrNOy3M6DpZtlGbopIAFy7UTQ1AH4Y9IAAZzTH9P/0//T/1UwbBTg+CjXCwqDCbry4ImBAQHXAIEBAdcAgQEB1wBVIAPRWNs8GQACIgAGcFUgABGwr7tRNDSAAGAAdbJu40NWlwZnM6Ly9RbVpnUUJrcFBZSzdvWU1OVlp4VWZlNGNzRHNBWGRCNW5ZOURFSHNwQmY2R285gg');
    const __system = Cell.fromBase64('te6cckECHgEAA2QAAQHAAQEFobo9AgEU/wD0pBP0vPLICwMCAWIVBAIBIBMFAgEgCQYCAUgIBwB1sm7jQ1aXBmczovL1FtWmdRQmtwUFlLN29ZTU5WWnhVZmU0Y3NEc0FYZEI1blk5REVIc3BCZjZHbzmCAAEbCvu1E0NIAAYAIBIA4KAgEgDAsAlbL0YJwXOw9XSyuex6E7DnWSoUbZoJwndY1LStkfLMi068t/fFiOYJwIFXAG4BnY5TOWDquRyWyw4JwnZdOWrNOy3M6DpZtlGbopIAIRsPl2zzbPGxBgHA0AAiICASARDwIRsOG2zzbPGxBgHBAAAiECEbDp9s82zxsQYBwSAAIgAhG+ZL7Z5tnjYgwcFAACIwKq0AHQ0wMBcbCjAfpAASDXSYEBC7ry4Igg1wsKIIEE/7ry0ImDCbry4IhUUFMDbwT4YQL4Yts8VRPbPPLggsj4QwHMfwHKAFUwUDTLH8v/y//L/8ntVBwWAtjtou37AZIwf+BwIddJwh+VMCDXCx/eIIIQHw1VcLqOxDDTHwGCEB8NVXC68uCB0x/6APpAASDXSYEBC7ry4Igg1wsKIIEE/7ry0ImDCbry4IhDMAPUAdAB1AHQAdQB0BZDMGwW4MAAkTDjDXAYFwBU+QGC8IXSiDhMAENFiwKAPLIgWfaIA8VTw2VjRDRkaNrJYfJGupN/2zHgAbRUdUPIVSBQI8sfAfoCASDXSYEBC7ry4Igg1wsKIIEE/7ry0ImDCbry4IjPFsn5AFIEKvkQUjMp+RBUEzf5EIFE9lNquvL0ggC9EQKScDPfApJwMt8B8vTbPH8ZARIyf1lwbW1t2zwaAcrIcQHKAVAHAcoAcAHKAlAFINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiM8WUAP6AnABymgjbrORf5MkbrPilzMzAXABygDjDSFus5x/AcoAASBu8tCAAcyVMXABygDiyQH7ABsAmH8BygDIcAHKAHABygAkbrOdfwHKAAQgbvLQgFAEzJY0A3ABygDiJG6znX8BygAEIG7y0IBQBMyWNANwAcoA4nABygACfwHKAALJWMwBcu1E0NQB+GPSAAGc0x/T/9P/0/9VMGwU4Pgo1wsKgwm68uCJgQEB1wCBAQHXAIEBAdcAVSAD0VjbPB0ABnBVIPYcAac=');
    let builder = beginCell();
    builder.storeRef(__system);
    builder.storeUint(0, 1);
    initMultisigContract_init_args({ $$type: 'MultisigContract_init_args', key1, key2, key3 })(builder);
    const __data = builder.endCell();
    return { code: __code, data: __data };
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
    135: { message: `Code of a contract was not found` },
    136: { message: `Invalid address` },
    137: { message: `Masterchain support is not enabled for this contract` },
    17654: { message: `Invalid seqno` },
    48401: { message: `Invalid signature` },
}

const MultisigContract_types: ABIType[] = [
    {"name":"StateInit","header":null,"fields":[{"name":"code","type":{"kind":"simple","type":"cell","optional":false}},{"name":"data","type":{"kind":"simple","type":"cell","optional":false}}]},
    {"name":"Context","header":null,"fields":[{"name":"bounced","type":{"kind":"simple","type":"bool","optional":false}},{"name":"sender","type":{"kind":"simple","type":"address","optional":false}},{"name":"value","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"raw","type":{"kind":"simple","type":"slice","optional":false}}]},
    {"name":"SendParameters","header":null,"fields":[{"name":"bounce","type":{"kind":"simple","type":"bool","optional":false}},{"name":"to","type":{"kind":"simple","type":"address","optional":false}},{"name":"value","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"mode","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"body","type":{"kind":"simple","type":"cell","optional":true}},{"name":"code","type":{"kind":"simple","type":"cell","optional":true}},{"name":"data","type":{"kind":"simple","type":"cell","optional":true}}]},
    {"name":"Operation","header":null,"fields":[{"name":"seqno","type":{"kind":"simple","type":"uint","optional":false,"format":32}},{"name":"amount","type":{"kind":"simple","type":"uint","optional":false,"format":"coins"}},{"name":"target","type":{"kind":"simple","type":"address","optional":false}}]},
    {"name":"Execute","header":520967536,"fields":[{"name":"operation","type":{"kind":"simple","type":"Operation","optional":false}},{"name":"signature1","type":{"kind":"simple","type":"slice","optional":false}},{"name":"signature2","type":{"kind":"simple","type":"slice","optional":false}},{"name":"signature3","type":{"kind":"simple","type":"slice","optional":false}}]},
    {"name":"Executed","header":2652032952,"fields":[{"name":"seqno","type":{"kind":"simple","type":"uint","optional":false,"format":32}}]},
]

const MultisigContract_getters: ABIGetter[] = [
    {"name":"key1","arguments":[],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
    {"name":"key2","arguments":[],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
    {"name":"key3","arguments":[],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
    {"name":"seqno","arguments":[],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
]

const MultisigContract_receivers: ABIReceiver[] = [
    {"receiver":"internal","message":{"kind":"text","text":"Deploy"}},
    {"receiver":"internal","message":{"kind":"typed","type":"Execute"}},
]

export class MultisigContract implements Contract {
    
    static async init(key1: bigint, key2: bigint, key3: bigint) {
        return await MultisigContract_init(key1, key2, key3);
    }
    
    static async fromInit(key1: bigint, key2: bigint, key3: bigint) {
        const init = await MultisigContract_init(key1, key2, key3);
        const address = contractAddress(0, init);
        return new MultisigContract(address, init);
    }
    
    static fromAddress(address: Address) {
        return new MultisigContract(address);
    }
    
    readonly address: Address; 
    readonly init?: { code: Cell, data: Cell };
    readonly abi: ContractABI = {
        types:  MultisigContract_types,
        getters: MultisigContract_getters,
        receivers: MultisigContract_receivers,
        errors: MultisigContract_errors,
    };
    
    private constructor(address: Address, init?: { code: Cell, data: Cell }) {
        this.address = address;
        this.init = init;
    }
    
    async send(provider: ContractProvider, via: Sender, args: { value: bigint, bounce?: boolean| null | undefined }, message: 'Deploy' | Execute) {
        
        let body: Cell | null = null;
        if (message === 'Deploy') {
            body = beginCell().storeUint(0, 32).storeStringTail(message).endCell();
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'Execute') {
            body = beginCell().store(storeExecute(message)).endCell();
        }
        if (body === null) { throw new Error('Invalid message type'); }
        
        await provider.internal(via, { ...args, body: body });
        
    }
    
    async getKey1(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('key1', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getKey2(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('key2', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getKey3(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('key3', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getSeqno(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('seqno', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
}