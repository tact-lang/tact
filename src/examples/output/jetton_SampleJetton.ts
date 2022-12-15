import { Cell, Slice, StackItem, Address, Builder, InternalMessage, CommonMessageInfo, CellMessage, beginCell, serializeDict, TupleSlice4 } from 'ton';
import { ContractExecutor, createExecutorFromCode, ExecuteError } from 'ton-nodejs';
import BN from 'bn.js';

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
export type ChangeOwner = {
    $$type: 'ChangeOwner';
    newOwner: Address;
}

export function packChangeOwner(src: ChangeOwner): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(3067051791, 32);
    b_0 = b_0.storeAddress(src.newOwner);
    return b_0.endCell();
}

export function packStackChangeOwner(src: ChangeOwner, __stack: StackItem[]) {
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.newOwner).endCell() });
}

export function packTupleChangeOwner(src: ChangeOwner): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.newOwner).endCell() });
    return __stack;
}

export function unpackStackChangeOwner(slice: TupleSlice4): ChangeOwner {
    const newOwner = slice.readAddress();
    return { $$type: 'ChangeOwner', newOwner: newOwner };
}
export function unpackTupleChangeOwner(slice: TupleSlice4): ChangeOwner {
    const newOwner = slice.readAddress();
    return { $$type: 'ChangeOwner', newOwner: newOwner };
}
export type TokenBurned = {
    $$type: 'TokenBurned';
    amount: BN;
    owner: Address;
    cashback: Address | null;
}

export function packTokenBurned(src: TokenBurned): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(2078119902, 32);
    b_0 = b_0.storeInt(src.amount, 257);
    b_0 = b_0.storeAddress(src.owner);
    if (src.cashback !== null) {
        b_0 = b_0.storeBit(true);
        b_0 = b_0.storeAddress(src.cashback);
    } else {
        b_0 = b_0.storeBit(false);
    }
    return b_0.endCell();
}

export function packStackTokenBurned(src: TokenBurned, __stack: StackItem[]) {
    __stack.push({ type: 'int', value: src.amount });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.owner).endCell() });
    if (src.cashback !== null) {
        __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.cashback).endCell() });
    } else {
        __stack.push({ type: 'null' });
    }
}

export function packTupleTokenBurned(src: TokenBurned): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: src.amount });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.owner).endCell() });
    if (src.cashback !== null) {
        __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.cashback).endCell() });
    } else {
        __stack.push({ type: 'null' });
    }
    return __stack;
}

export function unpackStackTokenBurned(slice: TupleSlice4): TokenBurned {
    const amount = slice.readBigNumber();
    const owner = slice.readAddress();
    const cashback = slice.readAddressOpt();
    return { $$type: 'TokenBurned', amount: amount, owner: owner, cashback: cashback };
}
export function unpackTupleTokenBurned(slice: TupleSlice4): TokenBurned {
    const amount = slice.readBigNumber();
    const owner = slice.readAddress();
    const cashback = slice.readAddressOpt();
    return { $$type: 'TokenBurned', amount: amount, owner: owner, cashback: cashback };
}
export type TokenTransferInternal = {
    $$type: 'TokenTransferInternal';
    queryId: BN;
    amount: BN;
    from: Address;
    responseAddress: Address;
    forwardTonAmount: BN;
}

export function packTokenTransferInternal(src: TokenTransferInternal): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(395134233, 32);
    b_0 = b_0.storeUint(src.queryId, 64);
    b_0 = b_0.storeInt(src.amount, 257);
    b_0 = b_0.storeAddress(src.from);
    b_0 = b_0.storeAddress(src.responseAddress);
    b_0 = b_0.storeCoins(src.forwardTonAmount);
    return b_0.endCell();
}

export function packStackTokenTransferInternal(src: TokenTransferInternal, __stack: StackItem[]) {
    __stack.push({ type: 'int', value: src.queryId });
    __stack.push({ type: 'int', value: src.amount });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.from).endCell() });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.responseAddress).endCell() });
    __stack.push({ type: 'int', value: src.forwardTonAmount });
}

export function packTupleTokenTransferInternal(src: TokenTransferInternal): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: src.queryId });
    __stack.push({ type: 'int', value: src.amount });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.from).endCell() });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.responseAddress).endCell() });
    __stack.push({ type: 'int', value: src.forwardTonAmount });
    return __stack;
}

