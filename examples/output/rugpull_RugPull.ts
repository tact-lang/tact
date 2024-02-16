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

export type ChangeOwner = {
    $$type: 'ChangeOwner';
    queryId: bigint;
    newOwner: Address;
}

export function storeChangeOwner(src: ChangeOwner) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(2174598809, 32);
        b_0.storeUint(src.queryId, 64);
        b_0.storeAddress(src.newOwner);
    };
}

export function loadChangeOwner(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 2174598809) { throw Error('Invalid prefix'); }
    let _queryId = sc_0.loadUintBig(64);
    let _newOwner = sc_0.loadAddress();
    return { $$type: 'ChangeOwner' as const, queryId: _queryId, newOwner: _newOwner };
}

function loadTupleChangeOwner(source: TupleReader) {
    let _queryId = source.readBigNumber();
    let _newOwner = source.readAddress();
    return { $$type: 'ChangeOwner' as const, queryId: _queryId, newOwner: _newOwner };
}

function storeTupleChangeOwner(source: ChangeOwner) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.queryId);
    builder.writeAddress(source.newOwner);
    return builder.build();
}

function dictValueParserChangeOwner(): DictionaryValue<ChangeOwner> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeChangeOwner(src)).endCell());
        },
        parse: (src) => {
            return loadChangeOwner(src.loadRef().beginParse());
        }
    }
}

export type ChangeOwnerOk = {
    $$type: 'ChangeOwnerOk';
    queryId: bigint;
    newOwner: Address;
}

export function storeChangeOwnerOk(src: ChangeOwnerOk) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(846932810, 32);
        b_0.storeUint(src.queryId, 64);
        b_0.storeAddress(src.newOwner);
    };
}

export function loadChangeOwnerOk(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 846932810) { throw Error('Invalid prefix'); }
    let _queryId = sc_0.loadUintBig(64);
    let _newOwner = sc_0.loadAddress();
    return { $$type: 'ChangeOwnerOk' as const, queryId: _queryId, newOwner: _newOwner };
}

function loadTupleChangeOwnerOk(source: TupleReader) {
    let _queryId = source.readBigNumber();
    let _newOwner = source.readAddress();
    return { $$type: 'ChangeOwnerOk' as const, queryId: _queryId, newOwner: _newOwner };
}

function storeTupleChangeOwnerOk(source: ChangeOwnerOk) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.queryId);
    builder.writeAddress(source.newOwner);
    return builder.build();
}

function dictValueParserChangeOwnerOk(): DictionaryValue<ChangeOwnerOk> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeChangeOwnerOk(src)).endCell());
        },
        parse: (src) => {
            return loadChangeOwnerOk(src.loadRef().beginParse());
        }
    }
}

export type RugParams = {
    $$type: 'RugParams';
    investment: bigint;
    returns: bigint;
    fee: bigint;
}

export function storeRugParams(src: RugParams) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeInt(src.investment, 257);
        b_0.storeInt(src.returns, 257);
        b_0.storeInt(src.fee, 257);
    };
}

export function loadRugParams(slice: Slice) {
    let sc_0 = slice;
    let _investment = sc_0.loadIntBig(257);
    let _returns = sc_0.loadIntBig(257);
    let _fee = sc_0.loadIntBig(257);
    return { $$type: 'RugParams' as const, investment: _investment, returns: _returns, fee: _fee };
}

function loadTupleRugParams(source: TupleReader) {
    let _investment = source.readBigNumber();
    let _returns = source.readBigNumber();
    let _fee = source.readBigNumber();
    return { $$type: 'RugParams' as const, investment: _investment, returns: _returns, fee: _fee };
}

function storeTupleRugParams(source: RugParams) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.investment);
    builder.writeNumber(source.returns);
    builder.writeNumber(source.fee);
    return builder.build();
}

function dictValueParserRugParams(): DictionaryValue<RugParams> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeRugParams(src)).endCell());
        },
        parse: (src) => {
            return loadRugParams(src.loadRef().beginParse());
        }
    }
}

 type RugPull_init_args = {
    $$type: 'RugPull_init_args';
    owner: Address;
    investment: bigint;
    returns: bigint;
    fee: bigint;
}

function initRugPull_init_args(src: RugPull_init_args) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeAddress(src.owner);
        b_0.storeInt(src.investment, 257);
        b_0.storeInt(src.returns, 257);
        let b_1 = new Builder();
        b_1.storeInt(src.fee, 257);
        b_0.storeRef(b_1.endCell());
    };
}

