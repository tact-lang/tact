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

export type DNSResolveResult = {
    $$type: 'DNSResolveResult';
    prefix: bigint;
    record: Cell | null;
}

export function storeDNSResolveResult(src: DNSResolveResult) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeInt(src.prefix, 257);
        if (src.record !== null && src.record !== undefined) { b_0.storeBit(true).storeRef(src.record); } else { b_0.storeBit(false); }
    };
}

export function loadDNSResolveResult(slice: Slice) {
    let sc_0 = slice;
    let _prefix = sc_0.loadIntBig(257);
    let _record = sc_0.loadBit() ? sc_0.loadRef() : null;
    return { $$type: 'DNSResolveResult' as const, prefix: _prefix, record: _record };
}

function loadTupleDNSResolveResult(source: TupleReader) {
    let _prefix = source.readBigNumber();
    let _record = source.readCellOpt();
    return { $$type: 'DNSResolveResult' as const, prefix: _prefix, record: _record };
}

function storeTupleDNSResolveResult(source: DNSResolveResult) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.prefix);
    builder.writeCell(source.record);
    return builder.build();
}

function dictValueParserDNSResolveResult(): DictionaryValue<DNSResolveResult> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeDNSResolveResult(src)).endCell());
        },
        parse: (src) => {
            return loadDNSResolveResult(src.loadRef().beginParse());
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

 type DNSTester_init_args = {
    $$type: 'DNSTester_init_args';
}

function initDNSTester_init_args(src: DNSTester_init_args) {
    return (builder: Builder) => {
        let b_0 = builder;
    };
}

async function DNSTester_init() {
    const __code = Cell.fromBase64('te6ccgECLgEABOgAART/APSkE/S88sgLAQIBYgIDAgLKBAUCASATFAIBIAYHAgHSDg8CkdAHQ0wMBcbCjAfpAASDXSYEBC7ry4Igg1wsKIIEE/7ry0ImDCbry4IhUUFMDbwT4YQL4Yts8Wds88uCCMMj4QwHMfwHKAMntVIqCAEB8gwBigGSMH/gcCHXScIflTAg1wsf3oIQlGqYtrqOp9MfAYIQlGqYtrry4IHTPwExyAGCEK/5D1dYyx/LP8n4QgFwbds8f+AwcAkBOm1tIm6zmVsgbvLQgG8iAZEy4hAkcAMEgEJQI9s8CgHKyHEBygFQBwHKAHABygJQBSDXSYEBC7ry4Igg1wsKIIEE/7ry0ImDCbry4IjPFlAD+gJwAcpoI26zkX+TJG6z4pczMwFwAcoA4w0hbrOcfwHKAAEgbvLQgAHMlTFwAcoA4skB+wALAJh/AcoAyHABygBwAcoAJG6znX8BygAEIG7y0IBQBMyWNANwAcoA4iRus51/AcoABCBu8tCAUATMljQDcAHKAOJwAcoAAn8BygACyVjMAbbtou37INdJwAgh10rAALCOEiDXCwfALpowyHABywfJ0Nsx4N5tyH9/cH+K5jAxNAOTXwNt4AKzkm8CkTHiyAFvIlnPF5MhbrObAW8icFADywcBzxfocDLLB8nQDQDwJtdJwACOGzAl10ogwAGVMAXUMNCawgGVXwZt2zHgBeIFcN4gjk8xMgTTByHALSLALlyxJMIvJcE6sLEkwmAlwXuwsbNTgrCxlV8Ibdsx4I4SMlBVsZVfBG3bMeACbwLIcH9/mzZwAnAFywcDBUZk4hBFA1Ak3iCzAQEgEAEBIBIB9u2i7fsg10rDAJIwcOAg10kgqTgCwwCSW3DgIMAAklt/4KsCcH9wA45OA9MHIcAAjhMxM8AAlFtw2zHglDBw2zHgcHB/ji8zIMAtIcIvIsE6sFIQsSLCYAPBexOwErGzlV8EcNsx4FIEsJVfA3DbMeBwAaRAM+IS5DAycBEACAGzsLoAnMgh10mrAo5CAdMHIcBik4A2Mt4hwGciwHGxk4A5Mt4hwGyTgDEy3iHAb5OAMDLeIcBzk4A1Mt4hwHWTgHYy3iHAepOAMjLeAssH5DHJ0AIBIBUWAgEgGRoCEboq/bPAHbPDGCoXAhG76N2zwB2zwxgqGAAE8CAABPAfAgEgGxwCASAmJwIRtqc7Z4A7Z4YwKh0CAW4fIAEE2zweAQwg2zzXGDAkALir0YJwXOw9XSyuex6E7DnWSoUbZoJwndY1LStkfLMi068t/fFiOYJwIFXAG4BnY5TOWDquRyWyw4JwG9Sd75VFlvHHU9PeBVnDJoJwnZdOWrNOy3M6DpZtlGbopAICdCEiAg+x+2eAO2eGMCojAg+z+2eAO2eGMColAQTbPCQANnCfAdMHAcAAILOUAqYIAt4S5jGBXmEhwwDy9AAE8CECASAoKQITtGGbZ4s7Z42CUCorABGwr7tRNDSAAGAAdbJu40NWlwZnM6Ly9RbWJYNUtlUzRESlBmMXZndFI4UW9ZTko2Z1NNMlo5Y1doQnVTRTQ5ZzJtZnl2ggATTtRNDUAfhj0gAwkW3g+CjXCwqDCbry4InbPCwBPnAi1wsHwACXMAHTBzEBeN6BXmEj8CDy9FUg2zwDoFgtAAJtABIwINdJyFjPFsk=');
    const __system = Cell.fromBase64('te6cckECMAEABPIAAQHAAQEFoURvAgEU/wD0pBP0vPLICwMCAWIeBAIBIBkFAgEgDQYCASAKBwITtGGbZ4s7Z42CUC4IAT5wItcLB8AAlzAB0wcxAXjegV5hI/Ag8vRVINs8A6BYCQASMCDXSchYzxbJAgEgDAsAdbJu40NWlwZnM6Ly9RbWJYNUtlUzRESlBmMXZndFI4UW9ZTko2Z1NNMlo5Y1doQnVTRTQ5ZzJtZnl2ggABGwr7tRNDSAAGACASAVDgIBbhQPAgJ0EhACD7P7Z4A7Z4YwLhEABPAhAg+x+2eAO2eGMC4TAQTbPBgAuKvRgnBc7D1dLK57HoTsOdZKhRtmgnCd1jUtK2R8syLTry398WI5gnAgVcAbgGdjlM5YOq5HJbLDgnAb1J3vlUWW8cdT094FWcMmgnCdl05as07LczoOlm2UZuikAhG2pztngDtnhjAuFgEE2zwXAQwg2zzXGDAYADZwnwHTBwHAACCzlAKmCALeEuYxgV5hIcMA8vQCASAcGgIRu+jds8Ads8MYLhsABPAfAhG6Kv2zwB2zwxguHQAE8CACAsolHwIB0iIgAQEgIQCcyCHXSasCjkIB0wchwGKTgDYy3iHAZyLAcbGTgDky3iHAbJOAMTLeIcBvk4AwMt4hwHOTgDUy3iHAdZOAdjLeIcB6k4AyMt4CywfkMcnQAQEgIwH27aLt+yDXSsMAkjBw4CDXSSCpOALDAJJbcOAgwACSW3/gqwJwf3ADjk4D0wchwACOEzEzwACUW3DbMeCUMHDbMeBwcH+OLzMgwC0hwi8iwTqwUhCxIsJgA8F7E7ASsbOVXwRw2zHgUgSwlV8DcNsx4HABpEAz4hLkMDJwJAAIAbOwugIBICkmAQHyJwG27aLt+yDXScAIIddKwACwjhIg1wsHwC6aMMhwAcsHydDbMeDebch/f3B/iuYwMTQDk18DbeACs5JvApEx4sgBbyJZzxeTIW6zmwFvInBQA8sHAc8X6HAyywfJ0CgA8CbXScAAjhswJddKIMABlTAF1DDQmsIBlV8Gbdsx4AXiBXDeII5PMTIE0wchwC0iwC5csSTCLyXBOrCxJMJgJcF7sLGzU4KwsZVfCG3bMeCOEjJQVbGVXwRt2zHgAm8CyHB/f5s2cAJwBcsHAwVGZOIQRQNQJN4gswKR0AdDTAwFxsKMB+kABINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiFRQUwNvBPhhAvhi2zxZ2zzy4IIwyPhDAcx/AcoAye1Ui4qAYoBkjB/4HAh10nCH5UwINcLH96CEJRqmLa6jqfTHwGCEJRqmLa68uCB0z8BMcgBghCv+Q9XWMsfyz/J+EIBcG3bPH/gMHArATptbSJus5lbIG7y0IBvIgGRMuIQJHADBIBCUCPbPCwByshxAcoBUAcBygBwAcoCUAUg10mBAQu68uCIINcLCiCBBP+68tCJgwm68uCIzxZQA/oCcAHKaCNus5F/kyRus+KXMzMBcAHKAOMNIW6znH8BygABIG7y0IABzJUxcAHKAOLJAfsALQCYfwHKAMhwAcoAcAHKACRus51/AcoABCBu8tCAUATMljQDcAHKAOIkbrOdfwHKAAQgbvLQgFAEzJY0A3ABygDicAHKAAJ/AcoAAslYzAE07UTQ1AH4Y9IAMJFt4Pgo1wsKgwm68uCJ2zwvAAJtVae4Zg==');
    let builder = beginCell();
    builder.storeRef(__system);
    builder.storeUint(0, 1);
    initDNSTester_init_args({ $$type: 'DNSTester_init_args' })(builder);
    const __data = builder.endCell();
    return { code: __code, data: __data };
}

const DNSTester_errors: { [key: number]: { message: string } } = {
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
    24161: { message: `Invalid DNS name` },
}

const DNSTester_types: ABIType[] = [
    {"name":"StateInit","header":null,"fields":[{"name":"code","type":{"kind":"simple","type":"cell","optional":false}},{"name":"data","type":{"kind":"simple","type":"cell","optional":false}}]},
    {"name":"Context","header":null,"fields":[{"name":"bounced","type":{"kind":"simple","type":"bool","optional":false}},{"name":"sender","type":{"kind":"simple","type":"address","optional":false}},{"name":"value","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"raw","type":{"kind":"simple","type":"slice","optional":false}}]},
    {"name":"SendParameters","header":null,"fields":[{"name":"bounce","type":{"kind":"simple","type":"bool","optional":false}},{"name":"to","type":{"kind":"simple","type":"address","optional":false}},{"name":"value","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"mode","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"body","type":{"kind":"simple","type":"cell","optional":true}},{"name":"code","type":{"kind":"simple","type":"cell","optional":true}},{"name":"data","type":{"kind":"simple","type":"cell","optional":true}}]},
    {"name":"DNSResolveResult","header":null,"fields":[{"name":"prefix","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"record","type":{"kind":"simple","type":"cell","optional":true}}]},
    {"name":"Deploy","header":2490013878,"fields":[{"name":"queryId","type":{"kind":"simple","type":"uint","optional":false,"format":64}}]},
    {"name":"DeployOk","header":2952335191,"fields":[{"name":"queryId","type":{"kind":"simple","type":"uint","optional":false,"format":64}}]},
    {"name":"FactoryDeploy","header":1829761339,"fields":[{"name":"queryId","type":{"kind":"simple","type":"uint","optional":false,"format":64}},{"name":"cashback","type":{"kind":"simple","type":"address","optional":false}}]},
]

const DNSTester_getters: ABIGetter[] = [
    {"name":"stringToInternal","arguments":[{"name":"src","type":{"kind":"simple","type":"string","optional":false}}],"returnType":{"kind":"simple","type":"slice","optional":true}},
    {"name":"internalNormalize","arguments":[{"name":"src","type":{"kind":"simple","type":"slice","optional":false}}],"returnType":{"kind":"simple","type":"slice","optional":false}},
    {"name":"dnsInternalVerify","arguments":[{"name":"subdomain","type":{"kind":"simple","type":"slice","optional":false}}],"returnType":{"kind":"simple","type":"bool","optional":false}},
    {"name":"dnsExtractTopDomainLength","arguments":[{"name":"subdomain","type":{"kind":"simple","type":"slice","optional":false}}],"returnType":{"kind":"simple","type":"int","optional":false,"format":257}},
    {"name":"dnsExtractTopDomain","arguments":[{"name":"subdomain","type":{"kind":"simple","type":"slice","optional":false}}],"returnType":{"kind":"simple","type":"slice","optional":false}},
    {"name":"dnsresolve","arguments":[{"name":"subdomain","type":{"kind":"simple","type":"slice","optional":false}},{"name":"category","type":{"kind":"simple","type":"int","optional":false,"format":257}}],"returnType":{"kind":"simple","type":"DNSResolveResult","optional":false}},
]

const DNSTester_receivers: ABIReceiver[] = [
    {"receiver":"internal","message":{"kind":"typed","type":"Deploy"}},
]

export class DNSTester implements Contract {
    
    static async init() {
        return await DNSTester_init();
    }
    
    static async fromInit() {
        const init = await DNSTester_init();
        const address = contractAddress(0, init);
        return new DNSTester(address, init);
    }
    
    static fromAddress(address: Address) {
        return new DNSTester(address);
    }
    
    readonly address: Address; 
    readonly init?: { code: Cell, data: Cell };
    readonly abi: ContractABI = {
        types:  DNSTester_types,
        getters: DNSTester_getters,
        receivers: DNSTester_receivers,
        errors: DNSTester_errors,
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
    
    async getStringToInternal(provider: ContractProvider, src: string) {
        let builder = new TupleBuilder();
        builder.writeString(src);
        let source = (await provider.get('stringToInternal', builder.build())).stack;
        let result = source.readCellOpt();
        return result;
    }
    
    async getInternalNormalize(provider: ContractProvider, src: Cell) {
        let builder = new TupleBuilder();
        builder.writeSlice(src);
        let source = (await provider.get('internalNormalize', builder.build())).stack;
        let result = source.readCell();
        return result;
    }
    
    async getDnsInternalVerify(provider: ContractProvider, subdomain: Cell) {
        let builder = new TupleBuilder();
        builder.writeSlice(subdomain);
        let source = (await provider.get('dnsInternalVerify', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getDnsExtractTopDomainLength(provider: ContractProvider, subdomain: Cell) {
        let builder = new TupleBuilder();
        builder.writeSlice(subdomain);
        let source = (await provider.get('dnsExtractTopDomainLength', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getDnsExtractTopDomain(provider: ContractProvider, subdomain: Cell) {
        let builder = new TupleBuilder();
        builder.writeSlice(subdomain);
        let source = (await provider.get('dnsExtractTopDomain', builder.build())).stack;
        let result = source.readCell();
        return result;
    }
    
    async getDnsresolve(provider: ContractProvider, subdomain: Cell, category: bigint) {
        let builder = new TupleBuilder();
        builder.writeSlice(subdomain);
        builder.writeNumber(category);
        let source = (await provider.get('dnsresolve', builder.build())).stack;
        const result = loadTupleDNSResolveResult(source);
        return result;
    }
    
}