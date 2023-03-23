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

export type Deploy = {
    $$type: 'Deploy';
    queryId: bigint;
}

export function storeDeploy(src: Deploy) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(2490013878, 32);
        b_0.storeUint(src.queryId, 64);
    };
}

export function loadDeploy(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 2490013878) { throw Error('Invalid prefix'); }
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

function dictValueParserDeploy(): DictionaryValue<Deploy> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeDeploy(src)).endCell());
        },
        parse: (src) => {
            return loadDeploy(src.loadRef().beginParse());
        }
    }
}

export type DeployOk = {
    $$type: 'DeployOk';
    queryId: bigint;
}

export function storeDeployOk(src: DeployOk) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(2952335191, 32);
        b_0.storeUint(src.queryId, 64);
    };
}

export function loadDeployOk(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 2952335191) { throw Error('Invalid prefix'); }
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

function dictValueParserDeployOk(): DictionaryValue<DeployOk> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeDeployOk(src)).endCell());
        },
        parse: (src) => {
            return loadDeployOk(src.loadRef().beginParse());
        }
    }
}

 type MathTester_init_args = {
    $$type: 'MathTester_init_args';
}

function initMathTester_init_args(src: MathTester_init_args) {
    return (builder: Builder) => {
        let b_0 = builder;
    };
}

