import { Cell, Slice, StackItem } from 'ton';
import { BN } from 'bn.js';
import { deploy } from '../abi/deploy';

export type Operation = {
    seqno: BigInt;
    target: Slice;
    amount: BigInt;
}

export function MultisigContract_init(key1: BigInt, key2: BigInt, key3: BigInt) {
    const __code = 'te6ccgECHAEAAasAART/APSkE/S88sgLAQIBYgIDAgLMBAUCASAaGwIBIAYHAgEgFBUCASAICQIBIA4PAgEgCgsCASAMDQBXDHSH+1E0PAGMQKCEP9jEN66jhPwBzEgbxAhbxEibxIDbxNBMPAKkTDi8AmAAMQgbxAhbxECbxIDgQEBzwAByQHMgQEBzwCAACzIAfAByYAA1IEBAdcA1AHQAYEBAdcAbwBQBG+MWG+MAW+MgAgEgEBECASASEwAtCBvECFvESJvEgNvE1Akyx/L/8v/y/+AACzIAfAEyYAAxNMf0//T/9P/bwBQBW+MUANvjAFvjAFvjIABDPADAdQB0AHUAdAB1DDQ1AHQbwBQBW+MUANvjAFvjFhvjIAIBIBYXAEPTeANrfGNrfGNrfGNrfGOBA3w7isAjfDuSw3w7msN8P4AsAA9cgB8ATJ7VSAIBIBgZAIcI/AC+QAlbxFUQVX5ECVvElRERPkQJW8TRED5ECNvECVvELryigKwAbDyisiAEAHLBSFvEc8WAW8S+gJxActqyXD7AIAAHCBvEIAAXvmS/aiaHgDGPgFmMAAm+Vj+AZA==';
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: new BN(key1.toString(), 10)});
    __stack.push({ type: 'int', value: new BN(key2.toString(), 10)});
    __stack.push({ type: 'int', value: new BN(key3.toString(), 10)});
    return deploy(__code, 'init_MultisigContract', __stack);
}
