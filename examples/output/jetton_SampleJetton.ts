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
        b_0.storeBit(src.sender);
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
        b_0.storeBit(src.to);
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

export type ChangeOwner = {
    $$type: 'ChangeOwner';
    newOwner: Address;
}

export function storeChangeOwner(src: ChangeOwner) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(3067051791, 32);
        b_0.storeBit(src.newOwner);
    };
}

export function loadChangeOwner(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 3067051791) { throw Error('Invalid prefix'); }
    let _newOwner = sc_0.loadAddress();
    return { $$type: 'ChangeOwner' as const, newOwner: _newOwner };
}

export type TokenTransfer = {
    $$type: 'TokenTransfer';
    queryId: bigint;
    amount: bigint;
    destination: Address;
    responseDestination: Address | null;
    customPayload: Cell | null;
    forwardTonAmount: bigint;
    forwardPayload: Cell;
}

export function storeTokenTransfer(src: TokenTransfer) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(260734629, 32);
        b_0.storeUint(src.queryId, 64);
        b_0.storeCoins(src.amount);
        b_0.storeBit(src.destination);
        if (src.responseDestination !== null && src.responseDestination !== undefined) { b_0.storeBit(true).storeAddress(src.responseDestination); } else { b_0.storeBit(false); }
        if (src.customPayload !== null && src.customPayload !== undefined) { b_0.storeBit(true).storeRef(src.customPayload); } else { b_0.storeBit(false); }
        b_0.storeCoins(src.forwardTonAmount);
        let b_0.storeBuilder(src.forwardPayload.asBuilder());
    };
}

export function loadTokenTransfer(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 260734629) { throw Error('Invalid prefix'); }
    let _queryId = sc_0.loadUintBig(64);
    let _amount = sc_0.loadCoins();
    let _destination = sc_0.loadAddress();
    let _responseDestination = sc_0.loadBit() ? sc_0.loadAddress() : null;
    let _customPayload = sc_0.loadBit() ? sc_0.loadRef() : null;
    let _forwardTonAmount = sc_0.loadCoins();
    let _forwardPayload = sc_0.asCell();
    return { $$type: 'TokenTransfer' as const, queryId: _queryId, amount: _amount, destination: _destination, responseDestination: _responseDestination, customPayload: _customPayload, forwardTonAmount: _forwardTonAmount, forwardPayload: _forwardPayload };
}

export type TokenTransferInternal = {
    $$type: 'TokenTransferInternal';
    queryId: bigint;
    amount: bigint;
    from: Address;
    responseAddress: Address | null;
    forwardTonAmount: bigint;
    forwardPayload: Cell;
}

export function storeTokenTransferInternal(src: TokenTransferInternal) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(395134233, 32);
        b_0.storeUint(src.queryId, 64);
        b_0.storeCoins(src.amount);
        b_0.storeBit(src.from);
        if (src.responseAddress !== null && src.responseAddress !== undefined) { b_0.storeBit(true).storeAddress(src.responseAddress); } else { b_0.storeBit(false); }
        b_0.storeCoins(src.forwardTonAmount);
        let b_0.storeBuilder(src.forwardPayload.asBuilder());
    };
}

export function loadTokenTransferInternal(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 395134233) { throw Error('Invalid prefix'); }
    let _queryId = sc_0.loadUintBig(64);
    let _amount = sc_0.loadCoins();
    let _from = sc_0.loadAddress();
    let _responseAddress = sc_0.loadBit() ? sc_0.loadAddress() : null;
    let _forwardTonAmount = sc_0.loadCoins();
    let _forwardPayload = sc_0.asCell();
    return { $$type: 'TokenTransferInternal' as const, queryId: _queryId, amount: _amount, from: _from, responseAddress: _responseAddress, forwardTonAmount: _forwardTonAmount, forwardPayload: _forwardPayload };
}

export type TokenNotification = {
    $$type: 'TokenNotification';
    queryId: bigint;
    amount: bigint;
    from: Address;
    forwardPayload: Cell;
}

export function storeTokenNotification(src: TokenNotification) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(1935855772, 32);
        b_0.storeUint(src.queryId, 64);
        b_0.storeCoins(src.amount);
        b_0.storeBit(src.from);
        let b_0.storeBuilder(src.forwardPayload.asBuilder());
    };
}

