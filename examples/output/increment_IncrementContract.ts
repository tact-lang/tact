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

export type Increment = {
    $$type: 'Increment';
    key: bigint;
    value: bigint;
}

export function storeIncrement(src: Increment) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(537284411, 32);
        b_0.storeInt(src.key, 257);
        b_0.storeInt(src.value, 257);
    };
}

export function loadIncrement(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 537284411) { throw Error('Invalid prefix'); }
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

function dictValueParserIncrement(): DictionaryValue<Increment> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeIncrement(src)).endCell());
        },
        parse: (src) => {
            return loadIncrement(src.loadRef().beginParse());
        }
    }
}

export type Toggle = {
    $$type: 'Toggle';
    key: bigint;
}

export function storeToggle(src: Toggle) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(1081595080, 32);
        b_0.storeInt(src.key, 257);
    };
}

export function loadToggle(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 1081595080) { throw Error('Invalid prefix'); }
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

function dictValueParserToggle(): DictionaryValue<Toggle> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeToggle(src)).endCell());
        },
        parse: (src) => {
            return loadToggle(src.loadRef().beginParse());
        }
    }
}

export type Persist = {
    $$type: 'Persist';
    key: bigint;
    content: Cell | null;
}

export function storePersist(src: Persist) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(3801943978, 32);
        b_0.storeInt(src.key, 257);
        if (src.content !== null && src.content !== undefined) { b_0.storeBit(true).storeRef(src.content); } else { b_0.storeBit(false); }
    };
}

export function loadPersist(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 3801943978) { throw Error('Invalid prefix'); }
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

function dictValueParserPersist(): DictionaryValue<Persist> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storePersist(src)).endCell());
        },
        parse: (src) => {
            return loadPersist(src.loadRef().beginParse());
        }
    }
}

export type Reset = {
    $$type: 'Reset';
    key: bigint;
}

export function storeReset(src: Reset) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(1718153138, 32);
        b_0.storeInt(src.key, 257);
    };
}

export function loadReset(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 1718153138) { throw Error('Invalid prefix'); }
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

function dictValueParserReset(): DictionaryValue<Reset> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeReset(src)).endCell());
        },
        parse: (src) => {
            return loadReset(src.loadRef().beginParse());
        }
    }
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

function dictValueParserSomething(): DictionaryValue<Something> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeSomething(src)).endCell());
        },
        parse: (src) => {
            return loadSomething(src.loadRef().beginParse());
        }
    }
}

 type IncrementContract_init_args = {
    $$type: 'IncrementContract_init_args';
}

function initIncrementContract_init_args(src: IncrementContract_init_args) {
    return (builder: Builder) => {
        let b_0 = builder;
    };
}

