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
    const __code = 'te6ccgECEwEAAlYAART/APSkE/S88sgLAQIBYgIDAgLLBAUCASANDgIBzgYHAAWkGEAE6Tt+3Ah10nCH5UwINcLH94C0NMDAXGwwAGRf5Fw4gH6QDBUQRVvA/hhAo4gMO1E0NMf0//TP1UgbBNVAvAYyFUgUCPLH8v/yz/J7VTgIIIQbeWNzbrjAiDAACLXScEhsOMCwADjAO1E0NMf0//TP1UgbBNVAoAgJCgsACQgbvJOgAXww7UTQ0x/T/9M/VSBsEwPTHwGCEG3ljc268uBk1AHQAdMf0wf6QAEB+gBtAdIAAZLUMd5VQBBWNhB4EGdVBAwATlvtRNDTH9P/0z9VIGwT+EFvI1uzkwKkAt7IVSBQI8sfy//LP8ntVACkIPkBgvAOI1cmEItXANA2ndcWf2r/uAan4EBZN13Q4Psklx5ysrqOKTDtRNDTH9P/0z9VIGwT+EFvI1uzkwKkAt7IVSBQI8sfy//LP8ntVNsx4AA0MPhBbyNbs5MCpALeyFUgUCPLH8v/yz/J7VQA9FR0MlNDyFVAUEXLHxLLBwHPFgH6AiFulHAyygCVfwHKAMziyfkAVBBo+RDyqlE3uvKrBqR/UHRDMMhxAcoBFcoAcAHKAlADzxYB+gJwAcpocAHKACJus5l/AcoAAvABWMyVMnBYygDiyQH7AMhVIFAjyx/L/8s/ye1UAgEgDxAAI74CV2omhpj+n/6Z+qkDYJthDAAhu6E3BZyFUgUCPLH8v/yz/JgCAUgREgAhsyX7UTQ0x/T/9M/VSBsE1uAAI7B+O1E0NMf0//TP1UgbBMwMYA==';
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: new BN(key.toString(), 10)});
    __stack.push({ type: 'int', value: new BN(walletId.toString(), 10)});
    return deploy(__code, 'init_Wallet', __stack);
}

export class Wallet {
    readonly executor: ContractExecutor;
    constructor(executor: ContractExecutor) { this.executor = executor; }
    
    async send(args: { amount: BN, from?: Address, debug?: boolean }, message: TransferMessage | Slice | null | 'notify') {
        let body: Cell | null = null;
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'TransferMessage') {
            body = packTransferMessage(message);
        }
        if (message && typeof message === 'object' && message instanceof Slice) {
            body = message.toCell();
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