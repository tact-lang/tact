import { Cell, Slice, Address, Builder, beginCell, ComputeError, TupleItem, TupleReader, Dictionary, contractAddress, ContractProvider, Sender } from 'ton-core';
import { ContractSystem, ContractExecutor } from 'ton-emulator';

export type StateInit = {
    $$type: 'StateInit';
    code: Cell;
    data: Cell;
}

export function storeStateInit(src: StateInit) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0 = b_0.storeRef(src.code);
        b_0 = b_0.storeRef(src.data);
    };
}

export function packStackStateInit(src: StateInit, __stack: TupleItem[]) {
    __stack.push({ type: 'cell', cell: src.code });
    __stack.push({ type: 'cell', cell: src.data });
}

export function packTupleStateInit(src: StateInit): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'cell', cell: src.code });
    __stack.push({ type: 'cell', cell: src.data });
    return __stack;
}

export function unpackStackStateInit(slice: TupleReader): StateInit {
    const code = slice.readCell();
    const data = slice.readCell();
    return { $$type: 'StateInit', code: code, data: data };
}
export function unpackTupleStateInit(slice: TupleReader): StateInit {
    const code = slice.readCell();
    const data = slice.readCell();
    return { $$type: 'StateInit', code: code, data: data };
}
export type Context = {
    $$type: 'Context';
    bounced: boolean;
    sender: Address;
    value: bigint;
    raw: Cell;
}

export function storeContext(src: Context) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0 = b_0.storeBit(src.bounced);
        b_0 = b_0.storeAddress(src.sender);
        b_0 = b_0.storeInt(src.value, 257);
        b_0 = b_0.storeRef(src.raw);
    };
}

export function packStackContext(src: Context, __stack: TupleItem[]) {
    __stack.push({ type: 'int', value: src.bounced ? -1n : 0n });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.sender).endCell() });
    __stack.push({ type: 'int', value: src.value });
    __stack.push({ type: 'slice', cell: src.raw });
}

export function packTupleContext(src: Context): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'int', value: src.bounced ? -1n : 0n });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.sender).endCell() });
    __stack.push({ type: 'int', value: src.value });
    __stack.push({ type: 'slice', cell: src.raw });
    return __stack;
}

export function unpackStackContext(slice: TupleReader): Context {
    const bounced = slice.readBoolean();
    const sender = slice.readAddress();
    const value = slice.readBigNumber();
    const raw = slice.readCell();
    return { $$type: 'Context', bounced: bounced, sender: sender, value: value, raw: raw };
}
export function unpackTupleContext(slice: TupleReader): Context {
    const bounced = slice.readBoolean();
    const sender = slice.readAddress();
    const value = slice.readBigNumber();
    const raw = slice.readCell();
    return { $$type: 'Context', bounced: bounced, sender: sender, value: value, raw: raw };
}
export type SendParameters = {
    $$type: 'SendParameters';
    bounce: boolean;
    to: Address;
    value: bigint;
    mode: bigint;
    body: Cell | null;
    code: Cell | null;
    data: Cell | null;
}

export function storeSendParameters(src: SendParameters) {
    return (builder: Builder) => {
        let b_0 = builder;
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
    };
}

export function packStackSendParameters(src: SendParameters, __stack: TupleItem[]) {
    __stack.push({ type: 'int', value: src.bounce ? -1n : 0n });
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

export function packTupleSendParameters(src: SendParameters): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'int', value: src.bounce ? -1n : 0n });
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

export function unpackStackSendParameters(slice: TupleReader): SendParameters {
    const bounce = slice.readBoolean();
    const to = slice.readAddress();
    const value = slice.readBigNumber();
    const mode = slice.readBigNumber();
    const body = slice.readCellOpt();
    const code = slice.readCellOpt();
    const data = slice.readCellOpt();
    return { $$type: 'SendParameters', bounce: bounce, to: to, value: value, mode: mode, body: body, code: code, data: data };
}
export function unpackTupleSendParameters(slice: TupleReader): SendParameters {
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
    value: bigint;
    timeout: bigint;
    bounce: boolean;
    mode: bigint;
    body: Cell | null;
}

