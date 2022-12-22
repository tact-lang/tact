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
    raw: Cell;
}

export function packContext(src: Context): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeBit(src.bounced);
    b_0 = b_0.storeAddress(src.sender);
    b_0 = b_0.storeInt(src.value, 257);
    b_0 = b_0.storeRef(src.raw);
    return b_0.endCell();
}

export function packStackContext(src: Context, __stack: StackItem[]) {
    __stack.push({ type: 'int', value: src.bounced ? new BN(-1) : new BN(0) });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.sender).endCell() });
    __stack.push({ type: 'int', value: src.value });
    __stack.push({ type: 'slice', cell: src.raw });
}

export function packTupleContext(src: Context): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: src.bounced ? new BN(-1) : new BN(0) });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.sender).endCell() });
    __stack.push({ type: 'int', value: src.value });
    __stack.push({ type: 'slice', cell: src.raw });
    return __stack;
}

export function unpackStackContext(slice: TupleSlice4): Context {
    const bounced = slice.readBoolean();
    const sender = slice.readAddress();
    const value = slice.readBigNumber();
    const raw = slice.readCell();
    return { $$type: 'Context', bounced: bounced, sender: sender, value: value, raw: raw };
}
export function unpackTupleContext(slice: TupleSlice4): Context {
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
export type TokenTransfer = {
    $$type: 'TokenTransfer';
    queryId: BN;
    amount: BN;
    destination: Address;
    responseDestination: Address | null;
    customPayload: Cell | null;
    forwardTonAmount: BN;
    forwardPayload: Cell;
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
    b_0 = b_0.storeCellCopy(src.forwardPayload);
    return b_0.endCell();
}

export function packStackTokenTransfer(src: TokenTransfer, __stack: StackItem[]) {
    __stack.push({ type: 'int', value: src.queryId });
    __stack.push({ type: 'int', value: src.amount });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.destination).endCell() });
    if (src.responseDestination !== null) {
        __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.responseDestination).endCell() });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.customPayload !== null) {
        __stack.push({ type: 'cell', cell: src.customPayload });
    } else {
        __stack.push({ type: 'null' });
    }
    __stack.push({ type: 'int', value: src.forwardTonAmount });
    __stack.push({ type: 'slice', cell: src.forwardPayload });
}

export function packTupleTokenTransfer(src: TokenTransfer): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: src.queryId });
    __stack.push({ type: 'int', value: src.amount });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.destination).endCell() });
    if (src.responseDestination !== null) {
        __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.responseDestination).endCell() });
    } else {
        __stack.push({ type: 'null' });
    }
    if (src.customPayload !== null) {
        __stack.push({ type: 'cell', cell: src.customPayload });
    } else {
        __stack.push({ type: 'null' });
    }
    __stack.push({ type: 'int', value: src.forwardTonAmount });
    __stack.push({ type: 'slice', cell: src.forwardPayload });
    return __stack;
}

export function unpackStackTokenTransfer(slice: TupleSlice4): TokenTransfer {
    const queryId = slice.readBigNumber();
    const amount = slice.readBigNumber();
    const destination = slice.readAddress();
    const responseDestination = slice.readAddressOpt();
    const customPayload = slice.readCellOpt();
    const forwardTonAmount = slice.readBigNumber();
    const forwardPayload = slice.readCell();
    return { $$type: 'TokenTransfer', queryId: queryId, amount: amount, destination: destination, responseDestination: responseDestination, customPayload: customPayload, forwardTonAmount: forwardTonAmount, forwardPayload: forwardPayload };
}
export function unpackTupleTokenTransfer(slice: TupleSlice4): TokenTransfer {
    const queryId = slice.readBigNumber();
    const amount = slice.readBigNumber();
    const destination = slice.readAddress();
    const responseDestination = slice.readAddressOpt();
    const customPayload = slice.readCellOpt();
    const forwardTonAmount = slice.readBigNumber();
    const forwardPayload = slice.readCell();
    return { $$type: 'TokenTransfer', queryId: queryId, amount: amount, destination: destination, responseDestination: responseDestination, customPayload: customPayload, forwardTonAmount: forwardTonAmount, forwardPayload: forwardPayload };
}
export type TokenTransferInternal = {
    $$type: 'TokenTransferInternal';
    queryId: BN;
    amount: BN;
    from: Address;
    responseAddress: Address | null;
    forwardTonAmount: BN;
    forwardPayload: Cell;
}

