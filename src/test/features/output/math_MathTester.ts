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