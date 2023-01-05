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
        b_0.storeRef(src.code);
        b_0.storeRef(src.data);
    };
}

export function loadStateInit(slice: Slice) {
    let sc_0 = slice;
    let _code = sc_0.loadRef();
    let _data = sc_0.loadRef();
    return { $$type: 'StateInit' as const, code: _code, data: _data };
}

function loadTupleStateInit(source: TupleReader) {
    const _code = source.readCell();
    const _data = source.readCell();
    return { $$type: 'StateInit' as const, code: _code, data: _data };
}

function storeTupleStateInit(source: StateInit) {
    let __tuple: TupleItem[] = [];
    __tuple.push({ type: 'cell', cell: source.code });
    __tuple.push({ type: 'cell', cell: source.data });
    return __tuple;
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
        b_0.storeBit(src.bounced);
        b_0.storeAddress(src.sender);
        b_0.storeInt(src.value, 257);
        b_0.storeRef(src.raw);
    };
}

export function loadContext(slice: Slice) {
    let sc_0 = slice;
    let _bounced = sc_0.loadBit();
    let _sender = sc_0.loadAddress();
    let _value = sc_0.loadIntBig(257);
    let _raw = sc_0.loadRef();
    return { $$type: 'Context' as const, bounced: _bounced, sender: _sender, value: _value, raw: _raw };
}

function loadTupleContext(source: TupleReader) {
    const _bounced = source.readBoolean();
    const _sender = source.readAddress();
    const _value = source.readBigNumber();
    const _raw = source.readCell();
    return { $$type: 'Context' as const, bounced: _bounced, sender: _sender, value: _value, raw: _raw };
}

function storeTupleContext(source: Context) {
    let __tuple: TupleItem[] = [];
    __tuple.push({ type: 'int', value: source.bounced ? -1n : 0n });
    __tuple.push({ type: 'slice', cell: beginCell().storeAddress(source.sender).endCell() });
    __tuple.push({ type: 'int', value: source.value });
    __tuple.push({ type: 'slice', cell: source.raw });
    return __tuple;
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
        b_0.storeBit(src.bounce);
        b_0.storeAddress(src.to);
        b_0.storeInt(src.value, 257);
        b_0.storeInt(src.mode, 257);
        if (src.body !== null) {
            b_0.storeBit(true);
            b_0.storeRef(src.body);
        } else {
            b_0.storeBit(false);
        }
        if (src.code !== null) {
            b_0.storeBit(true);
            b_0.storeRef(src.code);
        } else {
            b_0.storeBit(false);
        }
        if (src.data !== null) {
            b_0.storeBit(true);
            b_0.storeRef(src.data);
        } else {
            b_0.storeBit(false);
        }
    };
}

export function loadSendParameters(slice: Slice) {
    let sc_0 = slice;
    let _bounce = sc_0.loadBit();
    let _to = sc_0.loadAddress();
    let _value = sc_0.loadIntBig(257);
    let _mode = sc_0.loadIntBig(257);
    let _body: Cell | null = null;
    if (sc_0.loadBit()) {
        _body = sc_0.loadRef();
    }
    let _code: Cell | null = null;
    if (sc_0.loadBit()) {
        _code = sc_0.loadRef();
    }
    let _data: Cell | null = null;
    if (sc_0.loadBit()) {
        _data = sc_0.loadRef();
    }
    return { $$type: 'SendParameters' as const, bounce: _bounce, to: _to, value: _value, mode: _mode, body: _body, code: _code, data: _data };
}

function loadTupleSendParameters(source: TupleReader) {
    const _bounce = source.readBoolean();
    const _to = source.readAddress();
    const _value = source.readBigNumber();
    const _mode = source.readBigNumber();
    const _body = source.readCellOpt();
    const _code = source.readCellOpt();
    const _data = source.readCellOpt();
    return { $$type: 'SendParameters' as const, bounce: _bounce, to: _to, value: _value, mode: _mode, body: _body, code: _code, data: _data };
}

function storeTupleSendParameters(source: SendParameters) {
    let __tuple: TupleItem[] = [];
    __tuple.push({ type: 'int', value: source.bounce ? -1n : 0n });
    __tuple.push({ type: 'slice', cell: beginCell().storeAddress(source.to).endCell() });
    __tuple.push({ type: 'int', value: source.value });
    __tuple.push({ type: 'int', value: source.mode });
    if (source.body !== null) {
        __tuple.push({ type: 'cell', cell: source.body });
    } else {
        __tuple.push({ type: 'null' });
    }
    if (source.code !== null) {
        __tuple.push({ type: 'cell', cell: source.code });
    } else {
        __tuple.push({ type: 'null' });
    }
    if (source.data !== null) {
        __tuple.push({ type: 'cell', cell: source.data });
    } else {
        __tuple.push({ type: 'null' });
    }
    return __tuple;
}

