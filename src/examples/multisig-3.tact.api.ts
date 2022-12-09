import { Cell, Slice, StackItem, Address, Builder, InternalMessage, CommonMessageInfo, CellMessage } from 'ton';
import { ContractExecutor } from 'ton-nodejs';
import BN from 'bn.js';
import { deploy } from '../abi/deploy';

export type SendParameters = {
    $$type: 'SendParameters';
    bounce: boolean;
    to: Address;
    value: BigInt;
    mode: BigInt;
    body: Cell | null;
}

export function packSendParameters(src: SendParameters): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeBit(src.bounce);
    b_0 = b_0.storeAddress(src.to);
    b_0 = b_0.storeInt(new BN(src.value.toString(10), 10), 257);
    b_0 = b_0.storeInt(new BN(src.mode.toString(10), 10), 257);
    if (src.body !== null) {
        b_0 = b_0.storeBit(true);
        b_0 = b_0.storeRef(src.body);
    } else {
        b_0 = b_0.storeBit(false);
    }
    return b_0.endCell();
}

export type Operation = {
    $$type: 'Operation';
    seqno: BigInt;
    amount: BigInt;
    target: Address;
}

export function packOperation(src: Operation): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(new BN(src.seqno.toString(10), 10), 32);
    b_0 = b_0.storeCoins(new BN(src.amount.toString(10), 10));
    b_0 = b_0.storeAddress(src.target);
    return b_0.endCell();
}

export type Execute = {
    $$type: 'Execute';
    operation: Operation;
    signature1: Slice;
    signature2: Slice;
    signature3: Slice;
}

export function packExecute(src: Execute): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(819865922, 32);
    b_0 = b_0.storeCellCopy(packOperation(src.operation));
    b_0 = b_0.storeRef(src.signature1.toCell());
    b_0 = b_0.storeRef(src.signature2.toCell());
    b_0 = b_0.storeRef(src.signature3.toCell());
    return b_0.endCell();
}

export type Executed = {
    $$type: 'Executed';
    seqno: BigInt;
}

export function packExecuted(src: Executed): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(4174937, 32);
    b_0 = b_0.storeUint(new BN(src.seqno.toString(10), 10), 32);
    return b_0.endCell();
}

export function MultisigContract_init(key1: BigInt, key2: BigInt, key3: BigInt) {
    const __code = 'te6ccgECNAEAAlkAART/APSkE/S88sgLAQIBYgIDAgLLBAUCASAqKwIBIAYHAgFIHh8CASAICQIBIBITAgFICgsCASAMDQA9DHTH+1E0PALMQKCEDDeKUK6l/AIMfAW8A3gW/LAZIAAJCBu8k6ACASAODwIBIBARAEcyHABywFzAcsBcAHLABLMzMn5AMhyAcsBcAHLABLKB8v/ydCAAGRvI1Ajyx8B+gIBzxaAACzIAfAFyYAAXNMf+gD6QAFDMG8DgAgEgFBUCASAaGwIBIBYXAgEgGBkAJzwBwHUAdAB1AHQAdQB0BRDMG8EgABkbyRQNMsfy//L/8v/gAAsyAHwCcmAAGTTH9P/0//T/1UwbwSAAD1yAHwCcntVIAgEgHB0AfTIcQHKASFvEAHKAHABygIhbxHPFiFvEvoCcAHKaHABygAhbxQgbrOZf1jKAAHwAQHMlTBwAcoA4skBbxP7AIAArHBtbW1vBFADcW+HAXJvhwFzb4fwCoAIBICAhAgEgJicCASAiIwIBICQlAB0fyFvEgJvERJwbW8F8A6AADxwyMnIyfAEgAAcIG8RgAAcIG8SgAgEgKCkAdUIG8Q8Ab5ACFvESNvESJZ+RAibxIkbxIjWfkQI28TJW8TECT5ECNvEG8QJW8QuvKKArABsPKKbxDwEIAAcIG8TgAAcIG8QgAgEgLC0CASAuLwAXu62u1E0PALMfARMYABe4yX7UTQ8Asx8BUxgCASAwMQAJuKx/APgCASAyMwAXtHy9qJoeAWY+AkYwABew6ftRNDwCzHwFDGAAF7Dhu1E0PALMfATMYA==';
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: new BN(key1.toString(), 10)});
    __stack.push({ type: 'int', value: new BN(key2.toString(), 10)});
    __stack.push({ type: 'int', value: new BN(key3.toString(), 10)});
    return deploy(__code, 'init_MultisigContract', __stack);
}

export class MultisigContract {
    readonly executor: ContractExecutor;
    constructor(executor: ContractExecutor) { this.executor = executor; }
    
    async send(args: { amount: BN, from?: Address, debug?: boolean }, message: Execute) {
        let body: Cell | null = null;
        if (message.$$type === 'Execute') {
            body = packExecute(message);
        }
        if (body === null) { throw new Error('Invalid message type'); }
        await this.executor.internal(new InternalMessage({
            to: this.executor.address,
            from: args.from || this.executor.address,
            bounce: false,
            value: args.amount,
            body: new CommonMessageInfo({
                body: new CellMessage(body!)
            })
        }), { debug: args.debug });
    }
    async getTestAddress() {
        let __stack: StackItem[] = [];
        let result = await this.executor.get('testAddress', __stack);
    }
    async getKey1() {
        let __stack: StackItem[] = [];
        let result = await this.executor.get('key1', __stack);
        return result.stack.readBigNumber();
    }
    async getKey2() {
        let __stack: StackItem[] = [];
        let result = await this.executor.get('key2', __stack);
        return result.stack.readBigNumber();
    }
    async getKey3() {
        let __stack: StackItem[] = [];
        let result = await this.executor.get('key3', __stack);
        return result.stack.readBigNumber();
    }
    async getSeqno() {
        let __stack: StackItem[] = [];
        let result = await this.executor.get('seqno', __stack);
        return result.stack.readBigNumber();
    }
}