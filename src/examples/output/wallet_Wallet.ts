import { Cell, Slice, StackItem, Address, Builder, InternalMessage, CommonMessageInfo, CellMessage, beginCell, serializeDict, TupleSlice4, readString, stringToCell } from 'ton';
import { ContractExecutor, createExecutorFromCode, ExecuteError } from 'ton-nodejs';
import BN from 'bn.js';

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

export function packStackStateInit(src: StateInit, __stack: StackItem[]) {
    __stack.push({ type: 'cell', cell: src.code });
    __stack.push({ type: 'cell', cell: src.data });
}

export function packTupleStateInit(src: StateInit): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'cell', cell: src.code });
    __stack.push({ type: 'cell', cell: src.data });
    return __stack;
}

export function unpackStackStateInit(slice: TupleSlice4): StateInit {
    const code = slice.readCell();
    const data = slice.readCell();
    return { $$type: 'StateInit', code: code, data: data };
}
export function unpackTupleStateInit(slice: TupleSlice4): StateInit {
    const code = slice.readCell();
    const data = slice.readCell();
    return { $$type: 'StateInit', code: code, data: data };
}
export type Context = {
    $$type: 'Context';
    bounced: boolean;
    sender: Address;
    value: BN;
}

export function packContext(src: Context): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeBit(src.bounced);
    b_0 = b_0.storeAddress(src.sender);
    b_0 = b_0.storeInt(src.value, 257);
    return b_0.endCell();
}

export function packStackContext(src: Context, __stack: StackItem[]) {
    __stack.push({ type: 'int', value: src.bounced ? new BN(-1) : new BN(0) });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.sender).endCell() });
    __stack.push({ type: 'int', value: src.value });
}

export function packTupleContext(src: Context): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: src.bounced ? new BN(-1) : new BN(0) });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.sender).endCell() });
    __stack.push({ type: 'int', value: src.value });
    return __stack;
}

export function unpackStackContext(slice: TupleSlice4): Context {
    const bounced = slice.readBoolean();
    const sender = slice.readAddress();
    const value = slice.readBigNumber();
    return { $$type: 'Context', bounced: bounced, sender: sender, value: value };
}
export function unpackTupleContext(slice: TupleSlice4): Context {
    const bounced = slice.readBoolean();
    const sender = slice.readAddress();
    const value = slice.readBigNumber();
    return { $$type: 'Context', bounced: bounced, sender: sender, value: value };
}
export type SendParameters = {
    $$type: 'SendParameters';
    bounce: boolean;
    to: Address;
    value: BN;
    mode: BN;
    body: Cell | null;
    code: Cell | null;
    data: Cell | null;
}

export function packSendParameters(src: SendParameters): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeBit(src.bounce);
    b_0 = b_0.storeAddress(src.to);
    b_0 = b_0.storeInt(src.value, 257);
    b_0 = b_0.storeInt(src.mode, 257);
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

export function packStackSendParameters(src: SendParameters, __stack: StackItem[]) {
    __stack.push({ type: 'int', value: src.bounce ? new BN(-1) : new BN(0) });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.to).endCell() });
    __stack.push({ type: 'int', value: src.value });
    __stack.push({ type: 'int', value: src.mode });
    if (src.body !== null) {
        __stack.push({ type: 'cell', cell: src.body });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.code !== null) {
        __stack.push({ type: 'cell', cell: src.code });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.data !== null) {
        __stack.push({ type: 'cell', cell: src.data });
    } else {
        __stack.push({ type: 'null' });
    }
}

export function packTupleSendParameters(src: SendParameters): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: src.bounce ? new BN(-1) : new BN(0) });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.to).endCell() });
    __stack.push({ type: 'int', value: src.value });
    __stack.push({ type: 'int', value: src.mode });
    if (src.body !== null) {
        __stack.push({ type: 'cell', cell: src.body });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.code !== null) {
        __stack.push({ type: 'cell', cell: src.code });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.data !== null) {
        __stack.push({ type: 'cell', cell: src.data });
    } else {
        __stack.push({ type: 'null' });
    }
    return __stack;
}

export function unpackStackSendParameters(slice: TupleSlice4): SendParameters {
    const bounce = slice.readBoolean();
    const to = slice.readAddress();
    const value = slice.readBigNumber();
    const mode = slice.readBigNumber();
    const body = slice.readCellOpt();
    const code = slice.readCellOpt();
    const data = slice.readCellOpt();
    return { $$type: 'SendParameters', bounce: bounce, to: to, value: value, mode: mode, body: body, code: code, data: data };
}
export function unpackTupleSendParameters(slice: TupleSlice4): SendParameters {
    const bounce = slice.readBoolean();
    const to = slice.readAddress();
    const value = slice.readBigNumber();
    const mode = slice.readBigNumber();
    const body = slice.readCellOpt();
    const code = slice.readCellOpt();
    const data = slice.readCellOpt();
    return { $$type: 'SendParameters', bounce: bounce, to: to, value: value, mode: mode, body: body, code: code, data: data };
}
export type Transfer = {
    $$type: 'Transfer';
    seqno: BN;
    mode: BN;
    to: Address;
    amount: BN;
    body: Cell | null;
}

