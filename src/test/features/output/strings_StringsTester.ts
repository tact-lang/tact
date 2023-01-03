import { Cell, Slice, Address, Builder, beginCell, ComputeError, TupleItem, TupleReader, Dictionary, contractAddress, ContractProvider, Sender, Contract, ContractABI } from 'ton-core';
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

export function packStackStateInit(src: StateInit, __stack: TupleItem[]) {
    __stack.push({ type: 'cell', cell: src.code });
    __stack.push({ type: 'cell', cell: src.data });
}

export function packTupleStateInit(src: StateInit): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'cell', cell: src.code });
    __stack.push({ type: 'cell', cell: src.data });
    return __stack;
}

export function unpackStackStateInit(slice: TupleReader): StateInit {
    const code = slice.readCell();
    const data = slice.readCell();
    return { $$type: 'StateInit', code: code, data: data };
}
export function unpackTupleStateInit(slice: TupleReader): StateInit {
    const code = slice.readCell();
    const data = slice.readCell();
    return { $$type: 'StateInit', code: code, data: data };
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

export function packStackContext(src: Context, __stack: TupleItem[]) {
    __stack.push({ type: 'int', value: src.bounced ? -1n : 0n });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.sender).endCell() });
    __stack.push({ type: 'int', value: src.value });
    __stack.push({ type: 'slice', cell: src.raw });
}

export function packTupleContext(src: Context): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'int', value: src.bounced ? -1n : 0n });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.sender).endCell() });
    __stack.push({ type: 'int', value: src.value });
    __stack.push({ type: 'slice', cell: src.raw });
    return __stack;
}

export function unpackStackContext(slice: TupleReader): Context {
    const bounced = slice.readBoolean();
    const sender = slice.readAddress();
    const value = slice.readBigNumber();
    const raw = slice.readCell();
    return { $$type: 'Context', bounced: bounced, sender: sender, value: value, raw: raw };
}
export function unpackTupleContext(slice: TupleReader): Context {
    const bounced = slice.readBoolean();
    const sender = slice.readAddress();
    const value = slice.readBigNumber();
    const raw = slice.readCell();
    return { $$type: 'Context', bounced: bounced, sender: sender, value: value, raw: raw };
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
        if (src.body !== null) {
            b_0.storeBit(true);
            b_0.storeRef(src.body);
        } else {
            b_0.storeBit(false);
        }
        if (src.code !== null) {
            b_0.storeBit(true);
            b_0.storeRef(src.code);
        } else {
            b_0.storeBit(false);
        }
        if (src.data !== null) {
            b_0.storeBit(true);
            b_0.storeRef(src.data);
        } else {
            b_0.storeBit(false);
        }
    };
}

export function loadSendParameters(slice: Slice) {
    let sc_0 = slice;
    let _bounce = sc_0.loadBit();
    let _to = sc_0.loadAddress();
    let _value = sc_0.loadIntBig(257);
    let _mode = sc_0.loadIntBig(257);
    let _body: Cell | null = null;
    if (sc_0.loadBit()) {
        _body = sc_0.loadRef();
    }
    let _code: Cell | null = null;
    if (sc_0.loadBit()) {
        _code = sc_0.loadRef();
    }
    let _data: Cell | null = null;
    if (sc_0.loadBit()) {
        _data = sc_0.loadRef();
    }
    return { $$type: 'SendParameters' as const, bounce: _bounce, to: _to, value: _value, mode: _mode, body: _body, code: _code, data: _data };
}

export function packStackSendParameters(src: SendParameters, __stack: TupleItem[]) {
    __stack.push({ type: 'int', value: src.bounce ? -1n : 0n });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.to).endCell() });
    __stack.push({ type: 'int', value: src.value });
    __stack.push({ type: 'int', value: src.mode });
    if (src.body !== null) {
        __stack.push({ type: 'cell', cell: src.body });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.code !== null) {
        __stack.push({ type: 'cell', cell: src.code });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.data !== null) {
        __stack.push({ type: 'cell', cell: src.data });
    } else {
        __stack.push({ type: 'null' });
    }
}

