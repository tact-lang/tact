import { Cell, Slice, StackItem, Address } from 'ton';
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

export type Transfer = {
    $$type: 'Transfer';
    mode: BigInt;
    to: Address;
    amount: BigInt;
    body: Cell | null;
}

export type TransferMessage = {
    $$type: 'TransferMessage';
    signature: Slice;
    transfer: Transfer;
}

export function Wallet_init(key: BigInt, walletId: BigInt) {
    const __code = 'te6ccgECKgEAAi0AART/APSkE/S88sgLAQIBYgIDAgLLBAUCASAkJQIBIAYHAgHOIiMCASAICQIBIBYXAgEgCgsCASAQEQIBIAwNAgEgDg8AOQx0h/tRNDwCTECghBt5Y3NupXwBjHwEZEw4vALgAA8+kAB+kRvAoAApHJYywFwAcsAIW8QAcoHAW8RAcv/gAEkIG8QIW8RIm8SA28TUCTLBwHwAgH6AiFulHAyygCVfwHKAMzigAgEgEhMCASAUFQALMgB8APJgAEMbQHTB/ABAfoA0gABlDQD1BTebwBQBG+MWG+MAW+MWG+MgAB81AHQAfAFbwBQA2+MWG+MgACEIG8QIW8RAm8SA8sfy//LP4AIBIBgZAgEgHB0CASAaGwAPXIAfAHye1UgACzIAfAHyYAAlNMf0//TP28AUARvjFhvjAFvjIAIBIB4fAgEgICEAkTIcAHKAH8BygBwAcoBIW8R8AIhbxL6AnABygBw+gJw+gJwAcs/cAHLH3ABygAhbxRtvZl/AcoAIW8UAcyUcAHKAOLJAW8T+wCAAKxvAHBvjG1vjG1vjFhxb4cBcm+H8AiAABwgbxGAABwgbxKAABwgbxCAAaQgbxHwBPkAIW8QI28R+RDyim8Af2+MIW8RbxJvjCFvEW8Sb4whbxFvEG+MAW8RbxNvjPAMgAgEgJicAF74CV2omh4BJj4B5jAAJu6E/ANgCAUgoKQAXsyX7UTQ8Akx8BAxgABewfjtRNDwCTHwDjGA=';
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: new BN(key.toString(), 10)});
    __stack.push({ type: 'int', value: new BN(walletId.toString(), 10)});
    return deploy(__code, 'init_Wallet', __stack);
}
