import { 
    Cell,
    Slice, 
    Address, 
    Builder, 
    beginCell, 
    ComputeError, 
    TupleItem, 
    TupleReader, 
    Dictionary, 
    contractAddress, 
    ContractProvider, 
    Sender, 
    Contract, 
    ContractABI, 
    TupleBuilder,
    DictionaryValue
} from 'ton-core';
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
    let _code = source.readCell();
    let _data = source.readCell();
    return { $$type: 'StateInit' as const, code: _code, data: _data };
}

function storeTupleStateInit(source: StateInit) {
    let builder = new TupleBuilder();
    builder.writeCell(source.code);
    builder.writeCell(source.data);
    return builder.build();
}

function dictValueParserStateInit(): DictionaryValue<StateInit> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeStateInit(src)).endCell());
        },
        parse: (src) => {
            return loadStateInit(src.loadRef().beginParse());
        }
    }
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
    let _bounced = source.readBoolean();
    let _sender = source.readAddress();
    let _value = source.readBigNumber();
    let _raw = source.readCell();
    return { $$type: 'Context' as const, bounced: _bounced, sender: _sender, value: _value, raw: _raw };
}

function storeTupleContext(source: Context) {
    let builder = new TupleBuilder();
    builder.writeBoolean(source.bounced);
    builder.writeAddress(source.sender);
    builder.writeNumber(source.value);
    builder.writeSlice(source.raw);
    return builder.build();
}

function dictValueParserContext(): DictionaryValue<Context> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeContext(src)).endCell());
        },
        parse: (src) => {
            return loadContext(src.loadRef().beginParse());
        }
    }
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
        if (src.body !== null && src.body !== undefined) { b_0.storeBit(true).storeRef(src.body); } else { b_0.storeBit(false); }
        if (src.code !== null && src.code !== undefined) { b_0.storeBit(true).storeRef(src.code); } else { b_0.storeBit(false); }
        if (src.data !== null && src.data !== undefined) { b_0.storeBit(true).storeRef(src.data); } else { b_0.storeBit(false); }
    };
}

export function loadSendParameters(slice: Slice) {
    let sc_0 = slice;
    let _bounce = sc_0.loadBit();
    let _to = sc_0.loadAddress();
    let _value = sc_0.loadIntBig(257);
    let _mode = sc_0.loadIntBig(257);
    let _body = sc_0.loadBit() ? sc_0.loadRef() : null;
    let _code = sc_0.loadBit() ? sc_0.loadRef() : null;
    let _data = sc_0.loadBit() ? sc_0.loadRef() : null;
    return { $$type: 'SendParameters' as const, bounce: _bounce, to: _to, value: _value, mode: _mode, body: _body, code: _code, data: _data };
}

function loadTupleSendParameters(source: TupleReader) {
    let _bounce = source.readBoolean();
    let _to = source.readAddress();
    let _value = source.readBigNumber();
    let _mode = source.readBigNumber();
    let _body = source.readCellOpt();
    let _code = source.readCellOpt();
    let _data = source.readCellOpt();
    return { $$type: 'SendParameters' as const, bounce: _bounce, to: _to, value: _value, mode: _mode, body: _body, code: _code, data: _data };
}

function storeTupleSendParameters(source: SendParameters) {
    let builder = new TupleBuilder();
    builder.writeBoolean(source.bounce);
    builder.writeAddress(source.to);
    builder.writeNumber(source.value);
    builder.writeNumber(source.mode);
    builder.writeCell(source.body);
    builder.writeCell(source.code);
    builder.writeCell(source.data);
    return builder.build();
}

function dictValueParserSendParameters(): DictionaryValue<SendParameters> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeSendParameters(src)).endCell());
        },
        parse: (src) => {
            return loadSendParameters(src.loadRef().beginParse());
        }
    }
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
        if (src.body !== null && src.body !== undefined) { b_0.storeBit(true).storeRef(src.body); } else { b_0.storeBit(false); }
    };
}

