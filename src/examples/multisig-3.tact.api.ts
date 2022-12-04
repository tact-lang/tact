import { Cell, Slice, StackItem } from 'ton';
import { BN } from 'bn.js';
import { deploy } from '../abi/deploy';

export type Operation = {
    seqno: BigInt;
    target: Slice;
    amount: BigInt;
}

export function MultisigContract_init(key1: BigInt, key2: BigInt, key3: BigInt) {
    const __code = 'te6ccgECIgEAAgcAART/APSkE/S88sgLAQIBYgIDAgLLBAUCASAgIQIBIAYHAgHOHh8CASAICQIBIBITAgEgCgsCASAODwIBIAwNAAtMgB8AHJgATwx0h/wDQKCEP9jEN66jhPwDDEgbxAhbxEibxIDbxNBMPAPkTDi8A6AAMQgbxAhbxECbxIDgQEBzwAByQHMgQEBzwCACASAQEQALTIAfAFyYADUgQEB1wDUAdABgQEB1wBvAFAEb4xYb4wBb4yAATwgbxAhbxEibxIDbxNQJIEBAc8AgQEBzwCBAQHPAAHIgQEBzwDJAcyACASAUFQIBIBgZAgEgFhcAC0yAHwCcmABPIEBAdcAgQEB1wCBAQHXANQw0IEBAdcAbwBQBW+MUANvjAFvjAFvjIABDCBvECFvESJvEgNvE1BC8AEDyVADzAHJAczIAslYzMkBzIAIBIBobAgEgHB0AQzwBAHUAdAB1AHQAdQw0NQB0G8AUAVvjFADb4wBb4xYb4yAADTtRNDwCDGAADzIAfAFye1UgAIcI/AC+QAlbxFUQVX5ECVvElRERPkQJW8TRED5ECNvECVvELryigKwAbDyisiAEAHLBSFvEc8WAW8S+gJxActqyXD7AIAAHCBvEIABDG8AbW+MbW+MbW+MbW+McCBvh3FYBG+Hclhvh3NYb4fwBoAAPvmS/gG+AgYwACb5WP4CM';
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: new BN(key1.toString(), 10)});
    __stack.push({ type: 'int', value: new BN(key2.toString(), 10)});
    __stack.push({ type: 'int', value: new BN(key3.toString(), 10)});
    return deploy(__code, 'init_MultisigContract', __stack);
}
