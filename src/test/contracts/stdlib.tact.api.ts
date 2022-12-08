import { Cell, Slice, StackItem, Address, Builder, InternalMessage, CommonMessageInfo, CellMessage } from 'ton';
import { ContractExecutor } from 'ton-nodejs';
import BN from 'bn.js';
import { deploy } from '../../abi/deploy';

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

export function StdlibTest_init() {
    const __code = 'te6ccgEBGAEApAABFP8A9KQT9LzyyAsBAgFiAgMCAswEBQIBIBITAgEgBgcABd66VAIBIAgJAgEgDg8CASAKCwIBIAwNAAkW/LAZIAADDCAACzIAfAByYAAFG8AgAAlW8A8AKAIBIBARAAUxwCAABTXSYAICchQVAAm9PseALAIBIBYXABmvQvaiaHgBmID4BBjAABipC+1E0PADMQHwBjEAGKlS7UTQ8AMxAfAHMQ==';
    let __stack: StackItem[] = [];
    return deploy(__code, 'init_StdlibTest', __stack);
}

export class StdlibTest {
    readonly executor: ContractExecutor;
    constructor(executor: ContractExecutor) { this.executor = executor; }
    
}