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

export type Inrement = {
    $$type: 'Inrement';
    key: BigInt;
    value: BigInt;
}

export function packInrement(src: Inrement): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(3020402937, 32);
    b_0 = b_0.storeInt(new BN(src.key.toString(10), 10), 257);
    b_0 = b_0.storeInt(new BN(src.value.toString(10), 10), 257);
    return b_0.endCell();
}

export function IncrementContract_init() {
    const __code = 'te6ccgEBGAEA7gABFP8A9KQT9LzyyAsBAgFiAgMCAswEBQIBSBYXAgEgBgcCAUgSEwIBIAgJAgEgDg8CASAKCwIBIAwNAD0MdMf7UTQ8AUxAoIQtAew+bqX8AIx8ArwB+Bb8sBkgACUIW6VW1n0WjDgyAHPAMlBM/QVgABsgQEB1wCBAQHXAFlvAoAALG8hAfQAgAgEgEBEAD1yAHwA8ntVIAAsyAHwA8mAACz0BAFvAYAIBIBQVADlAH+IAH+ICBvECJvEIEBAQNvEVQTARAj8AFwb4eAALG1vAfAEgAAcIG8QgAAm4H38AiAAXu0B+1E0PAFMfAJMY';
    let __stack: StackItem[] = [];
    return deploy(__code, 'init_IncrementContract', __stack);
}
