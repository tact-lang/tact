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
export type Operation = {
    $$type: 'Operation';
    seqno: bigint;
    amount: bigint;
    target: Address;
}

export function storeOperation(src: Operation) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0 = b_0.storeUint(src.seqno, 32);
        b_0 = b_0.storeCoins(src.amount);
        b_0 = b_0.storeAddress(src.target);
    };
}

export function packStackOperation(src: Operation, __stack: TupleItem[]) {
    __stack.push({ type: 'int', value: src.seqno });
    __stack.push({ type: 'int', value: src.amount });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.target).endCell() });
}

export function packTupleOperation(src: Operation): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'int', value: src.seqno });
    __stack.push({ type: 'int', value: src.amount });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.target).endCell() });
    return __stack;
}

export function unpackStackOperation(slice: TupleReader): Operation {
    const seqno = slice.readBigNumber();
    const amount = slice.readBigNumber();
    const target = slice.readAddress();
    return { $$type: 'Operation', seqno: seqno, amount: amount, target: target };
}
export function unpackTupleOperation(slice: TupleReader): Operation {
    const seqno = slice.readBigNumber();
    const amount = slice.readBigNumber();
    const target = slice.readAddress();
    return { $$type: 'Operation', seqno: seqno, amount: amount, target: target };
}
export type Execute = {
    $$type: 'Execute';
    operation: Operation;
    signature1: Cell;
    signature2: Cell;
    signature3: Cell;
}

export function storeExecute(src: Execute) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0 = b_0.storeUint(819865922, 32);
        b_0 = b_0.store(storeOperation(src.operation));
        b_0 = b_0.storeRef(src.signature1);
        b_0 = b_0.storeRef(src.signature2);
        b_0 = b_0.storeRef(src.signature3);
    };
}

export function packStackExecute(src: Execute, __stack: TupleItem[]) {
    packStackOperation(src.operation, __stack);
    __stack.push({ type: 'slice', cell: src.signature1 });
    __stack.push({ type: 'slice', cell: src.signature2 });
    __stack.push({ type: 'slice', cell: src.signature3 });
}

export function packTupleExecute(src: Execute): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'tuple', items: packTupleOperation(src.operation) });
    __stack.push({ type: 'slice', cell: src.signature1 });
    __stack.push({ type: 'slice', cell: src.signature2 });
    __stack.push({ type: 'slice', cell: src.signature3 });
    return __stack;
}

export function unpackStackExecute(slice: TupleReader): Execute {
    const operation = unpackStackOperation(slice);
    const signature1 = slice.readCell();
    const signature2 = slice.readCell();
    const signature3 = slice.readCell();
    return { $$type: 'Execute', operation: operation, signature1: signature1, signature2: signature2, signature3: signature3 };
}
export function unpackTupleExecute(slice: TupleReader): Execute {
    const operation = unpackTupleOperation(slice);
    const signature1 = slice.readCell();
    const signature2 = slice.readCell();
    const signature3 = slice.readCell();
    return { $$type: 'Execute', operation: operation, signature1: signature1, signature2: signature2, signature3: signature3 };
}
export type Executed = {
    $$type: 'Executed';
    seqno: bigint;
}

export function storeExecuted(src: Executed) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0 = b_0.storeUint(4174937, 32);
        b_0 = b_0.storeUint(src.seqno, 32);
    };
}

export function packStackExecuted(src: Executed, __stack: TupleItem[]) {
    __stack.push({ type: 'int', value: src.seqno });
}

export function packTupleExecuted(src: Executed): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'int', value: src.seqno });
    return __stack;
}

