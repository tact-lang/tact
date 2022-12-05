import { Cell, Slice, StackItem } from 'ton';
import { BN } from 'bn.js';
import { deploy } from '../abi/deploy';

export type StateInit = {
    $$type: 'StateInit';
    code: Cell;
    data: Cell;
}

export type Operation = {
    $$type: 'Operation';
    seqno: BigInt;
    target: Slice;
    amount: BigInt;
}

export type Execute = {
    $$type: 'Execute';
    operation: Operation;
    signature1: Slice;
    signature2: Slice;
    signature3: Slice;
}

export function MultisigContract_init(key1: BigInt, key2: BigInt, key3: BigInt) {
    const __code = 'te6ccgECHgEAAagAART/APSkE/S88sgLAQIBYgIDAgLMBAUCASAcHQIBIAYHAgEgFBUCASAICQIBIA4PAgEgCgsCASAMDQA5DHSH+1E0PAHMQKCEDDeKUK6lfAEMfANkTDi8AmAAJwgbxAhbxECbxIDyx8ByQHMAfoCgAAsyAHwAcmAAKTTH9QB0AH6AG8AUARvjFhvjAFvjIAIBIBARAgEgEhMAQzwAwHUAdAB1AHQAdQw0NQB0G8AUAVvjFADb4wBb4xYb4yAALQgbxAhbxEibxIDbxNQJMsfy//L/8v/gAAsyAHwBcmAAMTTH9P/0//T/28AUAVvjFADb4wBb4wBb4yACASAWFwIBSBobAA9cgB8AXJ7VSAIBIBgZAEMbwBtb4xtb4xtb4xtb4xwIG+HcVgEb4dyWG+Hc1hvh/AGgADEyIAQAcsFIW8RzxYBbxL6AnEBy2rJcPsAgAAcIG8QgAHUIG8Q8AL5ACFvESNvESJZ+RAibxIkbxIjWfkQI28TJW8TECT5ECNvEG8QJW8QuvKKArABsPKKbxDwC4AAXvmS/aiaHgDmPgGGMAAm+Vj+AVA==';
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: new BN(key1.toString(), 10)});
    __stack.push({ type: 'int', value: new BN(key2.toString(), 10)});
    __stack.push({ type: 'int', value: new BN(key3.toString(), 10)});
    return deploy(__code, 'init_MultisigContract', __stack);
}
