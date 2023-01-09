import { Cell, Slice, Address, Builder, beginCell, ComputeError, TupleItem, TupleReader, Dictionary, contractAddress, ContractProvider, Sender, Contract, ContractABI, TupleBuilder, DictionaryValue } from 'ton-core';
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
async function A_init() {
    const __init = 'te6ccgEBBwEANQABFP8A9KQT9LzyyAsBAgFiAgMCAs4EBQAJoUrd4AUAAUgBEUcAHIzAHbPMmAYADAGBAQHPAA==';
    const __code = 'te6ccgECIAEAAs8AART/APSkE/S88sgLAQIBYgIDAgLLBAUCASAcHQIBIAYHAgEgCwwCAdQICQAB/ALLO37cCHXScIflTAg1wsf3gLQ0wMBcbDAAZF/kXDiAfpAIlBmbwT4YQKRW+DAAI8w+QGC8LQamTMwHB1yjmTiNoX+Opx1QKuTWe9zGJQ8DuXgkQ1duo8I2zzwGds82zHgkTDi8sCCgHgoACwgbvLQgIAEWyPhCAcwB2zzJ7VQZAgEgDQ4CAdQaGwIBWA8QAgEgERIAFSUfwHKAOBwAcoAgAEscFnIcAHLAXMBywFwAcsAEszMyfkAyHIBywFwAcsAEsoHy//J0IAIBIBMUAgEgFxgB9zIcQHKAVAH8BJwAcoCUAXPFlAD+gJwAcpoI26zJW6zsY49f/ASyHDwEnDwEiRus5l/8BIE8AFQBMyVNANw8BLiJG6zmX/wEgTwAVAEzJU0A3DwEuJw8BICf/ASAslYzJYzMwFw8BLiIW6zmH/wEgHwAQHMlDFw8BLiyQGAVAUsf8gBlHAByx/ebwABb4xtb4wB2zxvIgHJkyFus5YBbyJZzMnoMYBYABPsAALog10oh10mXIMIAIsIAsY5KA28igH8izzGrAqEFqwJRVbYIIMIAnCCqAhXXGFAzzxZAFN5ZbwJTQaHCAJnIAW8CUEShqgKOEjEzwgCZ1DDQINdKIddJknAg4uLoXwMBERwAcjMAds8yYBkAdzQ9AQwbSGBaIYBgBD0D2+h8uCHAYFohiICgBD0FwKBeKcBgBD0D2+h8uCHEoF4pwECgBD0F8j0AMnwFoAAMAYEBAc8AAAsMPhC8BeAAOT4QvAXXPATf3CAQot01lc3NhZ2WPAVXiNANPAUgARG9C87Z54DHgHweAE293owTgudh6ullc9j0J2HOslQo2zQThO6xqWlbI+WZFp15b++LEcwBFO1E0NQB+GLbPDEfAAyBAQHXAAE=';
    const __system = 'te6cckECQQEABRAAAQHAAQIBZiACAgEgFwMBBbIp4AQBFP8A9KQT9LzyyAsFAgFiBwYATaF3owTgudh6ullc9j0J2HOslQo2zQThO6xqWlbI+WZFp15b++LEcwICyxMIAgFIDwkCASANCgIBIAwLAAEgADs+ELwFVzwEX9wgEKLhNZXNzYWdlMo8BNeI0A08BKACASAvDgBHND0BDBtAYF4pwGAEPQPb6Hy4IcBgXinIgKAEPQXyPQAyfAUgAgEgEhACASARMQH3MhxAcoBUAfwEHABygJQBc8WUAP6AnABymgjbrMlbrOxjj1/8BDIcPAQcPAQJG6zmX/wEATwAVAEzJU0A3DwEOIkbrOZf/AQBPABUATMlTQDcPAQ4nDwEAJ/8BACyVjMljMzAXDwEOIhbrOYf/AQAfABAcyUMXDwEOLJAYDQCASA3NgIBzhQ7AWk7ftwIddJwh+VMCDXCx/eAtDTAwFxsMABkX+RcOIB+kAiUGZvBPhhApFb4MAAkTDjDfLAgoBUDrvkBIILwtBqZMzAcHXKOZOI2hf46nHVAq5NZ73MYlDwO5eCRDV26jwkw2zzwFts82zHggvD8PIIRJGZYHboj+QTNGglyPAhpreoARb1nM+pPdtvScrrjAj89FgIQ2zzwF9s82zE/PQEFsiGgGAEU/wD0pBP0vPLICxkCAWIaIwICyzgbAgEgHCgCASA1HQIBIDAeAgEgLx8ARzQ9AQwbQGBeKcBgBD0D2+h8uCHAYF4pyICgBD0F8j0AMnwFoAEFtxywIQEU/wD0pBP0vPLICyICAWImIwIBICUkAE293owTgudh6ullc9j0J2HOslQo2zQThO6xqWlbI+WZFp15b++LEcwBEb0LztnngMeAfD8CAss4JwIBICsoAgHUKikAOT4QvAXXPATf3CAQot01lc3NhZ2WPAVXiNANPAUgAAsMPhC8BeACASA1LAIBIDAtAgEgLy4AdzQ9AQwbSGBaIYBgBD0D2+h8uCHAYFohiICgBD0FwKBeKcBgBD0D2+h8uCHEoF4pwECgBD0F8j0AMnwFoAERHAByMwB2zzJgPgIBIDMxAUsf8gBlHAByx/ebwABb4xtb4wB2zxvIgHJkyFus5YBbyJZzMnoMYDIAuiDXSiHXSZcgwgAiwgCxjkoDbyKAfyLPMasCoQWrAlFVtgggwgCcIKoCFdcYUDPPFkAU3llvAlNBocIAmcgBbwJQRKGqAo4SMTPCAJnUMNAg10oh10mScCDi4uhfAwH3MhxAcoBUAfwEnABygJQBc8WUAP6AnABymgjbrMlbrOxjj1/8BLIcPAScPASJG6zmX/wEgTwAVAEzJU0A3DwEuIkbrOZf/ASBPABUATMlTQDcPAS4nDwEgJ/8BICyVjMljMzAXDwEuIhbrOYf/ASAfABAcyUMXDwEuLJAYDQABPsAAgFYNzYASxwWchwAcsBcwHLAXABywASzMzJ+QDIcgHLAXABywASygfL/8nQgABUlH8BygDgcAHKAIAIBIDo5AAH8AgHUPDsACwgbvLQgIALLO37cCHXScIflTAg1wsf3gLQ0wMBcbDAAZF/kXDiAfpAIlBmbwT4YQKRW+DAAI8w+QGC8LQamTMwHB1yjmTiNoX+Opx1QKuTWe9zGJQ8DuXgkQ1duo8I2zzwGds82zHgkTDi8sCCgPz0BFsj4QgHMAds8ye1UPgAMAYEBAc8AARTtRNDUAfhi2zwxQAAMgQEB1wABJ2qgeA==';
    let systemCell = Cell.fromBase64(__system);
    let builder = new TupleBuilder();
    builder.writeCell(systemCell);
    let __stack = builder.build();
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let initCell = Cell.fromBoc(Buffer.from(__init, 'base64'))[0];
    let system = await ContractSystem.create();
    let executor = await ContractExecutor.create({ code: initCell, data: new Cell() }, system);
    let res = await executor.get('init', __stack);
    if (!res.success) { throw Error(res.error); }
    if (res.exitCode !== 0 && res.exitCode !== 1) {
        if (A_errors[res.exitCode]) {
            throw new ComputeError(A_errors[res.exitCode].message, res.exitCode, { logs: res.vmLogs });
        } else {
            throw new ComputeError('Exit code: ' + res.exitCode, res.exitCode, { logs: res.vmLogs });
        }
    }
    
    let data = res.stack.readCell();
    return { code: codeCell, data };
}

const A_errors: { [key: number]: { message: string } } = {
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
}

export class A implements Contract {
    
    static async init() {
        return await A_init();
    }
    
    static async fromInit() {
        const init = await A_init();
        const address = contractAddress(0, init);
        return new A(address, init);
    }
    
    static fromAddress(address: Address) {
        return new A(address);
    }
    
    readonly address: Address; 
    readonly init?: { code: Cell, data: Cell };
    readonly abi: ContractABI = {
        errors: A_errors
    };
    
    private constructor(address: Address, init?: { code: Cell, data: Cell }) {
        this.address = address;
        this.init = init;
    }
    
    async send(provider: ContractProvider, via: Sender, args: { value: bigint, bounce?: boolean| null | undefined }, message: 'Message') {
        
        let body: Cell | null = null;
        if (message === 'Message') {
            body = beginCell().storeUint(0, 32).storeStringTail(message).endCell();
        }
        if (body === null) { throw new Error('Invalid message type'); }
        
        await provider.internal(via, { ...args, body: body });
        
    }
    
    async getGetNext(provider: ContractProvider) {
        let builder = new TupleBuilder();
        let source = (await provider.get('getNext', builder.build())).stack;
        const result = loadTupleStateInit(source);
        return result;
    }
    
}