async function MathTester_init() {
    const __code = Cell.fromBase64('te6ccgECTAEACW4AART/APSkE/S88sgLAQIBYgIDAtjQAdDTAwFxsMABkX+RcOIB+kABINdJgQELuvLgiCDXCwoggwm6IYEE/7qx8uCIgwm68uCJVFBTA28E+GEC+GLtRNDUAfhj0gAwkW2Ojfgo1wsKgwm68uCJ2zziWds8MDDI+EMBzH8BygDJ7VRKBAIBIAgJAYJwIddJwh+VMCDXCx/eApJbf+ABghCUapi2uo6i0x8BghCUapi2uvLggdM/ATHIAYIQr/kPV1jLH8s/yds8f+AwcAUBGn/4QnBYA4BCAW1t2zwGAc7IcQHKAVAHAcoAcAHKAlAFINdJgQELuvLgiCDXCwoggwm6IYEE/7qx8uCIgwm68uCJzxZQA/oCcAHKaCNusyVus7GXMzMBcAHKAOMNIW6znH8BygABIG7y0IABzJUxcAHKAOLJAfsABwCYfwHKAMhwAcoAcAHKACRus51/AcoABCBu8tCAUATMljQDcAHKAOIkbrOdfwHKAAQgbvLQgFAEzJY0A3ABygDicAHKAAJ/AcoAAslYzAIBIAoLAgEgKCkCASAMDQIBIBMUAgEgDg8CRbdoHaiaGoA/DHpABhItsdG/BRrhYVBhN15cETtnnEs7Z4YwShICRbLI+1E0NQB+GPSADCRbY6N+CjXCwqDCbry4InbPOJZ2zwxgShACRbLAu1E0NQB+GPSADCRbY6N+CjXCwqDCbry4InbPOJZ2zwxgShEAEgEhbpJbf5G94gAQIW6SW3CRuuIAEgEhbpJbcJG64gIBIBUWAgEgHh8CASAXGAIBWBscAkWvy/aiaGoA/DHpABhItsdG/BRrhYVBhN15cETtnnEs7Z4YwEoZAkWt0/aiaGoA/DHpABhItsdG/BRrhYVBhN15cETtnnEs7Z4YwEoaAAKgAC4hbiFuXLCTXwRwmwGzAbOwkb2SW3/i4gJEq4btRNDUAfhj0gAwkW2Ojfgo1wsKgwm68uCJ2zziWds8MUodAkSoRu1E0NQB+GPSADCRbY6N+CjXCwqDCbry4InbPOIB2zwxSiMAArwCAVggIQIBICQlAkSr5e1E0NQB+GPSADCRbY6N+CjXCwqDCbry4InbPOJZ2zwxSiIClqglIG6SMG2OISDXSYEBC7ry4Igg1wsKIIMJuiGBBP+6sfLgiIMJuvLgieLtRNDUAfhj0gAwkW2Ojfgo1wsKgwm68uCJ2zziAds8MUojABAhbpJbf5G94gAEbrMC7awxkLdJGLbHEQCQa6TAgIXdeXBEEGuFhRBBhN0QwIJ/3Vj5cERBhN15cETxELdJGLbHEQCQa6TAgIXdeXBEEGuFhRBBhN0QwIJ/3Vj5cERBhN15cETxdqJoagD8MekAGEi2x0b8FGuFhUGE3XlwRO2ecSztnhjASiYCRa3idqJoagD8MekAGEi2x0b8FGuFhUGE3XlwRO2ecSztnhjASicAMiFuIW5csJNfBH+cAbMBs7CSxwWSW3Di4rMALiFuIW5csJNfBH+bAbMBs7CRupJbcOLiAgEgKisCASBBQgIBICwtAgEgMjMCAUguLwLdsGtASDXSYEBC7ry4Igg1wsKIIMJuiGBBP+6sfLgiIMJuvLgiSFukjFtjiIBINdJgQELuvLgiCDXCwoggwm6IYEE/7qx8uCIgwm68uCJ4u1E0NQB+GPSADCRbY6N+CjXCwqDCbry4InbPOJZ2zwxgSjEC3KmMIW6SMW2OIgEg10mBAQu68uCIINcLCiCDCbohgQT/urHy4IiDCbry4IniASDXSYEBC7ry4Igg1wsKIIMJuiGBBP+6sfLgiIMJuvLgie1E0NQB+GPSADCRbY6N+CjXCwqDCbry4InbPOJZ2zwxSjAClqkGIG6SMG2OISDXSYEBC7ry4Igg1wsKIIMJuiGBBP+6sfLgiIMJuvLgieLtRNDUAfhj0gAwkW2Ojfgo1wsKgwm68uCJ2zziAds8MUo9ABQhbpJbcJLHBeKzABYBIW6SW3CSxwXiswIBIDQ1AgEgODkCzaznAJBrpMCAhd15cEQQa4WFEEGE3RDAgn/dWPlwREGE3XlwRICQa6TAgIXdeXBEEGuFhRBBhN0QwIJ/3Vj5cERBhN15cET2omhqAPwx6QAYSLbHRvwUa4WFQYTdeXBE7Z5xLO2eGMBKNgJFrTT2omhqAPwx6QAYSLbHRvwUa4WFQYTdeXBE7Z5xLO2eGMBKNwAIAccFswACvgIBIDo7AgFmPj8C7KnvIW6SMW2OIgEg10mBAQu68uCIINcLCiCDCbohgQT/urHy4IiDCbry4IniIW6SMW2OIgEg10mBAQu68uCIINcLCiCDCbohgQT/urHy4IiDCbry4Ini7UTQ1AH4Y9IAMJFtjo34KNcLCoMJuvLgids84lnbPDFKPAJEqWXtRNDUAfhj0gAwkW2Ojfgo1wsKgwm68uCJ2zziAds8MUo9ADAhbiFuXLCTXwR/nAGzAbOwkscFkltw4uIAAm4CQ6EjtRNDUAfhj0gAwkW2Ojfgo1wsKgwm68uCJ2zziWds8MZKQAC3o0YJwXOw9XSyuex6E7DnWSoUbZoJwndY1LStkfLMi068t/fFiOYJwIFXAG4BnY5TOWDquRyWyw4JwG9Sd75VFlvHHU9PeBVnDJoJwnZdOWrNOy3M6DpZtlGbopIAArkCASBDRAIBIEdIAt2wQghbpIxbY4iASDXSYEBC7ry4Igg1wsKIIMJuiGBBP+6sfLgiIMJuvLgieIBINdJgQELuvLgiCDXCwoggwm6IYEE/7qx8uCIgwm68uCJ7UTQ1AH4Y9IAMJFtjo34KNcLCoMJuvLgids84lnbPDGBKRQLdsEpASDXSYEBC7ry4Igg1wsKIIMJuiGBBP+6sfLgiIMJuvLgiSFukjFtjiIBINdJgQELuvLgiCDXCwoggwm6IYEE/7qx8uCIgwm68uCJ4u1E0NQB+GPSADCRbY6N+CjXCwqDCbry4InbPOJZ2zwxgSkYAEiFukltwkscF4gAUASFukltwkscF4gLNsFKASDXSYEBC7ry4Igg1wsKIIMJuiGBBP+6sfLgiIMJuvLgiQEg10mBAQu68uCIINcLCiCDCbohgQT/urHy4IiDCbry4IntRNDUAfhj0gAwkW2Ojfgo1wsKgwm68uCJ2zziWds8MYEpJAkWwWvtRNDUAfhj0gAwkW2Ojfgo1wsKgwm68uCJ2zziWds8MYEpLAAYBxwUAAm0AArs=');
    const __system = Cell.fromBase64('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');
    let builder = beginCell();
    builder.storeRef(__system);
    builder.storeUint(0, 1);
    initMathTester_init_args({ $$type: 'MathTester_init_args' })(builder);
    const __data = builder.endCell();
    return { code: __code, data: __data };
}