export function loadTransfer(slice: Slice) {
    let sc_0 = slice;
    let _seqno = sc_0.loadUintBig(32);
    let _mode = sc_0.loadUintBig(8);
    let _to = sc_0.loadAddress();
    let _amount = sc_0.loadCoins();
    let _body = sc_0.loadBit() ? sc_0.loadRef() : null;
    return { $$type: 'Transfer' as const, seqno: _seqno, mode: _mode, to: _to, amount: _amount, body: _body };
}

function loadTupleTransfer(source: TupleReader) {
    let _seqno = source.readBigNumber();
    let _mode = source.readBigNumber();
    let _to = source.readAddress();
    let _amount = source.readBigNumber();
    let _body = source.readCellOpt();
    return { $$type: 'Transfer' as const, seqno: _seqno, mode: _mode, to: _to, amount: _amount, body: _body };
}

function storeTupleTransfer(source: Transfer) {
    let builder = new TupleBuilder();
    builder.writeNumber(source.seqno);
    builder.writeNumber(source.mode);
    builder.writeAddress(source.to);
    builder.writeNumber(source.amount);
    builder.writeCell(source.body);
    return builder.build();
}

function dictValueParserTransfer(): DictionaryValue<Transfer> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeTransfer(src)).endCell());
        },
        parse: (src) => {
            return loadTransfer(src.loadRef().beginParse());
        }
    }
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
    let _signature = source.readCell();
    const _transfer = loadTupleTransfer(source.readTuple());
    return { $$type: 'TransferMessage' as const, signature: _signature, transfer: _transfer };
}

function storeTupleTransferMessage(source: TransferMessage) {
    let builder = new TupleBuilder();
    builder.writeSlice(source.signature);
    builder.writeTuple(storeTupleTransfer(source.transfer));
    return builder.build();
}

