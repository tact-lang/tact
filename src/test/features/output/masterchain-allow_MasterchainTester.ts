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

export type TestMessage = {
    $$type: 'TestMessage';
    address: Address;
    address2: Address | null;
}

export function storeTestMessage(src: TestMessage) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(3679600542, 32);
        b_0.storeAddress(src.address);
        b_0.storeAddress(src.address2);
    };
}

export function loadTestMessage(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 3679600542) { throw Error('Invalid prefix'); }
    let _address = sc_0.loadAddress();
    let _address2 = sc_0.loadMaybeAddress();
    return { $$type: 'TestMessage' as const, address: _address, address2: _address2 };
}

function loadTupleTestMessage(source: TupleReader) {
    let _address = source.readAddress();
    let _address2 = source.readAddressOpt();
    return { $$type: 'TestMessage' as const, address: _address, address2: _address2 };
}

function storeTupleTestMessage(source: TestMessage) {
    let builder = new TupleBuilder();
    builder.writeAddress(source.address);
    builder.writeAddress(source.address2);
    return builder.build();
}

function dictValueParserTestMessage(): DictionaryValue<TestMessage> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeTestMessage(src)).endCell());
        },
        parse: (src) => {
            return loadTestMessage(src.loadRef().beginParse());
        }
    }
}

 type MasterchainTester_init_args = {
    $$type: 'MasterchainTester_init_args';
}

function initMasterchainTester_init_args(src: MasterchainTester_init_args) {
    return (builder: Builder) => {
        let b_0 = builder;
    };
}

async function MasterchainTester_init() {
    const __code = Cell.fromBase64('te6ccgECFQEAAnwAART/APSkE/S88sgLAQIBYgIDAgLNBAUCASAICQK10A6GmBgLjYYADIv8i4cQD9IACQa6TAgIXdeXBEEGuFhRBBhN0AwIJ/3Vj5cEQqKCmBt4J8MIF8MXaiaGoA/DHpABhItsdBbZ5xLO2eGBhkfCGA5j+A5QBk9qpBMGADfRBrpMCAhd15cEQQa4WFEEGE3QDAgn/dWPlwREAaTtou37cCHXScIflTAg1wsf3gKSW3/gIYIQ21I/nrqOKTHTHwGCENtSP5668uCB+kAB8AQB+kAh1wsBwwCTAfAEkjFt4hJsElt/4AHAAJEw4w1wBwBU+QGC8IXSiDhMAENFiwKAPLIgWfaIA8VTw2VjRDRkaNrJYfJGupN/2zHgAgFiCgsCASAODwKzshObyIBINdJgQELuvLgiCDXCwoggwm6AYEE/7qx8uCIIW6SMW2OHAEg10mBAQu68uCIINcLCiCDCboBgQT/urHy4Iji7UTQ1AH4Y9IAMJFtjoLbPOJZ2zwxgEwwCZbO1SDXSYEBC7ry4Igg1wsKIIMJugGBBP+6sfLgiO1E0NQB+GPSADCRbY6C2zziAds8MYBMNAARbfwAEMH8CASAQEQIvurEO1E0NQB+GPSADCRbY6C2zziWds8MYExQCL7YKXaiaGoA/DHpABhItsdBbZ5xAO2eGMBMSALm3ejBOC52Hq6WVz2PQnYc6yVCjbNBOE7rGpaVsj5ZkWnXlv74sRzBOBAq4A3AM7HKZywdVyOS2WHBOA3qTvfKost446np7wKs4ZNBOGy84zdGHN4T1ltQmJrcbvLAADPpAAfAEMQACbQAkyHIBywFwAcsAEsoHy//J0PAE');
    const __system = Cell.fromBase64('te6cckECFwEAAoYAAQHAAQEFoAxHAgEU/wD0pBP0vPLICwMCAWIRBAIBIAwFAgEgCAYCL7qxDtRNDUAfhj0gAwkW2Ogts84lnbPDGBYHACTIcgHLAXABywASygfL/8nQ8AQCASAKCQC5t3owTgudh6ullc9j0J2HOslQo2zQThO6xqWlbI+WZFp15b++LEcwTgQKuANwDOxymcsHVcjktlhwTgN6k73yqLLeOOp6e8CrOGTQThsvOM3RhzeE9ZbUJia3G7ywAi+2Cl2omhqAPwx6QAYSLbHQW2ecQDtnhjAWCwAM+kAB8AQxAgFiDw0CZbO1SDXSYEBC7ry4Igg1wsKIIMJugGBBP+6sfLgiO1E0NQB+GPSADCRbY6C2zziAds8MYBYOAAQwfwKzshObyIBINdJgQELuvLgiCDXCwoggwm6AYEE/7qx8uCIIW6SMW2OHAEg10mBAQu68uCIINcLCiCDCboBgQT/urHy4Iji7UTQ1AH4Y9IAMJFtjoLbPOJZ2zwxgFhAABFt/AgLNExIAN9EGukwICF3XlwRBBrhYUQQYTdAMCCf91Y+XBEQCtdAOhpgYC42GAAyL/IuHEA/SAAkGukwICF3XlwRBBrhYUQQYTdAMCCf91Y+XBEKigpgbeCfDCBfDF2omhqAPwx6QAYSLbHQW2ecSztnhgYZHwhgOY/gOUAZPaqQWFAGk7aLt+3Ah10nCH5UwINcLH94Cklt/4CGCENtSP566jikx0x8BghDbUj+euvLggfpAAfAEAfpAIdcLAcMAkwHwBJIxbeISbBJbf+ABwACRMOMNcBUAVPkBgvCF0og4TABDRYsCgDyyIFn2iAPFU8NlY0Q0ZGjayWHyRrqTf9sx4AACbRcuNGg=');
    let builder = beginCell();
    builder.storeRef(__system);
    builder.storeUint(0, 1);
    initMasterchainTester_init_args({ $$type: 'MasterchainTester_init_args' })(builder);
    const __data = builder.endCell();
    return { code: __code, data: __data };
}