export function loadTokenNotification(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 1935855772) { throw Error('Invalid prefix'); }
    let _queryId = sc_0.loadUintBig(64);
    let _amount = sc_0.loadCoins();
    let _from = sc_0.loadAddress();
    let _forwardPayload = sc_0.asCell();
    return { $$type: 'TokenNotification' as const, queryId: _queryId, amount: _amount, from: _from, forwardPayload: _forwardPayload };
}

export type TokenBurn = {
    $$type: 'TokenBurn';
    queryId: bigint;
    amount: bigint;
    owner: Address;
    responseAddress: Address | null;
}

export function storeTokenBurn(src: TokenBurn) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(1499400124, 32);
        b_0.storeUint(src.queryId, 64);
        b_0.storeCoins(src.amount);
        b_0.storeBit(src.owner);
        if (src.responseAddress !== null && src.responseAddress !== undefined) { b_0.storeBit(true).storeAddress(src.responseAddress); } else { b_0.storeBit(false); }
    };
}

export function loadTokenBurn(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 1499400124) { throw Error('Invalid prefix'); }
    let _queryId = sc_0.loadUintBig(64);
    let _amount = sc_0.loadCoins();
    let _owner = sc_0.loadAddress();
    let _responseAddress = sc_0.loadBit() ? sc_0.loadAddress() : null;
    return { $$type: 'TokenBurn' as const, queryId: _queryId, amount: _amount, owner: _owner, responseAddress: _responseAddress };
}

export type TokenBurnNotification = {
    $$type: 'TokenBurnNotification';
    queryId: bigint;
    amount: bigint;
    owner: Address;
    responseAddress: Address | null;
}

export function storeTokenBurnNotification(src: TokenBurnNotification) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(2078119902, 32);
        b_0.storeUint(src.queryId, 64);
        b_0.storeCoins(src.amount);
        b_0.storeBit(src.owner);
        if (src.responseAddress !== null && src.responseAddress !== undefined) { b_0.storeBit(true).storeAddress(src.responseAddress); } else { b_0.storeBit(false); }
    };
}

export function loadTokenBurnNotification(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 2078119902) { throw Error('Invalid prefix'); }
    let _queryId = sc_0.loadUintBig(64);
    let _amount = sc_0.loadCoins();
    let _owner = sc_0.loadAddress();
    let _responseAddress = sc_0.loadBit() ? sc_0.loadAddress() : null;
    return { $$type: 'TokenBurnNotification' as const, queryId: _queryId, amount: _amount, owner: _owner, responseAddress: _responseAddress };
}

export type TokenExcesses = {
    $$type: 'TokenExcesses';
    queryId: bigint;
}

export function storeTokenExcesses(src: TokenExcesses) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(3576854235, 32);
        b_0.storeUint(src.queryId, 64);
    };
}

export function loadTokenExcesses(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 3576854235) { throw Error('Invalid prefix'); }
    let _queryId = sc_0.loadUintBig(64);
    return { $$type: 'TokenExcesses' as const, queryId: _queryId };
}

export type TokenUpdateContent = {
    $$type: 'TokenUpdateContent';
    content: Cell | null;
}

export function storeTokenUpdateContent(src: TokenUpdateContent) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(1862840892, 32);
        if (src.content !== null && src.content !== undefined) { b_0.storeBit(true).storeRef(src.content); } else { b_0.storeBit(false); }
    };
}

export function loadTokenUpdateContent(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 1862840892) { throw Error('Invalid prefix'); }
    let _content = sc_0.loadBit() ? sc_0.loadRef() : null;
    return { $$type: 'TokenUpdateContent' as const, content: _content };
}

export type JettonData = {
    $$type: 'JettonData';
    totalSupply: bigint;
    mintable: boolean;
    owner: Address;
    content: Cell | null;
    walletCode: Cell;
}

export function storeJettonData(src: JettonData) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeInt(src.totalSupply, 257);
        b_0.storeBit(src.mintable);
        b_0.storeBit(src.owner);
        if (src.content !== null && src.content !== undefined) { b_0.storeBit(true).storeRef(src.content); } else { b_0.storeBit(false); }
        b_0.storeRef(src.walletCode);
    };
}

