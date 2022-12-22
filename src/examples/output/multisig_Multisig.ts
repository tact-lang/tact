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
export type Request = {
    $$type: 'Request';
    requested: Address;
    to: Address;
    value: BN;
    timeout: BN;
    bounce: boolean;
    mode: BN;
    body: Cell | null;
}

export function packRequest(src: Request): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(4096439811, 32);
    b_0 = b_0.storeAddress(src.requested);
    b_0 = b_0.storeAddress(src.to);
    b_0 = b_0.storeCoins(src.value);
    b_0 = b_0.storeUint(src.timeout, 32);
    b_0 = b_0.storeBit(src.bounce);
    b_0 = b_0.storeUint(src.mode, 8);
    if (src.body !== null) {
        b_0 = b_0.storeBit(true);
        b_0 = b_0.storeRef(src.body);
    } else {
        b_0 = b_0.storeBit(false);
    }
    return b_0.endCell();
}

export function packStackRequest(src: Request, __stack: StackItem[]) {
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.requested).endCell() });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.to).endCell() });
    __stack.push({ type: 'int', value: src.value });
    __stack.push({ type: 'int', value: src.timeout });
    __stack.push({ type: 'int', value: src.bounce ? new BN(-1) : new BN(0) });
    __stack.push({ type: 'int', value: src.mode });
    if (src.body !== null) {
        __stack.push({ type: 'cell', cell: src.body });
    } else {
        __stack.push({ type: 'null' });
    }
}

export function packTupleRequest(src: Request): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.requested).endCell() });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.to).endCell() });
    __stack.push({ type: 'int', value: src.value });
    __stack.push({ type: 'int', value: src.timeout });
    __stack.push({ type: 'int', value: src.bounce ? new BN(-1) : new BN(0) });
    __stack.push({ type: 'int', value: src.mode });
    if (src.body !== null) {
        __stack.push({ type: 'cell', cell: src.body });
    } else {
        __stack.push({ type: 'null' });
    }
    return __stack;
}

export function unpackStackRequest(slice: TupleSlice4): Request {
    const requested = slice.readAddress();
    const to = slice.readAddress();
    const value = slice.readBigNumber();
    const timeout = slice.readBigNumber();
    const bounce = slice.readBoolean();
    const mode = slice.readBigNumber();
    const body = slice.readCellOpt();
    return { $$type: 'Request', requested: requested, to: to, value: value, timeout: timeout, bounce: bounce, mode: mode, body: body };
}
export function unpackTupleRequest(slice: TupleSlice4): Request {
    const requested = slice.readAddress();
    const to = slice.readAddress();
    const value = slice.readBigNumber();
    const timeout = slice.readBigNumber();
    const bounce = slice.readBoolean();
    const mode = slice.readBigNumber();
    const body = slice.readCellOpt();
    return { $$type: 'Request', requested: requested, to: to, value: value, timeout: timeout, bounce: bounce, mode: mode, body: body };
}
export type Signed = {
    $$type: 'Signed';
    request: Request;
}

export function packSigned(src: Signed): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(420994549, 32);
    b_0 = b_0.storeCellCopy(packRequest(src.request));
    return b_0.endCell();
}

export function packStackSigned(src: Signed, __stack: StackItem[]) {
    packStackRequest(src.request, __stack);
}

export function packTupleSigned(src: Signed): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'tuple', items: packTupleRequest(src.request) });
    return __stack;
}