const MasterchainTester_errors: { [key: number]: { message: string } } = {
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

export class MasterchainTester implements Contract {
    
    static async init() {
        return await MasterchainTester_init();
    }
    
    static async fromInit() {
        const init = await MasterchainTester_init();
        const address = contractAddress(0, init);
        return new MasterchainTester(address, init);
    }
    
    static fromAddress(address: Address) {
        return new MasterchainTester(address);
    }
    
    readonly address: Address; 
    readonly init?: { code: Cell, data: Cell };
    readonly abi: ContractABI = {
        errors: MasterchainTester_errors
    };
    
    private constructor(address: Address, init?: { code: Cell, data: Cell }) {
        this.address = address;
        this.init = init;
    }
    
    async send(provider: ContractProvider, via: Sender, args: { value: bigint, bounce?: boolean| null | undefined }, message: 'Deploy' | TestMessage) {
        
        let body: Cell | null = null;
        if (message === 'Deploy') {
            body = beginCell().storeUint(0, 32).storeStringTail(message).endCell();
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'TestMessage') {
            body = beginCell().store(storeTestMessage(message)).endCell();
        }
        if (body === null) { throw new Error('Invalid message type'); }
        
        await provider.internal(via, { ...args, body: body });
        
    }
    
    async getCreateAddress(provider: ContractProvider, chain: bigint, hash: bigint) {
        let builder = new TupleBuilder();
        builder.writeNumber(chain);
        builder.writeNumber(hash);
        let source = (await provider.get('createAddress', builder.build())).stack;
        let result = source.readAddress();
        return result;
    }
    
    async getParseAddress(provider: ContractProvider, src: Cell) {
        let builder = new TupleBuilder();
        builder.writeSlice(src);
        let source = (await provider.get('parseAddress', builder.build())).stack;
        let result = source.readAddress();
        return result;
    }
    
    async getSerializeAddress(provider: ContractProvider, src: Address) {
        let builder = new TupleBuilder();
        builder.writeAddress(src);
        let source = (await provider.get('serializeAddress', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
    async getHandleStruct(provider: ContractProvider, src: TestMessage) {
        let builder = new TupleBuilder();
        builder.writeTuple(storeTupleTestMessage(src));
        let source = (await provider.get('handleStruct', builder.build())).stack;
        let result = source.readBoolean();
        return result;
    }
    
}