export function packTokenTransferInternal(src: TokenTransferInternal): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(395134233, 32);
    b_0 = b_0.storeUint(src.queryId, 64);
    b_0 = b_0.storeInt(src.amount, 257);
    b_0 = b_0.storeAddress(src.from);
    b_0 = b_0.storeAddress(src.responseAddress);
    b_0 = b_0.storeCoins(src.forwardTonAmount);
    b_0 = b_0.storeCellCopy(src.forwardPayload);
    return b_0.endCell();
}

export function packStackTokenTransferInternal(src: TokenTransferInternal, __stack: StackItem[]) {
    __stack.push({ type: 'int', value: src.queryId });
    __stack.push({ type: 'int', value: src.amount });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.from).endCell() });
    if (src.responseAddress !== null) {
        __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.responseAddress).endCell() });
    } else {
        __stack.push({ type: 'null' });
    }
    __stack.push({ type: 'int', value: src.forwardTonAmount });
    __stack.push({ type: 'slice', cell: src.forwardPayload });
}

export function packTupleTokenTransferInternal(src: TokenTransferInternal): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: src.queryId });
    __stack.push({ type: 'int', value: src.amount });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.from).endCell() });
    if (src.responseAddress !== null) {
        __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.responseAddress).endCell() });
    } else {
        __stack.push({ type: 'null' });
    }
    __stack.push({ type: 'int', value: src.forwardTonAmount });
    __stack.push({ type: 'slice', cell: src.forwardPayload });
    return __stack;
}

export function unpackStackTokenTransferInternal(slice: TupleSlice4): TokenTransferInternal {
    const queryId = slice.readBigNumber();
    const amount = slice.readBigNumber();
    const from = slice.readAddress();
    const responseAddress = slice.readAddressOpt();
    const forwardTonAmount = slice.readBigNumber();
    const forwardPayload = slice.readCell();
    return { $$type: 'TokenTransferInternal', queryId: queryId, amount: amount, from: from, responseAddress: responseAddress, forwardTonAmount: forwardTonAmount, forwardPayload: forwardPayload };
}
export function unpackTupleTokenTransferInternal(slice: TupleSlice4): TokenTransferInternal {
    const queryId = slice.readBigNumber();
    const amount = slice.readBigNumber();
    const from = slice.readAddress();
    const responseAddress = slice.readAddressOpt();
    const forwardTonAmount = slice.readBigNumber();
    const forwardPayload = slice.readCell();
    return { $$type: 'TokenTransferInternal', queryId: queryId, amount: amount, from: from, responseAddress: responseAddress, forwardTonAmount: forwardTonAmount, forwardPayload: forwardPayload };
}
export type TokenNotification = {
    $$type: 'TokenNotification';
    queryId: BN;
    amount: BN;
    from: Address;
    forwardPayload: Cell;
}

export function packTokenNotification(src: TokenNotification): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(1935855772, 32);
    b_0 = b_0.storeUint(src.queryId, 64);
    b_0 = b_0.storeCoins(src.amount);
    b_0 = b_0.storeAddress(src.from);
    b_0 = b_0.storeCellCopy(src.forwardPayload);
    return b_0.endCell();
}

export function packStackTokenNotification(src: TokenNotification, __stack: StackItem[]) {
    __stack.push({ type: 'int', value: src.queryId });
    __stack.push({ type: 'int', value: src.amount });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.from).endCell() });
    __stack.push({ type: 'slice', cell: src.forwardPayload });
}