async function IncrementContract_init() {
    const __code = Cell.fromBase64('te6ccgECHgEABJcAART/APSkE/S88sgLAQIBYgIDAgLLBAUCASAXGAIBIAYHAgEgDxAC59gOhpgYC42GAAyL/IuHEA/SAAkGukwICF3XlwRBBrhYUQQYTdEMCCf91Y+XBEQYTdeXBEqigpgbeCfDCBfDF2omhqAPwx6QAAyngLtgrHRxh8FGuFhUGE3XlwRO2ecSqKbZ4YZHwhgOY/gOUAKqB4DGT2qkHAgAQ7RBrpMCAhd15cEQQa4WFEEGE3RDAgn/dWPlwREGE3XlwRMB9nAh10nCH5UwINcLH94Cklt/4CGCECAGTzu6jlcx0x8BghAgBk87uvLggYEBAdcAgQEB1wBZbBKBAQEgEDhBgFKAIW6VW1n0WjCYyAHPAEEz9ELigQEL+EIQNEEHgQEBIW6VW1n0WTCYyAHPAEEz9EHiAX/gIYIQQHfUyAkC+LqObTHTHwGCEEB31Mi68uCBgQEB1wABMSSBAQEicUEz9AxvoZQB1wAwkltt4iBujhowFIEBAQF/cSFulVtZ9FowmMgBzwBBM/RC4o4ggQEBASBu8tCAsxA2EnEhbpVbWfRaMJjIAc8AQTP0QuLiA3/gIYIQ4p0PqrrjAiEKCwCUMdMfAYIQ4p0Pqrry4IGBAQHXANIAAZHUkm0B4llsEoIAziklgQEBJFn0DW+hkjBt327y9BAkgQEBWSBulTBZ9FowlEEz9BXiAn8CooIQZmjvsrqOmDHTHwGCEGZo77K68uCBgQEB1wABMds8f+ABghCUapi2uo6i0x8BghCUapi2uvLggdM/ATHIAYIQr/kPV1jLH8s/yds8f+AwcAwNAdKBAQFtUxIQSVkhbpVbWfRaMJjIAc8AQTP0QuIEgQEBJm1xIW6VW1n0WjCYyAHPAEEz9ELiA4EBASZtIG6VMFn0WjCUQTP0FeKBAQv4QhAkbYEBASFulVtZ9FkwmMgBzwBBM/RB4oEBAW0OABp/+EJwWAOAQgHwG/AQAFggbpIwbY4QIG7y0IBvIcgBAYEBAc8AyeJBcCBulTBZ9FowlEEz9BXiEDRBMAIBIBESAgFIFRYBAdQTACX3oCegJqAOh6AnoCegIYCBqIGkAfbIcQHKAVAHAcoAcAHKAlAF8ArPFlAD+gJwAcpoI26zJW6zsY5MfwHKAMhwAcoAcAHKACRus51/AcoABCBu8tCAUATMljQDcAHKAOIkbrOdfwHKAAQgbvLQgFAEzJY0A3ABygDicAHKAAJ/AcoAAslYzJczMwFwAcoA4iEUADRus5x/AcoAASBu8tCAAcyVMXABygDiyQH7AAApRQRfQAEvQAAcj0ABL0ABL0AMkBzIAAVW1tgCASAZGgCVvd6ME4LnYerpZXPY9CdhzrJUKNs0E4TusalpWyPlmRadeW/vixHME4ECrgDcAzscpnLB1XI5LZYcE4TsunLVmnZbmdB0s2yjN0UkAkm68C7UTQ1AH4Y9IAAZTwF2wVjo4w+CjXCwqDCbry4InbPOLbPIHBsCSbtAftRNDUAfhj0gABlPAXbBWOjjD4KNcLCoMJuvLgids84ts8gcHQAGFF8EAAptbW1tbQAEXwQ=');
    const __system = Cell.fromBase64('te6cckECIAEABKEAAQHAAQEFoXRDAgEU/wD0pBP0vPLICwMCAWILBAIBIAYFAJW93owTgudh6ullc9j0J2HOslQo2zQThO6xqWlbI+WZFp15b++LEcwTgQKuANwDOxymcsHVcjktlhwThOy6ctWadluZ0HSzbKM3RSQCASAJBwJJu0B+1E0NQB+GPSAAGU8BdsFY6OMPgo1wsKgwm68uCJ2zzi2zyB8IAARfBAJJuvAu1E0NQB+GPSAAGU8BdsFY6OMPgo1wsKgwm68uCJ2zzi2zyB8KAAYUXwQCAssVDAIBIBANAgFIDw4ABVbW2AApRQRfQAEvQAAcj0ABL0ABL0AMkBzIAgEgEhEAJfegJ6AmoA6HoCegJ6AhgIGogaQBAdQTAfbIcQHKAVAHAcoAcAHKAlAF8ArPFlAD+gJwAcpoI26zJW6zsY5MfwHKAMhwAcoAcAHKACRus51/AcoABCBu8tCAUATMljQDcAHKAOIkbrOdfwHKAAQgbvLQgFAEzJY0A3ABygDicAHKAAJ/AcoAAslYzJczMwFwAcoA4iEUADRus5x/AcoAASBu8tCAAcyVMXABygDiyQH7AAIBIBcWAEO0Qa6TAgIXdeXBEEGuFhRBBhN0QwIJ/3Vj5cERBhN15cETAufYDoaYGAuNhgAMi/yLhxAP0gAJBrpMCAhd15cEQQa4WFEEGE3RDAgn/dWPlwREGE3XlwRKooKYG3gnwwgXwxdqJoagD8MekAAMp4C7YKx0cYfBRrhYVBhN15cETtnnEqim2eGGR8IYDmP4DlACqgeAxk9qpB8YAfZwIddJwh+VMCDXCx/eApJbf+AhghAgBk87uo5XMdMfAYIQIAZPO7ry4IGBAQHXAIEBAdcAWWwSgQEBIBA4QYBSgCFulVtZ9FowmMgBzwBBM/RC4oEBC/hCEDRBB4EBASFulVtZ9FkwmMgBzwBBM/RB4gF/4CGCEEB31MgZAvi6jm0x0x8BghBAd9TIuvLggYEBAdcAATEkgQEBInFBM/QMb6GUAdcAMJJbbeIgbo4aMBSBAQEBf3EhbpVbWfRaMJjIAc8AQTP0QuKOIIEBAQEgbvLQgLMQNhJxIW6VW1n0WjCYyAHPAEEz9ELi4gN/4CGCEOKdD6q64wIhHhoCooIQZmjvsrqOmDHTHwGCEGZo77K68uCBgQEB1wABMds8f+ABghCUapi2uo6i0x8BghCUapi2uvLggdM/ATHIAYIQr/kPV1jLH8s/yds8f+AwcBwbABp/+EJwWAOAQgHwG/AQAdKBAQFtUxIQSVkhbpVbWfRaMJjIAc8AQTP0QuIEgQEBJm1xIW6VW1n0WjCYyAHPAEEz9ELiA4EBASZtIG6VMFn0WjCUQTP0FeKBAQv4QhAkbYEBASFulVtZ9FkwmMgBzwBBM/RB4oEBAW0dAFggbpIwbY4QIG7y0IBvIcgBAYEBAc8AyeJBcCBulTBZ9FowlEEz9BXiEDRBMACUMdMfAYIQ4p0Pqrry4IGBAQHXANIAAZHUkm0B4llsEoIAziklgQEBJFn0DW+hkjBt327y9BAkgQEBWSBulTBZ9FowlEEz9BXiAn8ACm1tbW1tuqG2sQ==');
    let builder = beginCell();
    builder.storeRef(__system);
    builder.storeUint(0, 1);
    initIncrementContract_init_args({ $$type: 'IncrementContract_init_args' })(builder);
    const __data = builder.endCell();
    return { code: __code, data: __data };
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
    135: { message: `Code of a contract was not found` },
    136: { message: `Invalid address` },
    137: { message: `Masterchain support is not enabled for this contract` },
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
        let result = Dictionary.loadDirect(Dictionary.Keys.BigInt(257), Dictionary.Values.BigInt(257), source.readCellOpt());
        return result;
    }
    
    async getCounters2(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('counters2', builder.build())).stack;
        let result = Dictionary.loadDirect(Dictionary.Keys.Address(), Dictionary.Values.BigInt(257), source.readCellOpt());
        return result;
    }
    
}