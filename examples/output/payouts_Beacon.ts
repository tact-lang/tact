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
export type ChangeOwner = {
    $$type: 'ChangeOwner';
    newOwner: Address;
}

export function storeChangeOwner(src: ChangeOwner) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0 = b_0.storeUint(3067051791, 32);
        b_0 = b_0.storeAddress(src.newOwner);
    };
}

export function packStackChangeOwner(src: ChangeOwner, __stack: TupleItem[]) {
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.newOwner).endCell() });
}

export function packTupleChangeOwner(src: ChangeOwner): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.newOwner).endCell() });
    return __stack;
}

export function unpackStackChangeOwner(slice: TupleReader): ChangeOwner {
    const newOwner = slice.readAddress();
    return { $$type: 'ChangeOwner', newOwner: newOwner };
}
export function unpackTupleChangeOwner(slice: TupleReader): ChangeOwner {
    const newOwner = slice.readAddress();
    return { $$type: 'ChangeOwner', newOwner: newOwner };
}
export type CanPayout = {
    $$type: 'CanPayout';
    amount: bigint;
}

export function storeCanPayout(src: CanPayout) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0 = b_0.storeUint(1050587494, 32);
        b_0 = b_0.storeInt(src.amount, 257);
    };
}

export function packStackCanPayout(src: CanPayout, __stack: TupleItem[]) {
    __stack.push({ type: 'int', value: src.amount });
}

export function packTupleCanPayout(src: CanPayout): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'int', value: src.amount });
    return __stack;
}

export function unpackStackCanPayout(slice: TupleReader): CanPayout {
    const amount = slice.readBigNumber();
    return { $$type: 'CanPayout', amount: amount };
}
export function unpackTupleCanPayout(slice: TupleReader): CanPayout {
    const amount = slice.readBigNumber();
    return { $$type: 'CanPayout', amount: amount };
}
export type CanPayoutResponse = {
    $$type: 'CanPayoutResponse';
    amount: bigint;
    address: Address;
    ok: boolean;
}

export function storeCanPayoutResponse(src: CanPayoutResponse) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0 = b_0.storeUint(1861678417, 32);
        b_0 = b_0.storeInt(src.amount, 257);
        b_0 = b_0.storeAddress(src.address);
        b_0 = b_0.storeBit(src.ok);
    };
}

export function packStackCanPayoutResponse(src: CanPayoutResponse, __stack: TupleItem[]) {
    __stack.push({ type: 'int', value: src.amount });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.address).endCell() });
    __stack.push({ type: 'int', value: src.ok ? -1n : 0n });
}

export function packTupleCanPayoutResponse(src: CanPayoutResponse): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'int', value: src.amount });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.address).endCell() });
    __stack.push({ type: 'int', value: src.ok ? -1n : 0n });
    return __stack;
}

export function unpackStackCanPayoutResponse(slice: TupleReader): CanPayoutResponse {
    const amount = slice.readBigNumber();
    const address = slice.readAddress();
    const ok = slice.readBoolean();
    return { $$type: 'CanPayoutResponse', amount: amount, address: address, ok: ok };
}
export function unpackTupleCanPayoutResponse(slice: TupleReader): CanPayoutResponse {
    const amount = slice.readBigNumber();
    const address = slice.readAddress();
    const ok = slice.readBoolean();
    return { $$type: 'CanPayoutResponse', amount: amount, address: address, ok: ok };
}
async function Beacon_init(master: Address, owner: Address) {
    const __code = 'te6ccgECGgEAAm4AART/APSkE/S88sgLAQIBYgIDAgLLBAUCASAWFwIBIAYHAgFIDg8CAdQICQIB9AsMAcUcCHXScIflTAg1wsf3gLQ0wMBcbDAAZF/kXDiAfpAIlBmbwT4YQKOLDDtRNDUAfhi+kABAfpAAQHSAFUgbBNVAvAUyPhCAcxVIFrPFljPFsoAye1U4IIQPp6xZrrjAjDywIKAKAAsIG7y0ICAAgO1E0NQB+GL6QAEB+kABAdIAVSBsEwPTHwGCED6esWa68uCBgQEB1wABMUEw8BPI+EIBzFUgWs8WWM8WygDJ7VQAFSUfwHKAOBwAcoAgAfcyHEBygFQB/AOcAHKAlAFzxZQA/oCcAHKaCNusyVus7GOPX/wDshw8A5w8A4kbrOZf/AOBPABUATMlTQDcPAO4iRus5l/8A4E8AFQBMyVNANw8A7icPAOAn/wDgLJWMyWMzMBcPAO4iFus5h/8A4B8AEBzJQxcPAO4skBgDQAE+wACASAQEQAF0tuEAgEgEhMCASAUFQAlPhBbyQQI18DfwJwgEJYbW3wD4AAdHADyMwDWs8WWM8WygDJgAAUMDGAAsz4QW8kW4ERTTIlxwXy9IIQBfXhAHD7AiGOH38yIn/IVSCCEG729VFQBMsfEoEBAc8AAc8WygDJ8BCOHSJwyFUgghBu9vVRUATLHxKBAQHPAAHPFsoAyfAQ4oAAzvijvaiaGoA/DF9IACA/SAAgOkAKpA2CfgJQCAWYYGQAJsOX8BGAAcbL0YJwXOw9XSyuex6E7DnWSoUbZoJwndY1LStkfLMi068t/fFiOYJwQM51aecV+dJQsB1hbiZHsoA==';
    const depends = Dictionary.empty(Dictionary.Keys.Uint(16), Dictionary.Values.Cell());
    let systemCell = beginCell().storeDict(depends).endCell();
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'cell', cell: systemCell });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(master).endCell() });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(owner).endCell() });
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let system = await ContractSystem.create();
    let executor = await ContractExecutor.create({ code: codeCell, data: new Cell() }, system);
    let res = await executor.get('init_Beacon', __stack);
    if (!res.success) { throw Error(res.error); }
    let data = res.stack.readCell();
    return { code: codeCell, data };
}

export const Beacon_errors: { [key: string]: string } = {
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
    '16059': `Invalid value`,
    '48401': `Invalid signature`,
    '62972': `Invalid balance`,
}

export class Beacon {
    
    static async init(master: Address, owner: Address) {
        return await Beacon_init(master,owner);
    }
    
    static async fromInit(master: Address, owner: Address) {
        const init = await Beacon_init(master,owner);
        const address = contractAddress(0, init);
        return new Beacon(address, init);
    }
    
    static fromAddress(address: Address) {
        return new Beacon(address);
    }
    
    readonly address: Address; 
    readonly init?: { code: Cell, data: Cell };
    private constructor(address: Address, init?: { code: Cell, data: Cell }) {
        this.address = address;
        this.init = init;
    }
    
    async send(provider: ContractProvider, via: Sender, args: { value: bigint, bounce?: boolean| null | undefined }, message: CanPayout) {
        
        let body: Cell | null = null;
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'CanPayout') {
            body = beginCell().store(storeCanPayout(message)).endCell();
        }
        if (body === null) { throw new Error('Invalid message type'); }
        
        await provider.internal(via, { ...args, body: body });
        
    }
    
    async getOwner(provider: ContractProvider) {
        try {
            let __stack: TupleItem[] = [];
            let result = await provider.get('owner', __stack);
            return result.stack.readAddress();
        } catch (e) {
            if (e instanceof ComputeError) {
                if (e.debugLogs && e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (Beacon_errors[e.exitCode.toString()]) {
                    throw new Error(Beacon_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    
}