export function unpackStackExecuted(slice: TupleReader): Executed {
    const seqno = slice.readBigNumber();
    return { $$type: 'Executed', seqno: seqno };
}
export function unpackTupleExecuted(slice: TupleReader): Executed {
    const seqno = slice.readBigNumber();
    return { $$type: 'Executed', seqno: seqno };
}
async function MultisigContract_init(key1: bigint, key2: bigint, key3: bigint) {
    const __code = 'te6ccgECJAEAApIAART/APSkE/S88sgLAQIBYgIDAgLLBAUCASAaGwIBIAYHAgFIEBECAdQICQIBWAsMAW0cCHXScIflTAg1wsf3gLQ0wMBcbDAAZF/kXDiAfpAIlBmbwT4YQKRW+CCEDDeKUK64wIw8sCCgCgALCBu8tCAgALDtRNDUAfhi0x/T/9P/0/9VMGwUBNMfAYIQMN4pQrry4IHTH/oA+kABQzAD1AHQAdQB0AHUAdAWQzA2EIkQeBBnVQTwFcj4QgHMVTBQNMsfy//L/8v/ye1UABVZR/AcoA4HABygCAIBIA0OAfcyHEBygFQB/ANcAHKAlAFzxZQA/oCcAHKaCNusyVus7GOPX/wDchw8A1w8A0kbrOZf/ANBPABUATMlTQDcPAN4iRus5l/8A0E8AFQBMyVNANw8A3icPANAn/wDQLJWMyWMzMBcPAN4iFus5h/8A0B8AEBzJQxcPAN4skBgDwAjHAEyMxVMFA0yx/L/8v/y//JgAAT7AAIBIBITAgFIGBkCASAUFQIBIBYXABMfzMBcG1tbfAOgAAkECNfA4AAHBNfA4AAFGwxgAAUXwOAAbxUdUPIVSBQI8sfAfoCAc8WyfkAUgQq+RBSMyn5EFQTN/kQgUT2U2q68vQBggC9EQOwAbDy9PAQgAC++ZL9qJoagD8MWmP6f/p/+n/qpg2CngKQCASAcHQIBIB4fAAm4rH8A+AIBICAhAgEgIiMAL7Dp+1E0NQB+GLTH9P/0//T/1UwbBTwE4AAvsOG7UTQ1AH4YtMf0//T/9P/VTBsFPASgAC+w+XtRNDUAfhi0x/T/9P/0/9VMGwU8BGAATbL0YJwXOw9XSyuex6E7DnWSoUbZoJwndY1LStkfLMi068t/fFiOYA==';
    const depends = Dictionary.empty(Dictionary.Keys.Uint(16), Dictionary.Values.Cell());
    let systemCell = beginCell().storeDict(depends).endCell();
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'cell', cell: systemCell });
    __stack.push({ type: 'int', value: key1 });
    __stack.push({ type: 'int', value: key2 });
    __stack.push({ type: 'int', value: key3 });
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let system = await ContractSystem.create();
    let executor = await ContractExecutor.create({ code: codeCell, data: new Cell() }, system);
    let res = await executor.get('init_MultisigContract', __stack);
    if (!res.success) { throw Error(res.error); }
    let data = res.stack.readCell();
    return { code: codeCell, data };
}

export const MultisigContract_errors: { [key: string]: string } = {
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
    '17654': `Invalid seqno`,
    '48401': `Invalid signature`,
}

export class MultisigContract {
    
    static async init(key1: bigint, key2: bigint, key3: bigint) {
        return await MultisigContract_init(key1,key2,key3);
    }
    
    static async fromInit(key1: bigint, key2: bigint, key3: bigint) {
        const init = await MultisigContract_init(key1,key2,key3);
        const address = contractAddress(0, init);
        return new MultisigContract(address, init);
    }
    
    static fromAddress(address: Address) {
        return new MultisigContract(address);
    }
    
    readonly address: Address; 
    readonly init?: { code: Cell, data: Cell };
    private constructor(address: Address, init?: { code: Cell, data: Cell }) {
        this.address = address;
        this.init = init;
    }
    
    async send(provider: ContractProvider, via: Sender, args: { value: bigint, bounce?: boolean| null | undefined }, message: Execute) {
        
        let body: Cell | null = null;
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'Execute') {
            body = beginCell().store(storeExecute(message)).endCell();
        }
        if (body === null) { throw new Error('Invalid message type'); }
        
        await provider.internal(via, { ...args, body: body });
        
    }
    
    async getKey1(provider: ContractProvider) {
        try {
            let __stack: TupleItem[] = [];
            let result = await provider.get('key1', __stack);
            return result.stack.readBigNumber();
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (MultisigContract_errors[e.exitCode.toString()]) {
                    throw new Error(MultisigContract_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
    async getKey2(provider: ContractProvider) {
        try {
            let __stack: TupleItem[] = [];
            let result = await provider.get('key2', __stack);
            return result.stack.readBigNumber();
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (MultisigContract_errors[e.exitCode.toString()]) {
                    throw new Error(MultisigContract_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
    async getKey3(provider: ContractProvider) {
        try {
            let __stack: TupleItem[] = [];
            let result = await provider.get('key3', __stack);
            return result.stack.readBigNumber();
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (MultisigContract_errors[e.exitCode.toString()]) {
                    throw new Error(MultisigContract_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
    async getSeqno(provider: ContractProvider) {
        try {
            let __stack: TupleItem[] = [];
            let result = await provider.get('seqno', __stack);
            return result.stack.readBigNumber();
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (MultisigContract_errors[e.exitCode.toString()]) {
                    throw new Error(MultisigContract_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
}