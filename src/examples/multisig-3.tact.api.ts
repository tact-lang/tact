import { Cell, Slice, StackItem } from 'ton';
import { BN } from 'bn.js';
import { deploy } from '../abi/deploy';

export type Operation = {
    seqno: BigInt;
    target: Slice;
    amount: BigInt;
}

export function MultisigContract_init(key1: BigInt, key2: BigInt, key3: BigInt) {
    const __code = 'te6ccgECHAEAAcsAART/APSkE/S88sgLAQIBYgIDAgLMBAUCASAaGwIBIAYHAgEgFBUCASAICQIBIA4PAgEgCgsCASAMDQBXDHSH+1E0PAGMQKCEP9jEN66jhPwBzEgbxAhbxEibxIDbxNBMPAKkTDi8AmAAMQgbxAhbxECbxIDgQEBzwAByQHMgQEBzwCAACzIAfAByYAA1IEBAdcA1AHQAYEBAdcAbwBQBG+MWG+MAW+MgAgEgEBECASASEwBPCBvECFvESJvEgNvE1AkgQEBzwCBAQHPAIEBAc8AAciBAQHPAMkBzIAALMgB8ATJgAE8gQEB1wCBAQHXAIEBAdcA1DDQgQEB1wBvAFAFb4xQA2+MAW+MAW+MgAEM8AMB1AHQAdQB0AHUMNDUAdBvAFAFb4xQA2+MAW+MWG+MgAgEgFhcAQ9N4A2t8Y2t8Y2t8Y2t8Y4EDfDuKwCN8O5LDfDuaw3w/gCwAD1yAHwBMntVIAgEgGBkAhwj8AL5ACVvEVRBVfkQJW8SVERE+RAlbxNEQPkQI28QJW8QuvKKArABsPKKyIAQAcsFIW8RzxYBbxL6AnEBy2rJcPsAgAAcIG8QgABe+ZL9qJoeAMY+AWYwACb5WP4Bk';
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: new BN(key1.toString(), 10)});
    __stack.push({ type: 'int', value: new BN(key2.toString(), 10)});
    __stack.push({ type: 'int', value: new BN(key3.toString(), 10)});
    return deploy(__code, 'init_MultisigContract', __stack);
}
