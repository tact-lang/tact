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

function loadTupleStateInit(source: TupleReader) {
    const _code = source.readCell();
    const _data = source.readCell();
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
    const _bounced = source.readBoolean();
    const _sender = source.readAddress();
    const _value = source.readBigNumber();
    const _raw = source.readCell();
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

function loadTupleSendParameters(source: TupleReader) {
    const _bounce = source.readBoolean();
    const _to = source.readAddress();
    const _value = source.readBigNumber();
    const _mode = source.readBigNumber();
    const _body = source.readCellOpt();
    const _code = source.readCellOpt();
    const _data = source.readCellOpt();
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
    const _queryId = source.readBigNumber();
    return { $$type: 'Deploy' as const, queryId: _queryId };
}

export function packStackDeploy(src: Deploy, __stack: TupleItem[]) {
    __stack.push({ type: 'int', value: src.queryId });
}

export function packTupleDeploy(src: Deploy): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'int', value: src.queryId });
    return __stack;
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
    const _queryId = source.readBigNumber();
    return { $$type: 'DeployOk' as const, queryId: _queryId };
}

export function packStackDeployOk(src: DeployOk, __stack: TupleItem[]) {
    __stack.push({ type: 'int', value: src.queryId });
}

export function packTupleDeployOk(src: DeployOk): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'int', value: src.queryId });
    return __stack;
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
    const _key = source.readBigNumber();
    const _value = source.readBigNumber();
    return { $$type: 'Increment' as const, key: _key, value: _value };
}

export function packStackIncrement(src: Increment, __stack: TupleItem[]) {
    __stack.push({ type: 'int', value: src.key });
    __stack.push({ type: 'int', value: src.value });
}

export function packTupleIncrement(src: Increment): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'int', value: src.key });
    __stack.push({ type: 'int', value: src.value });
    return __stack;
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
    const _key = source.readBigNumber();
    return { $$type: 'Toggle' as const, key: _key };
}

export function packStackToggle(src: Toggle, __stack: TupleItem[]) {
    __stack.push({ type: 'int', value: src.key });
}

export function packTupleToggle(src: Toggle): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'int', value: src.key });
    return __stack;
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
        if (src.content !== null) {
            b_0.storeBit(true);
            b_0.storeRef(src.content);
        } else {
            b_0.storeBit(false);
        }
    };
}

export function loadPersist(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 140802882) { throw Error('Invalid prefix'); }
    let _key = sc_0.loadIntBig(257);
    let _content: Cell | null = null;
    if (sc_0.loadBit()) {
        _content = sc_0.loadRef();
    }
    return { $$type: 'Persist' as const, key: _key, content: _content };
}

function loadTuplePersist(source: TupleReader) {
    const _key = source.readBigNumber();
    const _content = source.readCellOpt();
    return { $$type: 'Persist' as const, key: _key, content: _content };
}

export function packStackPersist(src: Persist, __stack: TupleItem[]) {
    __stack.push({ type: 'int', value: src.key });
    if (src.content !== null) {
        __stack.push({ type: 'cell', cell: src.content });
    } else {
        __stack.push({ type: 'null' });
    }
}

export function packTuplePersist(src: Persist): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'int', value: src.key });
    if (src.content !== null) {
        __stack.push({ type: 'cell', cell: src.content });
    } else {
        __stack.push({ type: 'null' });
    }
    return __stack;
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
    const _key = source.readBigNumber();
    return { $$type: 'Reset' as const, key: _key };
}

export function packStackReset(src: Reset, __stack: TupleItem[]) {
    __stack.push({ type: 'int', value: src.key });
}

export function packTupleReset(src: Reset): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'int', value: src.key });
    return __stack;
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
    const _value = source.readBigNumber();
    return { $$type: 'Something' as const, value: _value };
}

export function packStackSomething(src: Something, __stack: TupleItem[]) {
    __stack.push({ type: 'int', value: src.value });
}

export function packTupleSomething(src: Something): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'int', value: src.value });
    return __stack;
}