export function unpackStackSigned(slice: TupleSlice4): Signed {
    const request = unpackStackRequest(slice);
    return { $$type: 'Signed', request: request };
}
export function unpackTupleSigned(slice: TupleSlice4): Signed {
    const request = unpackTupleRequest(slice);
    return { $$type: 'Signed', request: request };
}
export async function Multisig_init(members: Cell, totalWeight: BN, requiredWeight: BN) {
    const __code = 'te6ccgECJwEABAIAART/APSkE/S88sgLAQIBYgIDAgLLBAUCASAhIgIBSAYHAgEgDg8CAUgICQIBIAwNAoMcCHXScIflTAg1wsf3gLQ0wMBcbDAAZF/kXDiAfpAMFRBFW8D+GECkVvgIIIQ9Cq2A7rjAoIQGRfd9brjAjDywIKAKCwALCBu8tCAgANww7UTQ1AH4YoEBAdcA9ASBAQHXAIEBAdcAVTBsFATTHwGCEPQqtgO68uCB+kABAfpAAQH6ANMf0gDTB20B0gABkjHU3lVgNxCaEIkQeFUF8BnI+EIBzFUwUDSBAQHPAPQAgQEBzwCBAQHPAMntVAD07UTQ1AH4YoEBAdcA9ASBAQHXAIEBAdcAVTBsFATTHwGCEBkX3fW68uCB0x8BghD0KrYDuvLggfpAAQH6QAEB+gDTH9IA0wdtAdIAAZIx1N5VYDcQmhCJEHhVBfAayPhCAcxVMFA0gQEBzwD0AIEBAc8AgQEBzwDJ7VQAR1yHABywFzAcsBcAHLABLMzMn5AMhyAcsBcAHLABLKB8v/ydCAAdRBM/QKb6GUAdcAMOBbbYAgEgEBECAUgdHgIBIBITAgEgFxgAFVlH8BygDgcAHKAIAgEgFBUACRwWfAFgAfcyHEBygFQB/ARcAHKAlAFzxZQA/oCcAHKaCNusyVus7GOPX/wEchw8BFw8BEkbrOZf/ARBPABUATMlTQDcPAR4iRus5l/8BEE8AFQBMyVNANw8BHicPARAn/wEQLJWMyWMzMBcPAR4iFus5h/8BEB8AEBzJQxcPAR4skBgFgAE+wACASAZGgIBIBscALEcHAMyMwMBwVQk1AIBkQUUMvPFhn0ABeBAQHPABWBAQHPABPKAMhGFxA1GIIQ9Cq2A1AIyx9QBs8WUATPFlj6AssfygDLByFulHAyygCVfwHKAMziyQHMyYAA7ArQ9AQwggCTuQGAEPQPb6Hy4GRtyPQAyVWQC/AUgAD0MW1wBMjMUERDE1A0gQEBzwD0AIEBAc8AgQEBzwDJgABcNFuBAQtYgQEB8AaACASAfIABjT4QW8jMDH4QvgoVCDDVFu6VHqYU6nwFfASgRFNCMcFF/L0gRKTA/gjvBPy9ARtbfATgACQQI18DgAHE+EFvIzAxgQELKwKBAQHwBvABggC04wHCAPL0+EL4KFQYe1F6B1Uj8BVc8BJ/cFBCgEJQQm0C8BOAARbykL2omhqAPwxQICA64B6AkCAgOuAQICA64AqmDYKKoH4C8AgEgIyQCASAlJgAJuzX/AWgAQbcoPaiaGoA/DFAgIDrgHoCQICA64BAgIDrgCqYNgp4DEABNt3owTgudh6ullc9j0J2HOslQo2zQThO6xqWlbI+WZFp15b++LEcw';
    const depends = new Map<string, Cell>();
    depends.set('37817', Cell.fromBoc(Buffer.from('te6ccgECIAEABEgAART/APSkE/S88sgLAQIBYgIDAgLLBAUCASAcHQIBIAYHAgFIEhMCASAICQAV/KP4DlAHA4AOUAQCAUgKCwIBIBARAoE7ftwIddJwh+VMCDXCx/eAtDTAwFxsMABkX+RcOIB+kAwVEEVbwP4YQKRW+AgwAAi10nBIbDjAsAAkTDjDfLAgoAwNAAsIG7y0ICABrFvtRNDUAfhi+kABAfQEgQEB1wCBAQHXANIA1AHQ0x8BghD0KrYDuvLggfpAAQH6QAEB+gDTH9IA0wdtAdIAAZIx1N5VYDcQfBB7EHoQeRB4VQVsHPATDgH6+QGC8CKu5tCm3BRldyd91Y0GrjCQo83T2KiFYRhCCK5fbrA5uo7V7UTQ1AH4YvpAAQH0BIEBAdcAgQEB1wDSANQB0NMfAYIQ9Cq2A7ry4IH6QAEB+kABAfoA0x/SANMHbQHSAAGSMdTeVWA3EHwQexB6EHkQeFUFbBzwFOAPAKTI+EIBzFWwUMvPFhn0ABeBAQHPABWBAQHPABPKAMhGFxA1GIIQ9Cq2A1AIyx9QBs8WUATPFlj6AssfygDLByFulHAyygCVfwHKAMziyQHMye1UAKjI+EIBzFWwUMvPFhn0ABeBAQHPABWBAQHPABPKAMhGFxA1GIIQ9Cq2A1AIyx9QBs8WUATPFlj6AssfygDLByFulHAyygCVfwHKAMziyQHMye1U2zEAI1IW6VW1n0WTDgyAHPAEEz9EGAAdRBM/QKb6GUAdcAMOBbbYAgEgFBUBcdQIlJknwR3nl6QQBPtRRZ+Xp8ILeRmBiVwICFkUCAgPgDeACOQICFqAa2wICA+AKoVdAphF9xgATBsCASAWFwIBIBkaAfcyHEBygFQB/APcAHKAlAFzxZQA/oCcAHKaCNusyVus7GOPX/wD8hw8A9w8A8kbrOZf/APBPABUATMlTQDcPAP4iRus5l/8A8E8AFQBMyVNANw8A/icPAPAn/wDwLJWMyWMzMBcPAP4iFus5h/8A8B8AEBzJQxcPAP4skBgGACxHBwDMjMDAcFUJNQCAZEFFDLzxYZ9AAXgQEBzwAVgQEBzwATygDIRhcQNRiCEPQqtgNQCMsfUAbPFlAEzxZY+gLLH8oAywchbpRwMsoAlX8BygDM4skBzMmAABPsAAAUbFeAAASAAnjd/cHCBAIJUeYdUeYdWEshVYIIQGRfd9VAIyx8HghD0KrYDUAjLH1AGzxZQBM8WWPoCyx/KAMsHIW6UcDLKAJV/AcoAzOLJL1UgbW3wEAcACbwW54CMAgFmHh8Ar7C/u1E0NQB+GL6QAEB9ASBAQHXAIEBAdcA0gDUAdDTHwGCEPQqtgO68uCB+kABAfpAAQH6ANMf0gDTB20B0gABkjHU3lVgNxB8EHsQehB5EHhVBWwc8BKAATbL0YJwXOw9XSyuex6E7DnWSoUbZoJwndY1LStkfLMi068t/fFiOYA==', 'base64'))[0]);
    let systemCell = beginCell().storeDict(serializeDict(depends, 16, (src, v) => v.refs.push(src))).endCell();
    let __stack: StackItem[] = [];
    __stack.push({ type: 'cell', cell: systemCell });
    __stack.push({ type: 'cell', cell: members});
    __stack.push({ type: 'int', value: totalWeight });
    __stack.push({ type: 'int', value: requiredWeight });
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let executor = await createExecutorFromCode({ code: codeCell, data: new Cell() });
    let res = await executor.get('init_Multisig', __stack, { debug: true });
    if (res.debugLogs.length > 0) { console.warn(res.debugLogs); }
    let data = res.stack.readCell();
    return { code: codeCell, data };
}

export const Multisig_errors: { [key: string]: string } = {
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
    '4429': `Invalid sender`,
    '4755': `Timeout`,
    '40810': `Completed`,
    '46307': `Not a member`,
}

export class Multisig {
    readonly executor: ContractExecutor; 
    constructor(executor: ContractExecutor) { this.executor = executor; } 
    
    async send(args: { amount: BN, from?: Address, debug?: boolean }, message: Request | Signed) {
        let body: Cell | null = null;
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'Request') {
            body = packRequest(message);
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'Signed') {
            body = packSigned(message);
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
                if (Multisig_errors[e.exitCode.toString()]) {
                    throw new Error(Multisig_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getMember(address: Address) {
        try {
            let __stack: StackItem[] = [];
            __stack.push({ type: 'slice', cell: beginCell().storeAddress(address).endCell() });
            let result = await this.executor.get('member', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return result.stack.readBigNumberOpt();
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (Multisig_errors[e.exitCode.toString()]) {
                    throw new Error(Multisig_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getMembers() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('members', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return result.stack.readCellOpt();
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (Multisig_errors[e.exitCode.toString()]) {
                    throw new Error(Multisig_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
}