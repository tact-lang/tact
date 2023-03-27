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

 type IntrinsicsTester_init_args = {
    $$type: 'IntrinsicsTester_init_args';
}

function initIntrinsicsTester_init_args(src: IntrinsicsTester_init_args) {
    return (builder: Builder) => {
        let b_0 = builder;
    };
}

async function IntrinsicsTester_init() {
    const __code = Cell.fromBase64('te6ccgECLAEAA1MAART/APSkE/S88sgLAQIBYgIDA3bQAdDTAwFxsKMB+kABINdJgQELuvLgiCDXCwoggQT/uvLQiYMJuvLgiFRQUwNvBPhhAvhi2zxVFNs8MCgEBQIBIAcIAu7tou37cCHXScIflTAg1wsf3gKSW3/gAcAAj1j5ASCC8IXSiDhMAENFiwKAPLIgWfaIA8VTw2VjRDRkaNrJYfJGupQwf9sx4ILwUeoOxakCmfYWlm7yFcrexagv8XX41up+dMIkVsn11t26jwaI2zx/2zHgkTDicBEGAITI+EMBzH8BygBVQFBFgQEBzwDIUAPPFslYzAEg10mBAQu68uCIINcLCiCBBP+68tCJgwm68uCIzxbMgQEBzwDJ7VQAMMiCWMAAAAAAAAAAAAAAAAEBy2fMyXD7AAIBIBMUAgEgCQoCASALDAIBIA4PAhG2vttnm2eNijAoDQC5t3owTgudh6ullc9j0J2HOslQo2zQThO6xqWlbI+WZFp15b++LEcwTgQKuANwDOxymcsHVcjktlhwTgN6k73yqLLeOOp6e8CrOGTQThOy6ctWadluZ0HSzbKM3RSQAAIiAhG0yftnm2eNijAoEAIRtCV7Z5tnjYowKBIBAogRAB4AAAAASGVsbG8gd29ybGQAAiMCAUgVFgIBIBkaAhGx/PbPNs8bFGAoFwIRslZ2zzbPGxRgKBgASI0IYAQe/qqXMblNo5fl5kYi9eYzSLgSrFtHY6k/DdIB0HmNRAACJAIBSBscAgEgHyACEa447Z5tnjYowCgdAhGuQ22ebZ42KMAoHgECiCsADIISW2bTQAIBICEiAhGzVjbPNs8bFGAoKQIRr7ztnm2eNijAKCMCAW4kJQACIAIPo/Ns82zxsUYoJgIPoUds82zxsUYoJwAEgwgAAiEBnO1E0NQB+GPSAAGOM4EBAdcA1AHQAfpAASDXSYEBC7ry4Igg1wsKIIEE/7ry0ImDCbry4IgB1IEBAdcAVUBsFeAw+CjXCwqDCbry4InbPCoAGou0hlbGxvIHdvcmxkgBdIISW2bTQIu0hlbGxvIHdvcmxkiNCGAEHv6qlzG5TaOX5eZGIvXmM0i4EqxbR2OpPw3SAdB5jUSIgwgrABhIZWxsbyB3b3JsZCE=');
    const __system = Cell.fromBase64('te6cckECLgEAA10AAQHAAQEFoOvtAgEU/wD0pBP0vPLICwMCAWImBAIBIA8FAgEgCwYCASAJBwIRtCV7Z5tnjYowKwgAAiMCEbTJ+2ebZ42KMCsKAQKIKgIBIA0MALm3ejBOC52Hq6WVz2PQnYc6yVCjbNBOE7rGpaVsj5ZkWnXlv74sRzBOBAq4A3AM7HKZywdVyOS2WHBOA3qTvfKost446np7wKs4ZNBOE7Lpy1Zp2W5nQdLNsozdFJACEba+22ebZ42KMCsOAAIiAgEgIRACASAcEQIBIBQSAhGzVjbPNs8bFGArEwAai7SGVsbG8gd29ybGSAIBIBoVAgFuGBYCD6FHbPNs8bFGKxcAAiECD6PzbPNs8bFGKxkABIMIAhGvvO2ebZ42KMArGwACIAIBSB8dAhGuQ22ebZ42KMArHgAMghJbZtNAAhGuOO2ebZ42KMArIAECiC0CAUgkIgIRslZ2zzbPGxRgKyMAAiQCEbH89s82zxsUYCslAEiNCGAEHv6qlzG5TaOX5eZGIvXmM0i4EqxbR2OpPw3SAdB5jUQDdtAB0NMDAXGwowH6QAEg10mBAQu68uCIINcLCiCBBP+68tCJgwm68uCIVFBTA28E+GEC+GLbPFUU2zwwKygnAITI+EMBzH8BygBVQFBFgQEBzwDIUAPPFslYzAEg10mBAQu68uCIINcLCiCBBP+68tCJgwm68uCIzxbMgQEBzwDJ7VQC7u2i7ftwIddJwh+VMCDXCx/eApJbf+ABwACPWPkBIILwhdKIOEwAQ0WLAoA8siBZ9ogDxVPDZWNENGRo2slh8ka6lDB/2zHggvBR6g7FqQKZ9haWbvIVyt7FqC/xdfjW6n50wiRWyfXW3bqPBojbPH/bMeCRMOJwKikAMMiCWMAAAAAAAAAAAAAAAAEBy2fMyXD7AAAeAAAAAEhlbGxvIHdvcmxkAZztRNDUAfhj0gABjjOBAQHXANQB0AH6QAEg10mBAQu68uCIINcLCiCBBP+68tCJgwm68uCIAdSBAQHXAFVAbBXgMPgo1wsKgwm68uCJ2zwsAXSCEltm00CLtIZWxsbyB3b3JsZIjQhgBB7+qpcxuU2jl+XmRiL15jNIuBKsW0djqT8N0gHQeY1EiIMILQAYSGVsbG8gd29ybGQhVhb7mQ==');
    let builder = beginCell();
    builder.storeRef(__system);
    builder.storeUint(0, 1);
    initIntrinsicsTester_init_args({ $$type: 'IntrinsicsTester_init_args' })(builder);
    const __data = builder.endCell();
    return { code: __code, data: __data };
}

