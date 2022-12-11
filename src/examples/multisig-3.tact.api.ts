import { Cell, Slice, StackItem, Address, Builder, InternalMessage, CommonMessageInfo, CellMessage, beginCell } from 'ton';
import { ContractExecutor } from 'ton-nodejs';
import BN from 'bn.js';
import { deploy } from '../abi/deploy';

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

export type Operation = {
    $$type: 'Operation';
    seqno: BigInt;
    amount: BigInt;
    target: Address;
}

export function packOperation(src: Operation): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(new BN(src.seqno.toString(10), 10), 32);
    b_0 = b_0.storeCoins(new BN(src.amount.toString(10), 10));
    b_0 = b_0.storeAddress(src.target);
    return b_0.endCell();
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

export type Executed = {
    $$type: 'Executed';
    seqno: BigInt;
}

export function packExecuted(src: Executed): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(4174937, 32);
    b_0 = b_0.storeUint(new BN(src.seqno.toString(10), 10), 32);
    return b_0.endCell();
}

export function MultisigContract_init(key1: BigInt, key2: BigInt, key3: BigInt) {
    const __code = 'te6ccgECDwEAAZQAART/APSkE/S88sgLAQIBYgIDAgLPBAUCASAHCAHtHAh10nCH5UwINcLH94C0NMDAXGwwAGRf5Fw4gH6QDBUQRVvA/hhApFb4IIQMN4pQrqOvu1E0NMf0//T/9P/VTBsFATTHwGCEDDeKUK68uBk0x/6APpAAUMwA9QB0AHUAdAB1AHQFkMwNhCJEHgQZ1UE4DDywGSAGAAkIG7yToADqVHVDyFUgUCPLHwH6AgHPFsn5AFIEKvkQUjMp+RBUEzf5EFNZuvKKArABsPKKfzMBcG3IcQHKARXKAHABygJQA88WAfoCcAHKaHABygAibrOZfwHKAALwAVjMlTJwWMoA4skB+wDIVTBQNMsfy//L/8v/ye1UACe+ZL9qJoaY/p/+n/6f+qmDYKL4HAIBIAkKAgEgCwwAJ7isdwVSDIVTBQNMsfy//L/8v/yYAgEgDQ4AK7R8vaiaGmP6f/p/+n/qpg2CggRr4HAAJ7Dp+1E0NMf0//T/9P/VTBsFGwxgACmw4btRNDTH9P/0//T/1UwbBQTXwOA=';
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: new BN(key1.toString(), 10)});
    __stack.push({ type: 'int', value: new BN(key2.toString(), 10)});
    __stack.push({ type: 'int', value: new BN(key3.toString(), 10)});
    return deploy(__code, 'init_MultisigContract', __stack);
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