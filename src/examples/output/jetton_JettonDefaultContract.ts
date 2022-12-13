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
    queryId: BigInt;
    amount: BigInt;
    from: Address;
    responseAddress: Address;
    forwardTonAmount: BigInt;
}

export function packTokenReceived(src: TokenReceived): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(395134233, 32);
    b_0 = b_0.storeUint(new BN(src.queryId.toString(10), 10), 64);
    b_0 = b_0.storeInt(new BN(src.amount.toString(10), 10), 257);
    b_0 = b_0.storeAddress(src.from);
    b_0 = b_0.storeAddress(src.responseAddress);
    b_0 = b_0.storeCoins(new BN(src.forwardTonAmount.toString(10), 10));
    return b_0.endCell();
}

export type TokenTransfer = {
    $$type: 'TokenTransfer';
    queryId: BigInt;
    amount: BigInt;
    destination: Address;
    responseDestination: Address;
    customPayload: Cell | null;
    forwardTonAmount: BigInt;
}

export function packTokenTransfer(src: TokenTransfer): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(260734629, 32);
    b_0 = b_0.storeUint(new BN(src.queryId.toString(10), 10), 64);
    b_0 = b_0.storeCoins(new BN(src.amount.toString(10), 10));
    b_0 = b_0.storeAddress(src.destination);
    b_0 = b_0.storeAddress(src.responseDestination);
    if (src.customPayload !== null) {
        b_0 = b_0.storeBit(true);
        b_0 = b_0.storeRef(src.customPayload);
    } else {
        b_0 = b_0.storeBit(false);
    }
    b_0 = b_0.storeCoins(new BN(src.forwardTonAmount.toString(10), 10));
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
    const __code = 'te6ccgECFgEAAs4AART/APSkE/S88sgLAQIBYgIDAgLLBAUACaHeyeApAgFIBgcCAUgMDQIBSAgJAEdnIcAHLAXMBywFwAcsAEszMyfkAyHIBywFwAcsAEsoHy//J0ICgxwIddJwh+VMCDXCx/eAtDTAwFxsMABkX+RcOIB+kAwVEEVbwP4YQKRW+AgghAXjUUZuuMCghAPin6luuMCMPLAZIAoLAAkIG7yToACyMO1E0NQB+GKBAQHXAPpAAQH6QAFDMGwTA9MfAYIQF41FGbry4GTTP4EBAdcA+kABAfpAAQH6AFVANRBnEFZVA/AWyPhCAcxVIFAjgQEBzwABzxYBzxbJ7VQAwO1E0NQB+GKBAQHXAPpAAQH6QAFDMGwTA9MfAYIQD4p+pbry4GTTP/oA+kABAfpAAW0C0gABktQx3voABgUEUDM2EHgQZ1UE8BfI+EIBzFUgUCOBAQHPAAHPFgHPFsntVAIBWA4PAgEgEBEAFSUfwHKAOBwAcoAgAOsyHEBygEXygBwAcoCUAXPFlAD+gJwAcpoI26zJW6zsY41f/ASyHDwEnDwEiRus5V/8BIUzJU0A3DwEuIkbrOVf/ASFMyVNANw8BLicPASAn/wEgLJWMyWMzMBcPAS4iFus5l/AcoAAfABAcyUcDLKAOLJAfsAgAgEgEhMCASAUFQApHADyMxDE1AjgQEBzwABzxYBzxbJgAG8AtD0BDAgggDXngGAEPQPb6Hy4GRtAoIA154BgBD0D2+h8uBkEoIA154BAoAQ9BfI9ADJQAPwFIABbFsy+EFvIzAxUwPHBbOOEfhCVCBE8BVwWfAFWMcF8uBkkjAx4hOgIML/8uBkAoACpF8D+EFvIzAxJccF8uBkUVGhIML/8uBk+EJUIEfwFXBTIfAFcHBUNmZUJ6BSsMhVQIIQF41FGVAGyx8Uyz8SgQEBzwABzxYBzxYB+gLJQBVQYxTwE4A==';
    const depends = new Map<string, Cell>();
    depends.set('55198', Cell.fromBoc(Buffer.from('te6ccgECFgEAAs4AART/APSkE/S88sgLAQIBYgIDAgLLBAUACaHeyeApAgFIBgcCAUgMDQIBSAgJAEdnIcAHLAXMBywFwAcsAEszMyfkAyHIBywFwAcsAEsoHy//J0ICgxwIddJwh+VMCDXCx/eAtDTAwFxsMABkX+RcOIB+kAwVEEVbwP4YQKRW+AgghAXjUUZuuMCghAPin6luuMCMPLAZIAoLAAkIG7yToACyMO1E0NQB+GKBAQHXAPpAAQH6QAFDMGwTA9MfAYIQF41FGbry4GTTP4EBAdcA+kABAfpAAQH6AFVANRBnEFZVA/AWyPhCAcxVIFAjgQEBzwABzxYBzxbJ7VQAwO1E0NQB+GKBAQHXAPpAAQH6QAFDMGwTA9MfAYIQD4p+pbry4GTTP/oA+kABAfpAAW0C0gABktQx3voABgUEUDM2EHgQZ1UE8BfI+EIBzFUgUCOBAQHPAAHPFgHPFsntVAIBWA4PAgEgEBEAFSUfwHKAOBwAcoAgAOsyHEBygEXygBwAcoCUAXPFlAD+gJwAcpoI26zJW6zsY41f/ASyHDwEnDwEiRus5V/8BIUzJU0A3DwEuIkbrOVf/ASFMyVNANw8BLicPASAn/wEgLJWMyWMzMBcPAS4iFus5l/AcoAAfABAcyUcDLKAOLJAfsAgAgEgEhMCASAUFQApHADyMxDE1AjgQEBzwABzxYBzxbJgAG8AtD0BDAgggDXngGAEPQPb6Hy4GRtAoIA154BgBD0D2+h8uBkEoIA154BAoAQ9BfI9ADJQAPwFIABbFsy+EFvIzAxUwPHBbOOEfhCVCBE8BVwWfAFWMcF8uBkkjAx4hOgIML/8uBkAoACpF8D+EFvIzAxJccF8uBkUVGhIML/8uBk+EJUIEfwFXBTIfAFcHBUNmZUJ6BSsMhVQIIQF41FGVAGyx8Uyz8SgQEBzwABzxYBzxYB+gLJQBVQYxTwE4A==', 'base64'))[0]);
    let systemCell = beginCell().storeDict(serializeDict(depends, 16, (src, v) => v.refs.push(src))).endCell();
    let __stack: StackItem[] = [];
    __stack.push({ type: 'cell', cell: systemCell });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(master).endCell() });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(owner).endCell() });
    return deploy(__code, 'init_JettonDefaultContract', __stack); 
}

export class JettonDefaultContract {
            
    readonly executor: ContractExecutor; 
    constructor(executor: ContractExecutor) { this.executor = executor; } 
    
    async send(args: { amount: BN, from?: Address, debug?: boolean }, message: TokenReceived | TokenTransfer) {
        let body: Cell | null = null;
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'TokenReceived') {
            body = packTokenReceived(message);
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'TokenTransfer') {
            body = packTokenTransfer(message);
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
}