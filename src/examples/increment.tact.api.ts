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

export type Increment = {
    $$type: 'Increment';
    key: BigInt;
    value: BigInt;
}

export function packIncrement(src: Increment): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(3615081709, 32);
    b_0 = b_0.storeInt(new BN(src.key.toString(10), 10), 257);
    b_0 = b_0.storeInt(new BN(src.value.toString(10), 10), 257);
    return b_0.endCell();
}

export function IncrementContract_init() {
    const __code = 'te6ccgECHAEAAQUAART/APSkE/S88sgLAQIBYgIDAgLMBAUCAUgaGwIBIAYHAgEgEhMCASAICQIBIA4PAgEgCgsCASAMDQA9DHTH+1E0PAFMQKCENd5xO26l/ACMfAM8AfgW/LAZIAAlCFulVtZ9Fow4MgBzwDJQTP0FYAAbIEBAdcAgQEB1wBZbwKAACxvIQH0AIAIBIBARAA9cgB8APJ7VSAALMgB8APJgAAs9AQBbwGACASAUFQBD0A/xAA/xAQN4g4ATeIvXgEiXgEETeIQICAqgmReAC4N8PAIBIBYXAgEgGBkAAyggAAMqIAALG1vAfAEgAAcIG8QgAAm4H38AqAAXu0B+1E0PAFMfALMY';
    let __stack: StackItem[] = [];
    return deploy(__code, 'init_IncrementContract', __stack);
}
