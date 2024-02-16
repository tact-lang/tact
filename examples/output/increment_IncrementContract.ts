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
    const __code = Cell.fromBase64('te6ccgECGQEABIoAART/APSkE/S88sgLAQIBYgIDAr7QAdDTAwFxsKMB+kABINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiFRQUwNvBPhhAvhi2zxVFNs88uCCyPhDAcx/AcoAVUBQRfQAEvQAAcj0ABL0ABL0AMkBzMntVBIEAgEgDQ4B9gGSMH/gcCHXScIflTAg1wsf3iCCECAGTzu6jlcw0x8BghAgBk87uvLggYEBAdcAgQEB1wBZbBKBAQEgEDhBgFKAIW6VW1n0WjCYyAHPAEEz9ELigQEL+EIQNEEHgQEBIW6VW1n0WTCYyAHPAEEz9EHiAX/gIIIQQHfUyAUC+LqObTDTHwGCEEB31Mi68uCBgQEB1wABMSSBAQEicUEz9AxvoZQB1wAwkltt4iBujhowFIEBAQF/cSFulVtZ9FowmMgBzwBBM/RC4o4ggQEBASBu8tCAsxA2EnEhbpVbWfRaMJjIAc8AQTP0QuLiA3/gIIIQ4p0PqrrjAiAGBwCUMNMfAYIQ4p0Pqrry4IGBAQHXANIAAZHUkm0B4llsEoIAziklgQEBJFn0DW+hkjBt327y9BAkgQEBWSBulTBZ9FowlEEz9BXiAn8CqoIQZmjvsrqOmDDTHwGCEGZo77K68uCBgQEB1wABMds8f+CCEJRqmLa6jqfTHwGCEJRqmLa68uCB0z8BMcgBghCv+Q9XWMsfyz/J+EIBcG3bPH/gMHAICQHSgQEBbVMSEElZIW6VW1n0WjCYyAHPAEEz9ELiBIEBASZtcSFulVtZ9FowmMgBzwBBM/RC4gOBAQEmbSBulTBZ9FowlEEz9BXigQEL+EIQJG2BAQEhbpVbWfRZMJjIAc8AQTP0QeKBAQFtCgE6bW0ibrOZWyBu8tCAbyIBkTLiECRwAwSAQlAj2zwLAFggbpIwbY4QIG7y0IBvIcgBAYEBAc8AyeJBcCBulTBZ9FowlEEz9BXiEDRBMAHKyHEBygFQBwHKAHABygJQBSDXSYEBC7ry4Igg1wsKIIEE/7ry0ImDCbry4IjPFlAD+gJwAcpoI26zkX+TJG6z4pczMwFwAcoA4w0hbrOcfwHKAAEgbvLQgAHMlTFwAcoA4skB+wAMAJh/AcoAyHABygBwAcoAJG6znX8BygAEIG7y0IBQBMyWNANwAcoA4iRus51/AcoABCBu8tCAUATMljQDcAHKAOJwAcoAAn8BygACyVjMAgEgDxACASAVFgIRuvAts82zxsUYEhECEbtAfbPNs8bFGBITAAIhAV7tRNDUAfhj0gABjhT0BPQE1AHQ9AT0BPQEMBA1EDRsFeAw+CjXCwqDCbry4InbPBQAAiQACm1tbW1tAJW7vRgnBc7D1dLK57HoTsOdZKhRtmgnCd1jUtK2R8syLTry398WI5gnAgVcAbgGdjlM5YOq5HJbLDgnCdl05as07LczoOlm2UZuikgCAUgXGAARsK+7UTQ0gABgAHWybuNDVpcGZzOi8vUW1OUzRpTlRNeEhwaHZFWUd2YXBRbVVoSmV2WGR2WWk3WVFXZjZxSnBBWTZRVoIA==');
    const __system = Cell.fromBase64('te6cckECGwEABJQAAQHAAQEFoXRDAgEU/wD0pBP0vPLICwMCAWIPBAIBIAoFAgEgCQYCAUgIBwB1sm7jQ1aXBmczovL1FtTlM0aU5UTXhIcGh2RVlHdmFwUW1VaEpldlhkdllpN1lRV2Y2cUpwQVk2UVaCAAEbCvu1E0NIAAYACVu70YJwXOw9XSyuex6E7DnWSoUbZoJwndY1LStkfLMi068t/fFiOYJwIFXAG4BnY5TOWDquRyWyw4JwnZdOWrNOy3M6DpZtlGbopIAgEgDQsCEbtAfbPNs8bFGBkMAAIkAhG68C2zzbPGxRgZDgACIQK+0AHQ0wMBcbCjAfpAASDXSYEBC7ry4Igg1wsKIIEE/7ry0ImDCbry4IhUUFMDbwT4YQL4Yts8VRTbPPLggsj4QwHMfwHKAFVAUEX0ABL0AAHI9AAS9AAS9ADJAczJ7VQZEAH2AZIwf+BwIddJwh+VMCDXCx/eIIIQIAZPO7qOVzDTHwGCECAGTzu68uCBgQEB1wCBAQHXAFlsEoEBASAQOEGAUoAhbpVbWfRaMJjIAc8AQTP0QuKBAQv4QhA0QQeBAQEhbpVbWfRZMJjIAc8AQTP0QeIBf+AgghBAd9TIEQL4uo5tMNMfAYIQQHfUyLry4IGBAQHXAAExJIEBASJxQTP0DG+hlAHXADCSW23iIG6OGjAUgQEBAX9xIW6VW1n0WjCYyAHPAEEz9ELijiCBAQEBIG7y0ICzEDYScSFulVtZ9FowmMgBzwBBM/RC4uIDf+AgghDinQ+quuMCIBgSAqqCEGZo77K6jpgw0x8BghBmaO+yuvLggYEBAdcAATHbPH/gghCUapi2uo6n0x8BghCUapi2uvLggdM/ATHIAYIQr/kPV1jLH8s/yfhCAXBt2zx/4DBwFhMBOm1tIm6zmVsgbvLQgG8iAZEy4hAkcAMEgEJQI9s8FAHKyHEBygFQBwHKAHABygJQBSDXSYEBC7ry4Igg1wsKIIEE/7ry0ImDCbry4IjPFlAD+gJwAcpoI26zkX+TJG6z4pczMwFwAcoA4w0hbrOcfwHKAAEgbvLQgAHMlTFwAcoA4skB+wAVAJh/AcoAyHABygBwAcoAJG6znX8BygAEIG7y0IBQBMyWNANwAcoA4iRus51/AcoABCBu8tCAUATMljQDcAHKAOJwAcoAAn8BygACyVjMAdKBAQFtUxIQSVkhbpVbWfRaMJjIAc8AQTP0QuIEgQEBJm1xIW6VW1n0WjCYyAHPAEEz9ELiA4EBASZtIG6VMFn0WjCUQTP0FeKBAQv4QhAkbYEBASFulVtZ9FkwmMgBzwBBM/RB4oEBAW0XAFggbpIwbY4QIG7y0IBvIcgBAYEBAc8AyeJBcCBulTBZ9FowlEEz9BXiEDRBMACUMNMfAYIQ4p0Pqrry4IGBAQHXANIAAZHUkm0B4llsEoIAziklgQEBJFn0DW+hkjBt327y9BAkgQEBWSBulTBZ9FowlEEz9BXiAn8BXu1E0NQB+GPSAAGOFPQE9ATUAdD0BPQE9AQwEDUQNGwV4DD4KNcLCoMJuvLgids8GgAKbW1tbW1wcwtn');
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