export function packTupleTokenNotification(src: TokenNotification): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: src.queryId });
    __stack.push({ type: 'int', value: src.amount });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.from).endCell() });
    __stack.push({ type: 'slice', cell: src.forwardPayload });
    return __stack;
}

export function unpackStackTokenNotification(slice: TupleSlice4): TokenNotification {
    const queryId = slice.readBigNumber();
    const amount = slice.readBigNumber();
    const from = slice.readAddress();
    const forwardPayload = slice.readCell();
    return { $$type: 'TokenNotification', queryId: queryId, amount: amount, from: from, forwardPayload: forwardPayload };
}
export function unpackTupleTokenNotification(slice: TupleSlice4): TokenNotification {
    const queryId = slice.readBigNumber();
    const amount = slice.readBigNumber();
    const from = slice.readAddress();
    const forwardPayload = slice.readCell();
    return { $$type: 'TokenNotification', queryId: queryId, amount: amount, from: from, forwardPayload: forwardPayload };
}
export type TokenBurn = {
    $$type: 'TokenBurn';
    queryId: BN;
    amount: BN;
    owner: Address;
    responseAddress: Address | null;
}

export function packTokenBurn(src: TokenBurn): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(1499400124, 32);
    b_0 = b_0.storeUint(src.queryId, 64);
    b_0 = b_0.storeCoins(src.amount);
    b_0 = b_0.storeAddress(src.owner);
    b_0 = b_0.storeAddress(src.responseAddress);
    return b_0.endCell();
}

export function packStackTokenBurn(src: TokenBurn, __stack: StackItem[]) {
    __stack.push({ type: 'int', value: src.queryId });
    __stack.push({ type: 'int', value: src.amount });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.owner).endCell() });
    if (src.responseAddress !== null) {
        __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.responseAddress).endCell() });
    } else {
        __stack.push({ type: 'null' });
    }
}

export function packTupleTokenBurn(src: TokenBurn): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: src.queryId });
    __stack.push({ type: 'int', value: src.amount });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.owner).endCell() });
    if (src.responseAddress !== null) {
        __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.responseAddress).endCell() });
    } else {
        __stack.push({ type: 'null' });
    }
    return __stack;
}

export function unpackStackTokenBurn(slice: TupleSlice4): TokenBurn {
    const queryId = slice.readBigNumber();
    const amount = slice.readBigNumber();
    const owner = slice.readAddress();
    const responseAddress = slice.readAddressOpt();
    return { $$type: 'TokenBurn', queryId: queryId, amount: amount, owner: owner, responseAddress: responseAddress };
}
export function unpackTupleTokenBurn(slice: TupleSlice4): TokenBurn {
    const queryId = slice.readBigNumber();
    const amount = slice.readBigNumber();
    const owner = slice.readAddress();
    const responseAddress = slice.readAddressOpt();
    return { $$type: 'TokenBurn', queryId: queryId, amount: amount, owner: owner, responseAddress: responseAddress };
}
export type TokenBurnNotification = {
    $$type: 'TokenBurnNotification';
    queryId: BN;
    amount: BN;
    owner: Address;
    responseAddress: Address | null;
}

export function packTokenBurnNotification(src: TokenBurnNotification): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(2078119902, 32);
    b_0 = b_0.storeUint(src.queryId, 64);
    b_0 = b_0.storeCoins(src.amount);
    b_0 = b_0.storeAddress(src.owner);
    b_0 = b_0.storeAddress(src.responseAddress);
    return b_0.endCell();
}

export function packStackTokenBurnNotification(src: TokenBurnNotification, __stack: StackItem[]) {
    __stack.push({ type: 'int', value: src.queryId });
    __stack.push({ type: 'int', value: src.amount });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.owner).endCell() });
    if (src.responseAddress !== null) {
        __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.responseAddress).endCell() });
    } else {
        __stack.push({ type: 'null' });
    }
}

