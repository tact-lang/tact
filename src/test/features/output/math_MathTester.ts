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

export type FactoryDeploy = {
    $$type: 'FactoryDeploy';
    queryId: bigint;
    cashback: Address;
}

export function storeFactoryDeploy(src: FactoryDeploy) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(1829761339, 32);
        b_0.storeUint(src.queryId, 64);
        b_0.storeAddress(src.cashback);
    };
}

export function loadFactoryDeploy(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 1829761339) { throw Error('Invalid prefix'); }
    let _queryId = sc_0.loadUintBig(64);
    let _cashback = sc_0.loadAddress();
    return { $$type: 'FactoryDeploy' as const, queryId: _queryId, cashback: _cashback };
}

function loadTupleFactoryDeploy(source: TupleReader) {
    let _queryId = source.readBigNumber();
    let _cashback = source.readAddress();
    return { $$type: 'FactoryDeploy' as const, queryId: _queryId, cashback: _cashback };
}

function storeTupleFactoryDeploy(source: FactoryDeploy) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.queryId);
    builder.writeAddress(source.cashback);
    return builder.build();
}

function dictValueParserFactoryDeploy(): DictionaryValue<FactoryDeploy> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeFactoryDeploy(src)).endCell());
        },
        parse: (src) => {
            return loadFactoryDeploy(src.loadRef().beginParse());
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
    const __code = Cell.fromBase64('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');
    const __system = Cell.fromBase64('te6cckECiwEACSEAAQHAAQEFoJpJAgEU/wD0pBP0vPLICwMCAWKEBAIBIFQFAgEgJQYCASAYBwIBIA0IAgFICwkCEKid2zxZ2zwxiQoAHCFuklt/lwH5AAH5AL3iAhCpa9s8Wds8MYkMAAK7AgEgEw4CASARDwIQqgzbPFnbPDGJEAAEqQgCEKhI2zxZ2zwxiRIABKkEAgEgFhQCEKi82zxZ2zwxiRUAHgEhbpJbf5cB+QAB+QC94gKEqUoBINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiAEg10mBAQu68uCIINcLCiCBBP+68tCJgwm68uCI2zxZ2zwxiRcABgHHBQIBIB8ZAgEgGxoAdazdxoatLgzOZ0Xl6i2qKK4oKwbrLe5uCaZobuhLLI6GLM1oqIiOLc1PLmaozolJDwrsrCtMbamoJtBAAgEgHRwCEKjf2zxZ2zwxiU4ClKkpASDXSYEBC7ry4Igg1wsKIIEE/7ry0ImDCbry4IghbpIxbY4dASDXSYEBC7ry4Igg1wsKIIEE/7ry0ImDCbry4Iji2zxZ2zwxiR4AFAEhbpJbcJLHBeICAUghIAIQqP7bPFnbPDGJfgIBICMiAA+lfdqJoaQAAwKTphBC3SRi2xw6AkGukwICF3XlwRBBrhYUQQIJ/3XloRMGE3XlwRHEAkGukwICF3XlwRBBrhYUQQIJ/3XloRMGE3XlwRG2eLO2eGOJJAASIW6SW3CSxwXiAgEgQSYCASAzJwIBICwoAgFmKikAt6NGCcFzsPV0srnsehOw51kqFG2aCcJ3WNS0rZHyzItOvLf3xYjmCcCBVwBuAZ2OUzlg6rkclssOCcBvUne+VRZbxx1PT3gVZwyaCcJ2XTlqzTstzOg6WbZRm6KSAg+hI2zxZ2zwxokrAAK5AgEgMS0CAUgvLgIPoZds8Ads8MaJTAIPoGds8Wds8MaJMAAcIW6SW3CXAfkAAfkAuuICpKnvIW6SMW2OHQEg10mBAQu68uCIINcLCiCBBP+68tCJgwm68uCI4iFukjFtjh0BINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiOLbPFnbPDGJMgAwIW4hblywk18Ef5wBswGzsJLHBZJbcOLiAgEgPDQCASA3NQIQqvHbPFnbPDGJNgACrAIBIDo4Ag+k07Z4s7Z4Y4k5AAK+Ag+kubZ4s7Z4Y4k7AAKwAgEgPz0CEKg42zxZ2zwxiT4AHgEhbpJbcJcB+QAB+QC64gKEqc4BINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiAEg10mBAQu68uCIINcLCiCBBP+68tCJgwm68uCI2zxZ2zwxiUAACAHHBbMCASBJQgIBSEdDAgFIRUQCD6CfbPAHbPDGiUwCD6FvbPFnbPDGiUYAEAEB+QAB+QC9ApSprQEg10mBAQu68uCIINcLCiCBBP+68tCJgwm68uCIIW6SMW2OHQEg10mBAQu68uCIINcLCiCBBP+68tCJgwm68uCI4ts8Wds8MYlIABYBIW6SW3CSxwXiswIBSE9KAgFITUsCV6AYgbpIwbY4cINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiOLbPAHbPDGiUwAAm4CD6HrbPFnbPDGiU4APCFuIW5csJNfBH+OEQGzAbOwlwH5AAH5ALqSW3Di4gIBIFJQAg+nebZ4s7Z4Y4lRAAKoApOnGELdJGLbHDoCQa6TAgIXdeXBEEGuFhRBAgn/deWhEwYTdeXBEcQCQa6TAgIXdeXBEEGuFhRBAgn/deWhEwYTdeXBEbZ4s7Z4Y4lTABQhbpJbcJLHBeKzAgEgdlUCASBlVgIBIF5XAgEgXFgCASBaWQIQqATbPAHbPDGJawIQq8TbPFnbPDGJWwAuIW4hblywk18Ef5sBswGzsJG6kltw4uICpawxkLdJGLbHDoCQa6TAgIXdeXBEEGuFhRBAgn/deWhEwYTdeXBEcRC3SRi2xw6AkGukwICF3XlwRBBrhYUQQIJ/3XloRMGE3XlwRHFtniztnhjAiV0AMiFuIW5csJNfBH+cAbMBs7CSxwWSW3Di4rMCASBjXwIBIGFgAlioJSBukjBtjhwg10mBAQu68uCIINcLCiCBBP+68tCJgwm68uCI4ts8Ads8MYlrAhCr5ds8Wds8MYliABAhbpJbf5G94gIRrCFtniztnhjAiWQAEAEB+QAB+QC6AgEgbmYCAVhsZwIBSGpoAg+gO2zxZ2zwxolpAAKtAg+hG2zwB2zwxolrAARuswIQq4bbPFnbPDGJbQACvAIBIHFvAhGt0+2eLO2eGMCJcAAuIW4hblywk18EcJsBswGzsJG9klt/4uICAVh0cgIPpy+2eLO2eGOJcwACoAIPp4O2eLO2eGOJdQACsQIBIH93AgEgfXgCAnV7eQIPoQNs8Wds8MaJegASASFukltwkbriAg+gQ2zxZ2zwxol8AAKhAhGxTDbPFnbPDGCJfgA8IW4hblywk18EcI4RAbMBs7CXAfkAAfkAvZJbf+LiAgEggoACEbLAts8Wds8MYImBABAhbpJbcJG64gIRssj2zxZ2zwxgiYMAEgEhbpJbf5G94gKS0AHQ0wMBcbCjAfpAASDXSYEBC7ry4Igg1wsKIIEE/7ry0ImDCbry4IhUUFMDbwT4YQL4Yts8Wds88uCCMMj4QwHMfwHKAMntVImFAYoBkjB/4HAh10nCH5UwINcLH96CEJRqmLa6jqfTHwGCEJRqmLa68uCB0z8BMcgBghCv+Q9XWMsfyz/J+EIBcG3bPH/gMHCGATptbSJus5lbIG7y0IBvIgGRMuIQJHADBIBCUCPbPIcByshxAcoBUAcBygBwAcoCUAUg10mBAQu68uCIINcLCiCBBP+68tCJgwm68uCIzxZQA/oCcAHKaCNus5F/kyRus+KXMzMBcAHKAOMNIW6znH8BygABIG7y0IABzJUxcAHKAOLJAfsAiACYfwHKAMhwAcoAcAHKACRus51/AcoABCBu8tCAUATMljQDcAHKAOIkbrOdfwHKAAQgbvLQgFAEzJY0A3ABygDicAHKAAJ/AcoAAslYzAE07UTQ1AH4Y9IAMJFt4Pgo1wsKgwm68uCJ2zyKAAJtKNvxzw==');
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

const MathTester_types: ABIType[] = [
    {"name":"StateInit","header":null,"fields":[{"name":"code","type":{"kind":"simple","type":"cell","optional":false}},{"name":"data","type":{"kind":"simple","type":"cell","optional":false}}]},
    {"name":"Context","header":null,"fields":[{"name":"bounced","type":{"kind":"simple","type":"bool","optional":false}},{"name":"sender","type":{"kind":"simple","type":"address","optional":false}},{"name":"value","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"raw","type":{"kind":"simple","type":"slice","optional":false}}]},
    {"name":"SendParameters","header":null,"fields":[{"name":"bounce","type":{"kind":"simple","type":"bool","optional":false}},{"name":"to","type":{"kind":"simple","type":"address","optional":false}},{"name":"value","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"mode","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"body","type":{"kind":"simple","type":"cell","optional":true}},{"name":"code","type":{"kind":"simple","type":"cell","optional":true}},{"name":"data","type":{"kind":"simple","type":"cell","optional":true}}]},
    {"name":"Deploy","header":2490013878,"fields":[{"name":"queryId","type":{"kind":"simple","type":"uint","optional":false,"format":64}}]},
    {"name":"DeployOk","header":2952335191,"fields":[{"name":"queryId","type":{"kind":"simple","type":"uint","optional":false,"format":64}}]},
    {"name":"FactoryDeploy","header":1829761339,"fields":[{"name":"queryId","type":{"kind":"simple","type":"uint","optional":false,"format":64}},{"name":"cashback","type":{"kind":"simple","type":"address","optional":false}}]},
]

const MathTester_getters: ABIGetter[] = [
    {"name":"add","arguments":[{"name":"a","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"b","type":{"kind":"simple","type":"int","optional":false,"format":257}}],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
    {"name":"sub","arguments":[{"name":"a","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"b","type":{"kind":"simple","type":"int","optional":false,"format":257}}],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
    {"name":"mul","arguments":[{"name":"a","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"b","type":{"kind":"simple","type":"int","optional":false,"format":257}}],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
    {"name":"div","arguments":[{"name":"a","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"b","type":{"kind":"simple","type":"int","optional":false,"format":257}}],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
    {"name":"mod","arguments":[{"name":"a","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"b","type":{"kind":"simple","type":"int","optional":false,"format":257}}],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
    {"name":"shr","arguments":[{"name":"a","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"b","type":{"kind":"simple","type":"int","optional":false,"format":257}}],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
    {"name":"shl","arguments":[{"name":"a","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"b","type":{"kind":"simple","type":"int","optional":false,"format":257}}],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
    {"name":"and","arguments":[{"name":"a","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"b","type":{"kind":"simple","type":"int","optional":false,"format":257}}],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
    {"name":"or","arguments":[{"name":"a","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"b","type":{"kind":"simple","type":"int","optional":false,"format":257}}],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
    {"name":"compare1","arguments":[{"name":"a","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"b","type":{"kind":"simple","type":"int","optional":true,"format":257}}],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"compare2","arguments":[{"name":"a","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"b","type":{"kind":"simple","type":"int","optional":true,"format":257}}],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"compare3","arguments":[{"name":"a","type":{"kind":"simple","type":"int","optional":true,"format":257}},{"name":"b","type":{"kind":"simple","type":"int","optional":false,"format":257}}],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"compare4","arguments":[{"name":"a","type":{"kind":"simple","type":"int","optional":true,"format":257}},{"name":"b","type":{"kind":"simple","type":"int","optional":false,"format":257}}],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"compare5","arguments":[{"name":"a","type":{"kind":"simple","type":"int","optional":true,"format":257}},{"name":"b","type":{"kind":"simple","type":"int","optional":true,"format":257}}],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"compare6","arguments":[{"name":"a","type":{"kind":"simple","type":"int","optional":true,"format":257}},{"name":"b","type":{"kind":"simple","type":"int","optional":true,"format":257}}],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"compare7","arguments":[{"name":"a","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"b","type":{"kind":"simple","type":"int","optional":false,"format":257}}],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"compare8","arguments":[{"name":"a","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"b","type":{"kind":"simple","type":"int","optional":false,"format":257}}],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"compare9","arguments":[{"name":"a","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"b","type":{"kind":"simple","type":"int","optional":false,"format":257}}],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"compare10","arguments":[{"name":"a","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"b","type":{"kind":"simple","type":"int","optional":false,"format":257}}],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"compare11","arguments":[{"name":"a","type":{"kind":"simple","type":"address","optional":false}},{"name":"b","type":{"kind":"simple","type":"address","optional":false}}],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"compare12","arguments":[{"name":"a","type":{"kind":"simple","type":"address","optional":false}},{"name":"b","type":{"kind":"simple","type":"address","optional":true}}],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"compare13","arguments":[{"name":"a","type":{"kind":"simple","type":"address","optional":true}},{"name":"b","type":{"kind":"simple","type":"address","optional":false}}],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"compare14","arguments":[{"name":"a","type":{"kind":"simple","type":"address","optional":true}},{"name":"b","type":{"kind":"simple","type":"address","optional":true}}],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"compare15","arguments":[{"name":"a","type":{"kind":"simple","type":"address","optional":false}},{"name":"b","type":{"kind":"simple","type":"address","optional":false}}],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"compare16","arguments":[{"name":"a","type":{"kind":"simple","type":"address","optional":false}},{"name":"b","type":{"kind":"simple","type":"address","optional":true}}],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"compare17","arguments":[{"name":"a","type":{"kind":"simple","type":"address","optional":true}},{"name":"b","type":{"kind":"simple","type":"address","optional":false}}],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"compare18","arguments":[{"name":"a","type":{"kind":"simple","type":"address","optional":true}},{"name":"b","type":{"kind":"simple","type":"address","optional":true}}],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"compare19","arguments":[{"name":"a","type":{"kind":"simple","type":"cell","optional":false}},{"name":"b","type":{"kind":"simple","type":"cell","optional":false}}],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"compare20","arguments":[{"name":"a","type":{"kind":"simple","type":"cell","optional":false}},{"name":"b","type":{"kind":"simple","type":"cell","optional":true}}],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"compare21","arguments":[{"name":"a","type":{"kind":"simple","type":"cell","optional":true}},{"name":"b","type":{"kind":"simple","type":"cell","optional":false}}],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"compare22","arguments":[{"name":"a","type":{"kind":"simple","type":"cell","optional":true}},{"name":"b","type":{"kind":"simple","type":"cell","optional":true}}],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"compare23","arguments":[{"name":"a","type":{"kind":"simple","type":"cell","optional":false}},{"name":"b","type":{"kind":"simple","type":"cell","optional":false}}],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"compare24","arguments":[{"name":"a","type":{"kind":"simple","type":"cell","optional":false}},{"name":"b","type":{"kind":"simple","type":"cell","optional":true}}],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"compare25","arguments":[{"name":"a","type":{"kind":"simple","type":"cell","optional":true}},{"name":"b","type":{"kind":"simple","type":"cell","optional":false}}],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"compare26","arguments":[{"name":"a","type":{"kind":"simple","type":"cell","optional":true}},{"name":"b","type":{"kind":"simple","type":"cell","optional":true}}],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"compare27","arguments":[{"name":"a","type":{"kind":"dict","key":"int","value":"int"}},{"name":"b","type":{"kind":"dict","key":"int","value":"int"}}],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"compare28","arguments":[{"name":"a","type":{"kind":"dict","key":"int","value":"int"}},{"name":"b","type":{"kind":"dict","key":"int","value":"int"}}],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"isNull1","arguments":[{"name":"a","type":{"kind":"simple","type":"int","optional":true,"format":257}}],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"isNotNull1","arguments":[{"name":"a","type":{"kind":"simple","type":"int","optional":true,"format":257}}],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"isNull2","arguments":[{"name":"address","type":{"kind":"simple","type":"address","optional":true}}],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"isNotNull2","arguments":[{"name":"address","type":{"kind":"simple","type":"address","optional":true}}],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"isNull3","arguments":[{"name":"cell","type":{"kind":"simple","type":"cell","optional":true}}],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"isNotNull3","arguments":[{"name":"cell","type":{"kind":"simple","type":"cell","optional":true}}],"returnType":{"kind":"simple","type":"bool","optional":false}},
]

const MathTester_receivers: ABIReceiver[] = [
    {"receiver":"internal","message":{"kind":"typed","type":"Deploy"}},
]

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
        types:  MathTester_types,
        getters: MathTester_getters,
        receivers: MathTester_receivers,
        errors: MathTester_errors,
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
    
    async getSub(provider: ContractProvider, a: bigint, b: bigint) {
        let builder = new TupleBuilder();
        builder.writeNumber(a);
        builder.writeNumber(b);
        let source = (await provider.get('sub', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getMul(provider: ContractProvider, a: bigint, b: bigint) {
        let builder = new TupleBuilder();
        builder.writeNumber(a);
        builder.writeNumber(b);
        let source = (await provider.get('mul', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getDiv(provider: ContractProvider, a: bigint, b: bigint) {
        let builder = new TupleBuilder();
        builder.writeNumber(a);
        builder.writeNumber(b);
        let source = (await provider.get('div', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getMod(provider: ContractProvider, a: bigint, b: bigint) {
        let builder = new TupleBuilder();
        builder.writeNumber(a);
        builder.writeNumber(b);
        let source = (await provider.get('mod', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getShr(provider: ContractProvider, a: bigint, b: bigint) {
        let builder = new TupleBuilder();
        builder.writeNumber(a);
        builder.writeNumber(b);
        let source = (await provider.get('shr', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getShl(provider: ContractProvider, a: bigint, b: bigint) {
        let builder = new TupleBuilder();
        builder.writeNumber(a);
        builder.writeNumber(b);
        let source = (await provider.get('shl', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getAnd(provider: ContractProvider, a: bigint, b: bigint) {
        let builder = new TupleBuilder();
        builder.writeNumber(a);
        builder.writeNumber(b);
        let source = (await provider.get('and', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getOr(provider: ContractProvider, a: bigint, b: bigint) {
        let builder = new TupleBuilder();
        builder.writeNumber(a);
        builder.writeNumber(b);
        let source = (await provider.get('or', builder.build())).stack;
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
    
    async getCompare19(provider: ContractProvider, a: Cell, b: Cell) {
        let builder = new TupleBuilder();
        builder.writeCell(a);
        builder.writeCell(b);
        let source = (await provider.get('compare19', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getCompare20(provider: ContractProvider, a: Cell, b: Cell | null) {
        let builder = new TupleBuilder();
        builder.writeCell(a);
        builder.writeCell(b);
        let source = (await provider.get('compare20', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getCompare21(provider: ContractProvider, a: Cell | null, b: Cell) {
        let builder = new TupleBuilder();
        builder.writeCell(a);
        builder.writeCell(b);
        let source = (await provider.get('compare21', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getCompare22(provider: ContractProvider, a: Cell | null, b: Cell | null) {
        let builder = new TupleBuilder();
        builder.writeCell(a);
        builder.writeCell(b);
        let source = (await provider.get('compare22', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getCompare23(provider: ContractProvider, a: Cell, b: Cell) {
        let builder = new TupleBuilder();
        builder.writeCell(a);
        builder.writeCell(b);
        let source = (await provider.get('compare23', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getCompare24(provider: ContractProvider, a: Cell, b: Cell | null) {
        let builder = new TupleBuilder();
        builder.writeCell(a);
        builder.writeCell(b);
        let source = (await provider.get('compare24', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getCompare25(provider: ContractProvider, a: Cell | null, b: Cell) {
        let builder = new TupleBuilder();
        builder.writeCell(a);
        builder.writeCell(b);
        let source = (await provider.get('compare25', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getCompare26(provider: ContractProvider, a: Cell | null, b: Cell | null) {
        let builder = new TupleBuilder();
        builder.writeCell(a);
        builder.writeCell(b);
        let source = (await provider.get('compare26', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getCompare27(provider: ContractProvider, a: Dictionary<bigint, bigint>, b: Dictionary<bigint, bigint>) {
        let builder = new TupleBuilder();
        builder.writeCell(a.size > 0 ? beginCell().storeDictDirect(a, Dictionary.Keys.BigInt(257), Dictionary.Values.BigInt(257)).endCell() : null);
        builder.writeCell(b.size > 0 ? beginCell().storeDictDirect(b, Dictionary.Keys.BigInt(257), Dictionary.Values.BigInt(257)).endCell() : null);
        let source = (await provider.get('compare27', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getCompare28(provider: ContractProvider, a: Dictionary<bigint, bigint>, b: Dictionary<bigint, bigint>) {
        let builder = new TupleBuilder();
        builder.writeCell(a.size > 0 ? beginCell().storeDictDirect(a, Dictionary.Keys.BigInt(257), Dictionary.Values.BigInt(257)).endCell() : null);
        builder.writeCell(b.size > 0 ? beginCell().storeDictDirect(b, Dictionary.Keys.BigInt(257), Dictionary.Values.BigInt(257)).endCell() : null);
        let source = (await provider.get('compare28', builder.build())).stack;
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
    
    async getIsNull3(provider: ContractProvider, cell: Cell | null) {
        let builder = new TupleBuilder();
        builder.writeCell(cell);
        let source = (await provider.get('isNull3', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getIsNotNull3(provider: ContractProvider, cell: Cell | null) {
        let builder = new TupleBuilder();
        builder.writeCell(cell);
        let source = (await provider.get('isNotNull3', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
}