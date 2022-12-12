import { Cell, Slice, StackItem, Address, Builder, InternalMessage, CommonMessageInfo, CellMessage, beginCell, serializeDict } from 'ton';
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
    const __code = 'te6ccgECKAEAA3kAART/APSkE/S88sgLAQIBYgIDAgLLBAUCASAiIwIBzgYHAgEgDg8E9zt+3Ah10nCH5UwINcLH94C0NMDAXGwwAGRf5Fw4gH6QDBUQRVvA/hhAo4oMO1E0NQB+GLTH9P/0z9VIGwTVQLwHMj4QgHMVSBQI8sfy//LP8ntVOAgwHvjAiDAACLXScEhsOMCwADjAO1E0NQB+GLTH9P/0z9VIGwTVQKAICQoLAAkIG7yToACiMO1E0NQB+GLTH9P/0z9VIGwTA9MfAcB78uBk1AHQAdMf0wf6QAEB+gBtAdIAAZLUMd5VQBBWNhB4EGdVBPAWyPhCAcxVIFAjyx/L/8s/ye1UAExb7UTQ1AH4YtMf0//TP1UgbBPwGMj4QgHMVSBQI8sfy//LP8ntVALwIPkBIILwDiNXJhCLVwDQNp3XFn9q/7gGp+BAWTdd0OD7JJcecrK6jihb7UTQ1AH4YtMf0//TP1UgbBPwGcj4QgHMVSBQI8sfy//LP8ntVNsx4CCC8Gcn1pdl+PIsdcWB41ZUQ5f1oAu5G9MsTQ2W1MkmhLzCuuMCDA0AKPAXyPhCAcxVIFAjyx/L/8s/ye1UAFBb7UTQ1AH4YtMf0//TP1UgbBPwGsj4QgHMVSBQI8sfy//LP8ntVNsxAJyC8Jyg8YVRdOMuj9N431am5PbEDk38tgkOSYEvex4mIUv5uo4oMO1E0NQB+GLTH9P/0z9VIGwT8BvI+EIBzFUgUCPLH8v/yz/J7VTbMeACASAQEQIBIBwdAgEgEhMCASAWFwIBIBQVAAVTAxgAZzIcQHKARXKAHABygJQA88WAfoCcAHKaHABygAibrOZfwHKAALwAVjMlTJwWMoA4skB+wCAAHxwA8jMVSBQI8sfy//LP8mACASAYGQIBIBobAAUbCGAAAxbgAHcVHQyU0PIVUBQRcsfEssHAc8WAfoCIW6UcDLKAJV/AcoAzOLJ+QBUEGj5EPKqUTe68qsGpH9QdEMw8BCAAGQw+EFvI1uzkwKkAt6ACASAeHwAD0YQCASAgIAIBICAhABc+EFvI1uzkwKkAt6AAASACASAkJQArvgJXaiaGoA/DFpj+n/6Z+qkDYJ+ApAAJu6E/ARgCAUgmJwArsyX7UTQ1AH4YtMf0//TP1UgbBPwFYAArsH47UTQ1AH4YtMf0//TP1UgbBPwE4A==';
    const depends = new Map<string, Cell>();
    depends.set('14718', Cell.fromBoc(Buffer.from('te6ccgECKAEAA3kAART/APSkE/S88sgLAQIBYgIDAgLLBAUCASAiIwIBzgYHAgEgDg8E9zt+3Ah10nCH5UwINcLH94C0NMDAXGwwAGRf5Fw4gH6QDBUQRVvA/hhAo4oMO1E0NQB+GLTH9P/0z9VIGwTVQLwHMj4QgHMVSBQI8sfy//LP8ntVOAgwHvjAiDAACLXScEhsOMCwADjAO1E0NQB+GLTH9P/0z9VIGwTVQKAICQoLAAkIG7yToACiMO1E0NQB+GLTH9P/0z9VIGwTA9MfAcB78uBk1AHQAdMf0wf6QAEB+gBtAdIAAZLUMd5VQBBWNhB4EGdVBPAWyPhCAcxVIFAjyx/L/8s/ye1UAExb7UTQ1AH4YtMf0//TP1UgbBPwGMj4QgHMVSBQI8sfy//LP8ntVALwIPkBIILwDiNXJhCLVwDQNp3XFn9q/7gGp+BAWTdd0OD7JJcecrK6jihb7UTQ1AH4YtMf0//TP1UgbBPwGcj4QgHMVSBQI8sfy//LP8ntVNsx4CCC8Gcn1pdl+PIsdcWB41ZUQ5f1oAu5G9MsTQ2W1MkmhLzCuuMCDA0AKPAXyPhCAcxVIFAjyx/L/8s/ye1UAFBb7UTQ1AH4YtMf0//TP1UgbBPwGsj4QgHMVSBQI8sfy//LP8ntVNsxAJyC8Jyg8YVRdOMuj9N431am5PbEDk38tgkOSYEvex4mIUv5uo4oMO1E0NQB+GLTH9P/0z9VIGwT8BvI+EIBzFUgUCPLH8v/yz/J7VTbMeACASAQEQIBIBwdAgEgEhMCASAWFwIBIBQVAAVTAxgAZzIcQHKARXKAHABygJQA88WAfoCcAHKaHABygAibrOZfwHKAALwAVjMlTJwWMoA4skB+wCAAHxwA8jMVSBQI8sfy//LP8mACASAYGQIBIBobAAUbCGAAAxbgAHcVHQyU0PIVUBQRcsfEssHAc8WAfoCIW6UcDLKAJV/AcoAzOLJ+QBUEGj5EPKqUTe68qsGpH9QdEMw8BCAAGQw+EFvI1uzkwKkAt6ACASAeHwAD0YQCASAgIAIBICAhABc+EFvI1uzkwKkAt6AAASACASAkJQArvgJXaiaGoA/DFpj+n/6Z+qkDYJ+ApAAJu6E/ARgCAUgmJwArsyX7UTQ1AH4YtMf0//TP1UgbBPwFYAArsH47UTQ1AH4YtMf0//TP1UgbBPwE4A==', 'base64'))[0]);
    let systemCell = beginCell().storeDict(serializeDict(depends, 16, (src, v) => v.refs.push(src))).endCell();
    let __stack: StackItem[] = [];
    __stack.push({ type: 'cell', cell: systemCell });
    __stack.push({ type: 'int', value: new BN(key.toString(), 10)});
    __stack.push({ type: 'int', value: new BN(walletId.toString(), 10)});
    return deploy(__code, 'init_Wallet', __stack); 
}

export class Wallet {
            
    readonly executor: ContractExecutor; 
    constructor(executor: ContractExecutor) { this.executor = executor; } 
    
    async send(args: { amount: BN, from?: Address, debug?: boolean }, message: TransferMessage | Slice | null | 'notify' | 'слава україни' | 'duplicate') {
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
        if (message === 'duplicate') {
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