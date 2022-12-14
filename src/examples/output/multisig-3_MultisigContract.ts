import { Cell, Slice, StackItem, Address, Builder, InternalMessage, CommonMessageInfo, CellMessage, beginCell, serializeDict, TupleSlice4 } from 'ton';
import { ContractExecutor, createExecutorFromCode } from 'ton-nodejs';
import BN from 'bn.js';

export type SendParameters = {
    $$type: 'SendParameters';
    bounce: boolean;
    to: Address;
    value: BN;
    mode: BN;
    body: Cell | null;
    code: Cell | null;
    data: Cell | null;
}

export function packSendParameters(src: SendParameters): Cell {
    let b_0 = new Builder();
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
    return b_0.endCell();
}

export function packStackSendParameters(src: SendParameters, __stack: StackItem[]) {
    __stack.push({ type: 'int', value: src.bounce ? new BN(-1) : new BN(0) });
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

export function packTupleSendParameters(src: SendParameters): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: src.bounce ? new BN(-1) : new BN(0) });
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

export function unpackStackSendParameters(slice: TupleSlice4): SendParameters {
    const bounce = slice.readBoolean();
    const to = slice.readAddress();
    const value = slice.readBigNumber();
    const mode = slice.readBigNumber();
    const body = slice.readCellOpt();
    const code = slice.readCellOpt();
    const data = slice.readCellOpt();
    return { $$type: 'SendParameters', bounce: bounce, to: to, value: value, mode: mode, body: body, code: code, data: data };
}
export function unpackTupleSendParameters(slice: TupleSlice4): SendParameters {
    const bounce = slice.readBoolean();
    const to = slice.readAddress();
    const value = slice.readBigNumber();
    const mode = slice.readBigNumber();
    const body = slice.readCellOpt();
    const code = slice.readCellOpt();
    const data = slice.readCellOpt();
    return { $$type: 'SendParameters', bounce: bounce, to: to, value: value, mode: mode, body: body, code: code, data: data };
}
export type Context = {
    $$type: 'Context';
    bounced: boolean;
    sender: Address;
    value: BN;
}

export function packContext(src: Context): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeBit(src.bounced);
    b_0 = b_0.storeAddress(src.sender);
    b_0 = b_0.storeInt(src.value, 257);
    return b_0.endCell();
}

export function packStackContext(src: Context, __stack: StackItem[]) {
    __stack.push({ type: 'int', value: src.bounced ? new BN(-1) : new BN(0) });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.sender).endCell() });
    __stack.push({ type: 'int', value: src.value });
}

export function packTupleContext(src: Context): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: src.bounced ? new BN(-1) : new BN(0) });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.sender).endCell() });
    __stack.push({ type: 'int', value: src.value });
    return __stack;
}

export function unpackStackContext(slice: TupleSlice4): Context {
    const bounced = slice.readBoolean();
    const sender = slice.readAddress();
    const value = slice.readBigNumber();
    return { $$type: 'Context', bounced: bounced, sender: sender, value: value };
}
export function unpackTupleContext(slice: TupleSlice4): Context {
    const bounced = slice.readBoolean();
    const sender = slice.readAddress();
    const value = slice.readBigNumber();
    return { $$type: 'Context', bounced: bounced, sender: sender, value: value };
}
export type StateInit = {
    $$type: 'StateInit';
    code: Cell;
    data: Cell;
}

export function packStateInit(src: StateInit): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeRef(src.code);
    b_0 = b_0.storeRef(src.data);
    return b_0.endCell();
}

export function packStackStateInit(src: StateInit, __stack: StackItem[]) {
    __stack.push({ type: 'cell', cell: src.code });
    __stack.push({ type: 'cell', cell: src.data });
}

export function packTupleStateInit(src: StateInit): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'cell', cell: src.code });
    __stack.push({ type: 'cell', cell: src.data });
    return __stack;
}

