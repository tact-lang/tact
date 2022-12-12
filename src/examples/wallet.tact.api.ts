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
    b_0 = b_0.storeUint(123, 32);
    b_0 = b_0.storeRef(src.signature.toCell());
    b_0 = b_0.storeCellCopy(packTransfer(src.transfer));
    return b_0.endCell();
}

export function Wallet_init(key: BigInt, walletId: BigInt) {
    const __code = 'te6ccgECJAEAAuEAART/APSkE/S88sgLAQIBYgIDAgLLBAUCASAeHwIBIAYHAgEgDg8CAdQICQBn/kOIDlAIrlADgA5QEoAeeLAP0BOADlNDgA5QARN1nMv4DlAAF4AKxmSpk4LGUAcWSA/YBAL3O37cCHXScIflTAg1wsf3gLQ0wMBcbDAAZF/kXDiAfpAMFRBFW8D+GECjiAw7UTQ0x/T/9M/VSBsE1UC8BnIVSBQI8sfy//LP8ntVOAgwHvjAiDAACLXScEhsI4eW+1E0NMf0//TP1UgbBPwFshVIFAjyx/L/8s/ye1U4IAoLAAkIG7yToACSMO1E0NMf0//TP1UgbBMD0x8BwHvy4GTUAdAB0x/TB/pAAQH6AG0B0gABktQx3lVAEFY2EHgQZ1UE8BTIVSBQI8sfy//LP8ntVALowACO7yD5ASCC8A4jVyYQi1cA0Dad1xZ/av+4BqfgQFk3XdDg+ySXHnKyuo4gW+1E0NMf0//TP1UgbBPwF8hVIFAjyx/L/8s/ye1U2zHggvBnJ9aXZfjyLHXFgeNWVEOX9aALuRvTLE0NltTJJoS8wrrjAt4MDQBAMO1E0NMf0//TP1UgbBPwGMhVIFAjyx/L/8s/ye1U2zEAPu1E0NMf0//TP1UgbBNVAvAVyFUgUCPLH8v/yz/J7VQCASAQEQIB1BwdAgEgEhMCASAYGQIBIBQVAgEgFhcAHRwWchVIFAjyx/L/8s/yYAAFDAxgAAUbCGAAAxbgAgEgGhsCASAcHAB3FR0MlNDyFVAUEXLHxLLBwHPFgH6AiFulHAyygCVfwHKAMziyfkAVBBo+RDyqlE3uvKrBqR/UHRDMPAPgABkMPhBbyNbs5MCpALegABc+EFvI1uzkwKkAt6AAAwwgAgEgICEAI74CV2omhpj+n/6Z+qkDYJ+AlAAJu6E/AQgCAUgiIwAjsyX7UTQ0x/T/9M/VSBsE/ATgACOwfjtRNDTH9P/0z9VIGwT8BGA=';
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: new BN(key.toString(), 10)});
    __stack.push({ type: 'int', value: new BN(walletId.toString(), 10)});
    return deploy(__code, 'init_Wallet', __stack);
}

export class Wallet {
    readonly executor: ContractExecutor;
    constructor(executor: ContractExecutor) { this.executor = executor; }
    
    async send(args: { amount: BN, from?: Address, debug?: boolean }, message: TransferMessage | Slice | null | 'notify' | 'слава україни') {
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
        if (message === 'слава україни') {
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