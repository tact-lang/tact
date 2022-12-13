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

export function packStackSendParameters(src: SendParameters, to: StackItem[]) {
    to.push({ type: 'int', value: src.bounce ? new BN(-1): new BN(0) });
    to.push({ type: 'slice', cell: beginCell().storeAddress(src.to).endCell() });
    to.push({ type: 'int', value: src.value });
    to.push({ type: 'int', value: src.mode });
    if (src.body === null) {
        to.push({ type: 'null' });
    } else {
        to.push({ type: 'cell', cell: src.body });
    }
    if (src.code === null) {
        to.push({ type: 'null' });
    } else {
        to.push({ type: 'cell', cell: src.code });
    }
    if (src.data === null) {
        to.push({ type: 'null' });
    } else {
        to.push({ type: 'cell', cell: src.data });
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

export function packStackContext(src: Context, to: StackItem[]) {
    to.push({ type: 'int', value: src.bounced ? new BN(-1): new BN(0) });
    to.push({ type: 'slice', cell: beginCell().storeAddress(src.sender).endCell() });
    to.push({ type: 'int', value: src.value });
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

export function packStackStateInit(src: StateInit, to: StackItem[]) {
    to.push({ type: 'cell', cell: src.code });
    to.push({ type: 'cell', cell: src.data });
}

export type Source = {
    $$type: 'Source';
    a: BN;
    b: BN;
}

export function packSource(src: Source): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeInt(src.a, 257);
    b_0 = b_0.storeInt(src.b, 257);
    return b_0.endCell();
}

export function packStackSource(src: Source, to: StackItem[]) {
    to.push({ type: 'int', value: src.a });
    to.push({ type: 'int', value: src.b });
}

export class SampleContract {
    readonly executor: ContractExecutor; 
    constructor(executor: ContractExecutor) { this.executor = executor; } 
    
    async getStake() {
        let __stack: StackItem[] = [];
        let result = await this.executor.get('stake', __stack);
        return result.stack.readBigNumber();
    }
}