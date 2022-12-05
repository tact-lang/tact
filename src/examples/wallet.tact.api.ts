import { Cell, Slice, StackItem, Address, Builder } from 'ton';
import { BN } from 'bn.js';
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
    b_0 = b_0.storeInt(1843760589, 32);
    b_0 = b_0.storeRef(src.signature.toCell());
    b_0 = b_0.storeCellCopy(packTransfer(src.transfer));
    return b_0.endCell();
}

export function Wallet_init(key: BigInt, walletId: BigInt) {
    const __code = 'te6ccgECKgEAAjAAART/APSkE/S88sgLAQIBYgIDAgLLBAUCASAkJQIBIAYHAgHOIiMCASAICQIBIBYXAgEgCgsCASAQEQIBIAwNAgEgDg8AOQx0h/tRNDwCTECghBt5Y3NupXwBjHwEZEw4vALgAA8+kAB+kRvAoAApHJYywFwAcsAIW8QAcoHAW8RAcv/gAFMIG8QIW8RIm8SI28TBG8UUDXLH8sHAfACAfoCIW6UcDLKAJV/AcoAzOKACASASEwIBIBQVAAsyAHwA8mAATxtAdMf0wfwAQH6ANIAAZQ1BNQV3m8AUAVvjFADb4wBb4wBb4xYb4yAAHzUAdAB8AVvAFADb4xYb4yAAIQgbxAhbxECbxIDyx/L/8s/gAgEgGBkCASAcHQIBIBobAA9cgB8AfJ7VSAALMgB8AfJgACU0x/T/9M/bwBQBG+MWG+MAW+MgAgEgHh8CASAgIQCDMhwAcoAfwHKACFvEAHKAHABygBwAcoBIW8R8AIhbxL6AnABygBw+gJw+gJwAcs/cAHLH3ABygBwAcoAyQFvE/sAgAB8cG1tbwNYcW+HAXJvh/AIgAAcIG8RgAAcIG8SgAAcIG8QgAHMIG8R8AT5ACFvECNvEfkQ8qogbxFvECJvELryq38hbxFvEiJvEW8TI28RbxEEbxFvFBA0QTBvBfAMgAgEgJicAF74CV2omh4BJj4B5jAAJu6E/ANgCAUgoKQAXsyX7UTQ8Akx8BAxgABewfjtRNDwCTHwDjGA=';
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: new BN(key.toString(), 10)});
    __stack.push({ type: 'int', value: new BN(walletId.toString(), 10)});
    return deploy(__code, 'init_Wallet', __stack);
}
