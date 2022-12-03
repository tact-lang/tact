import { Cell, Slice, StackItem } from 'ton';
import { BN } from 'bn.js';
import { deploy } from '../abi/deploy';

export type Operation = {
    seqno: BigInt;
    target: Slice;
    amount: BigInt;
}

export function MultisigContract_init(key1: BigInt, key2: BigInt, key3: BigInt) {
    const __code = 'te6ccgECIgEAAh4AART/APSkE/S88sgLAQIBYgIDAgLLBAUCASAgIQIBIAYHAgHOHh8CASAICQIBIBITAgEgCgsCASAODwIBIAwNAAtMgB8AHJgAVwx0h/wDQKCEP9jEN66jhfwDDEgcG+BIXFvgSJyb4EDc2+BQTDwD5Ew4vAOgADcIHBvgSFxb4ECcm+BA4EBAc8AAckBzIEBAc8AgAgEgEBEAC0yAHwBcmAA1IEBAdcA1AHQAYEBAdcAbwBQBG+MWG+MAW+MgAFcIHBvgSFxb4Eicm+BA3NvgVAkgQEBzwCBAQHPAIEBAc8AAciBAQHPAMkBzIAIBIBQVAgEgGBkCASAWFwALTIAfAJyYAE8gQEB1wCBAQHXAIEBAdcA1DDQgQEB1wBvAFAFb4xQA2+MAW+MAW+MgAEsIHBvgSFxb4Eicm+BA3NvgVBC8AEDyVADzAHJAczIAslYzMkBzIAIBIBobAgEgHB0AQzwBAHUAdAB1AHQAdQw0NQB0G8AUAVvjFADb4wBb4xYb4yAADTtRNDwCDGAADzIAfAFye1UgAJUI/AC+QAlcW+BVEFV+RAlcm+BVERE+RAlc2+BRED5ECNwb4ElcG+BuvKKArABsPKKyIAQAcsFIXFvgc8WAXJvgfoCcQHLaslw+wCAACQgcG+BgAEMbwBtb4xtb4xtb4xtb4xwIG+HcVgEb4dyWG+Hc1hvh/AGgAA++ZL+Ab4CBjAAJvlY/gIw=';
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: new BN(key1.toString(), 10)});
    __stack.push({ type: 'int', value: new BN(key2.toString(), 10)});
    __stack.push({ type: 'int', value: new BN(key3.toString(), 10)});
    return deploy(__code, 'init_MultisigContract', __stack);
}
