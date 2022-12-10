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

export type Increment = {
    $$type: 'Increment';
    key: BigInt;
    value: BigInt;
}

export function packIncrement(src: Increment): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(3615081709, 32);
    b_0 = b_0.storeInt(new BN(src.key.toString(10), 10), 257);
    b_0 = b_0.storeInt(new BN(src.value.toString(10), 10), 257);
    return b_0.endCell();
}

export function IncrementContract_init() {
    const __code = 'te6ccgEBEAEAqwABFP8A9KQT9LzyyAsBAgFiAgMCAswEBQIBSA4PAgEgBgcCAUgKCwIBSAgJABH2QAgPoAZPaqQAVwx0x8BghDXecTtuo4Z7UTQ9AQBMQGBAQHXAIEBAdcAWWwS8ArwB+Aw8sBkgACUIW6VW1n0WjDgyAHPAMlBM/QVgAgEgDA0AEUgQEBVBIi8AGAAPG3IAQH0AMmAAASAACbgffwCIABe7QH7UTQ9AQBMfAJg=';
    let __stack: StackItem[] = [];
    return deploy(__code, 'init_IncrementContract', __stack);
}

export class IncrementContract {
    readonly executor: ContractExecutor;
    constructor(executor: ContractExecutor) { this.executor = executor; }
    
    async send(args: { amount: BN, from?: Address, debug?: boolean }, message: Increment) {
        let body: Cell | null = null;
        if (message.$$type === 'Increment') {
            body = packIncrement(message);
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
    async getCounters() {
        let __stack: StackItem[] = [];
        let result = await this.executor.get('counters', __stack);
        return result.stack.readCell();
    }
}