export function storeRequest(src: Request) {
    return (builder: Builder) => {
        let b_0 = builder;
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
    };
}

export function packStackRequest(src: Request, __stack: TupleItem[]) {
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.requested).endCell() });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.to).endCell() });
    __stack.push({ type: 'int', value: src.value });
    __stack.push({ type: 'int', value: src.timeout });
    __stack.push({ type: 'int', value: src.bounce ? -1n : 0n });
    __stack.push({ type: 'int', value: src.mode });
    if (src.body !== null) {
        __stack.push({ type: 'cell', cell: src.body });
    } else {
        __stack.push({ type: 'null' });
    }
}

export function packTupleRequest(src: Request): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.requested).endCell() });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.to).endCell() });
    __stack.push({ type: 'int', value: src.value });
    __stack.push({ type: 'int', value: src.timeout });
    __stack.push({ type: 'int', value: src.bounce ? -1n : 0n });
    __stack.push({ type: 'int', value: src.mode });
    if (src.body !== null) {
        __stack.push({ type: 'cell', cell: src.body });
    } else {
        __stack.push({ type: 'null' });
    }
    return __stack;
}

export function unpackStackRequest(slice: TupleReader): Request {
    const requested = slice.readAddress();
    const to = slice.readAddress();
    const value = slice.readBigNumber();
    const timeout = slice.readBigNumber();
    const bounce = slice.readBoolean();
    const mode = slice.readBigNumber();
    const body = slice.readCellOpt();
    return { $$type: 'Request', requested: requested, to: to, value: value, timeout: timeout, bounce: bounce, mode: mode, body: body };
}
export function unpackTupleRequest(slice: TupleReader): Request {
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

export function storeSigned(src: Signed) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0 = b_0.storeUint(420994549, 32);
        b_0 = b_0.store(storeRequest(src.request));
    };
}

export function packStackSigned(src: Signed, __stack: TupleItem[]) {
    packStackRequest(src.request, __stack);
}

export function packTupleSigned(src: Signed): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'tuple', items: packTupleRequest(src.request) });
    return __stack;
}

