import { Cell, Slice, Address, Builder, beginCell, ComputeError, TupleItem, TupleReader, Dictionary, contractAddress, ContractProvider, Sender, Contract, ContractABI, TupleBuilder } from 'ton-core';
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

export type Deploy = {
    $$type: 'Deploy';
    queryId: bigint;
}

export function storeDeploy(src: Deploy) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(2509716940, 32);
        b_0.storeUint(src.queryId, 64);
    };
}

export function loadDeploy(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 2509716940) { throw Error('Invalid prefix'); }
    let _queryId = sc_0.loadUintBig(64);
    return { $$type: 'Deploy' as const, queryId: _queryId };
}

function loadTupleDeploy(source: TupleReader) {
    let _queryId = source.readBigNumber();
    return { $$type: 'Deploy' as const, queryId: _queryId };
}

function storeTupleDeploy(source: Deploy) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.queryId);
    return builder.build();
}

export type DeployOk = {
    $$type: 'DeployOk';
    queryId: bigint;
}

export function storeDeployOk(src: DeployOk) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(3548362785, 32);
        b_0.storeUint(src.queryId, 64);
    };
}

export function loadDeployOk(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 3548362785) { throw Error('Invalid prefix'); }
    let _queryId = sc_0.loadUintBig(64);
    return { $$type: 'DeployOk' as const, queryId: _queryId };
}

function loadTupleDeployOk(source: TupleReader) {
    let _queryId = source.readBigNumber();
    return { $$type: 'DeployOk' as const, queryId: _queryId };
}

function storeTupleDeployOk(source: DeployOk) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.queryId);
    return builder.build();
}

export type Increment = {
    $$type: 'Increment';
    key: bigint;
    value: bigint;
}

export function storeIncrement(src: Increment) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(3615081709, 32);
        b_0.storeInt(src.key, 257);
        b_0.storeInt(src.value, 257);
    };
}

export function loadIncrement(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 3615081709) { throw Error('Invalid prefix'); }
    let _key = sc_0.loadIntBig(257);
    let _value = sc_0.loadIntBig(257);
    return { $$type: 'Increment' as const, key: _key, value: _value };
}

function loadTupleIncrement(source: TupleReader) {
    let _key = source.readBigNumber();
    let _value = source.readBigNumber();
    return { $$type: 'Increment' as const, key: _key, value: _value };
}

function storeTupleIncrement(source: Increment) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.key);
    builder.writeNumber(source.value);
    return builder.build();
}

export type Toggle = {
    $$type: 'Toggle';
    key: bigint;
}

export function storeToggle(src: Toggle) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(575056061, 32);
        b_0.storeInt(src.key, 257);
    };
}

export function loadToggle(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 575056061) { throw Error('Invalid prefix'); }
    let _key = sc_0.loadIntBig(257);
    return { $$type: 'Toggle' as const, key: _key };
}

function loadTupleToggle(source: TupleReader) {
    let _key = source.readBigNumber();
    return { $$type: 'Toggle' as const, key: _key };
}

function storeTupleToggle(source: Toggle) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.key);
    return builder.build();
}

export type Persist = {
    $$type: 'Persist';
    key: bigint;
    content: Cell | null;
}

export function storePersist(src: Persist) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(140802882, 32);
        b_0.storeInt(src.key, 257);
        if (src.content !== null && src.content !== undefined) { b_0.storeBit(true).storeRef(src.content); } else { b_0.storeBit(false); }
    };
}

export function loadPersist(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 140802882) { throw Error('Invalid prefix'); }
    let _key = sc_0.loadIntBig(257);
    let _content = sc_0.loadBit() ? sc_0.loadRef() : null;
    return { $$type: 'Persist' as const, key: _key, content: _content };
}

function loadTuplePersist(source: TupleReader) {
    let _key = source.readBigNumber();
    let _content = source.readCellOpt();
    return { $$type: 'Persist' as const, key: _key, content: _content };
}

function storeTuplePersist(source: Persist) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.key);
    builder.writeCell(source.content);
    return builder.build();
}