const IntrinsicsTester_errors: { [key: number]: { message: string } } = {
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

export class IntrinsicsTester implements Contract {
    
    static async init() {
        return await IntrinsicsTester_init();
    }
    
    static async fromInit() {
        const init = await IntrinsicsTester_init();
        const address = contractAddress(0, init);
        return new IntrinsicsTester(address, init);
    }
    
    static fromAddress(address: Address) {
        return new IntrinsicsTester(address);
    }
    
    readonly address: Address; 
    readonly init?: { code: Cell, data: Cell };
    readonly abi: ContractABI = {
        errors: IntrinsicsTester_errors
    };
    
    private constructor(address: Address, init?: { code: Cell, data: Cell }) {
        this.address = address;
        this.init = init;
    }
    
    async send(provider: ContractProvider, via: Sender, args: { value: bigint, bounce?: boolean| null | undefined }, message: 'Deploy' | 'emit_1') {
        
        let body: Cell | null = null;
        if (message === 'Deploy') {
            body = beginCell().storeUint(0, 32).storeStringTail(message).endCell();
        }
        if (message === 'emit_1') {
            body = beginCell().storeUint(0, 32).storeStringTail(message).endCell();
        }
        if (body === null) { throw new Error('Invalid message type'); }
        
        await provider.internal(via, { ...args, body: body });
        
    }
    
    async getGetTons(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getTons', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getGetTons2(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getTons2', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getGetString(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getString', builder.build())).stack;
        let result = source.readString();
        return result;
    }
    
    async getGetString2(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getString2', builder.build())).stack;
        let result = source.readString();
        return result;
    }
    
    async getGetAddress(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getAddress', builder.build())).stack;
        let result = source.readAddress();
        return result;
    }
    
    async getGetAddress2(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getAddress2', builder.build())).stack;
        let result = source.readAddress();
        return result;
    }
    
    async getGetCell(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getCell', builder.build())).stack;
        let result = source.readCell();
        return result;
    }
    
    async getGetCell2(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getCell2', builder.build())).stack;
        let result = source.readCell();
        return result;
    }
    
    async getGetPow(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getPow', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getGetPow2(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getPow2', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getGetComment(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getComment', builder.build())).stack;
        let result = source.readCell();
        return result;
    }
    
}