async function IncrementContract_init() {
    const __code = 'te6ccgECMgEABRgAART/APSkE/S88sgLAQIBYgIDAgLKBAUCASAsLQIBIAYHAgFiJCUCASAICQIBWBkaAgEgCgsCAdQXGAIBSAwNAgEgExQEnxwIddJwh+VMCDXCx/eAtDTAwFxsMABkX+RcOIB+kAiUGZvBPhhApFb4CCCENd5xO264wIgghAiRqi9uuMCIIIQCGR7QrrjAiCCEJFckEm6gDg8QEQALCBu8tCAgALww7UTQ1AH4YvQE9ATUAdD0BPQE9AQwEDUQNGwVBdMfAYIQ13nE7bry4IGBAQHXAIEBAdcAWTIQVhBFEDRDAPAgyPhCAcxVQFBF9AAS9AAByPQAEvQAEvQAyQHMye1UAK4w7UTQ1AH4YvQE9ATUAdD0BPQE9AQwEDUQNGwVBdMfAYIQIkaovbry4IGBAQHXAAExEEUQNEEw8CHI+EIBzFVAUEX0ABL0AAHI9AAS9AAS9ADJAczJ7VQAxDDtRNDUAfhi9AT0BNQB0PQE9AT0BDAQNRA0bBUF0x8BghAIZHtCuvLggYEBAdcAbQHSAAGSMdTeWTIQVhBFEDRDAPAiyPhCAcxVQFBF9AAS9AAByPQAEvQAEvQAyQHMye1UAc6OVzDtRNDUAfhi9AT0BNQB0PQE9AT0BDAQNRA0bBUF0x8BghCRXJBJuvLggYEBAdcAATEQRRA0QTDwI8j4QgHMVUBQRfQAEvQAAcj0ABL0ABL0AMkBzMntVOCCEJWXPcy64wIw8sCCEgCm7UTQ1AH4YvQE9ATUAdD0BPQE9AQwEDUQNGwVBdMfAYIQlZc9zLry4IHTPwExEEUQNEEw8CTI+EIBzFVAUEX0ABL0AAHI9AAS9AAS9ADJAczJ7VQAI1IW6VW1n0WjDgyAHPAEEz9EKAIBIBUWAB0QTP0DG+hlAHXADDgW22AAGwgbpUwWfRaMOBBM/QVgABEWfQNb6HcMG2AAIwhbpVbWfRZMODIAc8AQTP0QYAIBWBscAgEgHh8AFSUfwHKAOBwAcoAgAfcyHEBygFQB/AacAHKAlAFzxZQA/oCcAHKaCNusyVus7GOPX/wGshw8Bpw8BokbrOZf/AaBPABUATMlTQDcPAa4iRus5l/8BoE8AFQBMyVNANw8BricPAaAn/wGgLJWMyWMzMBcPAa4iFus5h/8BoB8AEBzJQxcPAa4skBgHQAE+wACASAgIQIBICIjACU+EFvJBAjXwN/AnCAQlhtbfAbgAD0bW1tbW0FyMwFUEX0ABL0AAHI9AAS9AAS9ADJAczJgAAUXwSAABwUXwSACASAmJwAh1kAMEIab/cEKxlj+Wf5PgOQCASAoKQIBICorAEM+EFvJBAjXwOBAQEgEDlBQFKQ8AUQI4EBC0AHgQEB8AkBgAEsJIEBASJx8AYgbpowFIEBAQF/cfAFnYEBAQHwAbMQNhJx8AXiA4AAvIIAziklgQEBJPAIbvL0ECSBAQFZ8AcCgAKcgQEBbVMSEElZ8AUEgQEBJm1x8AUDgQEBJm3wB4EBC/hBbyQQI18DECRtgQEB8AmBAQFtIG6SMG2OECBu8tCAbyHIAQGBAQHPAMniQXDwBxA0QTCACASAuLwBNvd6ME4LnYerpZXPY9CdhzrJUKNs0E4TusalpWyPlmRadeW/vixHMAgEgMDEAP7tAftRNDUAfhi9AT0BNQB0PQE9AT0BDAQNRA0bBXwHoAAm0Pv4DsAA/teBdqJoagD8MXoCegJqAOh6AnoCegIYCBqIGjYK+A/A=';
    const depends = Dictionary.empty(Dictionary.Keys.Uint(16), Dictionary.Values.Cell());
    let systemCell = beginCell().storeDict(depends).endCell();
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'cell', cell: systemCell });
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let system = await ContractSystem.create();
    let executor = await ContractExecutor.create({ code: codeCell, data: new Cell() }, system);
    let res = await executor.get('init_IncrementContract', __stack);
    if (!res.success) { throw Error(res.error); }
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
        let __stack: TupleItem[] = [];
        let result = await provider.get('counters', __stack);
        return result.stack.readCellOpt();
    }
    
    async getCounters2(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('counters2', __stack);
        return result.stack.readCellOpt();
    }
    
}