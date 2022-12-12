import { Cell, Slice, StackItem, Address, Builder, InternalMessage, CommonMessageInfo, CellMessage, beginCell, serializeDict } from 'ton';
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
    code: Cell | null;
    data: Cell | null;
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
    if (src.code !== null) {
        b_0 = b_0.storeBit(true);
        b_0 = b_0.storeRef(src.code);
    } else {
        b_0 = b_0.storeBit(false);
    }
    if (src.data !== null) {
        b_0 = b_0.storeBit(true);
        b_0 = b_0.storeRef(src.data);
    } else {
        b_0 = b_0.storeBit(false);
    }
    return b_0.endCell();
}

export type Context = {
    $$type: 'Context';
    bounced: boolean;
    sender: Address;
    value: BigInt;
}

export function packContext(src: Context): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeBit(src.bounced);
    b_0 = b_0.storeAddress(src.sender);
    b_0 = b_0.storeInt(new BN(src.value.toString(10), 10), 257);
    return b_0.endCell();
}

export type StateInit = {
    $$type: 'StateInit';
    code: Cell;
    data: Cell;
}

export function packStateInit(src: StateInit): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeRef(src.code);
    b_0 = b_0.storeRef(src.data);
    return b_0.endCell();
}

export function StdlibTest_init() {
    const __code = 'te6ccgEBEgEAwwABFP8A9KQT9LzyyAsBAgFiAgMCAs0EBQIBIAwNAEfRBrpJjhD5hoaYGAuNhgAMi/yLhxAP0gGCogibeB/DDueWAyQCASAGBwIBIAgJAgEgCgsAGRwAcjMAQGBAQHPAMmAABwxxwCAABwx10mAABwx10qACAnIODwAJvT7HgCQCASAQEQAnr0L2omhqAPwxQICA64AAmID4A8AAJqkL7UTQ1AH4YoEBAdcAATEB8AUAJqlS7UTQ1AH4YoEBAdcAATEB8AY=';
    const depends = new Map<string, Cell>();
    let systemCell = beginCell().storeDict(null).endCell();
    let __stack: StackItem[] = [];
    __stack.push({ type: 'cell', cell: systemCell });
    return deploy(__code, 'init_StdlibTest', __stack); 
}

export class StdlibTest {
            
    readonly executor: ContractExecutor; 
    constructor(executor: ContractExecutor) { this.executor = executor; } 
    
    async getSliceEmpty(sc: Slice) {
        let __stack: StackItem[] = [];
        __stack.push({ type: 'slice', cell: sc.toCell()});
        let result = await this.executor.get('sliceEmpty', __stack);
        return result.stack.readBoolean();
    }
    async getSliceBits(sc: Slice) {
        let __stack: StackItem[] = [];
        __stack.push({ type: 'slice', cell: sc.toCell()});
        let result = await this.executor.get('sliceBits', __stack);
        return result.stack.readBigNumber();
    }
    async getSliceRefs(sc: Slice) {
        let __stack: StackItem[] = [];
        __stack.push({ type: 'slice', cell: sc.toCell()});
        let result = await this.executor.get('sliceRefs', __stack);
        return result.stack.readBigNumber();
    }
}