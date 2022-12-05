import { Cell, Slice, StackItem } from 'ton';
import { BN } from 'bn.js';
import { deploy } from '../abi/deploy';

export type Operation = {
    seqno: BigInt;
    target: Slice;
    amount: BigInt;
}

export function MultisigContract_init(key1: BigInt, key2: BigInt, key3: BigInt) {
    const __code = 'te6ccgECIAEAAgEAART/APSkE/S88sgLAQIBYgIDAgLLBAUCASAeHwIBIAYHAgFiGhsCASAICQIBIBITAgEgCgsCASAODwBXQx0h/tRNDwCTECghD/YxDeuo4T8A0xIG8QIW8RIm8SA28TQTDwEJEw4vAPgCASAMDQAxCBvECFvEQJvEgOBAQHPAAHJAcyBAQHPAIAALMgB8ALJgADVYEBAdcA1AHQAYEBAdcAbwBQBG+MWG+MAW+MgCASAQEQBPCBvECFvESJvEgNvE1AkgQEBzwCBAQHPAIEBAc8AAciBAQHPAMkBzIAALMgB8AbJgAgEgFBUCASAYGQBPWBAQHXAIEBAdcAgQEB1wDUMNCBAQHXAG8AUAVvjFADb4wBb4wBb4yAIBIBYXAEMIG8QIW8RIm8SA28TUELwAgPJUAPMAckBzMgCyVjMyQHMgAAsyAHwCsmAAQ18AUB1AHQAdQB0AHUMNDUAdBvAFAFb4xQA2+MAW+MWG+MgAD1yAHwBsntVIAgEgHB0AQ0bwBtb4xtb4xtb4xtb4xwIG+HcVgEb4dyWG+Hc1hvh/AHgAhwj8AP5ACVvEVRBVfkQJW8SVERE+RAlbxNEQPkQI28QJW8QuvKKArABsPKKyIAQAcsFIW8RzxYBbxL6AnEBy2rJcPsAgAAcIG8QgABe+ZL9qJoeASY+AiYwACb5WP4CU';
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: new BN(key1.toString(), 10)});
    __stack.push({ type: 'int', value: new BN(key2.toString(), 10)});
    __stack.push({ type: 'int', value: new BN(key3.toString(), 10)});
    return deploy(__code, 'init_MultisigContract', __stack);
}