export type Reset = {
    $$type: 'Reset';
    key: bigint;
}

export function storeReset(src: Reset) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(2438762569, 32);
        b_0.storeInt(src.key, 257);
    };
}

export function loadReset(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 2438762569) { throw Error('Invalid prefix'); }
    let _key = sc_0.loadIntBig(257);
    return { $$type: 'Reset' as const, key: _key };
}

function loadTupleReset(source: TupleReader) {
    let _key = source.readBigNumber();
    return { $$type: 'Reset' as const, key: _key };
}

function storeTupleReset(source: Reset) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.key);
    return builder.build();
}

export type Something = {
    $$type: 'Something';
    value: bigint;
}

export function storeSomething(src: Something) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeInt(src.value, 257);
    };
}

export function loadSomething(slice: Slice) {
    let sc_0 = slice;
    let _value = sc_0.loadIntBig(257);
    return { $$type: 'Something' as const, value: _value };
}

function loadTupleSomething(source: TupleReader) {
    let _value = source.readBigNumber();
    return { $$type: 'Something' as const, value: _value };
}

function storeTupleSomething(source: Something) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.value);
    return builder.build();
}

async function IncrementContract_init() {
    const __init = 'te6ccgEBBwEARwABFP8A9KQT9LzyyAsBAgFiAgMCAs4EBQAJoUrd4AUAAUgBGUbW1tbW0FyMwF2zzJgGAChQRfQAEvQAAcj0ABL0ABL0AMkBzA==';
    const __code = 'te6ccgECNQEABG4AART/APSkE/S88sgLAQIBYgIDAgLKCAkCASAEBQIBIAYHAE293owTgudh6ullc9j0J2HOslQo2zQThO6xqWlbI+WZFp15b++LEcwBDbrwLbPPAegYAQ27QH2zzwHYGAIBIAoLAgHOKisCASAMDQIBWB8gAgHUDg8CAdQdHgSfHAh10nCH5UwINcLH94C0NMDAXGwwAGRf5Fw4gH6QCJQZm8E+GECkVvgIIIQ13nE7bqPkzDbPAXbPDIQVhBFEDRDAPAf2zzgIIIQIkaovbqAYEBoRAAsIG7y0ICAAMNMfAYIQ13nE7bry4IGBAQHXAIEBAdcAWQQ4j5Ew2zwF2zwxEEUQNEEw8CDbPOAgghAIZHtCuhgSGhMAJtMfAYIQIkaovbry4IGBAQHXAAEEPI+TMNs8Bds8MhBWEEUQNEMA8CHbPOAgghCRXJBJuhgUGhUAONMfAYIQCGR7Qrry4IGBAQHXANIAAZHUkm0B4lkENo+RMNs8Bds8MRBFEDRBMPAi2zzgghCVlz3MuhgWGhcAJtMfAYIQkVyQSbry4IGBAQHXAAEDLo+Q2zwF2zwxEEUQNEEw8CPbPOAw8sCCGBkaARbtRNDUAfhi2zxsFRsAINMfAYIQlZc9zLry4IHTPwEBGMj4QgHMVUDbPMntVBwAJPQE9ATUAdD0BPQE9AQwEDUQNAAoUEX0ABL0AAHI9AAS9AAS9ADJAcwAERZ9A1vodwwbYAAjCFulVtZ9Fkw4MgBzwBBM/RBgAgFYISICASAkJQAVJR/AcoA4HABygCAB9zIcQHKAVAH8BpwAcoCUAXPFlAD+gJwAcpoI26zJW6zsY49f/AayHDwGnDwGiRus5l/8BoE8AFQBMyVNANw8BriJG6zmX/wGgTwAVAEzJU0A3DwGuJw8BoCf/AaAslYzJYzMwFw8BriIW6zmH/wGgHwAQHMlDFw8BriyQGAjAAT7AAIBICYnAgEgKCkAJT4QW8kECNfA38CcIBCWG1t8BuAABRfBIAAHBRfBIABjPhBbyQQI18DgQEBIBA5QUBSkCFulVtZ9FowmMgBzwBBM/RC4hAjgQELQAeBAQHwCQGACASAsLQIBIC4vAKkJIEBASJxQTP0DG+hlAHXADCSW23iIG6OGjAUgQEBAX9xIW6VW1n0WjCYyAHPAEEz9ELijh2BAQEB8AGzEDYScSFulVtZ9FowmMgBzwBBM/RC4uIDgAEcggDOKSWBAQEk8Ahu8vQQJIEBAVkgbpUwWfRaMJRBM/QV4gKAB6yBAQFtUxIQSVkhbpVbWfRaMJjIAc8AQTP0QuIEgQEBJm1xIW6VW1n0WjCYyAHPAEEz9ELiA4EBASZtIG6VMFn0WjCUQTP0FeKBAQv4QW8kECNfAxAkbYEBAfAJgQEBbds8QXAgbpUwWfRaMJRBM/QV4hA0QTCAwAQk2zzwHIDMBHiBukjBt4CBu8tCAbyHbPDEBCsgB2zzJMgAMAYEBAc8AAQrIAds8yTQAFoIQ03+4IVjLH8s/';
    const __system = 'te6cckEBAQEAAwAAAUD20kA0';
    let systemCell = Cell.fromBase64(__system);
    let builder = new TupleBuilder();
    builder.writeCell(systemCell);
    let __stack = builder.build();
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let initCell = Cell.fromBoc(Buffer.from(__init, 'base64'))[0];
    let system = await ContractSystem.create();
    let executor = await ContractExecutor.create({ code: initCell, data: new Cell() }, system);
    let res = await executor.get('init', __stack);
    if (!res.success) { throw Error(res.error); }
    if (res.exitCode !== 0 && res.exitCode !== 1) {
        if (IncrementContract_errors[res.exitCode]) {
            throw new ComputeError(IncrementContract_errors[res.exitCode].message, res.exitCode, { logs: res.vmLogs });
        } else {
            throw new ComputeError('Exit code: ' + res.exitCode, res.exitCode, { logs: res.vmLogs });
        }
    }
    
    let data = res.stack.readCell();
    return { code: codeCell, data };
}

