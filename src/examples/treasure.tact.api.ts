import { Cell, Slice, StackItem, Address, Builder, InternalMessage, CommonMessageInfo, CellMessage, beginCell } from 'ton';
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

export type ChangeOnwer = {
    $$type: 'ChangeOnwer';
    newOwner: Address;
}

export function packChangeOnwer(src: ChangeOnwer): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(2284453861, 32);
    b_0 = b_0.storeAddress(src.newOwner);
    return b_0.endCell();
}

export type Withdraw = {
    $$type: 'Withdraw';
    amount: BigInt;
    mode: BigInt;
}

export function packWithdraw(src: Withdraw): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(1286094280, 32);
    b_0 = b_0.storeCoins(new BN(src.amount.toString(10), 10));
    b_0 = b_0.storeUint(new BN(src.mode.toString(10), 10), 8);
    return b_0.endCell();
}

export function Treasure_init(owner: Address) {
    const __code = 'te6ccgECEQEAATsAART/APSkE/S88sgLAQIBYgIDAgLMBAUACaG+XeAXAgHUBgcCASAJCgHNO37cCHXScIflTAg1wsf3gLQ0wMBcbDAAZF/kXDiAfpAMFRBFW8D+GECkVvgIIIQTKg9yLqOJjDtRND6QAExAdMfAYIQTKg9yLry4GT6ANMHWWwS8A3IAc8Wye1U4MAAkTDjDfLAZIAgACQgbvJOgAHT5AYLwmGwroSS7kofrSgvY0xBOHABno8k5UtiJx00IGFvTDU26jhLtRND6QAEx8A7IAc8Wye1U2zHgAgFYCwwCASANDgBnMhxAcoBFcoAcAHKAlADzxYB+gJwAcpocAHKACJus5l/AcoAAvABWMyVMnBYygDiyQH7AIAALMgBzxbJgAgEgDxAACUcCDwDIABUf8jJVBMEUDPwCoAAFPAMg';
    let __stack: StackItem[] = [];
    __stack.push({ type: 'slice', cell: owner});
    return deploy(__code, 'init_Treasure', __stack);
}

export class Treasure {
    readonly executor: ContractExecutor;
    constructor(executor: ContractExecutor) { this.executor = executor; }
    
    async send(args: { amount: BN, from?: Address, debug?: boolean }, message: Withdraw | 'Destroy') {
        let body: Cell | null = null;
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'Withdraw') {
            body = packWithdraw(message);
        }
        if (message === 'Destroy') {
            body = beginCell().storeUint(0, 32).storeBuffer(Buffer.from(message)).endCell();
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