export function unpackStackStateInit(slice: TupleSlice4): StateInit {
    const code = slice.readCell();
    const data = slice.readCell();
    return { $$type: 'StateInit', code: code, data: data };
}
export function unpackTupleStateInit(slice: TupleSlice4): StateInit {
    const code = slice.readCell();
    const data = slice.readCell();
    return { $$type: 'StateInit', code: code, data: data };
}
export type Operation = {
    $$type: 'Operation';
    seqno: BN;
    amount: BN;
    target: Address;
}

export function packOperation(src: Operation): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(src.seqno, 32);
    b_0 = b_0.storeCoins(src.amount);
    b_0 = b_0.storeAddress(src.target);
    return b_0.endCell();
}

export function packStackOperation(src: Operation, __stack: StackItem[]) {
    __stack.push({ type: 'int', value: src.seqno });
    __stack.push({ type: 'int', value: src.amount });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.target).endCell() });
}

export function packTupleOperation(src: Operation): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: src.seqno });
    __stack.push({ type: 'int', value: src.amount });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.target).endCell() });
    return __stack;
}

export function unpackStackOperation(slice: TupleSlice4): Operation {
    const seqno = slice.readBigNumber();
    const amount = slice.readBigNumber();
    const target = slice.readAddress();
    return { $$type: 'Operation', seqno: seqno, amount: amount, target: target };
}
export function unpackTupleOperation(slice: TupleSlice4): Operation {
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

export function packExecute(src: Execute): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(819865922, 32);
    b_0 = b_0.storeCellCopy(packOperation(src.operation));
    b_0 = b_0.storeRef(src.signature1);
    b_0 = b_0.storeRef(src.signature2);
    b_0 = b_0.storeRef(src.signature3);
    return b_0.endCell();
}

export function packStackExecute(src: Execute, __stack: StackItem[]) {
    packStackOperation(src.operation, __stack);
    __stack.push({ type: 'slice', cell: src.signature1 });
    __stack.push({ type: 'slice', cell: src.signature2 });
    __stack.push({ type: 'slice', cell: src.signature3 });
}

export function packTupleExecute(src: Execute): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'tuple', items: packTupleOperation(src.operation) });
    __stack.push({ type: 'slice', cell: src.signature1 });
    __stack.push({ type: 'slice', cell: src.signature2 });
    __stack.push({ type: 'slice', cell: src.signature3 });
    return __stack;
}

export function unpackStackExecute(slice: TupleSlice4): Execute {
    const operation = unpackStackOperation(slice);
    const signature1 = slice.readCell();
    const signature2 = slice.readCell();
    const signature3 = slice.readCell();
    return { $$type: 'Execute', operation: operation, signature1: signature1, signature2: signature2, signature3: signature3 };
}
export function unpackTupleExecute(slice: TupleSlice4): Execute {
    const operation = unpackTupleOperation(slice);
    const signature1 = slice.readCell();
    const signature2 = slice.readCell();
    const signature3 = slice.readCell();
    return { $$type: 'Execute', operation: operation, signature1: signature1, signature2: signature2, signature3: signature3 };
}
export type Executed = {
    $$type: 'Executed';
    seqno: BN;
}

export function packExecuted(src: Executed): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(4174937, 32);
    b_0 = b_0.storeUint(src.seqno, 32);
    return b_0.endCell();
}

export function packStackExecuted(src: Executed, __stack: StackItem[]) {
    __stack.push({ type: 'int', value: src.seqno });
}

export function packTupleExecuted(src: Executed): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: src.seqno });
    return __stack;
}