export function packTransfer(src: Transfer): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(src.seqno, 32);
    b_0 = b_0.storeUint(src.mode, 8);
    b_0 = b_0.storeAddress(src.to);
    b_0 = b_0.storeCoins(src.amount);
    if (src.body !== null) {
        b_0 = b_0.storeBit(true);
        b_0 = b_0.storeRef(src.body);
    } else {
        b_0 = b_0.storeBit(false);
    }
    return b_0.endCell();
}

export function packStackTransfer(src: Transfer, __stack: StackItem[]) {
    __stack.push({ type: 'int', value: src.seqno });
    __stack.push({ type: 'int', value: src.mode });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.to).endCell() });
    __stack.push({ type: 'int', value: src.amount });
    if (src.body !== null) {
        __stack.push({ type: 'cell', cell: src.body });
    } else {
        __stack.push({ type: 'null' });
    }
}

export function packTupleTransfer(src: Transfer): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: src.seqno });
    __stack.push({ type: 'int', value: src.mode });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.to).endCell() });
    __stack.push({ type: 'int', value: src.amount });
    if (src.body !== null) {
        __stack.push({ type: 'cell', cell: src.body });
    } else {
        __stack.push({ type: 'null' });
    }
    return __stack;
}

export function unpackStackTransfer(slice: TupleSlice4): Transfer {
    const seqno = slice.readBigNumber();
    const mode = slice.readBigNumber();
    const to = slice.readAddress();
    const amount = slice.readBigNumber();
    const body = slice.readCellOpt();
    return { $$type: 'Transfer', seqno: seqno, mode: mode, to: to, amount: amount, body: body };
}
export function unpackTupleTransfer(slice: TupleSlice4): Transfer {
    const seqno = slice.readBigNumber();
    const mode = slice.readBigNumber();
    const to = slice.readAddress();
    const amount = slice.readBigNumber();
    const body = slice.readCellOpt();
    return { $$type: 'Transfer', seqno: seqno, mode: mode, to: to, amount: amount, body: body };
}
export type TransferMessage = {
    $$type: 'TransferMessage';
    signature: Cell;
    transfer: Transfer;
}

export function packTransferMessage(src: TransferMessage): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(123, 32);
    b_0 = b_0.storeRef(src.signature);
    b_0 = b_0.storeCellCopy(packTransfer(src.transfer));
    return b_0.endCell();
}

export function packStackTransferMessage(src: TransferMessage, __stack: StackItem[]) {
    __stack.push({ type: 'slice', cell: src.signature });
    packStackTransfer(src.transfer, __stack);
}

export function packTupleTransferMessage(src: TransferMessage): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'slice', cell: src.signature });
    __stack.push({ type: 'tuple', items: packTupleTransfer(src.transfer) });
    return __stack;
}