export function unpackStackTokenTransferInternal(slice: TupleSlice4): TokenTransferInternal {
    const queryId = slice.readBigNumber();
    const amount = slice.readBigNumber();
    const from = slice.readAddress();
    const responseAddress = slice.readAddress();
    const forwardTonAmount = slice.readBigNumber();
    return { $$type: 'TokenTransferInternal', queryId: queryId, amount: amount, from: from, responseAddress: responseAddress, forwardTonAmount: forwardTonAmount };
}
export function unpackTupleTokenTransferInternal(slice: TupleSlice4): TokenTransferInternal {
    const queryId = slice.readBigNumber();
    const amount = slice.readBigNumber();
    const from = slice.readAddress();
    const responseAddress = slice.readAddress();
    const forwardTonAmount = slice.readBigNumber();
    return { $$type: 'TokenTransferInternal', queryId: queryId, amount: amount, from: from, responseAddress: responseAddress, forwardTonAmount: forwardTonAmount };
}
export type TokenTransfer = {
    $$type: 'TokenTransfer';
    queryId: BN;
    amount: BN;
    destination: Address;
    responseDestination: Address;
    customPayload: Cell | null;
    forwardTonAmount: BN;
}

export function packTokenTransfer(src: TokenTransfer): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(260734629, 32);
    b_0 = b_0.storeUint(src.queryId, 64);
    b_0 = b_0.storeCoins(src.amount);
    b_0 = b_0.storeAddress(src.destination);
    b_0 = b_0.storeAddress(src.responseDestination);
    if (src.customPayload !== null) {
        b_0 = b_0.storeBit(true);
        b_0 = b_0.storeRef(src.customPayload);
    } else {
        b_0 = b_0.storeBit(false);
    }
    b_0 = b_0.storeCoins(src.forwardTonAmount);
    return b_0.endCell();
}

export function packStackTokenTransfer(src: TokenTransfer, __stack: StackItem[]) {
    __stack.push({ type: 'int', value: src.queryId });
    __stack.push({ type: 'int', value: src.amount });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.destination).endCell() });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.responseDestination).endCell() });
    if (src.customPayload !== null) {
        __stack.push({ type: 'cell', cell: src.customPayload });
    } else {
        __stack.push({ type: 'null' });
    }
    __stack.push({ type: 'int', value: src.forwardTonAmount });
}

export function packTupleTokenTransfer(src: TokenTransfer): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: src.queryId });
    __stack.push({ type: 'int', value: src.amount });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.destination).endCell() });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.responseDestination).endCell() });
    if (src.customPayload !== null) {
        __stack.push({ type: 'cell', cell: src.customPayload });
    } else {
        __stack.push({ type: 'null' });
    }
    __stack.push({ type: 'int', value: src.forwardTonAmount });
    return __stack;
}

export function unpackStackTokenTransfer(slice: TupleSlice4): TokenTransfer {
    const queryId = slice.readBigNumber();
    const amount = slice.readBigNumber();
    const destination = slice.readAddress();
    const responseDestination = slice.readAddress();
    const customPayload = slice.readCellOpt();
    const forwardTonAmount = slice.readBigNumber();
    return { $$type: 'TokenTransfer', queryId: queryId, amount: amount, destination: destination, responseDestination: responseDestination, customPayload: customPayload, forwardTonAmount: forwardTonAmount };
}
export function unpackTupleTokenTransfer(slice: TupleSlice4): TokenTransfer {
    const queryId = slice.readBigNumber();
    const amount = slice.readBigNumber();
    const destination = slice.readAddress();
    const responseDestination = slice.readAddress();
    const customPayload = slice.readCellOpt();
    const forwardTonAmount = slice.readBigNumber();
    return { $$type: 'TokenTransfer', queryId: queryId, amount: amount, destination: destination, responseDestination: responseDestination, customPayload: customPayload, forwardTonAmount: forwardTonAmount };
}
export type JettonUpdateContent = {
    $$type: 'JettonUpdateContent';
    content: Cell | null;
}

export function packJettonUpdateContent(src: JettonUpdateContent): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(3551049822, 32);
    if (src.content !== null) {
        b_0 = b_0.storeBit(true);
        b_0 = b_0.storeRef(src.content);
    } else {
        b_0 = b_0.storeBit(false);
    }
    return b_0.endCell();
}

