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

 type DDDD_init_args = {
    $$type: 'DDDD_init_args';
    addr1: Address;
    addr2: Address;
    addr3: Address;
}

function initDDDD_init_args(src: DDDD_init_args) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeAddress(src.addr1);
        b_0.storeAddress(src.addr2);
        b_0.storeAddress(src.addr3);
    };
}

async function DDDD_init(addr1: Address, addr2: Address, addr3: Address) {
    const __code = Cell.fromBase64('te6ccgECEgEAA7EAART/APSkE/S88sgLAQIBYgIDBKDQAdDTAwFxsMABkX+RcOIB+kABINdJgQELuvLgiCDXCwoggwm6IYEE/7qx8uCIgwm68uCJVFBTA28E+GEC+GLtRNDUAfhj0gAB4w9VFNs8MA4PBAUCASAKCwFEcCHXScIflTAg1wsf3gKSW3/gAcAAAddJwSGwjoPbPH/gcAYBBNs8CAHgAYEBAXAmIG6VMFn0WjCUQTP0FOKBAQFxJSBulTBZ9FowlEEz9BTigQEBciQgbpUwWfRaMJRBM/QU4oEBAXMmIG6VMFn0WjCUQTP0FOIBgQELJXCBAQEhbpVbWfRZMJjIAc8AQTP0QeKBAQskcYEBAQcAjCFulVtZ9FkwmMgBzwBBM/RB4oEBCyNygQEBIW6VW1n0WTCYyAHPAEEz9EHigQELJXOBAQEhbpVbWfRZMJjIAc8AQTP0QeIBFsj4QwHMfwHKAFVACQDqUFQg10mBAQu68uCIINcLCiCDCbohgQT/urHy4IiDCbry4InPFlgg10mBAQu68uCIINcLCiCDCbohgQT/urHy4IiDCbry4InPFgEg10mBAQu68uCIINcLCiCDCbohgQT/urHy4IiDCbry4InPFhL0APQAye1UApO8FPEGukwICF3XlwRBBrhYUQQYTdEMCCf91Y+XBEQYTdeXBE9qJoagD8MekAAPGHqoI2IUCAhYDAgICgmfoFN9DKAOuAGEkttvFA4PAgEgDA0Aubu9GCcFzsPV0srnsehOw51kqFG2aCcJ3WNS0rZHyzItOvLf3xYjmCcCBVwBuAZ2OUzlg6rkclssOCcBvUne+VRZbxx1PT3gVZwyaCcJ2XTlqzTstzOg6WbZRm6KSAJBuVw+1E0NQB+GPSAAHjD1UEMTIzgQEBMln0DG+hkjBt34Dg8A7vpAASDXSYEBC7ry4Igg1wsKIIMJuiGBBP+6sfLgiIMJuvLgiQH6QAEg10mBAQu68uCIINcLCiCDCbohgQT/urHy4IiDCbry4IkB+kABINdJgQELuvLgiCDXCwoggwm6IYEE/7qx8uCIgwm68uCJAfQE9ARVQGwVAfz4KNcLCoMJuvLgifpAASDXSYEBC7ry4Igg1wsKIIMJuiGBBP+6sfLgiIMJuvLgiQH6QAEg10mBAQu68uCIINcLCiCDCbohgQT/urHy4IiDCbry4IkB+kABINdJgQELuvLgiCDXCwoggwm6IYEE/7qx8uCIgwm68uCJQzAD0VgQAQTbPBEABG1t');
    const __system = Cell.fromBase64('te6cckECFAEAA7sAAQHAAQEFoViRAgEU/wD0pBP0vPLICwMCAWIJBAIBIAgFAgEgBwYCQblcPtRNDUAfhj0gAB4w9VBDEyM4EBATJZ9AxvoZIwbd+BMQALm7vRgnBc7D1dLK57HoTsOdZKhRtmgnCd1jUtK2R8syLTry398WI5gnAgVcAbgGdjlM5YOq5HJbLDgnAb1J3vlUWW8cdT094FWcMmgnCdl05as07LczoOlm2UZuikgCk7wU8Qa6TAgIXdeXBEEGuFhRBBhN0QwIJ/3Vj5cERBhN15cET2omhqAPwx6QAA8YeqgjYhQICFgMCAgKCZ+gU30MoA64AYSS228UExAEoNAB0NMDAXGwwAGRf5Fw4gH6QAEg10mBAQu68uCIINcLCiCDCbohgQT/urHy4IiDCbry4IlUUFMDbwT4YQL4Yu1E0NQB+GPSAAHjD1UU2zwwExANCgEE2zwLARbI+EMBzH8BygBVQAwA6lBUINdJgQELuvLgiCDXCwoggwm6IYEE/7qx8uCIgwm68uCJzxZYINdJgQELuvLgiCDXCwoggwm6IYEE/7qx8uCIgwm68uCJzxYBINdJgQELuvLgiCDXCwoggwm6IYEE/7qx8uCIgwm68uCJzxYS9AD0AMntVAFEcCHXScIflTAg1wsf3gKSW3/gAcAAAddJwSGwjoPbPH/gcA4B4AGBAQFwJiBulTBZ9FowlEEz9BTigQEBcSUgbpUwWfRaMJRBM/QU4oEBAXIkIG6VMFn0WjCUQTP0FOKBAQFzJiBulTBZ9FowlEEz9BTiAYEBCyVwgQEBIW6VW1n0WTCYyAHPAEEz9EHigQELJHGBAQEPAIwhbpVbWfRZMJjIAc8AQTP0QeKBAQsjcoEBASFulVtZ9FkwmMgBzwBBM/RB4oEBCyVzgQEBIW6VW1n0WTCYyAHPAEEz9EHiAfz4KNcLCoMJuvLgifpAASDXSYEBC7ry4Igg1wsKIIMJuiGBBP+6sfLgiIMJuvLgiQH6QAEg10mBAQu68uCIINcLCiCDCbohgQT/urHy4IiDCbry4IkB+kABINdJgQELuvLgiCDXCwoggwm6IYEE/7qx8uCIgwm68uCJQzAD0VgRAQTbPBIABG1tAO76QAEg10mBAQu68uCIINcLCiCDCbohgQT/urHy4IiDCbry4IkB+kABINdJgQELuvLgiCDXCwoggwm6IYEE/7qx8uCIgwm68uCJAfpAASDXSYEBC7ry4Igg1wsKIIMJuiGBBP+6sfLgiIMJuvLgiQH0BPQEVUBsFVrHd7E=');
    let builder = beginCell();
    builder.storeRef(__system);
    builder.storeUint(0, 1);
    initDDDD_init_args({ $$type: 'DDDD_init_args', addr1, addr2, addr3 })(builder);
    const __data = builder.endCell();
    return { code: __code, data: __data };
}