export function loadJettonData(slice: Slice) {
    let sc_0 = slice;
    let _totalSupply = sc_0.loadIntBig(257);
    let _mintable = sc_0.loadBit();
    let _owner = sc_0.loadAddress();
    let _content = sc_0.loadBit() ? sc_0.loadRef() : null;
    let _walletCode = sc_0.loadRef();
    return { $$type: 'JettonData' as const, totalSupply: _totalSupply, mintable: _mintable, owner: _owner, content: _content, walletCode: _walletCode };
}

export type JettonWalletData = {
    $$type: 'JettonWalletData';
    balance: bigint;
    owner: Address;
    master: Address;
    walletCode: Cell;
}

export function storeJettonWalletData(src: JettonWalletData) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeInt(src.balance, 257);
        b_0.storeBit(src.owner);
        b_0.storeBit(src.master);
        b_0.storeRef(src.walletCode);
    };
}

export function loadJettonWalletData(slice: Slice) {
    let sc_0 = slice;
    let _balance = sc_0.loadIntBig(257);
    let _owner = sc_0.loadAddress();
    let _master = sc_0.loadAddress();
    let _walletCode = sc_0.loadRef();
    return { $$type: 'JettonWalletData' as const, balance: _balance, owner: _owner, master: _master, walletCode: _walletCode };
}

export type Mint = {
    $$type: 'Mint';
    amount: bigint;
}

export function storeMint(src: Mint) {
    return (builder: Builder) => {
        let b_0 = builder;
        b_0.storeUint(2737462367, 32);
        b_0.storeInt(src.amount, 257);
    };
}

export function loadMint(slice: Slice) {
    let sc_0 = slice;
    if (sc_0.loadUint(32) !== 2737462367) { throw Error('Invalid prefix'); }
    let _amount = sc_0.loadIntBig(257);
    return { $$type: 'Mint' as const, amount: _amount };
}