export type Transfer = {
    $$type: 'Transfer';
    seqno: bigint;
    mode: bigint;
    to: Address;
    amount: bigint;
    body: Cell | null;
}

export function storeTransfer(src: Transfer) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(src.seqno, 32);
        b_0.storeUint(src.mode, 8);
        b_0.storeAddress(src.to);
        b_0.storeCoins(src.amount);
        if (src.body !== null) {
            b_0.storeBit(true);
            b_0.storeRef(src.body);
        } else {
            b_0.storeBit(false);
        }
    };
}

export function loadTransfer(slice: Slice) {
    let sc_0 = slice;
    let _seqno = sc_0.loadUintBig(32);
    let _mode = sc_0.loadUintBig(8);
    let _to = sc_0.loadAddress();
    let _amount = sc_0.loadCoins();
    let _body: Cell | null = null;
    if (sc_0.loadBit()) {
        _body = sc_0.loadRef();
    }
    return { $$type: 'Transfer' as const, seqno: _seqno, mode: _mode, to: _to, amount: _amount, body: _body };
}

function loadTupleTransfer(source: TupleReader) {
    const _seqno = source.readBigNumber();
    const _mode = source.readBigNumber();
    const _to = source.readAddress();
    const _amount = source.readBigNumber();
    const _body = source.readCellOpt();
    return { $$type: 'Transfer' as const, seqno: _seqno, mode: _mode, to: _to, amount: _amount, body: _body };
}

function storeTupleTransfer(source: Transfer) {
    let __tuple: TupleItem[] = [];
    __tuple.push({ type: 'int', value: source.seqno });
    __tuple.push({ type: 'int', value: source.mode });
    __tuple.push({ type: 'slice', cell: beginCell().storeAddress(source.to).endCell() });
    __tuple.push({ type: 'int', value: source.amount });
    if (source.body !== null) {
        __tuple.push({ type: 'cell', cell: source.body });
    } else {
        __tuple.push({ type: 'null' });
    }
    return __tuple;
}

export type TransferMessage = {
    $$type: 'TransferMessage';
    signature: Cell;
    transfer: Transfer;
}

export function storeTransferMessage(src: TransferMessage) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(123, 32);
        b_0.storeRef(src.signature);
        b_0.store(storeTransfer(src.transfer));
    };
}

export function loadTransferMessage(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 123) { throw Error('Invalid prefix'); }
    let _signature = sc_0.loadRef();
    let _transfer = loadTransfer(sc_0);
    return { $$type: 'TransferMessage' as const, signature: _signature, transfer: _transfer };
}

function loadTupleTransferMessage(source: TupleReader) {
    const _signature = source.readCell();
    const _transfer = loadTupleTransfer(source.readTuple());
    return { $$type: 'TransferMessage' as const, signature: _signature, transfer: _transfer };
}

function storeTupleTransferMessage(source: TransferMessage) {
    let __tuple: TupleItem[] = [];
    __tuple.push({ type: 'slice', cell: source.signature });
    __tuple.push({ type: 'tuple', items: storeTupleTransfer(source.transfer) });
    return __tuple;
}