const DDDD_errors: { [key: number]: { message: string } } = {
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

export class DDDD implements Contract {
    
    static async init(addr1: Address, addr2: Address, addr3: Address) {
        return await DDDD_init(addr1, addr2, addr3);
    }
    
    static async fromInit(addr1: Address, addr2: Address, addr3: Address) {
        const init = await DDDD_init(addr1, addr2, addr3);
        const address = contractAddress(0, init);
        return new DDDD(address, init);
    }
    
    static fromAddress(address: Address) {
        return new DDDD(address);
    }
    
    readonly address: Address; 
    readonly init?: { code: Cell, data: Cell };
    readonly abi: ContractABI = {
        errors: DDDD_errors
    };
    
    private constructor(address: Address, init?: { code: Cell, data: Cell }) {
        this.address = address;
        this.init = init;
    }
    
    async send(provider: ContractProvider, via: Sender, args: { value: bigint, bounce?: boolean| null | undefined }, message: null) {
        
        let body: Cell | null = null;
        if (message === null) {
            body = new Cell();
        }
        if (body === null) { throw new Error('Invalid message type'); }
        
        await provider.internal(via, { ...args, body: body });
        
    }
    
    async getMapDataAddr1(provider: ContractProvider, key: bigint) {
        let builder = new TupleBuilder();
        builder.writeNumber(key);
        let source = (await provider.get('mapData_addr1', builder.build())).stack;
        let result = source.readAddressOpt();
        return result;
    }
    
    async getMapData2Addr1(provider: ContractProvider, key: Address) {
        let builder = new TupleBuilder();
        builder.writeAddress(key);
        let source = (await provider.get('mapData2_addr1', builder.build())).stack;
        let result = source.readBigNumberOpt();
        return result;
    }
    
}