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

export type Transfer = {
    $$type: 'Transfer';
    seqno: BigInt;
    mode: BigInt;
    to: Address;
    amount: BigInt;
    body: Cell | null;
}

export function packTransfer(src: Transfer): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(new BN(src.seqno.toString(10), 10), 32);
    b_0 = b_0.storeUint(new BN(src.mode.toString(10), 10), 8);
    b_0 = b_0.storeAddress(src.to);
    b_0 = b_0.storeCoins(new BN(src.amount.toString(10), 10));
    if (src.body !== null) {
        b_0 = b_0.storeBit(true);
        b_0 = b_0.storeRef(src.body);
    } else {
        b_0 = b_0.storeBit(false);
    }
    return b_0.endCell();
}

export type TransferMessage = {
    $$type: 'TransferMessage';
    signature: Slice;
    transfer: Transfer;
}

export function packTransferMessage(src: TransferMessage): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(1843760589, 32);
    b_0 = b_0.storeRef(src.signature.toCell());
    b_0 = b_0.storeCellCopy(packTransfer(src.transfer));
    return b_0.endCell();
}

export function Wallet_init(key: BigInt, walletId: BigInt) {
    const __code = 'te6ccgECDwEAAdUAART/APSkE/S88sgLAQIBYgIDAgLPBAUCASAJCgPbO37MXAh10nCH5UwINcLH94gghBt5Y3Nuo6+MO1E0NMf0//TP1UgbBMD0x8BghBt5Y3NuvLgZNQB0AHTH9MH+kABAfoAbQHSAAGS1DHeVUAQVjYQeBBnVQTgIMAAItdJwSGw4wLAAJEw4w3ywGSAGBwgACQgbvJOgAPRUdDJTQ8hVQFBFyx8SywcBzxYB+gIhbpRwMsoAlX8BygDM4sn5AFQQaPkQ8qpRN7ryqwakf1B0QzDIcQHKARXKAHABygJQA88WAfoCcAHKaHABygAibrOZfwHKAALwAVjMlTJwWMoA4skB+wDIVSBQI8sfy//LP8ntVAA+W+1E0NMf0//TP1UgbBMCpALIVSBQI8sfy//LP8ntVACQ+QGC8A4jVyYQi1cA0Dad1xZ/av+4BqfgQFk3XdDg+ySXHnKyuo4g7UTQ0x/T/9M/VSBsEwKkAshVIFAjyx/L/8s/ye1U2zHgAgEgCwwAI74CV2omhpj+n/6Z+qkDYJthDAAhu6E3BZyFUgUCPLH8v/yz/JgCAUgNDgAhsyX7UTQ0x/T/9M/VSBsE1uAAI7B+O1E0NMf0//TP1UgbBMwMYA==';
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: new BN(key.toString(), 10)});
    __stack.push({ type: 'int', value: new BN(walletId.toString(), 10)});
    return deploy(__code, 'init_Wallet', __stack);
}

export class Wallet {
    readonly executor: ContractExecutor;
    constructor(executor: ContractExecutor) { this.executor = executor; }
    
    async send(args: { amount: BN, from?: Address, debug?: boolean }, message: TransferMessage | null | 'notify') {
        let body: Cell | null = null;
        if (message && typeof message === 'object' && message.$$type === 'TransferMessage') {
            body = packTransferMessage(message);
        }
        if (message === null) {
            body = new Cell();
        }
        if (message === 'notify') {
            body = beginCell().storeUint(0, 32).storeBuffer(Buffer.from(message)).endCell();
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
    async getPublicKey() {
        let __stack: StackItem[] = [];
        let result = await this.executor.get('publicKey', __stack);
        return result.stack.readBigNumber();
    }
    async getWalletId() {
        let __stack: StackItem[] = [];
        let result = await this.executor.get('walletId', __stack);
        return result.stack.readBigNumber();
    }
    async getSeqno() {
        let __stack: StackItem[] = [];
        let result = await this.executor.get('seqno', __stack);
        return result.stack.readBigNumber();
    }
}