async function Wallet_init(key: bigint, walletId: bigint) {
    const __code = 'te6ccgECLwEABGgAART/APSkE/S88sgLAQIBYgIDAgLLBAUCASAnKAIBzgYHAgEgDxAE9Tt+3Ah10nCH5UwINcLH94C0NMDAXGwwAGRf5Fw4gH6QCJQZm8E+GECjigw7UTQ1AH4YtMf0//TP1UgbBNVAvAfyPhCAcxVIFAjyx/L/8s/ye1U4CDAe+MCIMAAItdJwSGw4wLAAOMA7UTQ1AH4YtMf0//TP1UgbBNVAoAgJCgsACwgbvLQgIACiMO1E0NQB+GLTH9P/0z9VIGwTA9MfAcB78uCB1AHQAdMf0wf6QAEB+gBtAdIAAZIx1N5VQBBWNhB4EGdVBPAZyPhCAcxVIFAjyx/L/8s/ye1UAExb7UTQ1AH4YtMf0//TP1UgbBPwG8j4QgHMVSBQI8sfy//LP8ntVALyIPkBIILwhdKIOEwAQ0WLAoA8siBZ9ogDxVPDZWNENGRo2slh8ka6jihb7UTQ1AH4YtMf0//TP1UgbBPwGMj4QgHMVSBQI8sfy//LP8ntVNsx4CCC8A4jVyYQi1cA0Dad1xZ/av+4BqfgQFk3XdDg+ySXHnKyuuMCIAwNACjwGsj4QgHMVSBQI8sfy//LP8ntVABQW+1E0NQB+GLTH9P/0z9VIGwT8BzI+EIBzFUgUCPLH8v/yz/J7VTbMQHmgvBnJ9aXZfjyLHXFgeNWVEOX9aALuRvTLE0NltTJJoS8wrqOKFvtRNDUAfhi0x/T/9M/VSBsE/AdyPhCAcxVIFAjyx/L/8s/ye1U2zHggvCcoPGFUXTjLo/TeN9WpuT2xA5N/LYJDkmBL3seJiFL+brjAg4AUDDtRNDUAfhi0x/T/9M/VSBsE/AeyPhCAcxVIFAjyx/L/8s/ye1U2zECASAREgIBIBwdAgEgExQCASAYGQAVWUfwHKAOBwAcoAgCASAVFgH3MhxAcoBUAfwEXABygJQBc8WUAP6AnABymgjbrMlbrOxjj1/8BHIcPARcPARJG6zmX/wEQTwAVAEzJU0A3DwEeIkbrOZf/ARBPABUATMlTQDcPAR4nDwEQJ/8BECyVjMljMzAXDwEeIhbrOYf/ARAfABAcyUMXDwEeLJAYBcAHxwA8jMVSBQI8sfy//LP8mAABPsAAAVTAxgCASAaGwAFGwhgAAMW4AIBIB4fAgEgIiMCASAlIAIBICEkAIsVHQyU0PIVUBQRcsfEssHAc8WAfoCIW6UcDLKAJV/AcoAzOLJ+QCCAL0RUXn5EBby9IFE9lFIuhTy9Aakf1B0QzBtbfASgABsMPhBbyRfA7OTAqQC3oAIBICQkAgEgJSYAGT4QW8kXwOzkwKkAt6AAASAAAwwgAgEgKSoCASAtLgAJu6E/ATgCAUgrLAArsyX7UTQ1AH4YtMf0//TP1UgbBPwF4AArsH47UTQ1AH4YtMf0//TP1UgbBPwFYABNu70YJwXOw9XSyuex6E7DnWSoUbZoJwndY1LStkfLMi068t/fFiOYACu4BK7UTQ1AH4YtMf0//TP1UgbBPwFo';
    const __system = 'te6cckECMQEABHIAAQHAAQEFoHL9AgEU/wD0pBP0vPLICwMCAWINBAIBIAgFAgEgBwYAK7gErtRNDUAfhi0x/T/9M/VSBsE/AWgATbu9GCcFzsPV0srnsehOw51kqFG2aCcJ3WNS0rZHyzItOvLf3xYjmAIBIAwJAgFICwoAK7B+O1E0NQB+GLTH9P/0z9VIGwT8BWAAK7Ml+1E0NQB+GLTH9P/0z9VIGwT8BeAACbuhPwE4AgLLJw4CASAbDwIBIBQQAgEgExECASAaEgADDCACASAWFgIBIBgVAgEgFxYAGT4QW8kXwOzkwKkAt6AAGww+EFvJF8Ds5MCpALegAgEgGhkAixUdDJTQ8hVQFBFyx8SywcBzxYB+gIhbpRwMsoAlX8BygDM4sn5AIIAvRFRefkQFvL0gUT2UUi6FPL0BqR/UHRDMG1t8BKAAASACASAhHAIBICAdAgEgHx4AAxbgAAUbCGAABVMDGAIBICYiAgEgJCMAHxwA8jMVSBQI8sfy//LP8mAB9zIcQHKAVAH8BFwAcoCUAXPFlAD+gJwAcpoI26zJW6zsY49f/ARyHDwEXDwESRus5l/8BEE8AFQBMyVNANw8BHiJG6zmX/wEQTwAVAEzJU0A3DwEeJw8BECf/ARAslYzJYzMwFw8BHiIW6zmH/wEQHwAQHMlDFw8BHiyQGAlAAT7AAAVWUfwHKAOBwAcoAgCAc4pKAALCBu8tCAgBPU7ftwIddJwh+VMCDXCx/eAtDTAwFxsMABkX+RcOIB+kAiUGZvBPhhAo4oMO1E0NQB+GLTH9P/0z9VIGwTVQLwH8j4QgHMVSBQI8sfy//LP8ntVOAgwHvjAiDAACLXScEhsOMCwADjAO1E0NQB+GLTH9P/0z9VIGwTVQKAwLysqACjwGsj4QgHMVSBQI8sfy//LP8ntVALyIPkBIILwhdKIOEwAQ0WLAoA8siBZ9ogDxVPDZWNENGRo2slh8ka6jihb7UTQ1AH4YtMf0//TP1UgbBPwGMj4QgHMVSBQI8sfy//LP8ntVNsx4CCC8A4jVyYQi1cA0Dad1xZ/av+4BqfgQFk3XdDg+ySXHnKyuuMCIC4sAeaC8Gcn1pdl+PIsdcWB41ZUQ5f1oAu5G9MsTQ2W1MkmhLzCuo4oW+1E0NQB+GLTH9P/0z9VIGwT8B3I+EIBzFUgUCPLH8v/yz/J7VTbMeCC8Jyg8YVRdOMuj9N431am5PbEDk38tgkOSYEvex4mIUv5uuMCLQBQMO1E0NQB+GLTH9P/0z9VIGwT8B7I+EIBzFUgUCPLH8v/yz/J7VTbMQBQW+1E0NQB+GLTH9P/0z9VIGwT8BzI+EIBzFUgUCPLH8v/yz/J7VTbMQBMW+1E0NQB+GLTH9P/0z9VIGwT8BvI+EIBzFUgUCPLH8v/yz/J7VQAojDtRNDUAfhi0x/T/9M/VSBsEwPTHwHAe/LggdQB0AHTH9MH+kABAfoAbQHSAAGSMdTeVUAQVjYQeBBnVQTwGcj4QgHMVSBQI8sfy//LP8ntVHonsjw=';
    let systemCell = Cell.fromBase64(__system);
    let __tuple: TupleItem[] = [];
    __tuple.push({ type: 'cell', cell: systemCell });
    __tuple.push({ type: 'int', value: key });
    __tuple.push({ type: 'int', value: walletId });
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let system = await ContractSystem.create();
    let executor = await ContractExecutor.create({ code: codeCell, data: new Cell() }, system);
    let res = await executor.get('init_Wallet', __tuple);
    if (!res.success) { throw Error(res.error); }
    if (res.exitCode !== 0 && res.exitCode !== 1) {
        if (Wallet_errors[res.exitCode]) {
            throw new ComputeError(Wallet_errors[res.exitCode].message, res.exitCode, { logs: res.vmLogs });
        } else {
            throw new ComputeError('Exit code: ' + res.exitCode, res.exitCode, { logs: res.vmLogs });
        }
    }
    
    let data = res.stack.readCell();
    return { code: codeCell, data };
}