export function unpackStackSigned(slice: TupleReader): Signed {
    const request = unpackStackRequest(slice);
    return { $$type: 'Signed', request: request };
}
export function unpackTupleSigned(slice: TupleReader): Signed {
    const request = unpackTupleRequest(slice);
    return { $$type: 'Signed', request: request };
}
async function Multisig_init(members: Cell, totalWeight: bigint, requiredWeight: bigint) {
    const __code = 'te6ccgECJwEABAUAART/APSkE/S88sgLAQIBYgIDAgLLBAUCASAhIgIBSAYHAgEgDg8CAUgICQIBWAwNAoEcCHXScIflTAg1wsf3gLQ0wMBcbDAAZF/kXDiAfpAIlBmbwT4YQKRW+AgghD0KrYDuuMCghAZF931uuMCMPLAgoAoLAAsIG7y0ICAA3DDtRNDUAfhigQEB1wD0BIEBAdcAgQEB1wBVMGwUBNMfAYIQ9Cq2A7ry4IH6QAEB+kABAfoA0x/SANMHbQHSAAGSMdTeVWA3EJoQiRB4VQXwGsj4QgHMVTBQNIEBAc8A9ACBAQHPAIEBAc8Aye1UAPTtRNDUAfhigQEB1wD0BIEBAdcAgQEB1wBVMGwUBNMfAYIQGRfd9bry4IHTHwGCEPQqtgO68uCB+kABAfpAAQH6ANMf0gDTB20B0gABkjHU3lVgNxCaEIkQeFUF8BvI+EIBzFUwUDSBAQHPAPQAgQEBzwCBAQHPAMntVABHMhwAcsBcwHLAXABywASzMzJ+QDIcgHLAXABywASygfL/8nQgAB0QTP0Cm+hlAHXADDgW22ACASAQEQIBSBscAgFYEhMCASAUFQAVJR/AcoA4HABygCAACRwWfAGgAgEgFhcCASAZGgH3MhxAcoBUAfwEnABygJQBc8WUAP6AnABymgjbrMlbrOxjj1/8BLIcPAScPASJG6zmX/wEgTwAVAEzJU0A3DwEuIkbrOZf/ASBPABUATMlTQDcPAS4nDwEgJ/8BICyVjMljMzAXDwEuIhbrOYf/ASAfABAcyUMXDwEuLJAYBgAsRwcAzIzAwHBVCTUAgGRBRQy88WGfQAF4EBAc8AFYEBAc8AE8oAyEYXEDUYghD0KrYDUAjLH1AGzxZQBM8WWPoCyx/KAMsHIW6UcDLKAJV/AcoAzOLJAczJgAAT7AAA7ArQ9AQwggCTuQGAEPQPb6Hy4GRtyPQAyVWQC/AVgAD0MW1wBMjMUERDE1A0gQEBzwD0AIEBAc8AgQEBzwDJgAgEgHR4CASAfIAAXDRbgQELWIEBAfAHgAAkECNfA4AB1PhBbyQQI18DgQELKwKBAQHwB/ABggC04wHCAPL0+EL4KFQYe1F6B1Uj8BZc8BN/cFBCgEJQQm0C8BSAAZz4QW8kECNfA/hC+ChUIMNUW7pUephTqfAW8BOBEU0IxwUX8vSBEpMD+CO8E/L0BG1t8BSAARbykL2omhqAPwxQICA64B6AkCAgOuAQICA64AqmDYKKoH4DEAgEgIyQCASAlJgAJuzX/AXgAQbcoPaiaGoA/DFAgIDrgHoCQICA64BAgIDrgCqYNgp4DMABNt3owTgudh6ullc9j0J2HOslQo2zQThO6xqWlbI+WZFp15b++LEcw';
    const depends = Dictionary.empty(Dictionary.Keys.Uint(16), Dictionary.Values.Cell());
    depends.set(37817, Cell.fromBoc(Buffer.from('te6ccgECIAEABEkAART/APSkE/S88sgLAQIBYgIDAgLLBAUCASAcHQIBSAYHAgFIEBECAUgICQIBWA4PAn87ftwIddJwh+VMCDXCx/eAtDTAwFxsMABkX+RcOIB+kAiUGZvBPhhApFb4CDAACLXScEhsOMCwACRMOMN8sCCgCgsACwgbvLQgIAGsW+1E0NQB+GL6QAEB9ASBAQHXAIEBAdcA0gDUAdDTHwGCEPQqtgO68uCB+kABAfpAAQH6ANMf0gDTB20B0gABkjHU3lVgNxB8EHsQehB5EHhVBWwc8BQMAfr5AYLwIq7m0KbcFGV3J33VjQauMJCjzdPYqIVhGEIIrl9usDm6jtXtRNDUAfhi+kABAfQEgQEB1wCBAQHXANIA1AHQ0x8BghD0KrYDuvLggfpAAQH6QAEB+gDTH9IA0wdtAdIAAZIx1N5VYDcQfBB7EHoQeRB4VQVsHPAV4A0ApMj4QgHMVbBQy88WGfQAF4EBAc8AFYEBAc8AE8oAyEYXEDUYghD0KrYDUAjLH1AGzxZQBM8WWPoCyx/KAMsHIW6UcDLKAJV/AcoAzOLJAczJ7VQAqMj4QgHMVbBQy88WGfQAF4EBAc8AFYEBAc8AE8oAyEYXEDUYghD0KrYDUAjLH1AGzxZQBM8WWPoCyx/KAMsHIW6UcDLKAJV/AcoAzOLJAczJ7VTbMQAjCFulVtZ9Fkw4MgBzwBBM/RBgAB0QTP0Cm+hlAHXADDgW22ACASASEwIBSBkaAgEgFBUCASAXGAAVJR/AcoA4HABygCAB9zIcQHKAVAH8BBwAcoCUAXPFlAD+gJwAcpoI26zJW6zsY49f/AQyHDwEHDwECRus5l/8BAE8AFQBMyVNANw8BDiJG6zmX/wEATwAVAEzJU0A3DwEOJw8BACf/AQAslYzJYzMwFw8BDiIW6zmH/wEAHwAQHMlDFw8BDiyQGAWAAT7AACxHBwDMjMDAcFUJNQCAZEFFDLzxYZ9AAXgQEBzwAVgQEBzwATygDIRhcQNRiCEPQqtgNQCMsfUAbPFlAEzxZY+gLLH8oAywchbpRwMsoAlX8BygDM4skBzMmAABRsV4AABIAF1IESkyT4I7zy9IIAn2oos/L0+EFvJBAjXwMrgQELIoEBAfAH8AEcgQELUA1tgQEB8AZQq6BTCL7jAAmAbAJ43f3BwgQCCVHmHVHmHVhLIVWCCEBkX3fVQCMsfB4IQ9Cq2A1AIyx9QBs8WUATPFlj6AssfygDLByFulHAyygCVfwHKAMziyS9VIG1t8BEHAAm8FueAlAIBZh4fAK+wv7tRNDUAfhi+kABAfQEgQEB1wCBAQHXANIA1AHQ0x8BghD0KrYDuvLggfpAAQH6QAEB+gDTH9IA0wdtAdIAAZIx1N5VYDcQfBB7EHoQeRB4VQVsHPATgAE2y9GCcFzsPV0srnsehOw51kqFG2aCcJ3WNS0rZHyzItOvLf3xYjmA=', 'base64'))[0]);
    let systemCell = beginCell().storeDict(depends).endCell();
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'cell', cell: systemCell });
    __stack.push({ type: 'cell', cell: members});
    __stack.push({ type: 'int', value: totalWeight });
    __stack.push({ type: 'int', value: requiredWeight });
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let system = await ContractSystem.create();
    let executor = await ContractExecutor.create({ code: codeCell, data: new Cell() }, system);
    let res = await executor.get('init_Multisig', __stack);
    if (!res.success) { throw Error(res.error); }
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
    
    static async init(members: Cell, totalWeight: bigint, requiredWeight: bigint) {
        return await Multisig_init(members,totalWeight,requiredWeight);
    }
    
    static async fromInit(members: Cell, totalWeight: bigint, requiredWeight: bigint) {
        const init = await Multisig_init(members,totalWeight,requiredWeight);
        const address = contractAddress(0, init);
        return new Multisig(address, init);
    }
    
    static fromAddress(address: Address) {
        return new Multisig(address);
    }
    
    readonly address: Address; 
    readonly init?: { code: Cell, data: Cell };
    private constructor(address: Address, init?: { code: Cell, data: Cell }) {
        this.address = address;
        this.init = init;
    }
    
    async send(provider: ContractProvider, via: Sender, args: { value: bigint, bounce?: boolean| null | undefined }, message: Request | Signed) {
        
        let body: Cell | null = null;
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'Request') {
            body = beginCell().store(storeRequest(message)).endCell();
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'Signed') {
            body = beginCell().store(storeSigned(message)).endCell();
        }
        if (body === null) { throw new Error('Invalid message type'); }
        
        await provider.internal(via, { ...args, body: body });
        
    }
    
    async getMember(provider: ContractProvider, address: Address) {
        try {
            let __stack: TupleItem[] = [];
            __stack.push({ type: 'slice', cell: beginCell().storeAddress(address).endCell() });
            let result = await provider.get('member', __stack);
            return result.stack.readBigNumberOpt();
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (Multisig_errors[e.exitCode.toString()]) {
                    throw new Error(Multisig_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
    async getMembers(provider: ContractProvider) {
        try {
            let __stack: TupleItem[] = [];
            let result = await provider.get('members', __stack);
            return result.stack.readCellOpt();
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (Multisig_errors[e.exitCode.toString()]) {
                    throw new Error(Multisig_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
}