const IncrementContract_errors: { [key: number]: { message: string } } = {
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
    52777: { message: `Empty counter` },
}

export class IncrementContract implements Contract {
    
    static async init() {
        return await IncrementContract_init();
    }
    
    static async fromInit() {
        const init = await IncrementContract_init();
        const address = contractAddress(0, init);
        return new IncrementContract(address, init);
    }
    
    static fromAddress(address: Address) {
        return new IncrementContract(address);
    }
    
    readonly address: Address; 
    readonly init?: { code: Cell, data: Cell };
    readonly abi: ContractABI = {
        errors: IncrementContract_errors
    };
    
    private constructor(address: Address, init?: { code: Cell, data: Cell }) {
        this.address = address;
        this.init = init;
    }
    
    async send(provider: ContractProvider, via: Sender, args: { value: bigint, bounce?: boolean| null | undefined }, message: Increment | Toggle | Persist | Reset | Deploy) {
        
        let body: Cell | null = null;
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'Increment') {
            body = beginCell().store(storeIncrement(message)).endCell();
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'Toggle') {
            body = beginCell().store(storeToggle(message)).endCell();
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'Persist') {
            body = beginCell().store(storePersist(message)).endCell();
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'Reset') {
            body = beginCell().store(storeReset(message)).endCell();
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'Deploy') {
            body = beginCell().store(storeDeploy(message)).endCell();
        }
        if (body === null) { throw new Error('Invalid message type'); }
        
        await provider.internal(via, { ...args, body: body });
        
    }
    
    async getCounters(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('counters', builder.build())).stack;
        const result = source.readCellOpt();
        return result;
    }
    
    async getCounters2(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('counters2', builder.build())).stack;
        const result = source.readCellOpt();
        return result;
    }
    
}