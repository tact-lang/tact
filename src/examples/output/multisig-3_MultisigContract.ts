import { Cell, Slice, StackItem, Address, Builder, InternalMessage, CommonMessageInfo, CellMessage, beginCell, serializeDict } from 'ton';
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

export type Execute = {
    $$type: 'Execute';
    operation: Operation;
    signature1: Slice;
    signature2: Slice;
    signature3: Slice;
}

export function packExecute(src: Execute): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(819865922, 32);
    b_0 = b_0.storeCellCopy(packOperation(src.operation));
    b_0 = b_0.storeRef(src.signature1.toCell());
    b_0 = b_0.storeRef(src.signature2.toCell());
    b_0 = b_0.storeRef(src.signature3.toCell());
    return b_0.endCell();
}

export function packStackExecute(src: Execute, __stack: StackItem[]) {
    packStackOperation(src.operation, __stack);
    __stack.push({ type: 'slice', cell: src.signature1.toCell() });
    __stack.push({ type: 'slice', cell: src.signature2.toCell() });
    __stack.push({ type: 'slice', cell: src.signature3.toCell() });
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
        await this.executor.internal(new InternalMessage({
            to: this.executor.address,
            from: args.from || this.executor.address,
            bounce: false,
            value: args.amount,
            body: new CommonMessageInfo({
                body: new CellMessage(body!)
            })
        }), { debug: args.debug });
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