export function packTupleTokenBurnNotification(src: TokenBurnNotification): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: src.queryId });
    __stack.push({ type: 'int', value: src.amount });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.owner).endCell() });
    if (src.responseAddress !== null) {
        __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.responseAddress).endCell() });
    } else {
        __stack.push({ type: 'null' });
    }
    return __stack;
}

export function unpackStackTokenBurnNotification(slice: TupleSlice4): TokenBurnNotification {
    const queryId = slice.readBigNumber();
    const amount = slice.readBigNumber();
    const owner = slice.readAddress();
    const responseAddress = slice.readAddressOpt();
    return { $$type: 'TokenBurnNotification', queryId: queryId, amount: amount, owner: owner, responseAddress: responseAddress };
}
export function unpackTupleTokenBurnNotification(slice: TupleSlice4): TokenBurnNotification {
    const queryId = slice.readBigNumber();
    const amount = slice.readBigNumber();
    const owner = slice.readAddress();
    const responseAddress = slice.readAddressOpt();
    return { $$type: 'TokenBurnNotification', queryId: queryId, amount: amount, owner: owner, responseAddress: responseAddress };
}
export type TokenExcesses = {
    $$type: 'TokenExcesses';
    queryId: BN;
}

export function packTokenExcesses(src: TokenExcesses): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeUint(3576854235, 32);
    b_0 = b_0.storeUint(src.queryId, 64);
    return b_0.endCell();
}

export function packStackTokenExcesses(src: TokenExcesses, __stack: StackItem[]) {
    __stack.push({ type: 'int', value: src.queryId });
}

export function packTupleTokenExcesses(src: TokenExcesses): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: src.queryId });
    return __stack;
}

export function unpackStackTokenExcesses(slice: TupleSlice4): TokenExcesses {
    const queryId = slice.readBigNumber();
    return { $$type: 'TokenExcesses', queryId: queryId };
}
export function unpackTupleTokenExcesses(slice: TupleSlice4): TokenExcesses {
    const queryId = slice.readBigNumber();
    return { $$type: 'TokenExcesses', queryId: queryId };
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
export type JettonWalletData = {
    $$type: 'JettonWalletData';
    balance: BN;
    owner: Address;
    master: Address;
    walletCode: Cell;
}

export function packJettonWalletData(src: JettonWalletData): Cell {
    let b_0 = new Builder();
    b_0 = b_0.storeInt(src.balance, 257);
    b_0 = b_0.storeAddress(src.owner);
    b_0 = b_0.storeAddress(src.master);
    b_0 = b_0.storeRef(src.walletCode);
    return b_0.endCell();
}

export function packStackJettonWalletData(src: JettonWalletData, __stack: StackItem[]) {
    __stack.push({ type: 'int', value: src.balance });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.owner).endCell() });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.master).endCell() });
    __stack.push({ type: 'cell', cell: src.walletCode });
}

export function packTupleJettonWalletData(src: JettonWalletData): StackItem[] {
    let __stack: StackItem[] = [];
    __stack.push({ type: 'int', value: src.balance });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.owner).endCell() });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(src.master).endCell() });
    __stack.push({ type: 'cell', cell: src.walletCode });
    return __stack;
}

