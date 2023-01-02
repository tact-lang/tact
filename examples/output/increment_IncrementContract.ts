import { Cell, Slice, Address, Builder, beginCell, ComputeError, TupleItem, TupleReader, Dictionary, contractAddress, ContractProvider, Sender, Contract, ContractABI } from 'ton-core';
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
export type Increment = {
    $$type: 'Increment';
    key: bigint;
    value: bigint;
}

export function storeIncrement(src: Increment) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0 = b_0.storeUint(3615081709, 32);
        b_0 = b_0.storeInt(src.key, 257);
        b_0 = b_0.storeInt(src.value, 257);
    };
}

export function packStackIncrement(src: Increment, __stack: TupleItem[]) {
    __stack.push({ type: 'int', value: src.key });
    __stack.push({ type: 'int', value: src.value });
}

export function packTupleIncrement(src: Increment): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'int', value: src.key });
    __stack.push({ type: 'int', value: src.value });
    return __stack;
}

export function unpackStackIncrement(slice: TupleReader): Increment {
    const key = slice.readBigNumber();
    const value = slice.readBigNumber();
    return { $$type: 'Increment', key: key, value: value };
}
export function unpackTupleIncrement(slice: TupleReader): Increment {
    const key = slice.readBigNumber();
    const value = slice.readBigNumber();
    return { $$type: 'Increment', key: key, value: value };
}
export type Toggle = {
    $$type: 'Toggle';
    key: bigint;
}

export function storeToggle(src: Toggle) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0 = b_0.storeUint(575056061, 32);
        b_0 = b_0.storeInt(src.key, 257);
    };
}

export function packStackToggle(src: Toggle, __stack: TupleItem[]) {
    __stack.push({ type: 'int', value: src.key });
}

export function packTupleToggle(src: Toggle): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'int', value: src.key });
    return __stack;
}

export function unpackStackToggle(slice: TupleReader): Toggle {
    const key = slice.readBigNumber();
    return { $$type: 'Toggle', key: key };
}
export function unpackTupleToggle(slice: TupleReader): Toggle {
    const key = slice.readBigNumber();
    return { $$type: 'Toggle', key: key };
}
export type Persist = {
    $$type: 'Persist';
    key: bigint;
    content: Cell | null;
}

export function storePersist(src: Persist) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0 = b_0.storeUint(140802882, 32);
        b_0 = b_0.storeInt(src.key, 257);
        if (src.content !== null) {
            b_0 = b_0.storeBit(true);
            b_0 = b_0.storeRef(src.content);
        } else {
            b_0 = b_0.storeBit(false);
        }
    };
}

export function packStackPersist(src: Persist, __stack: TupleItem[]) {
    __stack.push({ type: 'int', value: src.key });
    if (src.content !== null) {
        __stack.push({ type: 'cell', cell: src.content });
    } else {
        __stack.push({ type: 'null' });
    }
}

export function packTuplePersist(src: Persist): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'int', value: src.key });
    if (src.content !== null) {
        __stack.push({ type: 'cell', cell: src.content });
    } else {
        __stack.push({ type: 'null' });
    }
    return __stack;
}

export function unpackStackPersist(slice: TupleReader): Persist {
    const key = slice.readBigNumber();
    const content = slice.readCellOpt();
    return { $$type: 'Persist', key: key, content: content };
}
export function unpackTuplePersist(slice: TupleReader): Persist {
    const key = slice.readBigNumber();
    const content = slice.readCellOpt();
    return { $$type: 'Persist', key: key, content: content };
}
export type Reset = {
    $$type: 'Reset';
    key: bigint;
}

export function storeReset(src: Reset) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0 = b_0.storeUint(2438762569, 32);
        b_0 = b_0.storeInt(src.key, 257);
    };
}

export function packStackReset(src: Reset, __stack: TupleItem[]) {
    __stack.push({ type: 'int', value: src.key });
}

export function packTupleReset(src: Reset): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'int', value: src.key });
    return __stack;
}

export function unpackStackReset(slice: TupleReader): Reset {
    const key = slice.readBigNumber();
    return { $$type: 'Reset', key: key };
}
export function unpackTupleReset(slice: TupleReader): Reset {
    const key = slice.readBigNumber();
    return { $$type: 'Reset', key: key };
}
export type Something = {
    $$type: 'Something';
    value: bigint;
}

export function storeSomething(src: Something) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0 = b_0.storeInt(src.value, 257);
    };
}

export function packStackSomething(src: Something, __stack: TupleItem[]) {
    __stack.push({ type: 'int', value: src.value });
}

export function packTupleSomething(src: Something): TupleItem[] {
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'int', value: src.value });
    return __stack;
}