export function unpackStackTransferMessage(slice: TupleSlice4): TransferMessage {
    const signature = slice.readCell();
    const transfer = unpackStackTransfer(slice);
    return { $$type: 'TransferMessage', signature: signature, transfer: transfer };
}
export function unpackTupleTransferMessage(slice: TupleSlice4): TransferMessage {
    const signature = slice.readCell();
    const transfer = unpackTupleTransfer(slice);
    return { $$type: 'TransferMessage', signature: signature, transfer: transfer };
}
export async function Wallet_init(key: BN, walletId: BN) {
    const __code = 'te6ccgECLQEABBEAART/APSkE/S88sgLAQIBYgIDAgLLBAUCASAlJgIBzgYHAgEgDg8E9zt+3Ah10nCH5UwINcLH94C0NMDAXGwwAGRf5Fw4gH6QDBUQRVvA/hhAo4oMO1E0NQB+GLTH9P/0z9VIGwTVQLwHcj4QgHMVSBQI8sfy//LP8ntVOAgwHvjAiDAACLXScEhsOMCwADjAO1E0NQB+GLTH9P/0z9VIGwTVQKAICQoLAAsIG7y0ICAAojDtRNDUAfhi0x/T/9M/VSBsEwPTHwHAe/LggdQB0AHTH9MH+kABAfoAbQHSAAGSMdTeVUAQVjYQeBBnVQTwF8j4QgHMVSBQI8sfy//LP8ntVABMW+1E0NQB+GLTH9P/0z9VIGwT8BnI+EIBzFUgUCPLH8v/yz/J7VQC8CD5ASCC8A4jVyYQi1cA0Dad1xZ/av+4BqfgQFk3XdDg+ySXHnKyuo4oW+1E0NQB+GLTH9P/0z9VIGwT8BrI+EIBzFUgUCPLH8v/yz/J7VTbMeAggvBnJ9aXZfjyLHXFgeNWVEOX9aALuRvTLE0NltTJJoS8wrrjAgwNACjwGMj4QgHMVSBQI8sfy//LP8ntVABQW+1E0NQB+GLTH9P/0z9VIGwT8BvI+EIBzFUgUCPLH8v/yz/J7VTbMQCcgvCcoPGFUXTjLo/TeN9WpuT2xA5N/LYJDkmBL3seJiFL+bqOKDDtRNDUAfhi0x/T/9M/VSBsE/AcyPhCAcxVIFAjyx/L/8s/ye1U2zHgAgEgEBECASAdHgIBIBITAgEgFxgCASAUFQAfRwA8jMVSBQI8sfy//LP8mAAVJR/AcoA4HABygCAB9zIcQHKAVAH8BBwAcoCUAXPFlAD+gJwAcpoI26zJW6zsY49f/AQyHDwEHDwECRus5l/8BAE8AFQBMyVNANw8BDiJG6zmX/wEATwAVAEzJU0A3DwEOJw8BACf/AQAslYzJYzMwFw8BDiIW6zmH/wEAHwAQHMlDFw8BDiyQGAWAAT7AAIBIBkaAgEgGxwABQwMYAAFGwhgAAMW4ACLFR0MlNDyFVAUEXLHxLLBwHPFgH6AiFulHAyygCVfwHKAMziyfkAggC9EVF5+RAW8vSBRPZRSLoU8vQGpH9QdEMwbW3wEYAIBIB8gAgFIIyQCASAhIgIBICIiABkMPhBbyNbs5MCpALegABc+EFvI1uzkwKkAt6AAASAAAwwgAgEgJygCASArLAAJu6E/ASgCAUgpKgArsyX7UTQ1AH4YtMf0//TP1UgbBPwFoAArsH47UTQ1AH4YtMf0//TP1UgbBPwFIABNu70YJwXOw9XSyuex6E7DnWSoUbZoJwndY1LStkfLMi068t/fFiOYACu4BK7UTQ1AH4YtMf0//TP1UgbBPwFY';
    const depends = new Map<string, Cell>();
    depends.set('14718', Cell.fromBoc(Buffer.from('te6ccgECLQEABBEAART/APSkE/S88sgLAQIBYgIDAgLLBAUCASAlJgIBzgYHAgEgDg8E9zt+3Ah10nCH5UwINcLH94C0NMDAXGwwAGRf5Fw4gH6QDBUQRVvA/hhAo4oMO1E0NQB+GLTH9P/0z9VIGwTVQLwHcj4QgHMVSBQI8sfy//LP8ntVOAgwHvjAiDAACLXScEhsOMCwADjAO1E0NQB+GLTH9P/0z9VIGwTVQKAICQoLAAsIG7y0ICAAojDtRNDUAfhi0x/T/9M/VSBsEwPTHwHAe/LggdQB0AHTH9MH+kABAfoAbQHSAAGSMdTeVUAQVjYQeBBnVQTwF8j4QgHMVSBQI8sfy//LP8ntVABMW+1E0NQB+GLTH9P/0z9VIGwT8BnI+EIBzFUgUCPLH8v/yz/J7VQC8CD5ASCC8A4jVyYQi1cA0Dad1xZ/av+4BqfgQFk3XdDg+ySXHnKyuo4oW+1E0NQB+GLTH9P/0z9VIGwT8BrI+EIBzFUgUCPLH8v/yz/J7VTbMeAggvBnJ9aXZfjyLHXFgeNWVEOX9aALuRvTLE0NltTJJoS8wrrjAgwNACjwGMj4QgHMVSBQI8sfy//LP8ntVABQW+1E0NQB+GLTH9P/0z9VIGwT8BvI+EIBzFUgUCPLH8v/yz/J7VTbMQCcgvCcoPGFUXTjLo/TeN9WpuT2xA5N/LYJDkmBL3seJiFL+bqOKDDtRNDUAfhi0x/T/9M/VSBsE/AcyPhCAcxVIFAjyx/L/8s/ye1U2zHgAgEgEBECASAdHgIBIBITAgEgFxgCASAUFQAfRwA8jMVSBQI8sfy//LP8mAAVJR/AcoA4HABygCAB9zIcQHKAVAH8BBwAcoCUAXPFlAD+gJwAcpoI26zJW6zsY49f/AQyHDwEHDwECRus5l/8BAE8AFQBMyVNANw8BDiJG6zmX/wEATwAVAEzJU0A3DwEOJw8BACf/AQAslYzJYzMwFw8BDiIW6zmH/wEAHwAQHMlDFw8BDiyQGAWAAT7AAIBIBkaAgEgGxwABQwMYAAFGwhgAAMW4ACLFR0MlNDyFVAUEXLHxLLBwHPFgH6AiFulHAyygCVfwHKAMziyfkAggC9EVF5+RAW8vSBRPZRSLoU8vQGpH9QdEMwbW3wEYAIBIB8gAgFIIyQCASAhIgIBICIiABkMPhBbyNbs5MCpALegABc+EFvI1uzkwKkAt6AAASAAAwwgAgEgJygCASArLAAJu6E/ASgCAUgpKgArsyX7UTQ1AH4YtMf0//TP1UgbBPwFoAArsH47UTQ1AH4YtMf0//TP1UgbBPwFIABNu70YJwXOw9XSyuex6E7DnWSoUbZoJwndY1LStkfLMi068t/fFiOYACu4BK7UTQ1AH4YtMf0//TP1UgbBPwFY', 'base64'))[0]);
    let systemCell = beginCell().storeDict(serializeDict(depends, 16, (src, v) => v.refs.push(src))).endCell();
    let __stack: StackItem[] = [];
    __stack.push({ type: 'cell', cell: systemCell });
    __stack.push({ type: 'int', value: key });
    __stack.push({ type: 'int', value: walletId });
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let executor = await createExecutorFromCode({ code: codeCell, data: new Cell() });
    let res = await executor.get('init_Wallet', __stack, { debug: true });
    if (res.debugLogs.length > 0) { console.warn(res.debugLogs); }
    let data = res.stack.readCell();
    return { code: codeCell, data };
}

