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
    const __system = Cell.fromBase64('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');
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
        errors: MathTester_errors
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