export function unpackStackJettonWalletData(slice: TupleSlice4): JettonWalletData {
    const balance = slice.readBigNumber();
    const owner = slice.readAddress();
    const master = slice.readAddress();
    const walletCode = slice.readCell();
    return { $$type: 'JettonWalletData', balance: balance, owner: owner, master: master, walletCode: walletCode };
}
export function unpackTupleJettonWalletData(slice: TupleSlice4): JettonWalletData {
    const balance = slice.readBigNumber();
    const owner = slice.readAddress();
    const master = slice.readAddress();
    const walletCode = slice.readCell();
    return { $$type: 'JettonWalletData', balance: balance, owner: owner, master: master, walletCode: walletCode };
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
export async function JettonDefaultWallet_init(master: Address, owner: Address) {
    const __code = 'te6ccgECKQEABYwAART/APSkE/S88sgLAQIBYgIDAgLKBAUCASAlJgIBIAYHAgFIEhMCASAICQIB7hARAgFICgsAR7OQ4AOWAuYDlgLgA5YAJZmZk/IBkOQDlgLgA5YAJZQPl/+ToQT1RwIddJwh+VMCDXCx/eAtDTAwFxsMABkX+RcOIB+kAiUGZvBPhhAo4zMO1E0NQB+GKBAQHXAPpAAQH6QAFDMGwTVQLwKMj4QgHMVSBQI4EBAc8AAc8WAc8Wye1U4CCCEA+KfqW64wIgghAXjUUZuuMCghBZXwe8uuMCMIDA0ODwALQgbvLQgIAN4w7UTQ1AH4YoEBAdcA+kABAfpAAUMwbBMD0x8BghAPin6luvLggdM/+gD6QAEB+kAh1wsBwwCRAZIxbeJtAtIAAZRsEtQS3voAUWYWFURANxCJEHhVBfAlyPhCAcxVIFAjgQEBzwABzxYBzxbJ7VQA0DDtRNDUAfhigQEB1wD6QAEB+kABQzBsEwPTHwGCEBeNRRm68uCB0z+BAQHXAPpAAQH6QCHXCwHDAJEBkjFt4gH6AFFVFRRDMDYQeBBnVQTwJsj4QgHMVSBQI4EBAc8AAc8WAc8Wye1UALztRNDUAfhigQEB1wD6QAEB+kABQzBsEwPTHwGCEFlfB7y68uCB0z/6APpAAQH6QCHXCwHDAJEBkjFt4hRDMDQQVhBFVQLwJ8j4QgHMVSBQI4EBAc8AAc8WAc8Wye1UAAbywIIAFSUfwHKAOBwAcoAgAAkcFnwCYAIBIBQVAE/cAQa5Dpj+mfmP0AGECaqRFBCAvGoozdAcEIPe7L710J2Il5egnQAUAgEgFhcCASAdHgIBIBgZAgEgGxwB9zIcQHKAVAH8B5wAcoCUAXPFlAD+gJwAcpoI26zJW6zsY49f/AeyHDwHnDwHiRus5l/8B4E8AJQBMyVNANw8B7iJG6zmX/wHgTwAlAEzJU0A3DwHuJw8B4Cf/AeAslYzJYzMwFw8B7iIW6zmH/wHgHwAgHMlDFw8B7iyQGAaACUbDH6ADFx1yH6ADH6ADCnA6sAgAAT7AAApHADyMxDE1AjgQEBzwABzxYBzxbJgAG8AtD0BDAgggDYrwGAEPQPb6Hy4GRtAoIA2K8BgBD0D2+h8uBkEoIA2K8BAoAQ9BfI9ADJQAPwIoAIBIB8gAgEgIiMADz4QlMS8CMwgAacbCL4QW8kgRFNUzvHBfL0UbehggD1/CHC//L0QzBSPPAhcSTCAJIwct6BPrsCqIIJMS0AoIIImJaAoBK88vT4QlQgZPAjXPAff1B2cIBAK1RMORiAhAGjIVVCCEBeNRRlQB8sfFcs/E4EBAc8AAc8WASBulTBwAcsBks8W4gH6AgHPFskQVhA0WfAgAe8+EFvJFMqxwWzjhL4QlO48CMBgRFNAvAfJMcF8vTeUcigggD1/CHC//L0IfgnbxAhoYIImJaAZrYIoYIImJaAoKEmwgCWEH1QiV8I4w0lbrMiwgCwjh1wBvACcATIAYIQ1TJ221jLH8s/yRBHQzAXbW3wIJI1W+KAkANMW/hBbySBEU1TOMcF8vRRhKGCAPX8IcL/8vRDMFI58CGBPrsBggkxLQCgggiYloCgErzy9H9wA4BAVDNmyFUwghB73ZfeUAXLHxPLPwH6AgHPFgEgbpUwcAHLAZLPFuLJVBMEUDNtbfAggAHJQTUMw8CFSMKAaoXBwKEgTUHTIVTCCEHNi0JxQBcsfE8s/AfoCAc8WAc8WySgQRkMTUFVtbfAgUAUAN7/YF2omhqAPwxQICA64B9IACA/SAAoZg2CfgSQCAnMnKAAJrPH4EUAAca3owTgudh6ullc9j0J2HOslQo2zQThO6xqWlbI+WZFp15b++LEcwThO6PAB8tmwHk/kHVks1lEJwA==';
    const depends = new Map<string, Cell>();
    depends.set('55471', Cell.fromBoc(Buffer.from('te6ccgECKQEABYwAART/APSkE/S88sgLAQIBYgIDAgLKBAUCASAlJgIBIAYHAgFIEhMCASAICQIB7hARAgFICgsAR7OQ4AOWAuYDlgLgA5YAJZmZk/IBkOQDlgLgA5YAJZQPl/+ToQT1RwIddJwh+VMCDXCx/eAtDTAwFxsMABkX+RcOIB+kAiUGZvBPhhAo4zMO1E0NQB+GKBAQHXAPpAAQH6QAFDMGwTVQLwKMj4QgHMVSBQI4EBAc8AAc8WAc8Wye1U4CCCEA+KfqW64wIgghAXjUUZuuMCghBZXwe8uuMCMIDA0ODwALQgbvLQgIAN4w7UTQ1AH4YoEBAdcA+kABAfpAAUMwbBMD0x8BghAPin6luvLggdM/+gD6QAEB+kAh1wsBwwCRAZIxbeJtAtIAAZRsEtQS3voAUWYWFURANxCJEHhVBfAlyPhCAcxVIFAjgQEBzwABzxYBzxbJ7VQA0DDtRNDUAfhigQEB1wD6QAEB+kABQzBsEwPTHwGCEBeNRRm68uCB0z+BAQHXAPpAAQH6QCHXCwHDAJEBkjFt4gH6AFFVFRRDMDYQeBBnVQTwJsj4QgHMVSBQI4EBAc8AAc8WAc8Wye1UALztRNDUAfhigQEB1wD6QAEB+kABQzBsEwPTHwGCEFlfB7y68uCB0z/6APpAAQH6QCHXCwHDAJEBkjFt4hRDMDQQVhBFVQLwJ8j4QgHMVSBQI4EBAc8AAc8WAc8Wye1UAAbywIIAFSUfwHKAOBwAcoAgAAkcFnwCYAIBIBQVAE/cAQa5Dpj+mfmP0AGECaqRFBCAvGoozdAcEIPe7L710J2Il5egnQAUAgEgFhcCASAdHgIBIBgZAgEgGxwB9zIcQHKAVAH8B5wAcoCUAXPFlAD+gJwAcpoI26zJW6zsY49f/AeyHDwHnDwHiRus5l/8B4E8AJQBMyVNANw8B7iJG6zmX/wHgTwAlAEzJU0A3DwHuJw8B4Cf/AeAslYzJYzMwFw8B7iIW6zmH/wHgHwAgHMlDFw8B7iyQGAaACUbDH6ADFx1yH6ADH6ADCnA6sAgAAT7AAApHADyMxDE1AjgQEBzwABzxYBzxbJgAG8AtD0BDAgggDYrwGAEPQPb6Hy4GRtAoIA2K8BgBD0D2+h8uBkEoIA2K8BAoAQ9BfI9ADJQAPwIoAIBIB8gAgEgIiMADz4QlMS8CMwgAacbCL4QW8kgRFNUzvHBfL0UbehggD1/CHC//L0QzBSPPAhcSTCAJIwct6BPrsCqIIJMS0AoIIImJaAoBK88vT4QlQgZPAjXPAff1B2cIBAK1RMORiAhAGjIVVCCEBeNRRlQB8sfFcs/E4EBAc8AAc8WASBulTBwAcsBks8W4gH6AgHPFskQVhA0WfAgAe8+EFvJFMqxwWzjhL4QlO48CMBgRFNAvAfJMcF8vTeUcigggD1/CHC//L0IfgnbxAhoYIImJaAZrYIoYIImJaAoKEmwgCWEH1QiV8I4w0lbrMiwgCwjh1wBvACcATIAYIQ1TJ221jLH8s/yRBHQzAXbW3wIJI1W+KAkANMW/hBbySBEU1TOMcF8vRRhKGCAPX8IcL/8vRDMFI58CGBPrsBggkxLQCgggiYloCgErzy9H9wA4BAVDNmyFUwghB73ZfeUAXLHxPLPwH6AgHPFgEgbpUwcAHLAZLPFuLJVBMEUDNtbfAggAHJQTUMw8CFSMKAaoXBwKEgTUHTIVTCCEHNi0JxQBcsfE8s/AfoCAc8WAc8WySgQRkMTUFVtbfAgUAUAN7/YF2omhqAPwxQICA64B9IACA/SAAoZg2CfgSQCAnMnKAAJrPH4EUAAca3owTgudh6ullc9j0J2HOslQo2zQThO6xqWlbI+WZFp15b++LEcwThO6PAB8tmwHk/kHVks1lEJwA==', 'base64'))[0]);
    let systemCell = beginCell().storeDict(serializeDict(depends, 16, (src, v) => v.refs.push(src))).endCell();
    let __stack: StackItem[] = [];
    __stack.push({ type: 'cell', cell: systemCell });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(master).endCell() });
    __stack.push({ type: 'slice', cell: beginCell().storeAddress(owner).endCell() });
    let codeCell = Cell.fromBoc(Buffer.from(__code, 'base64'))[0];
    let executor = await createExecutorFromCode({ code: codeCell, data: new Cell() });
    let res = await executor.get('init_JettonDefaultWallet', __stack, { debug: true });
    if (res.debugLogs.length > 0) { console.warn(res.debugLogs); }
    let data = res.stack.readCell();
    return { code: codeCell, data };
}