export function packStackJettonUpdateContent(src: JettonUpdateContent, __stack: StackItem[]) {
    if (src.content !== null) {
        __stack.push({ type: 'cell', cell: src.content });
    } else {
        __stack.push({ type: 'null' });
    }
}

export function packTupleJettonUpdateContent(src: JettonUpdateContent): StackItem[] {
    let __stack: StackItem[] = [];
    if (src.content !== null) {
        __stack.push({ type: 'cell', cell: src.content });
    } else {
        __stack.push({ type: 'null' });
    }
    return __stack;
}

export function unpackStackJettonUpdateContent(slice: TupleSlice4): JettonUpdateContent {
    const content = slice.readCellOpt();
    return { $$type: 'JettonUpdateContent', content: content };
}
export function unpackTupleJettonUpdateContent(slice: TupleSlice4): JettonUpdateContent {
    const content = slice.readCellOpt();
    return { $$type: 'JettonUpdateContent', content: content };
}
export type JettonData = {
    $$type: 'JettonData';
    totalSupply: BN;
    mintable: boolean;
    owner: Address;
    content: Cell | null;
    walletCode: Cell;
}

export function packJettonData(src: JettonData): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeInt(src.totalSupply, 257);
    b_0 = b_0.storeBit(src.mintable);
    b_0 = b_0.storeAddress(src.owner);
    if (src.content !== null) {
        b_0 = b_0.storeBit(true);
        b_0 = b_0.storeRef(src.content);
    } else {
        b_0 = b_0.storeBit(false);
    }
    b_0 = b_0.storeRef(src.walletCode);
    return b_0.endCell();
}

export function packStackJettonData(src: JettonData, __stack: StackItem[]) {
    __stack.push({ type: 'int', value: src.totalSupply });
    __stack.push({ type: 'int', value: src.mintable ? new BN(-1) : new BN(0) });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.owner).endCell() });
    if (src.content !== null) {
        __stack.push({ type: 'cell', cell: src.content });
    } else {
        __stack.push({ type: 'null' });
    }
    __stack.push({ type: 'cell', cell: src.walletCode });
}

export function packTupleJettonData(src: JettonData): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: src.totalSupply });
    __stack.push({ type: 'int', value: src.mintable ? new BN(-1) : new BN(0) });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.owner).endCell() });
    if (src.content !== null) {
        __stack.push({ type: 'cell', cell: src.content });
    } else {
        __stack.push({ type: 'null' });
    }
    __stack.push({ type: 'cell', cell: src.walletCode });
    return __stack;
}

export function unpackStackJettonData(slice: TupleSlice4): JettonData {
    const totalSupply = slice.readBigNumber();
    const mintable = slice.readBoolean();
    const owner = slice.readAddress();
    const content = slice.readCellOpt();
    const walletCode = slice.readCell();
    return { $$type: 'JettonData', totalSupply: totalSupply, mintable: mintable, owner: owner, content: content, walletCode: walletCode };
}
export function unpackTupleJettonData(slice: TupleSlice4): JettonData {
    const totalSupply = slice.readBigNumber();
    const mintable = slice.readBoolean();
    const owner = slice.readAddress();
    const content = slice.readCellOpt();
    const walletCode = slice.readCell();
    return { $$type: 'JettonData', totalSupply: totalSupply, mintable: mintable, owner: owner, content: content, walletCode: walletCode };
}
export type Mint = {
    $$type: 'Mint';
    amount: BN;
}

export function packMint(src: Mint): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(2737462367, 32);
    b_0 = b_0.storeInt(src.amount, 257);
    return b_0.endCell();
}

export function packStackMint(src: Mint, __stack: StackItem[]) {
    __stack.push({ type: 'int', value: src.amount });
}

export function packTupleMint(src: Mint): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: src.amount });
    return __stack;
}

