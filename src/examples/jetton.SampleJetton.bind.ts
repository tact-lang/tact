import { Cell, Slice, StackItem, Address, Builder, InternalMessage, CommonMessageInfo, CellMessage, beginCell, serializeDict } from 'ton';
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

export type JettonData = {
    $$type: 'JettonData';
    totalSupply: BigInt;
    mintable: boolean;
    owner: Address;
    content: Cell;
    walletCode: Cell;
}

export function packJettonData(src: JettonData): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeInt(new BN(src.totalSupply.toString(10), 10), 257);
    b_0 = b_0.storeBit(src.mintable);
    b_0 = b_0.storeAddress(src.owner);
    b_0 = b_0.storeRef(src.content);
    b_0 = b_0.storeRef(src.walletCode);
    return b_0.endCell();
}

export type Burned = {
    $$type: 'Burned';
    amount: BigInt;
    owner: Address;
    cashback: Address | null;
}

export function packBurned(src: Burned): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(2078119902, 32);
    b_0 = b_0.storeInt(new BN(src.amount.toString(10), 10), 257);
    b_0 = b_0.storeAddress(src.owner);
    if (src.cashback !== null) {
        b_0 = b_0.storeBit(true);
        b_0 = b_0.storeAddress(src.cashback);
    } else {
        b_0 = b_0.storeBit(false);
    }
    return b_0.endCell();
}

export type TokenReceived = {
    $$type: 'TokenReceived';
    amount: BigInt;
}

export function packTokenReceived(src: TokenReceived): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(421783706, 32);
    b_0 = b_0.storeInt(new BN(src.amount.toString(10), 10), 257);
    return b_0.endCell();
}

export type JettonUpdateContent = {
    $$type: 'JettonUpdateContent';
    content: Cell | null;
}

export function packJettonUpdateContent(src: JettonUpdateContent): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(3551049822, 32);
    if (src.content !== null) {
        b_0 = b_0.storeBit(true);
        b_0 = b_0.storeRef(src.content);
    } else {
        b_0 = b_0.storeBit(false);
    }
    return b_0.endCell();
}

export type ChangeOwner = {
    $$type: 'ChangeOwner';
    newOwner: Address;
}

export function packChangeOwner(src: ChangeOwner): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(3067051791, 32);
    b_0 = b_0.storeAddress(src.newOwner);
    return b_0.endCell();
}

export type Mint = {
    $$type: 'Mint';
    amount: BigInt;
}

export function packMint(src: Mint): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(2737462367, 32);
    b_0 = b_0.storeInt(new BN(src.amount.toString(10), 10), 257);
    return b_0.endCell();
}

export function JettonDefaultContract_init(master: Address, owner: Address) {
    const __code = 'te6ccgECKwEAA94AART/APSkE/S88sgLAQIBYgIDAgLKBAUCASAnKAIBIAYHABPVVQPAcMhA0QwCAgFICAkCASAPEAIBSAoLAEdnIcAHLAXMBywFwAcsAEszMyfkAyHIBywFwAcsAEsoHy//J0IDlxwIddJwh+VMCDXCx/eAtDTAwFxsMABkX+RcOIB+kAwVEEVbwP4YQKRW+AgghCjKlxfuuMCIIIQe92X3rrjAoIQ06i4XrrjAjDywGSAMDQ4ACQgbvJOgALww7UTQ1AH4YvoA+kABbQLSAAGS1DHe0gDUBUREbBUF0x8BghCjKlxfuvLgZIEBAdcAATEQRRA0QTDwHsj4QgHMVUBQVPoCWM8WIW6UcDLKAJV/AcoAzOISygDMye1UAOAw7UTQ1AH4YvoA+kABbQLSAAGS1DHe0gDUBUREbBUF0x8BghB73ZfeuvLgZIEBAdcA+kABbQLSAAGU+kABMN5DEzMQZxBWEEUQNFjwH8j4QgHMVUBQVPoCWM8WIW6UcDLKAJV/AcoAzOISygDMye1UAMLtRNDUAfhi+gD6QAFtAtIAAZLUMd7SANQFRERsFQXTHwGCENOouF668uBkbQHSAAGS1DHeATEQRRA0QTDwIMj4QgHMVUBQVPoCWM8WIW6UcDLKAJV/AcoAzOISygDMye1UAgEgERICASAZGgAV9KP4DlAHA4AOUAQCASATFAIBIBUWAgEgFxgA6zIcQHKARfKAHABygJQBc8WUAP6AnABymgjbrMlbrOxjjV/8BPIcPATcPATJG6zlX/wExTMlTQDcPAT4iRus5V/8BMUzJU0A3DwE+Jw8BMCf/ATAslYzJYzMwFw8BPiIW6zmX8BygAB8AEBzJRwMsoA4skB+wCAAIxwA8jMA1rPFljPFoEBAc8AyYAA5ALQ9AQwggDOUwGAEPQPb6Hy4GRtyPQAyUAD8BWAAPwFyMxBNVBU+gJYzxYhbpRwMsoAlX8BygDM4hLKAMzJgAgEgGxwCASAhIgIBIB0eAgEgHyAADz4QvgoWPAWgAFkUWagVUDwGHBTIfAFcHBSC8gBghAZI+iaWMsfgQEBzwDJXjIUEDtAu/AUVQOAALz4QW8jMDFVUPAYcFnwBVAGxwXy4GRVA4AAFEMwgAgEgIyQCASAlJgAZPhBbyMwMSTHBfLgZIAAJBA0XwSAAEz4QW8jMDEB8BmAAGwwFhUUQzDwGlBFoUE0gAEO+KO9qJoagD8MX0AfSAAtoFpAADJahjvaQBqAqIiNgr4DsAgEgKSoAQ7ni3tRNDUAfhi+gD6QAFtAtIAAZLUMd7SANQFRERsFfAbgACbncPwF4';
    const depends = new Map<string, Cell>();
    let systemCell = beginCell().storeDict(null).endCell();
    let __stack: StackItem[] = [];
    __stack.push({ type: 'cell', cell: systemCell });
    __stack.push({ type: 'slice', cell: master});
    __stack.push({ type: 'slice', cell: owner});
    return deploy(__code, 'init_JettonDefaultContract', __stack); 
}

export class JettonDefaultContract {
            
    readonly executor: ContractExecutor; 
    constructor(executor: ContractExecutor) { this.executor = executor; } 
    
}