const Wallet_errors: { [key: number]: { message: string } } = {
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
    17654: { message: `Invalid seqno` },
    48401: { message: `Invalid signature` },
}

export class Wallet implements Contract {
    
    static async init(key: bigint, walletId: bigint) {
        return await Wallet_init(key,walletId);
    }
    
    static async fromInit(key: bigint, walletId: bigint) {
        const init = await Wallet_init(key,walletId);
        const address = contractAddress(0, init);
        return new Wallet(address, init);
    }
    
    static fromAddress(address: Address) {
        return new Wallet(address);
    }
    
    readonly address: Address; 
    readonly init?: { code: Cell, data: Cell };
    readonly abi: ContractABI = {
        errors: Wallet_errors
    };
    
    private constructor(address: Address, init?: { code: Cell, data: Cell }) {
        this.address = address;
        this.init = init;
    }
    
    async send(provider: ContractProvider, via: Sender, args: { value: bigint, bounce?: boolean| null | undefined }, message: 'Deploy' | TransferMessage | Slice | null | 'notify' | 'слава україни' | 'duplicate') {
        
        let body: Cell | null = null;
        if (message === 'Deploy') {
            body = beginCell().storeUint(0, 32).storeBuffer(Buffer.from(message)).endCell();
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'TransferMessage') {
            body = beginCell().store(storeTransferMessage(message)).endCell();
        }
        if (message && typeof message === 'object' && message instanceof Slice) {
            body = message.asCell();
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
        
        await provider.internal(via, { ...args, body: body });
        
    }
    
    async getPublicKey(provider: ContractProvider) {
        let __tuple: TupleItem[] = [];
        let result = await provider.get('publicKey', __tuple);
        return result.stack.readBigNumber();
    }
    
    async getWalletId(provider: ContractProvider) {
        let __tuple: TupleItem[] = [];
        let result = await provider.get('walletId', __tuple);
        return result.stack.readBigNumber();
    }
    
    async getSeqno(provider: ContractProvider) {
        let __tuple: TupleItem[] = [];
        let result = await provider.get('seqno', __tuple);
        return result.stack.readBigNumber();
    }
    
}