export function packTupleSendParameters(src: SendParameters): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'int', value: src.bounce ? -1n : 0n });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.to).endCell() });
    __stack.push({ type: 'int', value: src.value });
    __stack.push({ type: 'int', value: src.mode });
    if (src.body !== null) {
        __stack.push({ type: 'cell', cell: src.body });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.code !== null) {
        __stack.push({ type: 'cell', cell: src.code });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.data !== null) {
        __stack.push({ type: 'cell', cell: src.data });
    } else {
        __stack.push({ type: 'null' });
    }
    return __stack;
}

export function unpackStackSendParameters(slice: TupleReader): SendParameters {
    const bounce = slice.readBoolean();
    const to = slice.readAddress();
    const value = slice.readBigNumber();
    const mode = slice.readBigNumber();
    const body = slice.readCellOpt();
    const code = slice.readCellOpt();
    const data = slice.readCellOpt();
    return { $$type: 'SendParameters', bounce: bounce, to: to, value: value, mode: mode, body: body, code: code, data: data };
}
export function unpackTupleSendParameters(slice: TupleReader): SendParameters {
    const bounce = slice.readBoolean();
    const to = slice.readAddress();
    const value = slice.readBigNumber();
    const mode = slice.readBigNumber();
    const body = slice.readCellOpt();
    const code = slice.readCellOpt();
    const data = slice.readCellOpt();
    return { $$type: 'SendParameters', bounce: bounce, to: to, value: value, mode: mode, body: body, code: code, data: data };
}
async function StringsTester_init() {
    const __code = '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';
    const depends = Dictionary.empty(Dictionary.Keys.Uint(16), Dictionary.Values.Cell());
    let systemCell = beginCell().storeDict(depends).endCell();
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'cell', cell: systemCell });
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let system = await ContractSystem.create();
    let executor = await ContractExecutor.create({ code: codeCell, data: new Cell() }, system);
    let res = await executor.get('init_StringsTester', __stack);
    if (!res.success) { throw Error(res.error); }
    let data = res.stack.readCell();
    return { code: codeCell, data };
}

const StringsTester_errors: { [key: number]: { message: string } } = {
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
}

export class StringsTester implements Contract {
    
    static async init() {
        return await StringsTester_init();
    }
    
    static async fromInit() {
        const init = await StringsTester_init();
        const address = contractAddress(0, init);
        return new StringsTester(address, init);
    }
    
    static fromAddress(address: Address) {
        return new StringsTester(address);
    }
    
    readonly address: Address; 
    readonly init?: { code: Cell, data: Cell };
    readonly abi: ContractABI = {
        errors: StringsTester_errors
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
    
    async getConstantString(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('constantString', __stack);
        return result.stack.readCell().beginParse().loadStringTail();
    }
    
    async getConstantStringUnicode(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('constantStringUnicode', __stack);
        return result.stack.readCell().beginParse().loadStringTail();
    }
    
    async getConstantStringUnicodeLong(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('constantStringUnicodeLong', __stack);
        return result.stack.readCell().beginParse().loadStringTail();
    }
    
    async getDynamicStringCell(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('dynamicStringCell', __stack);
        return result.stack.readCell();
    }
    
    async getDynamicCommentCell(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('dynamicCommentCell', __stack);
        return result.stack.readCell();
    }
    
    async getDynamicCommentCellLarge(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('dynamicCommentCellLarge', __stack);
        return result.stack.readCell();
    }
    
    async getDynamicCommentStringLarge(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('dynamicCommentStringLarge', __stack);
        return result.stack.readCell().beginParse().loadStringTail();
    }
    
    async getStringWithNumber(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('stringWithNumber', __stack);
        return result.stack.readCell().beginParse().loadStringTail();
    }
    
    async getStringWithNegativeNumber(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('stringWithNegativeNumber', __stack);
        return result.stack.readCell().beginParse().loadStringTail();
    }
    
    async getStringWithLargeNumber(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('stringWithLargeNumber', __stack);
        return result.stack.readCell().beginParse().loadStringTail();
    }
    
    async getStringWithFloat(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('stringWithFloat', __stack);
        return result.stack.readCell().beginParse().loadStringTail();
    }
    
    async getBase64(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('base64', __stack);
        return result.stack.readCell();
    }
    
    async getProcessBase64(provider: ContractProvider, src: string) {
        let __stack: TupleItem[] = [];
        __stack.push({ type: 'slice', cell: beginCell().storeStringTail(src).endCell() });
        let result = await provider.get('processBase64', __stack);
        return result.stack.readCell();
    }
    
}