export function unpackStackSomething(slice: TupleReader): Something {
    const value = slice.readBigNumber();
    return { $$type: 'Something', value: value };
}
export function unpackTupleSomething(slice: TupleReader): Something {
    const value = slice.readBigNumber();
    return { $$type: 'Something', value: value };
}
async function IncrementContract_init() {
    const __code = 'te6ccgECKgEAA/QAART/APSkE/S88sgLAQIBYgIDAgLLBAUCASAkJQIBIAYHAgEgGBkCASAICQAPvEDd5aEA3kMCASAKCwIBIBITAgEgDA0AI1IW6VW1n0WjDgyAHPAEEz9EKASdHAh10nCH5UwINcLH94C0NMDAXGwwAGRf5Fw4gH6QCJQZm8E+GECkVvgIIIQ13nE7brjAiCCECJGqL264wIgghAIZHtCuuMCghCRXJBJuoA4PEBEACwgbvLQgIAC8MO1E0NQB+GL0BPQE1AHQ9AT0BPQEMBA1EDRsFQXTHwGCENd5xO268uCBgQEB1wCBAQHXAFkyEFYQRRA0QwDwGMj4QgHMVUBQRfQAEvQAAcj0ABL0ABL0AMkBzMntVACuMO1E0NQB+GL0BPQE1AHQ9AT0BPQEMBA1EDRsFQXTHwGCECJGqL268uCBgQEB1wABMRBFEDRBMPAZyPhCAcxVQFBF9AAS9AAByPQAEvQAEvQAyQHMye1UAMQw7UTQ1AH4YvQE9ATUAdD0BPQE9AQwEDUQNGwVBdMfAYIQCGR7Qrry4IGBAQHXAG0B0gABkjHU3lkyEFYQRRA0QwDwGsj4QgHMVUBQRfQAEvQAAcj0ABL0ABL0AMkBzMntVAC6jlbtRNDUAfhi9AT0BNQB0PQE9AT0BDAQNRA0bBUF0x8BghCRXJBJuvLggYEBAdcAATEQRRA0QTDwG8j4QgHMVUBQRfQAEvQAAcj0ABL0ABL0AMkBzMntVOAw8sCCAgEgFBUCASAWFwAdEEz9AxvoZQB1wAw4FttgABsIG6VMFn0WjDgQTP0FYAARFn0DW+h3DBtgACMIW6VW1n0WTDgyAHPAEEz9EGACAVgaGwIBSB4fAD1W1tbW1tBcjMBVBF9AAS9AAByPQAEvQAEvQAyQHMyYAgEgHB0ABRfBIAAHBRfBIAIBICAhAgEgIiMAQz4QW8kECNfA4EBASAQOUFAUpDwAxAjgQELQAeBAQHwBwGAASwkgQEBInHwBCBumjAUgQEBAX9x8AOdgQEBAfABsxA2EnHwA+IDgAC8ggDOKSWBAQEk8AZu8vQQJIEBAVnwBQKAAmyBAQFtUxIQSVnwAwSBAQEmbXHwAwOBAQEmbfAFgQEL+EFvJBAjXwMQJG2BAQHwB4EBAW0gbpIwbZvwDsgBAYEBAc8AyeJBcPAFEDRBMIAIBICYnAE293owTgudh6ullc9j0J2HOslQo2zQThO6xqWlbI+WZFp15b++LEcwCASAoKQA/u0B+1E0NQB+GL0BPQE1AHQ9AT0BPQEMBA1EDRsFfAWgACbQ+/gKwAD+14F2omhqAPwxegJ6AmoA6HoCegJ6AhgIGogaNgr4C8A==';
    const depends = Dictionary.empty(Dictionary.Keys.Uint(16), Dictionary.Values.Cell());
    let systemCell = beginCell().storeDict(depends).endCell();
    let __stack: TupleItem[] = [];
    __stack.push({ type: 'cell', cell: systemCell });
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let system = await ContractSystem.create();
    let executor = await ContractExecutor.create({ code: codeCell, data: new Cell() }, system);
    let res = await executor.get('init_IncrementContract', __stack);
    if (!res.success) { throw Error(res.error); }
    let data = res.stack.readCell();
    return { code: codeCell, data };
}

const IncrementContract_errors: { [key: number]: { message: string } } = {
    2: { message: `Stack undeflow` },
    3: { message: `Stack overflow` },
    4: { message: `Integer overflow` },
    5: { message: `Integer out of expected range` },
    6: { message: `Invalid opcode` },
    7: { message: `Type check error` },
    8: { message: `Cell overflow` },
    9: { message: `Cell underflow` },
    10: { message: `Dictionary error` },
    13: { message: `Out of gas error` },
    32: { message: `Method ID not found` },
    34: { message: `Action is invalid or not supported` },
    37: { message: `Not enough TON` },
    38: { message: `Not enough extra-currencies` },
    128: { message: `Null reference exception` },
    129: { message: `Invalid serialization prefix` },
    130: { message: `Invalid incoming message` },
    131: { message: `Constraints error` },
    132: { message: `Access denied` },
    133: { message: `Contract stopped` },
    134: { message: `Invalid argument` },
    52777: { message: `Empty counter` },
}

export class IncrementContract implements Contract {
    
    static async init() {
        return await IncrementContract_init();
    }
    
    static async fromInit() {
        const init = await IncrementContract_init();
        const address = contractAddress(0, init);
        return new IncrementContract(address, init);
    }
    
    static fromAddress(address: Address) {
        return new IncrementContract(address);
    }
    
    readonly address: Address; 
    readonly init?: { code: Cell, data: Cell };
    readonly abi: ContractABI = {
        errors: IncrementContract_errors
    };
    
    private constructor(address: Address, init?: { code: Cell, data: Cell }) {
        this.address = address;
        this.init = init;
    }
    
    async send(provider: ContractProvider, via: Sender, args: { value: bigint, bounce?: boolean| null | undefined }, message: Increment | Toggle | Persist | Reset) {
        
        let body: Cell | null = null;
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'Increment') {
            body = beginCell().store(storeIncrement(message)).endCell();
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'Toggle') {
            body = beginCell().store(storeToggle(message)).endCell();
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'Persist') {
            body = beginCell().store(storePersist(message)).endCell();
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'Reset') {
            body = beginCell().store(storeReset(message)).endCell();
        }
        if (body === null) { throw new Error('Invalid message type'); }
        
        await provider.internal(via, { ...args, body: body });
        
    }
    
    async getCounters(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('counters', __stack);
        return result.stack.readCellOpt();
    }
    
    async getCounters2(provider: ContractProvider) {
        let __stack: TupleItem[] = [];
        let result = await provider.get('counters2', __stack);
        return result.stack.readCellOpt();
    }
    
}