export function unpackStackExecuted(slice: TupleSlice4): Executed {
    const seqno = slice.readBigNumber();
    return { $$type: 'Executed', seqno: seqno };
}
export function unpackTupleExecuted(slice: TupleSlice4): Executed {
    const seqno = slice.readBigNumber();
    return { $$type: 'Executed', seqno: seqno };
}
export async function MultisigContract_init(key1: BN, key2: BN, key3: BN) {
    const __code = 'te6ccgECIQEAAlEAART/APSkE/S88sgLAQIBYgIDAgLLBAUCASAZGgIBIAYHAgFIERICAdQICQIBWAsMAW8cCHXScIflTAg1wsf3gLQ0wMBcbDAAZF/kXDiAfpAMFRBFW8D+GECkVvgghAw3ilCuuMCMPLAZIAoACQgbvJOgALDtRNDUAfhi0x/T/9P/0/9VMGwUBNMfAYIQMN4pQrry4GTTH/oA+kABQzAD1AHQAdQB0AHUAdAWQzA2EIkQeBBnVQTwFMj4QgHMVTBQNMsfy//L/8v/ye1UAgEgDQ4CASAPEAAVJR/AcoA4HABygCAA6zIcQHKARfKAHABygJQBc8WUAP6AnABymgjbrMlbrOxjjV/8AzIcPAMcPAMJG6zlX/wDBTMlTQDcPAM4iRus5V/8AwUzJU0A3DwDOJw8AwCf/AMAslYzJYzMwFw8AziIW6zmX8BygAB8AEBzJRwMsoA4skB+wCAAIxwBMjMVTBQNMsfy//L/8v/yYAATH8zAXBtbW3wDYAIBIBMUAF/So6oeQqkCgR5Y+A/QEA54tk/IApAhV8iCkZlPyIKgmb/IgprN15RQFYANh5RXgHwCASAVFgIBIBcYAAkECNfA4AAHBNfA4AAFGwxgAAUXwOAAL75kv2omhqAPwxaY/p/+n/6f+qmDYKeAnAIBIBscAgEgHR4ACbisfwDoAgEgHyAAL7R8vaiaGoA/DFpj+n/6f/p/6qYNgp4CEAAvsOn7UTQ1AH4YtMf0//T/9P/VTBsFPASgAC+w4btRNDUAfhi0x/T/9P/0/9VMGwU8BGA=';
    const depends = new Map<string, Cell>();
    let systemCell = beginCell().storeDict(null).endCell();
    let __stack: StackItem[] = [];
    __stack.push({ type: 'cell', cell: systemCell });
    __stack.push({ type: 'int', value: key1 });
    __stack.push({ type: 'int', value: key2 });
    __stack.push({ type: 'int', value: key3 });
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let executor = await createExecutorFromCode({ code: codeCell, data: new Cell() });
    let res = await executor.get('init_MultisigContract', __stack, { debug: true });
    let data = res.stack.readCell();
    return { code: codeCell, data };
}

export class MultisigContract {
    readonly executor: ContractExecutor; 
    constructor(executor: ContractExecutor) { this.executor = executor; } 
    
    async send(args: { amount: BN, from?: Address, debug?: boolean }, message: Execute) {
        let body: Cell | null = null;
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'Execute') {
            body = packExecute(message);
        }
        if (body === null) { throw new Error('Invalid message type'); }
        let r = await this.executor.internal(new InternalMessage({
            to: this.executor.address,
            from: args.from || this.executor.address,
            bounce: false,
            value: args.amount,
            body: new CommonMessageInfo({
                body: new CellMessage(body!)
            })
        }), { debug: args.debug });
        if (args.debug && r.debugLogs.length > 0) { console.warn(r.debugLogs); }
    }
    async getKey1() {
        let __stack: StackItem[] = [];
        let result = await this.executor.get('key1', __stack);
        return result.stack.readBigNumber();
    }
    async getKey2() {
        let __stack: StackItem[] = [];
        let result = await this.executor.get('key2', __stack);
        return result.stack.readBigNumber();
    }
    async getKey3() {
        let __stack: StackItem[] = [];
        let result = await this.executor.get('key3', __stack);
        return result.stack.readBigNumber();
    }
    async getSeqno() {
        let __stack: StackItem[] = [];
        let result = await this.executor.get('seqno', __stack);
        return result.stack.readBigNumber();
    }
}