async function RugPull_init(owner: Address, investment: bigint, returns: bigint, fee: bigint) {
    const __code = Cell.fromBase64('te6ccgECJAEABYUAART/APSkE/S88sgLAQIBYgIDA3rQAdDTAwFxsKMB+kABINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiFRQUwNvBPhhAvhi2zxVGds88uCCIAQFAgEgExQDZO2i7fsBkjB/4HAh10nCH5UwINcLH94gwAAi10nBIbDjAiCCEIGdvpm64wLAAJEw4w1wBgcIAMTI+EMBzH8BygBVkFCpINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiM8WF4EBAc8AFYEBAc8AA8iBAQHPABKBAQHPAMoAEsoAEoEBAc8AA8iBAQHPABL0AMlYzMkBzMntVAPkW9s8JI6McCqDBn9QM21tbds8jtz4QW8kMDKBPrtTuaATvhLy9IEBAVIyIG6VMFn0WjCUQTP0FOIBpFFYoJxTB7yVU1KhwgCRcOKOoSGBAQEkWfQMb6GSMG3fIG7y0IBRGKEDpFE4F0Mw2zxQBehQVeJ/DREJAvww0x8BghCBnb6ZuvLggdM/+kABINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiBJsElWR2zw5UanIWYIQMnsrSlADyx/LPwEg10mBAQu68uCIINcLCiCBBP+68tCJgwm68uCIzxbJEJoQeRBoEFcQRhA1RDAS+EIBf23bPH8MEAT6+QEggvAJUZAZSu5hHOiVxVA634X9hk3nkFdGFC9gjT6y+q0U5LqPGjDbPCSzlCVw+wLecCqDBn9QM21tbds8f9sx4CCC8M3iQsbKxWCpn/LSaD7g+xYpqBiuwPEWZRHNgizyDaTquo6TMDR/cCqDBn9QM21tbds8BH/bMeAMEREKARQBcn9QM21tbds8EQFWgvC8+vd2kHxxnMjTedjxlKqqJ+jKKHHNWReBch8hWkVFAbqOhds8f9sx4AsEENs82zwzf4gUDA0ODwAS+EJSoMcF8uCEABCCAJ2wJLPy9AAWAAAAAFN0b3BwZWQBDvhCAX9t2zwQATptbSJus5lbIG7y0IBvIgGRMuIQJHADBIBCUCPbPBEByshxAcoBUAcBygBwAcoCUAUg10mBAQu68uCIINcLCiCBBP+68tCJgwm68uCIzxZQA/oCcAHKaCNus5F/kyRus+KXMzMBcAHKAOMNIW6znH8BygABIG7y0IABzJUxcAHKAOLJAfsAEgCYfwHKAMhwAcoAcAHKACRus51/AcoABCBu8tCAUATMljQDcAHKAOIkbrOdfwHKAAQgbvLQgFAEzJY0A3ABygDicAHKAAJ/AcoAAslYzAIBIBUWAgEgGRoCEboXvbPNs8bKGCAXAhG4Ud2zzbPGyhggGAACIwACKQHdu70YJwXOw9XSyuex6E7DnWSoUbZoJwndY1LStkfLMi068t/fFiOYJwIFXAG4BnY5TOWDquRyWyw4JwnZdOWrNOy3M6DpZtlGbopIJw8ud/q+aF6CzkWq0KuwWxSoJwQM51aecV+dJQsB1hbiZHsoGwIBSBwdACSCcJEwaGam6KQ2fuBHvgVRj4kCAUgeHwB1sm7jQ1aXBmczovL1FtYmJkenc1ZEtXVGVpZnhjckUyalo1QmtOS0RxU0RyN3pwU1ZDOVdtYlZvRWeCAAEKq+7UTQ0gABAhCq1ds82zxsoyAhAdbtRNDUAfhj0gABjlP6QAEg10mBAQu68uCIINcLCiCBBP+68tCJgwm68uCIAYEBAdcAgQEB1wDUAdCBAQHXAIEBAdcA0gDSAIEBAdcA1DDQgQEB1wD0BDAQehB5EHhsGuD4KNcLCoMJuvLgiSIABlR4dgF4+kABINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiAGBAQHXAIEBAdcA1AHQgQEB1wAwFEMwBNFVAts8IwASbXBwVGAEcFUg');
    const __system = Cell.fromBase64('te6cckECJgEABY8AAQHAAQEFoK6fAgEU/wD0pBP0vPLICwMCAWITBAIBIA4FAgEgDAYCAUgIBwB1sm7jQ1aXBmczovL1FtYmJkenc1ZEtXVGVpZnhjckUyalo1QmtOS0RxU0RyN3pwU1ZDOVdtYlZvRWeCACAUgLCQIQqtXbPNs8bKMjCgAGVHh2ABCqvu1E0NIAAQHdu70YJwXOw9XSyuex6E7DnWSoUbZoJwndY1LStkfLMi068t/fFiOYJwIFXAG4BnY5TOWDquRyWyw4JwnZdOWrNOy3M6DpZtlGbopIJw8ud/q+aF6CzkWq0KuwWxSoJwQM51aecV+dJQsB1hbiZHsoDQAkgnCRMGhmpuikNn7gR74FUY+JAgEgEQ8CEbhR3bPNs8bKGCMQAAIpAhG6F72zzbPGyhgjEgACIwN60AHQ0wMBcbCjAfpAASDXSYEBC7ry4Igg1wsKIIEE/7ry0ImDCbry4IhUUFMDbwT4YQL4Yts8VRnbPPLggiMVFADEyPhDAcx/AcoAVZBQqSDXSYEBC7ry4Igg1wsKIIEE/7ry0ImDCbry4IjPFheBAQHPABWBAQHPAAPIgQEBzwASgQEBzwDKABLKABKBAQHPAAPIgQEBzwAS9ADJWMzJAczJ7VQDZO2i7fsBkjB/4HAh10nCH5UwINcLH94gwAAi10nBIbDjAiCCEIGdvpm64wLAAJEw4w1wHhsWBPr5ASCC8AlRkBlK7mEc6JXFUDrfhf2GTeeQV0YUL2CNPrL6rRTkuo8aMNs8JLOUJXD7At5wKoMGf1AzbW1t2zx/2zHgIILwzeJCxsrFYKmf8tJoPuD7FimoGK7A8RZlEc2CLPINpOq6jpMwNH9wKoMGf1AzbW1t2zwEf9sx4B0gIBcBVoLwvPr3dpB8cZzI03nY8ZSqqifoyihxzVkXgXIfIVpFRQG6joXbPH/bMeAYBBDbPNs8M3+IFB0iGhkBDvhCAX9t2zwcABYAAAAAU3RvcHBlZAL8MNMfAYIQgZ2+mbry4IHTP/pAASDXSYEBC7ry4Igg1wsKIIEE/7ry0ImDCbry4IgSbBJVkds8OVGpyFmCEDJ7K0pQA8sfyz8BINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiM8WyRCaEHkQaBBXEEYQNUQwEvhCAX9t2zx/HRwBOm1tIm6zmVsgbvLQgG8iAZEy4hAkcAMEgEJQI9s8IAAS+EJSoMcF8uCEA+Rb2zwkjoxwKoMGf1AzbW1t2zyO3PhBbyQwMoE+u1O5oBO+EvL0gQEBUjIgbpUwWfRaMJRBM/QU4gGkUVignFMHvJVTUqHCAJFw4o6hIYEBASRZ9AxvoZIwbd8gbvLQgFEYoQOkUTgXQzDbPFAF6FBV4n8iIB8BFAFyf1AzbW1t2zwgAcrIcQHKAVAHAcoAcAHKAlAFINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiM8WUAP6AnABymgjbrORf5MkbrPilzMzAXABygDjDSFus5x/AcoAASBu8tCAAcyVMXABygDiyQH7ACEAmH8BygDIcAHKAHABygAkbrOdfwHKAAQgbvLQgFAEzJY0A3ABygDiJG6znX8BygAEIG7y0IBQBMyWNANwAcoA4nABygACfwHKAALJWMwAEIIAnbAks/L0AdbtRNDUAfhj0gABjlP6QAEg10mBAQu68uCIINcLCiCBBP+68tCJgwm68uCIAYEBAdcAgQEB1wDUAdCBAQHXAIEBAdcA0gDSAIEBAdcA1DDQgQEB1wD0BDAQehB5EHhsGuD4KNcLCoMJuvLgiSQBePpAASDXSYEBC7ry4Igg1wsKIIEE/7ry0ImDCbry4IgBgQEB1wCBAQHXANQB0IEBAdcAMBRDMATRVQLbPCUAEm1wcFRgBHBVIEtCxkk=');
    let builder = beginCell();
    builder.storeRef(__system);
    builder.storeUint(0, 1);
    initRugPull_init_args({ $$type: 'RugPull_init_args', owner, investment, returns, fee })(builder);
    const __data = builder.endCell();
    return { code: __code, data: __data };
}

