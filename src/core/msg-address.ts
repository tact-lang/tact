// addr_none$00 = MsgAddressExt;
// addr_extern$01 len:(## 9) external_address:(bits len) = MsgAddressExt;
// anycast_info$_ depth:(#<= 30) { depth >= 1 }
//    rewrite_pfx:(bits depth) = Anycast;
// addr_std$10 anycast:(Maybe Anycast) workchain_id:int8 address:bits256  = MsgAddressInt;
// addr_var$11 anycast:(Maybe Anycast) addr_len:(## 9) workchain_id:int32 address:(bits addr_len) = MsgAddressInt;
// _ _:MsgAddressInt = MsgAddress;
// _ _:MsgAddressExt = MsgAddress;

import { int, uint, uintBig } from "@/core/numeric";
import type { Path, Tlb } from "@/core/tlb";
import type { Builder, Slice } from "@ton/core";

export type MsgAddress =
    | AddrNone
    | AddrExtern
    | AddrStd
    | AddrVar
export type AddrNone = {
    readonly $: 'AddrNone'
}
export const AddrNone: AddrNone = Object.freeze({ $: "AddrNone" });
export const isAddrNone = (a: MsgAddress): a is AddrNone => a.$ === 'AddrNone';
export type AddrExtern = {
    readonly $: 'AddrExtern'
    readonly len: number
    readonly address: bigint; // bits len
}
export const AddrExtern = (len: number, address: bigint): AddrExtern => Object.freeze({
    $: 'AddrExtern', address, len,
})
export const isAddrExtern = (a: MsgAddress): a is AddrExtern => a.$ === 'AddrExtern';
export type AddrStd = {
    readonly $: 'AddrStd'
    readonly workchainId: number;
    readonly address: bigint;
}
export const AddrStd = (workchainId: number, address: bigint): AddrStd => Object.freeze({
    $: 'AddrStd', address, workchainId,
})
export const isAddrStd = (a: MsgAddress): a is AddrStd => a.$ === 'AddrStd';
export type AddrVar = {
    readonly $: 'AddrVar'
    readonly len: number // ## 9
    readonly workchainId: number // int32
    readonly address: bigint // bits addr_len
}
export const AddrVar = (len: number, workchainId: number, address: bigint): AddrVar => Object.freeze({
    $: "AddrVar", address, len, workchainId,
});
export const isAddrVar = (a: MsgAddress): a is AddrVar => a.$ === 'AddrVar';

const loadAddress = (s: Slice, p: Path): MsgAddress => {
    const type = uint(2).load(s, [...p, '$']);
    if (type === 0) {
        // addr_none$00
        return AddrNone;
    } else if (type === 1) {
        // addr_extern$01
        // len:(## 9)
        const len = uint(9).load(s, [...p, 'len']);
        // external_address:(bits len)
        const addr = uintBig(len).load(s, [...p, 'address']);
        return AddrExtern(len, addr);
    } else if (type === 2) {
        // addr_std$10
        // anycast:(Maybe Anycast)
        if (uint(1).load(s, [...p, 'anycast']) !== 0) {
            throw Error('Anycast not supported');
        }
        // workchain_id:int8
        const wc = int(8).load(s, [...p, 'workchainId']);
        // address:bits256
        const addr = uintBig(256).load(s, [...p, 'address']);
        return AddrStd(wc, addr);
    } else if (type === 3) {
        // addr_var$11
        // anycast:(Maybe Anycast)
        if (uint(1).load(s, [...p, 'anycast']) !== 0) {
            throw Error('Anycast not supported');
        }
        // addr_len:(## 9)
        const len = uint(9).load(s, [...p, 'len']);
        // workchain_id:int32
        const wc = int(32).load(s, [...p, 'workchainId']);
        // address:(bits addr_len)
        const addr = uintBig(len).load(s, [...p, 'address']);
        return AddrVar(len, wc, addr);
    } else {
        throw Error('Unreachable');
    }
};

const storeAddress = (t: MsgAddress, b: Builder, p: Path) => {
    switch (t.$) {
        case 'AddrNone': {
            // addr_none$00
            uint(2).store(0, b, [...p, '$']);
            return;
        }
        case 'AddrExtern': {
            // addr_extern$01
            uint(2).store(1, b, [...p, '$']);
            // len:(## 9)
            uint(9).store(t.len, b, [...p, 'len']);
            // external_address:(bits len)
            uintBig(t.len).store(t.address, b, [...p, 'address']);
            return;
        }
        case 'AddrStd': {
            // addr_std$10
            uint(2).store(2, b, [...p, '$']);
            // anycast:(Maybe Anycast)
            uint(1).store(0, b, [...p, 'anycast']);
            // workchain_id:int8
            int(8).store(t.workchainId, b, [...p, 'workchainId']);
            // address:bits256
            uintBig(256).store(t.address, b, [...p, 'address']);
            return;
        }
        case 'AddrVar': {
            // addr_var$11
            uint(2).store(3, b, [...p, '$']);
            // anycast:(Maybe Anycast)
            uint(1).store(0, b, [...p, 'anycast']);
            // addr_len:(## 9)
            uint(9).store(t.len, b, [...p, 'len']);
            // workchain_id:int32
            int(32).store(t.workchainId, b, [...p, 'workchainId']);
            // address:(bits addr_len)
            uintBig(t.len).store(t.address, b, [...p, 'address']);
        }
    }
};

export const msgAddress: Tlb<MsgAddress> = ({
    store: storeAddress,
    load: loadAddress,
});