const IncrementContract_types: ABIType[] = [
    {"name":"StateInit","header":null,"fields":[{"name":"code","type":{"kind":"simple","type":"cell","optional":false}},{"name":"data","type":{"kind":"simple","type":"cell","optional":false}}]},
    {"name":"Context","header":null,"fields":[{"name":"bounced","type":{"kind":"simple","type":"bool","optional":false}},{"name":"sender","type":{"kind":"simple","type":"address","optional":false}},{"name":"value","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"raw","type":{"kind":"simple","type":"slice","optional":false}}]},
    {"name":"SendParameters","header":null,"fields":[{"name":"bounce","type":{"kind":"simple","type":"bool","optional":false}},{"name":"to","type":{"kind":"simple","type":"address","optional":false}},{"name":"value","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"mode","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"body","type":{"kind":"simple","type":"cell","optional":true}},{"name":"code","type":{"kind":"simple","type":"cell","optional":true}},{"name":"data","type":{"kind":"simple","type":"cell","optional":true}}]},
    {"name":"Deploy","header":2490013878,"fields":[{"name":"queryId","type":{"kind":"simple","type":"uint","optional":false,"format":64}}]},
    {"name":"DeployOk","header":2952335191,"fields":[{"name":"queryId","type":{"kind":"simple","type":"uint","optional":false,"format":64}}]},
    {"name":"FactoryDeploy","header":1829761339,"fields":[{"name":"queryId","type":{"kind":"simple","type":"uint","optional":false,"format":64}},{"name":"cashback","type":{"kind":"simple","type":"address","optional":false}}]},
    {"name":"Increment","header":537284411,"fields":[{"name":"key","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"value","type":{"kind":"simple","type":"int","optional":false,"format":257}}]},
    {"name":"Toggle","header":1081595080,"fields":[{"name":"key","type":{"kind":"simple","type":"int","optional":false,"format":257}}]},
    {"name":"Persist","header":3801943978,"fields":[{"name":"key","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"content","type":{"kind":"simple","type":"cell","optional":true}}]},
    {"name":"Reset","header":1718153138,"fields":[{"name":"key","type":{"kind":"simple","type":"int","optional":false,"format":257}}]},
    {"name":"Something","header":null,"fields":[{"name":"value","type":{"kind":"simple","type":"int","optional":false,"format":257}}]},
]

const IncrementContract_getters: ABIGetter[] = [
    {"name":"counters","arguments":[],"returnType":{"kind":"dict","key":"int","value":"int"}},
    {"name":"counters2","arguments":[],"returnType":{"kind":"dict","key":"address","value":"int"}},
]

const IncrementContract_receivers: ABIReceiver[] = [
    {"receiver":"internal","message":{"kind":"typed","type":"Increment"}},
    {"receiver":"internal","message":{"kind":"typed","type":"Toggle"}},
    {"receiver":"internal","message":{"kind":"typed","type":"Persist"}},
    {"receiver":"internal","message":{"kind":"typed","type":"Reset"}},
    {"receiver":"internal","message":{"kind":"typed","type":"Deploy"}},
]

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
        types:  IncrementContract_types,
        getters: IncrementContract_getters,
        receivers: IncrementContract_receivers,
        errors: IncrementContract_errors,
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