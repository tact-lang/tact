import { Cell, Slice, Address, Builder, beginCell, ComputeError, TupleItem, TupleReader, Dictionary, contractAddress, ContractProvider, Sender } from 'ton-core';
import { ContractSystem, ContractExecutor } from 'ton-emulator';

export type StateInit = {
    $$type: 'StateInit';
    code: Cell;
    data: Cell;
}

export function storeStateInit(src: StateInit) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0 = b_0.storeRef(src.code);
        b_0 = b_0.storeRef(src.data);
    };
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
        b_0 = b_0.storeBit(src.bounced);
        b_0 = b_0.storeAddress(src.sender);
        b_0 = b_0.storeInt(src.value, 257);
        b_0 = b_0.storeRef(src.raw);
    };
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
        b_0 = b_0.storeBit(src.bounce);
        b_0 = b_0.storeAddress(src.to);
        b_0 = b_0.storeInt(src.value, 257);
        b_0 = b_0.storeInt(src.mode, 257);
        if (src.body !== null) {
            b_0 = b_0.storeBit(true);
            b_0 = b_0.storeRef(src.body);
        } else {
            b_0 = b_0.storeBit(false);
        }
        if (src.code !== null) {
            b_0 = b_0.storeBit(true);
            b_0 = b_0.storeRef(src.code);
        } else {
            b_0 = b_0.storeBit(false);
        }
        if (src.data !== null) {
            b_0 = b_0.storeBit(true);
            b_0 = b_0.storeRef(src.data);
        } else {
            b_0 = b_0.storeBit(false);
        }
    };
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

export const StringsTester_errors: { [key: string]: string } = {
    '2': `Stack undeflow`,
    '3': `Stack overflow`,
    '4': `Integer overflow`,
    '5': `Integer out of expected range`,
    '6': `Invalid opcode`,
    '7': `Type check error`,
    '8': `Cell overflow`,
    '9': `Cell underflow`,
    '10': `Dictionary error`,
    '13': `Out of gas error`,
    '32': `Method ID not found`,
    '34': `Action is invalid or not supported`,
    '37': `Not enough TON`,
    '38': `Not enough extra-currencies`,
    '128': `Null reference exception`,
    '129': `Invalid serialization prefix`,
    '130': `Invalid incoming message`,
    '131': `Constraints error`,
    '132': `Access denied`,
    '133': `Contract stopped`,
    '134': `Invalid argument`,
}

export class StringsTester {
    
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
    private constructor(address: Address, init?: { code: Cell, data: Cell }) {
        this.address = address;
        this.init = init;
    }
    
    async getConstantString(provider: ContractProvider) {
        try {
            let __stack: TupleItem[] = [];
            let result = await provider.get('constantString', __stack);
            return readString(result.stack.readCell().beginParse());
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (StringsTester_errors[e.exitCode.toString()]) {
                    throw new Error(StringsTester_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
    async getConstantStringUnicode(provider: ContractProvider) {
        try {
            let __stack: TupleItem[] = [];
            let result = await provider.get('constantStringUnicode', __stack);
            return readString(result.stack.readCell().beginParse());
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (StringsTester_errors[e.exitCode.toString()]) {
                    throw new Error(StringsTester_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
    async getConstantStringUnicodeLong(provider: ContractProvider) {
        try {
            let __stack: TupleItem[] = [];
            let result = await provider.get('constantStringUnicodeLong', __stack);
            return readString(result.stack.readCell().beginParse());
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (StringsTester_errors[e.exitCode.toString()]) {
                    throw new Error(StringsTester_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
    async getDynamicStringCell(provider: ContractProvider) {
        try {
            let __stack: TupleItem[] = [];
            let result = await provider.get('dynamicStringCell', __stack);
            return result.stack.readCell();
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (StringsTester_errors[e.exitCode.toString()]) {
                    throw new Error(StringsTester_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
    async getDynamicCommentCell(provider: ContractProvider) {
        try {
            let __stack: TupleItem[] = [];
            let result = await provider.get('dynamicCommentCell', __stack);
            return result.stack.readCell();
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (StringsTester_errors[e.exitCode.toString()]) {
                    throw new Error(StringsTester_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
    async getDynamicCommentCellLarge(provider: ContractProvider) {
        try {
            let __stack: TupleItem[] = [];
            let result = await provider.get('dynamicCommentCellLarge', __stack);
            return result.stack.readCell();
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (StringsTester_errors[e.exitCode.toString()]) {
                    throw new Error(StringsTester_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
    async getDynamicCommentStringLarge(provider: ContractProvider) {
        try {
            let __stack: TupleItem[] = [];
            let result = await provider.get('dynamicCommentStringLarge', __stack);
            return readString(result.stack.readCell().beginParse());
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (StringsTester_errors[e.exitCode.toString()]) {
                    throw new Error(StringsTester_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
    async getStringWithNumber(provider: ContractProvider) {
        try {
            let __stack: TupleItem[] = [];
            let result = await provider.get('stringWithNumber', __stack);
            return readString(result.stack.readCell().beginParse());
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (StringsTester_errors[e.exitCode.toString()]) {
                    throw new Error(StringsTester_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
    async getStringWithNegativeNumber(provider: ContractProvider) {
        try {
            let __stack: TupleItem[] = [];
            let result = await provider.get('stringWithNegativeNumber', __stack);
            return readString(result.stack.readCell().beginParse());
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (StringsTester_errors[e.exitCode.toString()]) {
                    throw new Error(StringsTester_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
    async getStringWithLargeNumber(provider: ContractProvider) {
        try {
            let __stack: TupleItem[] = [];
            let result = await provider.get('stringWithLargeNumber', __stack);
            return readString(result.stack.readCell().beginParse());
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (StringsTester_errors[e.exitCode.toString()]) {
                    throw new Error(StringsTester_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
    async getStringWithFloat(provider: ContractProvider) {
        try {
            let __stack: TupleItem[] = [];
            let result = await provider.get('stringWithFloat', __stack);
            return readString(result.stack.readCell().beginParse());
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (StringsTester_errors[e.exitCode.toString()]) {
                    throw new Error(StringsTester_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
    async getBase64(provider: ContractProvider) {
        try {
            let __stack: TupleItem[] = [];
            let result = await provider.get('base64', __stack);
            return result.stack.readCell();
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (StringsTester_errors[e.exitCode.toString()]) {
                    throw new Error(StringsTester_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
    async getProcessBase64(provider: ContractProvider, src: string) {
        try {
            let __stack: TupleItem[] = [];
            __stack.push({ type: 'slice', cell: stringToCell(src) });
            let result = await provider.get('processBase64', __stack);
            return result.stack.readCell();
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (StringsTester_errors[e.exitCode.toString()]) {
                    throw new Error(StringsTester_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
}