async function SampleJetton_init(owner: Address, content: Cell | null) {
    const __init = 'te6ccgEBBgEARgABFP8A9KQT9LzyyAsBAgFiAgMCAs0EBQAJoUrd4AkAAdQARdOD+CZGYhmigh/QEA54sRN1nLP4DlAAlmSpk4LGUAcWUAZM';
    const __code = 'te6ccgECOwEABXwAART/APSkE/S88sgLAQIBYgIDAgLKBAUCASA1NgIBIAYHAgFIGhsCASAICQIBWBARAgHUCgsAR95DgA5YC5gOWAuADlgAlmZmT8gGQ5AOWAuADlgAllA+X/5OhASXO37cCHXScIflTAg1wsf3gLQ0wMBcbDAAZF/kXDiAfpAIlBmbwT4YQKRW+AgghCjKlxfuuMCIIIQbwiyPLrjAiCCEHvdl9664wLAAIAwNDg8ACwgbvLQgIAC4MO1E0NQB+GL6APpAAQHSAAGR1JJtAeLSAFUwbBQE0x8BghCjKlxfuvLggYEBAdcAATEQNEEw8CrI+EIBzFUwUEP6AgHPFiJus5Z/AcoAEsyVMnBYygDiygDJ7VQAwDDtRNDUAfhi+gD6QAEB0gABkdSSbQHi0gBVMGwUBNMfAYIQbwiyPLry4IHSAAGR1JJtAeIBMRA0QTDwLMj4QgHMVTBQQ/oCAc8WIm6zln8BygASzJUycFjKAOLKAMntVADmMO1E0NQB+GL6APpAAQHSAAGR1JJtAeLSAFUwbBQE0x8BghB73ZfeuvLggdM/+gD6QAEB+kAh1wsBwwCRAZIxbeIUQzA0EGcQVhBFVQLwLcj4QgHMVTBQQ/oCAc8WIm6zln8BygASzJUycFjKAOLKAMntVADojmz5AYLwzQ2YbLGi9GiucIn0/DFiwRbl9T+9EaaDn1Lb9QQIMLK6jkTtRNDUAfhi+gD6QAEB0gABkdSSbQHi0gBVMGwU8CvI+EIBzFUwUEP6AgHPFiJus5Z/AcoAEsyVMnBYygDiygDJ7VTbMeCRMOLywIICASASEwIBIBQVAAFIABVZR/AcoA4HABygCAIBIBYXAgEgGBkABTIyYAADNCAACTwHPAdgAAkcFnwCIAIBIBwdAgEgKywCASAeHwIBICUmAgEgICECASAjJAH3MhxAcoBUAfwG3ABygJQBc8WUAP6AnABymgjbrMlbrOxjj1/8BvIcPAbcPAbJG6zmX/wGwTwAVAEzJU0A3DwG+IkbrOZf/AbBPABUATMlTQDcPAb4nDwGwJ/8BsCyVjMljMzAXDwG+IhbrOYf/AbAfABAcyUMXDwG+LJAYCIAKRwA8jMQxNQI4EBAc8AAc8WAc8WyYAAE+wAAbwC0PQEMCCCANivAYAQ9A9vofLgZG0CggDYrwGAEPQPb6Hy4GQSggDYrwECgBD0F8j0AMlAA/AhgAA8+EL4KFjwIoAIBICcoAgEgKSoADTwI2xC8B+AADz4KPAjMEMwgAKUUWGgVTHwI1zwH3BwgEAh+Cgh8B4QNRBOECMQL8hVUIIQF41FGVAHyx8Vyz9QA/oCAc8WASBulTBwAcsBks8W4gH6AgHPFslFYBBKEDlAqfAgWoAA5PhBbyQQI18DVUDwIwGBEU0C8B9QBscFFfL0VQKACASAtLgIBSDM0AgEgLzACASAxMgAdPhBbyQQI18DI8cF8uCEgAAkECNfA4AAXPhBbyQQI18DZvAmgACM+EFvJBAjXwOCEDuaygAh8CaAADxVMPAoMUEwgAGsEEcQNkV38CdQNKElbrOOH3BwgEIHyAGCENUydttYyx/LP8kQJBA4QXBtbfAgECOSNDTiQwCAAQb4o72omhqAPwxfQB9IACA6QAAyOpJNoDxaQAqmDYKeBTAIBSDc4AgFYOToAlbd6ME4LnYerpZXPY9CdhzrJUKNs0E4TusalpWyPlmRadeW/vixHME4YTIikya+3yRcvbDO06rpAsE4IGc6tPOK/OkoWA6wtxMj2UABFrbz2omhqAPwxfQB9IACA6QAAyOpJNoDxaQAqmDYKKoH4EkAARa8W9qJoagD8MX0AfSAAgOkAAMjqSTaA8WkAKpg2CngS+AxA';
    const __system = 'te6cckECKwEABY8AAQHAAQEFobFfAgEU/wD0pBP0vPLICwMCAWIHBAIBIAYFAHG93owTgudh6ullc9j0J2HOslQo2zQThO6xqWlbI+WZFp15b++LEcwThO6PAB8tmwHk/kHVks1lEJwAO7/YF2omhqAPwxQICA64B9IACA/SAAoZg2CfgS+A5AICyh4IAgFIDAkCAdQLCgBPIAg1yHTH9M/MfoAMIE1UiKCEBeNRRm6A4IQe92X3roTsRLy9BOgAoADTFv4QW8kgRFNUzjHBfL0UYShggD1/CHC//L0QzBSOfAigT67AYIJMS0AoIIImJaAoBK88vR/cAOAQFQzZshVMIIQe92X3lAFyx8Tyz8B+gIBzxYBIG6VMHABywGSzxbiyVQTBFAzbW3wIYAIBIBYNAgEgEw4CASARDwHvPhBbyRTKscFs44S+EJTuPAkAYERTQLwICTHBfL03lHIoIIA9fwhwv/y9CH4J28QIaGCCJiWgGa2CKGCCJiWgKChJsIAlhB9UIlfCOMNJW6zIsIAsI4dcAbwAnAEyAGCENUydttYyx/LP8kQR0MwF21t8CGSNVvigEAByUE1DMPAiUjCgGqFwcChIE1B0yFUwghBzYtCcUAXLHxPLPwH6AgHPFgHPFskoEEZDE1BVbW3wIVAFAacbCL4QW8kgRFNUzvHBfL0UbehggD1/CHC//L0QzBSPPAicSTCAJIwct6BPrsCqIIJMS0AoIIImJaAoBK88vT4QlQgZPAkXPAgf1B2cIBAK1RMORiASAGTIVVCCEBeNRRlQB8sfFcs/UAP6AgHPFgEgbpUwcAHLAZLPFuIB+gIBzxbJEFYQNFnwIQIBIBUUAA8+EJTEvAkMIABvALQ9AQwIIIA2K8BgBD0D2+h8uBkbQKCANivAYAQ9A9vofLgZBKCANivAQKAEPQXyPQAyUAD8COACASAaFwIBIBkYACkcAPIzEMTUCOBAQHPAAHPFgHPFsmAAJRsMfoAMXHXIfoAMfoAMKcDqwCACASAdGwH3MhxAcoBUAfwH3ABygJQBc8WUAP6AnABymgjbrMlbrOxjj1/8B/IcPAfcPAfJG6zmX/wHwTwAlAEzJU0A3DwH+IkbrOZf/AfBPACUATMlTQDcPAf4nDwHwJ/8B8CyVjMljMzAXDwH+IhbrOYf/AfAfACAcyUMXDwH+LJAYBwABPsAAAkcFnwCYAIBICIfAgFuISAAFVlH8BygDgcAHKAIAAFIAgEgJCMAR7OQ4AOWAuYDlgLgA5YAJZmZk/IBkOQDlgLgA5YAJZQPl/+ToQIBSCYlAAtCBu8tCAgE9UcCHXScIflTAg1wsf3gLQ0wMBcbDAAZF/kXDiAfpAIlBmbwT4YQKOMzDtRNDUAfhigQEB1wD6QAEB+kABQzBsE1UC8CnI+EIBzFUgUCOBAQHPAAHPFgHPFsntVOAgghAPin6luuMCIIIQF41FGbrjAoIQWV8HvLrjAjCCopKCcABvLAggC87UTQ1AH4YoEBAdcA+kABAfpAAUMwbBMD0x8BghBZXwe8uvLggdM/+gD6QAEB+kAh1wsBwwCRAZIxbeIUQzA0EFYQRVUC8CjI+EIBzFUgUCOBAQHPAAHPFgHPFsntVADKMO1E0NQB+GKBAQHXAPpAAQH6QAFDMGwTA9MfAYIQF41FGbry4IHTP/oA+kABAfpAIdcLAcMAkQGSMW3iAfoAUVUVFEMwNhB4EGdVBPAnyPhCAcxVIFAjgQEBzwABzxYBzxbJ7VQA3jDtRNDUAfhigQEB1wD6QAEB+kABQzBsEwPTHwGCEA+KfqW68uCB0z/6APpAAQH6QCHXCwHDAJEBkjFt4gHSAAGR1JJtAeL6AFFmFhUUQzA3EIkQeFUF8CbI+EIBzFUgUCOBAQHPAAHPFgHPFsntVEg44xo=';
    let systemCell = Cell.fromBase64(__system);
    let __tuple: TupleItem[] = [];
    __tuple.push({ type: 'cell', cell: systemCell });
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let initCell = Cell.fromBoc(Buffer.from(__init, 'base64'))[0];
    let system = await ContractSystem.create();
    let executor = await ContractExecutor.create({ code: initCell, data: new Cell() }, system);
    let res = await executor.get('init', __tuple);
    if (!res.success) { throw Error(res.error); }
    if (res.exitCode !== 0 && res.exitCode !== 1) {
        if (SampleJetton_errors[res.exitCode]) {
            throw new ComputeError(SampleJetton_errors[res.exitCode].message, res.exitCode, { logs: res.vmLogs });
        } else {
            throw new ComputeError('Exit code: ' + res.exitCode, res.exitCode, { logs: res.vmLogs });
        }
    }
    
    let data = res.stack.readCell();
    return { code: codeCell, data };
}

const SampleJetton_errors: { [key: number]: { message: string } } = {
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
    4429: { message: `Invalid sender` },
    13650: { message: `Invalid bounced message` },
    16059: { message: `Invalid value` },
    62972: { message: `Invalid balance` },
}

export class SampleJetton implements Contract {
    
    static async init(owner: Address, content: Cell | null) {
        return await SampleJetton_init(owner,content);
    }
    
    static async fromInit(owner: Address, content: Cell | null) {
        const init = await SampleJetton_init(owner,content);
        const address = contractAddress(0, init);
        return new SampleJetton(address, init);
    }
    
    static fromAddress(address: Address) {
        return new SampleJetton(address);
    }
    
    readonly address: Address; 
    readonly init?: { code: Cell, data: Cell };
    readonly abi: ContractABI = {
        errors: SampleJetton_errors
    };
    
    private constructor(address: Address, init?: { code: Cell, data: Cell }) {
        this.address = address;
        this.init = init;
    }
    
}