import { Cell, Slice, StackItem, Address, Builder, InternalMessage, CommonMessageInfo, CellMessage, beginCell } from 'ton';
import { ContractExecutor } from 'ton-nodejs';
import BN from 'bn.js';
import { deploy } from '../../abi/deploy';

export type SendParameters = {
    $$type: 'SendParameters';
    bounce: boolean;
    to: Address;
    value: BigInt;
    mode: BigInt;
    body: Cell | null;
}

export function packSendParameters(src: SendParameters): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeBit(src.bounce);
    b_0 = b_0.storeAddress(src.to);
    b_0 = b_0.storeInt(new BN(src.value.toString(10), 10), 257);
    b_0 = b_0.storeInt(new BN(src.mode.toString(10), 10), 257);
    if (src.body !== null) {
        b_0 = b_0.storeBit(true);
        b_0 = b_0.storeRef(src.body);
    } else {
        b_0 = b_0.storeBit(false);
    }
    return b_0.endCell();
}

export type Context = {
    $$type: 'Context';
    bounced: boolean;
    sender: Address;
    value: BigInt;
}

export function packContext(src: Context): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeBit(src.bounced);
    b_0 = b_0.storeAddress(src.sender);
    b_0 = b_0.storeInt(new BN(src.value.toString(10), 10), 257);
    return b_0.endCell();
}

export type Source = {
    $$type: 'Source';
    a: BigInt;
    b: BigInt;
    c: BigInt;
    d: BigInt;
}

export function packSource(src: Source): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeInt(new BN(src.a.toString(10), 10), 257);
    b_0 = b_0.storeInt(new BN(src.b.toString(10), 10), 257);
    b_0 = b_0.storeInt(new BN(src.c.toString(10), 10), 257);
    let b_1 = new Builder();
    b_1 = b_1.storeInt(new BN(src.d.toString(10), 10), 257);
    b_0 = b_0.storeRef(b_1.endCell());
    return b_0.endCell();
}

export class Empty {
    readonly executor: ContractExecutor;
    constructor(executor: ContractExecutor) { this.executor = executor; }
    
}