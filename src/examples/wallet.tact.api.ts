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
    const __code = 'te6ccgECLAEAAgEAART/APSkE/S88sgLAQIBYgIDAgLLBAUCASAmJwIBIAYHAgFiIiMCASAICQIBIBYXAgEgCgsCASAQEQIBIAwNAgEgDg8AOQx0h/tRNDwCjECghBt5Y3NupXwBzHwEpEw4vAMgAAkIG7yToAAPPpAAfpEbwKAAKRyWMsBcAHLACFvEAHKBwFvEQHL/4AIBIBITAgEgFBUAOxvJVBFyx8SywcB8AMB+gIhbpRwMsoAlX8BygDM4oAALMgB8ATJgAC00x/TB/ACAfoAbQHSAAGS1DHeVUBvBYAATNQB0AHwBhJvAoAIBIBgZAgEgHB0CASAaGwAVTTH9P/0z9VIG8DgAFRvI1Ajyx/L/8s/gAAsyAHwCMmACASAeHwIBICAhAA8yAHwCMntVIAB9MhxAcoBIW8QAcoAcAHKAiFvEfADIW8S+gJwAcpocAHKACFvFCBus5l/WMoAAfABAcyVMHABygDiyQFvE/sAgAB8cG1tbwNYcW+HAXJvh/AJgAAcIG8RgAgEgJCUAZUIG8RIPAF+QACbxAjbxEQI/kQ8qogbxAibxC68qt/IW8SIm8TI28RBG8UEDRBMG8F8A2AAHCBvEoAAHCBvEIAIBICgpABe+AldqJoeAUY+AgYwACbuhPwDoAgFIKisAF7Ml+1E0PAKMfARMYAAXsH47UTQ8Aox8A8xg';
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: new BN(key.toString(), 10)});
    __stack.push({ type: 'int', value: new BN(walletId.toString(), 10)});
    return deploy(__code, 'init_Wallet', __stack);
}