export const Wallet_errors: { [key: string]: string } = {
    '2': `Stack undeflow`,
    '3': `Stack overflow`,
    '4': `Integer overflow`,
    '5': `Integer out of expected range`,
    '6': `Invalid opcode`,
    '7': `Type check error`,
    '8': `Cell overflow`,
    '9': `Cell underflow`,
    '10': `Dictionary error`,
    '13': `Out of gas error`,
    '32': `Method ID not found`,
    '34': `Action is invalid or not supported`,
    '37': `Not enough TON`,
    '38': `Not enough extra-currencies`,
    '128': `Null reference exception`,
    '129': `Invalid serialization prefix`,
    '130': `Invalid incoming message`,
    '131': `Constraints error`,
    '132': `Access denied`,
    '133': `Contract stopped`,
    '134': `Invalid argument`,
    '17654': `Invalid seqno`,
    '48401': `Invalid signature`,
}

export class Wallet {
    readonly executor: ContractExecutor; 
    constructor(executor: ContractExecutor) { this.executor = executor; } 
    
    async send(args: { amount: BN, from?: Address, debug?: boolean }, message: TransferMessage | Slice | null | 'notify' | 'слава україни' | 'duplicate') {
        let body: Cell | null = null;
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'TransferMessage') {
            body = packTransferMessage(message);
        }
        if (message && typeof message === 'object' && message instanceof Slice) {
            body = message.toCell();
        }
        if (message === null) {
            body = new Cell();
        }
        if (message === 'notify') {
            body = beginCell().storeUint(0, 32).storeBuffer(Buffer.from(message)).endCell();
        }
        if (message === 'слава україни') {
            body = beginCell().storeUint(0, 32).storeBuffer(Buffer.from(message)).endCell();
        }
        if (message === 'duplicate') {
            body = beginCell().storeUint(0, 32).storeBuffer(Buffer.from(message)).endCell();
        }
        if (body === null) { throw new Error('Invalid message type'); }
        try {
            let r = await this.executor.internal(new InternalMessage({
                to: this.executor.address,
                from: args.from || this.executor.address,
                bounce: false,
                value: args.amount,
                body: new CommonMessageInfo({
                    body: new CellMessage(body!)
                })
            }), { debug: args.debug });
            if (r.debugLogs.length > 0) { console.warn(r.debugLogs); }
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (Wallet_errors[e.exitCode.toString()]) {
                    throw new Error(Wallet_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getPublicKey() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('publicKey', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return result.stack.readBigNumber();
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (Wallet_errors[e.exitCode.toString()]) {
                    throw new Error(Wallet_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getWalletId() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('walletId', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return result.stack.readBigNumber();
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (Wallet_errors[e.exitCode.toString()]) {
                    throw new Error(Wallet_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getSeqno() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('seqno', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return result.stack.readBigNumber();
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (Wallet_errors[e.exitCode.toString()]) {
                    throw new Error(Wallet_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
}