export function unpackStackMint(slice: TupleSlice4): Mint {
    const amount = slice.readBigNumber();
    return { $$type: 'Mint', amount: amount };
}
export function unpackTupleMint(slice: TupleSlice4): Mint {
    const amount = slice.readBigNumber();
    return { $$type: 'Mint', amount: amount };
}
export async function SampleJetton_init(owner: Address, content: Cell | null) {
    const __code = 'te6ccgECMwEABJAAART/APSkE/S88sgLAQIBYgIDAgLKBAUCASArLAIBIAYHAgFiIyQCAUgICQIBIA8QAgFICgsAR2chwAcsBcwHLAXABywASzMzJ+QDIcgHLAXABywASygfL/8nQgOXHAh10nCH5UwINcLH94C0NMDAXGwwAGRf5Fw4gH6QDBUQRVvA/hhApFb4CCCEKMqXF+64wIgghDTqLheuuMCghB73ZfeuuMCMPLAgoAwNDgALCBu8tCAgALow7UTQ1AH4YvoA+kABbQLSAAGUbBLUEt7SAARQM2wUBNMfAYIQoypcX7ry4IGBAQHXAAExEDRBMPAiyPhCAcxVMFBD+gIBzxYibpUycFjKAJZ/AcoAEsziygDJ7VQAwjDtRNDUAfhi+gD6QAFtAtIAAZRsEtQS3tIABFAzbBQE0x8BghDTqLheuvLggW0B0gABkjHU3gExEDRBMPAjyPhCAcxVMFBD+gIBzxYibpUycFjKAJZ/AcoAEsziygDJ7VQA4O1E0NQB+GL6APpAAW0C0gABlGwS1BLe0gAEUDNsFATTHwGCEHvdl9668uCBgQEB1wD6QAFtAtIAAZZsEvpAAVneQxMzEFYQRRA0WPAkyPhCAcxVMFBD+gIBzxYibpUycFjKAJZ/AcoAEsziygDJ7VQCAVgREgIBIBUWABVZR/AcoA4HABygCAIBIBMUAAc8uCDgAOsyHEBygEXygBwAcoCUAXPFlAD+gJwAcpoI26zJW6zsY41f/AVyHDwFXDwFSRus5V/8BUUzJU0A3DwFeIkbrOVf/AVFMyVNANw8BXicPAVAn/wFQLJWMyWMzMBcPAV4iFus5l/AcoAAfABAcyUcDLKAOLJAfsAgAgEgFxgCASAdHgIBIBkaAgEgGxwAKRwA8jMQxNQI4EBAc8AAc8WAc8WyYABvALQ9AQwIIIA2K8BgBD0D2+h8uBkbQKCANivAYAQ9A9vofLgZBKCANivAQKAEPQXyPQAyUAD8BiAAQxwfwTIzEM0UEP6AgHPFiJulTJwWMoAln8BygASzOLKAMmAADz4QvgoWPAZgAgEgHyACASAhIgAVPAbbCIycDMB8AWAADz4KPAbMEMwgAIkUVWgVTDwG3BTIfAFcHBTAPgo+CgiEDQQPshVQIIQF41FGVAGyx8Uyz8SgQEBzwABzxYBzxYB+gLJXjIUEDpAqvAXVQKAALT4QW8jMDFVQPAbcFnwBVAFxwXwFlUCgAgEgJSYAGdGAqKIZh4D6gaUKgRwCASAnKAIBICkqABk+EFvIzAxI8cF8uCEgAAkECNfA4AATPhBbyMwMQHwHoAAPFUw8CAxQTCAARb4o72omhqAPwxfQB9IAC2gWkAAMo2CWoJb2kAAigZtgp4EMAgEgLS4CASAvMAAJudw/AagCAVgxMgBNt3owTgudh6ullc9j0J2HOslQo2zQThO6xqWlbI+WZFp15b++LEcwAEmtvPaiaGoA/DF9AH0gALaBaQAAyjYJaglvaQACKBm2CiqB+A5AAEWvFvaiaGoA/DF9AH0gALaBaQAAyjYJaglvaQACKBm2CngOwA==';
    const depends = new Map<string, Cell>();
    depends.set('55471', Cell.fromBoc(Buffer.from('te6ccgECGgEAAwcAART/APSkE/S88sgLAQIBYgIDAgLLBAUCA3rgGBkCAUgGBwIBIAwNAgFICAkAR2chwAcsBcwHLAXABywASzMzJ+QDIcgHLAXABywASygfL/8nQgKDHAh10nCH5UwINcLH94C0NMDAXGwwAGRf5Fw4gH6QDBUQRVvA/hhApFb4CCCEBeNRRm64wKCEA+KfqW64wIw8sCCgCgsACwgbvLQgIACyMO1E0NQB+GKBAQHXAPpAAQH6QAFDMGwTA9MfAYIQF41FGbry4IHTP4EBAdcA+kABAfpAAQH6AFVANRBnEFZVA/AXyPhCAcxVIFAjgQEBzwABzxYBzxbJ7VQAxO1E0NQB+GKBAQHXAPpAAQH6QAFDMGwTA9MfAYIQD4p+pbry4IHTP/oA+kABAfpAAW0C0gABlGwS1BLe+gAGBQRQMzYQeBBnVQTwGMj4QgHMVSBQI4EBAc8AAc8WAc8Wye1UAgEgDg8Apdr4H8ILeRmBiS44L4Caio0JBhf/gJ/CEqECP4CzgpkPgCuDgqGzMqE9ApWGQqoEEIC8aijKgDZY+KZZ+JQICA54AA54sA54sA/QFkoAqoMYp4CkAgFYEBECASASEwAVJR/AcoA4HABygCAABzy4IOACASAUFQIBIBYXAOsyHEBygEXygBwAcoCUAXPFlAD+gJwAcpoI26zJW6zsY41f/ASyHDwEnDwEiRus5V/8BIUzJU0A3DwEuIkbrOVf/ASFMyVNANw8BLicPASAn/wEgLJWMyWMzMBcPAS4iFus5l/AcoAAfABAcyUcDLKAOLJAfsAgACkcAPIzEMTUCOBAQHPAAHPFgHPFsmAAbwC0PQEMCCCANivAYAQ9A9vofLgZG0CggDYrwGAEPQPb6Hy4GQSggDYrwECgBD0F8j0AMlAA/AVgAFcWzL4QW8jMDFTA8cFs44Q+EJUIETwFnBZ8AVYxwXwE5IwMeIToCDC//ATAoAAJrPH4CsAATa3owTgudh6ullc9j0J2HOslQo2zQThO6xqWlbI+WZFp15b++LEcwA==', 'base64'))[0]);
    let systemCell = beginCell().storeDict(serializeDict(depends, 16, (src, v) => v.refs.push(src))).endCell();
    let __stack: StackItem[] = [];
    __stack.push({ type: 'cell', cell: systemCell });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(owner).endCell() });
    if (content !== null) {
        __stack.push({ type: 'cell', cell: content });
    } else {
        __stack.push({ type: 'null' });
    }
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let executor = await createExecutorFromCode({ code: codeCell, data: new Cell() });
    let res = await executor.get('init_SampleJetton', __stack, { debug: true });
    if (res.debugLogs.length > 0) { console.warn(res.debugLogs); }
    let data = res.stack.readCell();
    return { code: codeCell, data };
}