const RugPull_errors: { [key: number]: { message: string } } = {
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
    16059: { message: `Invalid value` },
    40368: { message: `Contract stopped` },
    53296: { message: `Contract not stopped` },
}

const RugPull_types: ABIType[] = [
    {"name":"StateInit","header":null,"fields":[{"name":"code","type":{"kind":"simple","type":"cell","optional":false}},{"name":"data","type":{"kind":"simple","type":"cell","optional":false}}]},
    {"name":"Context","header":null,"fields":[{"name":"bounced","type":{"kind":"simple","type":"bool","optional":false}},{"name":"sender","type":{"kind":"simple","type":"address","optional":false}},{"name":"value","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"raw","type":{"kind":"simple","type":"slice","optional":false}}]},
    {"name":"SendParameters","header":null,"fields":[{"name":"bounce","type":{"kind":"simple","type":"bool","optional":false}},{"name":"to","type":{"kind":"simple","type":"address","optional":false}},{"name":"value","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"mode","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"body","type":{"kind":"simple","type":"cell","optional":true}},{"name":"code","type":{"kind":"simple","type":"cell","optional":true}},{"name":"data","type":{"kind":"simple","type":"cell","optional":true}}]},
    {"name":"ChangeOwner","header":2174598809,"fields":[{"name":"queryId","type":{"kind":"simple","type":"uint","optional":false,"format":64}},{"name":"newOwner","type":{"kind":"simple","type":"address","optional":false}}]},
    {"name":"ChangeOwnerOk","header":846932810,"fields":[{"name":"queryId","type":{"kind":"simple","type":"uint","optional":false,"format":64}},{"name":"newOwner","type":{"kind":"simple","type":"address","optional":false}}]},
    {"name":"RugParams","header":null,"fields":[{"name":"investment","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"returns","type":{"kind":"simple","type":"int","optional":false,"format":257}},{"name":"fee","type":{"kind":"simple","type":"int","optional":false,"format":257}}]},
]

const RugPull_getters: ABIGetter[] = [
    {"name":"params","arguments":[],"returnType":{"kind":"simple","type":"RugParams","optional":false}},
    {"name":"owner","arguments":[],"returnType":{"kind":"simple","type":"address","optional":false}},
    {"name":"stopped","arguments":[],"returnType":{"kind":"simple","type":"bool","optional":false}},
]

const RugPull_receivers: ABIReceiver[] = [
    {"receiver":"internal","message":{"kind":"empty"}},
    {"receiver":"internal","message":{"kind":"text","text":"withdraw"}},
    {"receiver":"internal","message":{"kind":"text","text":"rugpull"}},
    {"receiver":"internal","message":{"kind":"typed","type":"ChangeOwner"}},
    {"receiver":"internal","message":{"kind":"text","text":"Stop"}},
]

export class RugPull implements Contract {
    
    static async init(owner: Address, investment: bigint, returns: bigint, fee: bigint) {
        return await RugPull_init(owner, investment, returns, fee);
    }
    
    static async fromInit(owner: Address, investment: bigint, returns: bigint, fee: bigint) {
        const init = await RugPull_init(owner, investment, returns, fee);
        const address = contractAddress(0, init);
        return new RugPull(address, init);
    }
    
    static fromAddress(address: Address) {
        return new RugPull(address);
    }
    
    readonly address: Address; 
    readonly init?: { code: Cell, data: Cell };
    readonly abi: ContractABI = {
        types:  RugPull_types,
        getters: RugPull_getters,
        receivers: RugPull_receivers,
        errors: RugPull_errors,
    };
    
    private constructor(address: Address, init?: { code: Cell, data: Cell }) {
        this.address = address;
        this.init = init;
    }
    
    async send(provider: ContractProvider, via: Sender, args: { value: bigint, bounce?: boolean| null | undefined }, message: null | 'withdraw' | 'rugpull' | ChangeOwner | 'Stop') {
        
        let body: Cell | null = null;
        if (message === null) {
            body = new Cell();
        }
        if (message === 'withdraw') {
            body = beginCell().storeUint(0, 32).storeStringTail(message).endCell();
        }
        if (message === 'rugpull') {
            body = beginCell().storeUint(0, 32).storeStringTail(message).endCell();
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'ChangeOwner') {
            body = beginCell().store(storeChangeOwner(message)).endCell();
        }
        if (message === 'Stop') {
            body = beginCell().storeUint(0, 32).storeStringTail(message).endCell();
        }
        if (body === null) { throw new Error('Invalid message type'); }
        
        await provider.internal(via, { ...args, body: body });
        
    }
    
    async getParams(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('params', builder.build())).stack;
        const result = loadTupleRugParams(source);
        return result;
    }
    
    async getOwner(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('owner', builder.build())).stack;
        let result = source.readAddress();
        return result;
    }
    
    async getStopped(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('stopped', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
}