function dictValueParserTransferMessage(): DictionaryValue<TransferMessage> {
    return {
        serialize: (src, buidler) => {
            buidler.storeRef(beginCell().store(storeTransferMessage(src)).endCell());
        },
        parse: (src) => {
            return loadTransferMessage(src.loadRef().beginParse());
        }
    }
}
async function Wallet_init(key: bigint, walletId: bigint) {
    const __init = 'te6ccgEBBgEAMwABFP8A9KQT9LzyyAsBAgFiAgMCAs4EBQAJoUrd4AUAAUgAH0cAPIzFUgUCPLH8v/yz/Jg=';
    const __code = 'te6ccgECGQEABBkAART/APSkE/S88sgLAQIBYgIDAgLLBAUCASAQEQT307aLt+3Ah10nCH5UwINcLH94C0NMDAXGwwAGRf5Fw4gH6QCJQZm8E+GECjicw7UTQ1AH4YtMf0//TP1UgbBNVAjDI+EIBzFUgUCPLH8v/yz/J7VTgIMB74wIgwAAi10nBIbDjAsAA4wDtRNDUAfhi0x/T/9M/VSBsE1UCgYHCAkAIaG4AeRmKpAoEeWP5f/ln+TAAu4w7UTQ1AH4YtMf0//TP1UgbBMD0x8BwHvy4IHUAdAB0x/TB/pAAQH6ANIAAZHUkm0B4lVAEFY2EHgQZ1UEVHQyU0PbPPkAggC9EVF5+RAW8vSBRPZRSLoU8vQGpH9QdEMwbW3bPMj4QgHMVSBQI8sfy//LP8ntVAoLAGBb7UTQ1AH4YtMf0//TP1UgbBP4QW8kXwOzkwKkAt7I+EIBzFUgUCPLH8v/yz/J7VQC7iD5ASCC8IXSiDhMAENFiwKAPLIgWfaIA8VTw2VjRDRkaNrJYfJGuo4mW+1E0NQB+GLTH9P/0z9VIGwTyPhCAcxVIFAjyx/L/8s/ye1U2zHgIILwDiNXJhCLVwDQNp3XFn9q/7gGp+BAWTdd0OD7JJcecrK64wIgDQ4APjD4QW8kXwOzkwKkAt7I+EIBzFUgUCPLH8v/yz/J7VQAQMhVQFBFyx8SywcBzxYB+gIhbrOVfwHKAMyUcDLKAOLJAfbIcQHKAVAHAcoAcAHKAlAFzxZQA/oCcAHKaCNusyVus7GOTH8BygDIcAHKAHABygAkbrOdfwHKAAQgbvLQgFAEzJY0A3ABygDiJG6znX8BygAEIG7y0IBQBMyWNANwAcoA4nABygACfwHKAALJWMyXMzMBcAHKAOIhbrMMADCcfwHKAAEgbvLQgAHMlTFwAcoA4skB+wAAZFvtRNDUAfhi0x/T/9M/VSBsE/hBbyRfA7OTAqQC3sj4QgHMVSBQI8sfy//LP8ntVNsxAfqC8Gcn1pdl+PIsdcWB41ZUQ5f1oAu5G9MsTQ2W1MkmhLzCuo4yW+1E0NQB+GLTH9P/0z9VIGwT+EFvJF8Ds5MCpALeyPhCAcxVIFAjyx/L/8s/ye1U2zHggvCcoPGFUXTjLo/TeN9WpuT2xA5N/LYJDkmBL3seJiFL+brjAg8ATDDtRNDUAfhi0x/T/9M/VSBsE8j4QgHMVSBQI8sfy//LP8ntVNsxAgFqEhMCASAWFwErsyX7UTQ1AH4YtMf0//TP1UgbBPbPIBQBK7B+O1E0NQB+GLTH9P/0z9VIGwT2zyAVAAJbAAQwMQBNu70YJwXOw9XSyuex6E7DnWSoUbZoJwndY1LStkfLMi068t/fFiOYASu4BK7UTQ1AH4YtMf0//TP1UgbBPbPIGAAEbCE=';
    const __system = 'te6cckECGwEABCMAAQHAAQEFoHL9AgEU/wD0pBP0vPLICwMCAWIOBAIBIAkFAgEgCAYBK7gErtRNDUAfhi0x/T/9M/VSBsE9s8gHAARsIQBNu70YJwXOw9XSyuex6E7DnWSoUbZoJwndY1LStkfLMi068t/fFiOYAgFqDAoBK7B+O1E0NQB+GLTH9P/0z9VIGwT2zyALAAQwMQErsyX7UTQ1AH4YtMf0//TP1UgbBPbPIA0AAlsCAssQDwAhobgB5GYqkCgR5Y/l/+Wf5MAE99O2i7ftwIddJwh+VMCDXCx/eAtDTAwFxsMABkX+RcOIB+kAiUGZvBPhhAo4nMO1E0NQB+GLTH9P/0z9VIGwTVQIwyPhCAcxVIFAjyx/L/8s/ye1U4CDAe+MCIMAAItdJwSGw4wLAAOMA7UTQ1AH4YtMf0//TP1UgbBNVAoXFhIRAD4w+EFvJF8Ds5MCpALeyPhCAcxVIFAjyx/L/8s/ye1UAu4g+QEggvCF0og4TABDRYsCgDyyIFn2iAPFU8NlY0Q0ZGjayWHyRrqOJlvtRNDUAfhi0x/T/9M/VSBsE8j4QgHMVSBQI8sfy//LP8ntVNsx4CCC8A4jVyYQi1cA0Dad1xZ/av+4BqfgQFk3XdDg+ySXHnKyuuMCIBUTAfqC8Gcn1pdl+PIsdcWB41ZUQ5f1oAu5G9MsTQ2W1MkmhLzCuo4yW+1E0NQB+GLTH9P/0z9VIGwT+EFvJF8Ds5MCpALeyPhCAcxVIFAjyx/L/8s/ye1U2zHggvCcoPGFUXTjLo/TeN9WpuT2xA5N/LYJDkmBL3seJiFL+brjAhQATDDtRNDUAfhi0x/T/9M/VSBsE8j4QgHMVSBQI8sfy//LP8ntVNsxAGRb7UTQ1AH4YtMf0//TP1UgbBP4QW8kXwOzkwKkAt7I+EIBzFUgUCPLH8v/yz/J7VTbMQBgW+1E0NQB+GLTH9P/0z9VIGwT+EFvJF8Ds5MCpALeyPhCAcxVIFAjyx/L/8s/ye1UAu4w7UTQ1AH4YtMf0//TP1UgbBMD0x8BwHvy4IHUAdAB0x/TB/pAAQH6ANIAAZHUkm0B4lVAEFY2EHgQZ1UEVHQyU0PbPPkAggC9EVF5+RAW8vSBRPZRSLoU8vQGpH9QdEMwbW3bPMj4QgHMVSBQI8sfy//LP8ntVBoYAfbIcQHKAVAHAcoAcAHKAlAFzxZQA/oCcAHKaCNusyVus7GOTH8BygDIcAHKAHABygAkbrOdfwHKAAQgbvLQgFAEzJY0A3ABygDiJG6znX8BygAEIG7y0IBQBMyWNANwAcoA4nABygACfwHKAALJWMyXMzMBcAHKAOIhbrMZADCcfwHKAAEgbvLQgAHMlTFwAcoA4skB+wAAQMhVQFBFyx8SywcBzxYB+gIhbrOVfwHKAMyUcDLKAOLJUuNl5w==';
    let systemCell = Cell.fromBase64(__system);
    let builder = new TupleBuilder();
    builder.writeCell(systemCell);
    builder.writeNumber(key);
    builder.writeNumber(walletId);
    let __stack = builder.build();
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let initCell = Cell.fromBoc(Buffer.from(__init, 'base64'))[0];
    let system = await ContractSystem.create();
    let executor = await ContractExecutor.create({ code: initCell, data: new Cell() }, system);
    let res = await executor.get('init', __stack);
    if (!res.success) { throw Error(res.error); }
    if (res.exitCode !== 0 && res.exitCode !== 1) {
        if (Wallet_errors[res.exitCode]) {
            throw new ComputeError(Wallet_errors[res.exitCode].message, res.exitCode, { logs: res.logs });
        } else {
            throw new ComputeError('Exit code: ' + res.exitCode, res.exitCode, { logs: res.logs });
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
    135: { message: `Code of a contract was not found` },
    136: { message: `Invalid address` },
    17654: { message: `Invalid seqno` },
    48401: { message: `Invalid signature` },
}

export class Wallet implements Contract {
    
    static async init(key: bigint, walletId: bigint) {
        return await Wallet_init(key, walletId);
    }
    
    static async fromInit(key: bigint, walletId: bigint) {
        const init = await Wallet_init(key, walletId);
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
            body = beginCell().storeUint(0, 32).storeStringTail(message).endCell();
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
            body = beginCell().storeUint(0, 32).storeStringTail(message).endCell();
        }
        if (message === 'слава україни') {
            body = beginCell().storeUint(0, 32).storeStringTail(message).endCell();
        }
        if (message === 'duplicate') {
            body = beginCell().storeUint(0, 32).storeStringTail(message).endCell();
        }
        if (body === null) { throw new Error('Invalid message type'); }
        
        await provider.internal(via, { ...args, body: body });
        
    }
    
    async getPublicKey(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('publicKey', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getWalletId(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('walletId', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
    async getSeqno(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('seqno', builder.build())).stack;
        let result = source.readBigNumber();
        return result;
    }
    
}