export const SampleJetton_errors: { [key: string]: string } = {
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
}

export class SampleJetton {
    readonly executor: ContractExecutor; 
    constructor(executor: ContractExecutor) { this.executor = executor; } 
    
    async send(args: { amount: BN, from?: Address, debug?: boolean }, message: Mint | JettonUpdateContent | TokenBurned) {
        let body: Cell | null = null;
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'Mint') {
            body = packMint(message);
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'JettonUpdateContent') {
            body = packJettonUpdateContent(message);
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'TokenBurned') {
            body = packTokenBurned(message);
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
                if (SampleJetton_errors[e.exitCode.toString()]) {
                    throw new Error(SampleJetton_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getGetWalletAddress(owner: Address) {
        try {
            let __stack: StackItem[] = [];
            __stack.push({ type: 'slice', cell: beginCell().storeAddress(owner).endCell() });
            let result = await this.executor.get('get_wallet_address', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return result.stack.readAddress();
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (SampleJetton_errors[e.exitCode.toString()]) {
                    throw new Error(SampleJetton_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getGetJettonData() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('get_jetton_data', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return unpackStackJettonData(result.stack);
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (SampleJetton_errors[e.exitCode.toString()]) {
                    throw new Error(SampleJetton_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getOwner() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('owner', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return result.stack.readAddress();
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (SampleJetton_errors[e.exitCode.toString()]) {
                    throw new Error(SampleJetton_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
}