export const JettonDefaultWallet_errors: { [key: string]: string } = {
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
    '13650': `Invalid bounced message`,
    '16059': `Invalid value`,
    '62972': `Invalid balance`,
}

export class JettonDefaultWallet {
    readonly executor: ContractExecutor; 
    constructor(executor: ContractExecutor) { this.executor = executor; } 
    
    async send(args: { amount: BN, from?: Address, debug?: boolean }, message: TokenTransfer | TokenTransferInternal | TokenBurn) {
        let body: Cell | null = null;
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'TokenTransfer') {
            body = packTokenTransfer(message);
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'TokenTransferInternal') {
            body = packTokenTransferInternal(message);
        }
        if (message && typeof message === 'object' && !(message instanceof Slice) && message.$$type === 'TokenBurn') {
            body = packTokenBurn(message);
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
                if (JettonDefaultWallet_errors[e.exitCode.toString()]) {
                    throw new Error(JettonDefaultWallet_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
    async getGetWalletData() {
        try {
            let __stack: StackItem[] = [];
            let result = await this.executor.get('get_wallet_data', __stack, { debug: true });
            if (result.debugLogs.length > 0) { console.warn(result.debugLogs); }
            return unpackStackJettonWalletData(result.stack);
        } catch (e) {
            if (e instanceof ExecuteError) {
                if (e.debugLogs.length > 0) { console.warn(e.debugLogs); }
                if (JettonDefaultWallet_errors[e.exitCode.toString()]) {
                    throw new Error(JettonDefaultWallet_errors[e.exitCode.toString()]);
                }
            }
            throw e;
        }
    }
}