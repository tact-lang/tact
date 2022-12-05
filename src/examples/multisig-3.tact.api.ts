import { Cell, Slice, StackItem } from 'ton';
import { BN } from 'bn.js';
import { deploy } from '../abi/deploy';

export type Operation = {
    seqno: BigInt;
    target: Slice;
    amount: BigInt;
}

export function MultisigContract_init(key1: BigInt, key2: BigInt, key3: BigInt) {
    const __code = 'te6ccgECGAEAAa0AART/APSkE/S88sgLAQIBYgIDAgLMBAUACaGVj+AXAgEgBgcCAUgUFQIBIAgJAgEgDg8CASAKCwIBIAwNAFcMdIf7UTQ8AYxAoIQ/2MQ3rqOE/AHMSBvECFvESJvEgNvE0Ew8AqRMOLwCYAAxCBvECFvEQJvEgOBAQHPAAHJAcyBAQHPAIAALMgB8AHJgADUgQEB1wDUAdABgQEB1wBvAFAEb4xYb4wBb4yACASAQEQIBIBITAE8IG8QIW8RIm8SA28TUCSBAQHPAIEBAc8AgQEBzwAByIEBAc8AyQHMgAAsyAHwBMmAATyBAQHXAIEBAdcAgQEB1wDUMNCBAQHXAG8AUAVvjFADb4wBb4wBb4yAAQzwAwHUAdAB1AHQAdQw0NQB0G8AUAVvjFADb4wBb4xYb4yAAD1yAHwBMntVIAgEgFhcAhwj8AL5ACVvEVRBVfkQJW8SVERE+RAlbxNEQPkQI28QJW8QuvKKArABsPKKyIAQAcsFIW8RzxYBbxL6AnEBy2rJcPsAgAEMbwBtb4xtb4xtb4xtb4xwIG+HcVgEb4dyWG+Hc1hvh/AFg';
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: new BN(key1.toString(), 10)});
    __stack.push({ type: 'int', value: new BN(key2.toString(), 10)});
    __stack.push({ type: 'int', value: new BN(key3.toString(), 10)});
    return deploy(__code, 'init_MultisigContract', __stack);
}
