import { Cell, Slice, StackItem, Address } from 'ton';
import { BN } from 'bn.js';
import { deploy } from '../abi/deploy';

export type Operation = {
    $$type: 'Operation';
    seqno: BigInt;
    amount: BigInt;
    target: Address;
}

export type Execute = {
    $$type: 'Execute';
    operation: Operation;
    signature1: Slice;
    signature2: Slice;
    signature3: Slice;
}

export function MultisigContract_init(key1: BigInt, key2: BigInt, key3: BigInt) {
    const __code = 'te6ccgECKAEAAgwAART/APSkE/S88sgLAQIBYgIDAgLLBAUCASAkJQIBIAYHAgHOIiMCASAICQIBIBYXAgEgCgsCASAQEQIBIAwNAgEgDg8AOQx0h/tRNDwCjECghAw3ilCupXwBzHwEZEw4vAMgAA8+kAB+kRvAoAApHJYywFwAcsAIW8QAcoHAW8RAcv/gACsyHABywFzAcsBcAHLABLMzMn5AG8CgAgEgEhMCASAUFQAlCBvECFvEQJvEgPLHwH6AgHwAoAALMgB8ATJgACU0x/6APABbwBQBG+MWG+MWG+MgAD08AYB1AHQAdQB0AHUAdBvAFAFb4xQA2+MAW+MWG+MgAgEgGBkCASAcHQIBIBobADFNMf0//T/9P/bwBQBW+MUANvjAFvjAFvjIAC0IG8QIW8RIm8SA28TUCTLH8v/y//L/4AALMgB8AjJgAgEgHh8CASAgIQAPMgB8AjJ7VSAAQxvAG1vjG1vjG1vjG1vjHAgb4dxWARvh3JYb4dzWG+H8AmAAMTIgBABywUhbxLPFgFvEfoCcQHLaslw+wCAADxwyMnIyfADgAAcIG8QgAHUIG8Q8AX5ACFvESNvESJZ+RAibxIkbxIjWfkQI28TJW8TECT5ECNvEG8QJW8QuvKKArABsPKKbxDwDoAIBICYnAAm+Vj+AbAAXu62u1E0PAKMfAPMYABe4yX7UTQ8Aox8BAxg=';
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: new BN(key1.toString(), 10)});
    __stack.push({ type: 'int', value: new BN(key2.toString(), 10)});
    __stack.push({ type: 'int', value: new BN(key3.toString(), 10)});
    return deploy(__code, 'init_MultisigContract', __stack);
}
