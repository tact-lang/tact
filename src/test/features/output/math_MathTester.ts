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