const MathTester_errors: { [key: number]: { message: string } } = {
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

export class MathTester implements Contract {
    
    static async init() {
        return await MathTester_init();
    }
    
    static async fromInit() {
        const init = await MathTester_init();
        const address = contractAddress(0, init);
        return new MathTester(address, init);
    }
    
    static fromAddress(address: Address) {
        return new MathTester(address);
    }
    
    readonly address: Address; 
    readonly init?: { code: Cell, data: Cell };
    readonly abi: ContractABI = {
        errors: MathTester_errors
    };
    
    private constructor(address: Address, init?: { code: Cell, data: Cell }) {
        this.address = address;
        this.init = init;
    }
    
    async send(provider: ContractProvider, via: Sender, args: { value: bigint, bounce?: boolean| null | undefined }, message: Deploy) {
        
        let body: Cell | null = null;
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'Deploy') {
            body = beginCell().store(storeDeploy(message)).endCell();
        }
        if (body === null) { throw new Error('Invalid message type'); }
        
        await provider.internal(via, { ...args, body: body });
        
    }
    
    async getAdd(provider: ContractProvider, a: bigint, b: bigint) {
        let builder = new TupleBuilder();
        builder.writeNumber(a);
        builder.writeNumber(b);
        let source = (await provider.get('add', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getCompare1(provider: ContractProvider, a: bigint, b: bigint | null) {
        let builder = new TupleBuilder();
        builder.writeNumber(a);
        builder.writeNumber(b);
        let source = (await provider.get('compare1', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getCompare2(provider: ContractProvider, a: bigint, b: bigint | null) {
        let builder = new TupleBuilder();
        builder.writeNumber(a);
        builder.writeNumber(b);
        let source = (await provider.get('compare2', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getCompare3(provider: ContractProvider, a: bigint | null, b: bigint) {
        let builder = new TupleBuilder();
        builder.writeNumber(a);
        builder.writeNumber(b);
        let source = (await provider.get('compare3', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getCompare4(provider: ContractProvider, a: bigint | null, b: bigint) {
        let builder = new TupleBuilder();
        builder.writeNumber(a);
        builder.writeNumber(b);
        let source = (await provider.get('compare4', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getCompare5(provider: ContractProvider, a: bigint | null, b: bigint | null) {
        let builder = new TupleBuilder();
        builder.writeNumber(a);
        builder.writeNumber(b);
        let source = (await provider.get('compare5', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getCompare6(provider: ContractProvider, a: bigint | null, b: bigint | null) {
        let builder = new TupleBuilder();
        builder.writeNumber(a);
        builder.writeNumber(b);
        let source = (await provider.get('compare6', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getCompare7(provider: ContractProvider, a: bigint, b: bigint) {
        let builder = new TupleBuilder();
        builder.writeNumber(a);
        builder.writeNumber(b);
        let source = (await provider.get('compare7', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getCompare8(provider: ContractProvider, a: bigint, b: bigint) {
        let builder = new TupleBuilder();
        builder.writeNumber(a);
        builder.writeNumber(b);
        let source = (await provider.get('compare8', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getCompare9(provider: ContractProvider, a: bigint, b: bigint) {
        let builder = new TupleBuilder();
        builder.writeNumber(a);
        builder.writeNumber(b);
        let source = (await provider.get('compare9', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getCompare10(provider: ContractProvider, a: bigint, b: bigint) {
        let builder = new TupleBuilder();
        builder.writeNumber(a);
        builder.writeNumber(b);
        let source = (await provider.get('compare10', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getCompare11(provider: ContractProvider, a: Address, b: Address) {
        let builder = new TupleBuilder();
        builder.writeAddress(a);
        builder.writeAddress(b);
        let source = (await provider.get('compare11', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getCompare12(provider: ContractProvider, a: Address, b: Address | null) {
        let builder = new TupleBuilder();
        builder.writeAddress(a);
        builder.writeAddress(b);
        let source = (await provider.get('compare12', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getCompare13(provider: ContractProvider, a: Address | null, b: Address) {
        let builder = new TupleBuilder();
        builder.writeAddress(a);
        builder.writeAddress(b);
        let source = (await provider.get('compare13', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getCompare14(provider: ContractProvider, a: Address | null, b: Address | null) {
        let builder = new TupleBuilder();
        builder.writeAddress(a);
        builder.writeAddress(b);
        let source = (await provider.get('compare14', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getCompare15(provider: ContractProvider, a: Address, b: Address) {
        let builder = new TupleBuilder();
        builder.writeAddress(a);
        builder.writeAddress(b);
        let source = (await provider.get('compare15', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getCompare16(provider: ContractProvider, a: Address, b: Address | null) {
        let builder = new TupleBuilder();
        builder.writeAddress(a);
        builder.writeAddress(b);
        let source = (await provider.get('compare16', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getCompare17(provider: ContractProvider, a: Address | null, b: Address) {
        let builder = new TupleBuilder();
        builder.writeAddress(a);
        builder.writeAddress(b);
        let source = (await provider.get('compare17', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getCompare18(provider: ContractProvider, a: Address | null, b: Address | null) {
        let builder = new TupleBuilder();
        builder.writeAddress(a);
        builder.writeAddress(b);
        let source = (await provider.get('compare18', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getIsNull1(provider: ContractProvider, a: bigint | null) {
        let builder = new TupleBuilder();
        builder.writeNumber(a);
        let source = (await provider.get('isNull1', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getIsNotNull1(provider: ContractProvider, a: bigint | null) {
        let builder = new TupleBuilder();
        builder.writeNumber(a);
        let source = (await provider.get('isNotNull1', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getIsNull2(provider: ContractProvider, address: Address | null) {
        let builder = new TupleBuilder();
        builder.writeAddress(address);
        let source = (await provider.get('isNull2', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getIsNotNull2(provider: ContractProvider, address: Address | null) {
        let builder = new TupleBuilder();
        builder.writeAddress(address);
        let source = (await provider.get('isNotNull2', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
}