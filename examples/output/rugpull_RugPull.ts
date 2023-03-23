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

export type ChangeOwner = {
    $$type: 'ChangeOwner';
    newOwner: Address;
}

export function storeChangeOwner(src: ChangeOwner) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(256331011, 32);
        b_0.storeAddress(src.newOwner);
    };
}

export function loadChangeOwner(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 256331011) { throw Error('Invalid prefix'); }
    let _newOwner = sc_0.loadAddress();
    return { $$type: 'ChangeOwner' as const, newOwner: _newOwner };
}

function loadTupleChangeOwner(source: TupleReader) {
    let _newOwner = source.readAddress();
    return { $$type: 'ChangeOwner' as const, newOwner: _newOwner };
}

function storeTupleChangeOwner(source: ChangeOwner) {
    let builder = new TupleBuilder();
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
    const __code = Cell.fromBase64('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');
    const __system = Cell.fromBase64('te6cckECIgEABosAAQHAAQEFoK6fAgEU/wD0pBP0vPLICwMCAWIPBAIBIAoFAgEgCAYDwbhtXtRNDUAfhj0gABjsz4KNcLCoMJuvLgifpAASDXSYEBC7ry4Igg1wsKIIMJuiGBBP+6sfLgiIMJuvLgiQGBAQHXAIEBAdcA1AHQgQEB1wAwFEMwBNFVAts84w3bPGyjghIAcABlR4dgHdu70YJwXOw9XSyuex6E7DnWSoUbZoJwndY1LStkfLMi068t/fFiOYJwIFXAG4BnY5TOWDquRyWyw4JwnZdOWrNOy3M6DpZtlGbopIJwoBY90JlEubWqqQrClgAsBoJwQM51aecV+dJQsB1hbiZHsoCQAkgnCRMGhmpuikNn7gR74FUY+JAgEgDQsDwbhR3tRNDUAfhj0gABjsz4KNcLCoMJuvLgifpAASDXSYEBC7ry4Igg1wsKIIMJuiGBBP+6sfLgiIMJuvLgiQGBAQHXAIEBAdcA1AHQgQEB1wAwFEMwBNFVAts84w3bPGyhghIAwAAikDwboXvtRNDUAfhj0gABjsz4KNcLCoMJuvLgifpAASDXSYEBC7ry4Igg1wsKIIMJuiGBBP+6sfLgiIMJuvLgiQGBAQHXAIEBAdcA1AHQgQEB1wAwFEMwBNFVAts84w3bPGyhghIA4AAiMBftAB0NMDAXGwwAGRf5Fw4gH6QAEg10mBAQu68uCIINcLCiCDCbohgQT/urHy4IiDCbry4IlUUFMDbwT4YQL4YhAEvu1E0NQB+GPSAAGOzPgo1wsKgwm68uCJ+kABINdJgQELuvLgiCDXCwoggwm6IYEE/7qx8uCIgwm68uCJAYEBAdcAgQEB1wDUAdCBAQHXADAUQzAE0VUC2zzjDVUZ2zwwISASEQDOyPhDAcx/AcoAVZBQqSDXSYEBC7ry4Igg1wsKIIMJuiGBBP+6sfLgiIMJuvLgic8WF4EBAc8AFYEBAc8AA8iBAQHPABKBAQHPAMoAEsoAEoEBAc8AA8iBAQHPABL0AMlYzMkBzMntVAPc7aLt+3Ah10nCH5UwINcLH94Cklt/4CHAACHXScEhsOMCIYIQD0dNA7qOujHTHwGCEA9HTQO68uCB+kABINdJgQELuvLgiCDXCwoggwm6IYEE/7qx8uCIgwm68uCJMVWQ2zxsGX/gAcAAkTDjDXAbGhME+vkBIILwCVGQGUruYRzolcVQOt+F/YZN55BXRhQvYI0+svqtFOS6jxow2zwks5QlcPsC3nAqgwZ/UDNtbW3bPH/bMeAggvDN4kLGysVgqZ/y0mg+4PsWKagYrsDxFmURzYIs8g2k6rqOkzA0f3AqgwZ/UDNtbW3bPAR/2zHgGh0dFAFWgvC8+vd2kHxxnMjTedjxlKqqJ+jKKHHNWReBch8hWkVFAbqOhds8f9sx4BUEIts82zwzf4t1N0b3BwZWSNs8Gh8YFgEG2zwDFwEaf/hCcFgDgEIBbW3bPB0BQshwAcsfbwABb4xtb4wB2zxvIgHJkyFus5YBbyJZzMnoMRkAuiDXSiHXSZcgwgAiwgCxjkoDbyKAfyLPMasCoQWrAlFVtgggwgCcIKoCFdcYUDPPFkAU3llvAlNBocIAmcgBbwJQRKGqAo4SMTPCAJnUMNAg10oh10mScCDi4uhfAwAS+EJSoMcF8uCEA+Rb2zwkjoxwKoMGf1AzbW1t2zyO3PhBbyQwMoE+u1O5oBO+EvL0gQEBUjIgbpUwWfRaMJRBM/QU4gGkUVignFMHvJVTUqHCAJFw4o6hIYEBASRZ9AxvoZIwbd8gbvLQgFEYoQOkUTgXQzDbPFAF6FBV4n8fHRwBFAFyf1AzbW1t2zwdAdTIcQHKAVAHAcoAcAHKAlAFINdJgQELuvLgiCDXCwoggwm6IYEE/7qx8uCIgwm68uCJzxZQA/oCcAHKaCNus5F/kyRus+KXMzMBcAHKAOMNIW6znH8BygABIG7y0IABzJUxcAHKAOLJAfsAHgCYfwHKAMhwAcoAcAHKACRus51/AcoABCBu8tCAUATMljQDcAHKAOIkbrOdfwHKAAQgbvLQgFAEzJY0A3ABygDicAHKAAJ/AcoAAslYzAAQggCdsCSz8vQAsPpAASDXSYEBC7ry4Igg1wsKIIMJuiGBBP+6sfLgiIMJuvLgiQGBAQHXAIEBAdcA1AHQgQEB1wCBAQHXANIA0gCBAQHXANQw0IEBAdcA9AQwEHoQeRB4bBoAEm1wcFRgBHBVICl/eYY=');
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
        errors: RugPull_errors
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