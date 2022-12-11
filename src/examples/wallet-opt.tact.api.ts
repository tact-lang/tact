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

export type TransferMessage = {
    $$type: 'TransferMessage';
    signature: Slice;
    transfer: Slice;
}

export function packTransferMessage(src: TransferMessage): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(1843760589, 32);
    b_0 = b_0.storeCellCopy(src.signature.toCell());
    b_0 = b_0.storeCellCopy(src.transfer.toCell());
    return b_0.endCell();
}

export function Wallet_init(key: BigInt, walletId: BigInt) {
    const __code = 'te6ccgEBCgEA2wABFP8A9KQT9LzyyAsBAgFiAgMA1NAxcCHXScIflTAg1wsf3oIQbeWNzbqOTe1E0NMf0//TP1UgbBMD0x8BghBt5Y3NuvLgZIMI1xhmMhA0QwAg+QFUECT5EPKq0h/SB9QwUSW68qsEpAT7AMhVIFAjyx/L/8s/ye1U4DDywGQCASAEBQIBIAYHACO+AldqJoaY/p/+mfqpA2CbYQwAIbuhNwWchVIFAjyx/L/8s/yYAgFICAkAIbMl+1E0NMf0//TP1UgbBNbgACOwfjtRNDTH9P/0z9VIGwTMDGA=';
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: new BN(key.toString(), 10)});
    __stack.push({ type: 'int', value: new BN(walletId.toString(), 10)});
    return deploy(__code, 'init_Wallet', __stack);
}

export class Wallet {
    readonly executor: ContractExecutor;
    constructor(executor: ContractExecutor) { this.executor = executor; }
    
    async send(args: { amount: BN, from?: Address, debug?: boolean }, message: TransferMessage) {
        let body: Cell | null = null;
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'TransferMessage') {
            body = packTransferMessage(message);
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