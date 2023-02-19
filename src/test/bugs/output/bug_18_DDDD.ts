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
async function DDDD_init(addr1: Address, addr2: Address, addr3: Address) {
    const __init = 'te6ccgEBBgEAOgABFP8A9KQT9LzyyAsBAgFiAgMCAs0EBQAJoUrd4AkAAdQALdNraC5GYCqCpniyxniwDniwl6AHoAZM';
    const __code = 'te6ccgECDgEAAdAAART/APSkE/S88sgLAQIBYgIDAgLNBAUCASAICQGl04EOuk4Q/KmBBrhY/vAWhpgYC42GAAyL/IuHEA/SARKDM3gnwwgUit8GAAAOuk4JDYR032omhqAPwxfSAAgP0gAID9IACA+gJ6AiqgNgrweWBBQGACNohbpVbWfRZMODIAc8AQTP0QYB7AGBAQFwJiBulTBZ9FowlEEz9BTigQEBcSUgbpUwWfRaMJRBM/QU4oEBAXIkIG6VMFn0WjCUQTP0FOKBAQFzJiBulTBZ9FowlEEz9BTiAYEBCyVwgQEB8AaBAQskcYEBAfAGgQELI3KBAQHwBoEBCyVzgQEB8AYHADLI+EIBzFVAUFTPFljPFgHPFhL0APQAye1UAUO8FPdqJoagD8MX0gAID9IACA/SAAgPoCegIqoDYKqoJtnkCgIBIAsMADBsQoEBCwGBAQFBM/QKb6GUAdcAMJJbbeIAcbu9GCcFzsPV0srnsehOw51kqFG2aCcJ3WNS0rZHyzItOvLf3xYjmCcBvUne+VRZbxx1PT3gVZwyaAFDuVw+1E0NQB+GL6QAEB+kABAfpAAQH0BPQEVUBsFVUE2zyA0AIDEyM4EBATJZ9AxvoZIwbd8=';
    const __system = 'te6cckECEAEAAdoAAQHAAQEFoViRAgEU/wD0pBP0vPLICwMCAWILBAIBIAkFAgEgCAYBQ7lcPtRNDUAfhi+kABAfpAAQH6QAEB9AT0BFVAbBVVBNs8gHACAxMjOBAQEyWfQMb6GSMG3fAHG7vRgnBc7D1dLK57HoTsOdZKhRtmgnCd1jUtK2R8syLTry398WI5gnAb1J3vlUWW8cdT094FWcMmgBQ7wU92omhqAPwxfSAAgP0gAID9IACA+gJ6AiqgNgqqgm2eQKADBsQoEBCwGBAQFBM/QKb6GUAdcAMJJbbeICAs0NDAAjaIW6VW1n0WTDgyAHPAEEz9EGAaXTgQ66ThD8qYEGuFj+8BaGmBgLjYYADIv8i4cQD9IBEoMzeCfDCBSK3wYAAA66TgkNhHTfaiaGoA/DF9IACA/SAAgP0gAID6AnoCKqA2CvB5YEFA4B7AGBAQFwJiBulTBZ9FowlEEz9BTigQEBcSUgbpUwWfRaMJRBM/QU4oEBAXIkIG6VMFn0WjCUQTP0FOKBAQFzJiBulTBZ9FowlEEz9BTiAYEBCyVwgQEB8AaBAQskcYEBAfAGgQELI3KBAQHwBoEBCyVzgQEB8AYPADLI+EIBzFVAUFTPFljPFgHPFhL0APQAye1U93e4GA==';
    let systemCell = Cell.fromBase64(__system);
    let builder = new TupleBuilder();
    builder.writeCell(systemCell);
    builder.writeAddress(addr1);
    builder.writeAddress(addr2);
    builder.writeAddress(addr3);
    let __stack = builder.build();
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let initCell = Cell.fromBoc(Buffer.from(__init, 'base64'))[0];
    let system = await ContractSystem.create();
    let executor = await ContractExecutor.create({ code: initCell, data: new Cell() }, system);
    let res = await executor.get('init', __stack);
    if (!res.success) { throw Error(res.error); }
    if (res.exitCode !== 0 && res.exitCode !== 1) {
        if (DDDD_errors[res.exitCode]) {
            throw new ComputeError(DDDD_errors[res.exitCode].message, res.exitCode, { logs: res.logs });
        } else {
            throw new ComputeError('Exit code: ' + res.exitCode, res.exitCode, { logs: res.logs });
        }
    }
    let data = res.stack.readCell();
    return { code: codeCell, data };
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