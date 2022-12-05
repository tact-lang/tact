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
    const __code = 'te6ccgECJAEAAaMAART/APSkE/S88sgLAQIBYgIDAgLLBAUCAUggIQIBIAYHACfQgbxHwBPkAIW8QMiJvERL5EPKKgIBIAgJAgEgFhcCASAKCwIBIBARAgEgDA0CASAODwA5DHSH+1E0PAJMQKCEG3ljc26lfAGMfAQkTDi8AuAADz6QAH6RG8CgACkcljLAXABywAhbxABygcBbxEBy/+AASQgbxAhbxEibxIDbxNQJMsHAfACAfoCIW6UcDLKAJV/AcoAzOKACASASEwIBIBQVAAsyAHwA8mAAQxtAdMH8AEB+gDSAAGUNAPUFN5vAFAEb4xYb4wBb4xYb4yAAHzUAdAB8AVvAFADb4xYb4yAAIQgbxAhbxECbxIDyx/L/8sfgAgEgGBkCASAcHQIBIBobAA9cgB8AfJ7VSAALMgB8AfJgACU0x/T/9MfbwBQBG+MWG+MAW+MgADVW8AbW+MbW+MbW+McCBvh3FYA2+Hclhvh/AIgCASAeHwAHCBvEYAAHCBvEIAAJu6E/ANgCAUgiIwAXsyX7UTQ8Akx8A8xgABewfjtRNDwCTHwDjGA=';
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: new BN(key.toString(), 10)});
    __stack.push({ type: 'int', value: new BN(walletId.toString(), 10)});
    return deploy(__code, 'init_Wallet', __stack);
}
