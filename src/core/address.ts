export type Address =
    | AddrNone
    | AddrExtern
    | AddrStd
    | AddrVar
export type AddrNone = {
    readonly $: 'AddrNone'
}
export const AddrNone: AddrNone = Object.freeze({ $: "AddrNone" });
export const isAddrNone = (a: Address): a is AddrNone => a.$ === 'AddrNone';
export type AddrExtern = {
    readonly $: 'AddrExtern'
    readonly len: number
    readonly address: bigint; // bits len
}
export const AddrExtern = (len: number, address: bigint): AddrExtern => Object.freeze({
    $: 'AddrExtern', address, len,
})
export const isAddrExtern = (a: Address): a is AddrExtern => a.$ === 'AddrExtern';
export type AddrStd = {
    readonly $: 'AddrStd'
    // readonly anycast: Maybe<Anycast>;
    readonly workchainId: number;
    readonly address: bigint;
}
export const AddrStd = (workchainId: number, address: bigint): AddrStd => Object.freeze({
    $: 'AddrStd', address, workchainId,
})
export const isAddrStd = (a: Address): a is AddrStd => a.$ === 'AddrStd';
export type AddrVar = {
    readonly $: 'AddrVar'
    // readonly anycast: Maybe<Anycast>
    readonly len: number // ## 9
    readonly workchainId: number // int32
    readonly address: bigint // bits addr_len
}
export const AddrVar = (len: number, workchainId: number, address: bigint): AddrVar => Object.freeze({
    $: "AddrVar", address, len, workchainId,
});
export const isAddrVar = (a: Address): a is AddrVar => a.$ === 'AddrVar';
// type Anycast = {
//     depth: number; // (#<= 30) { depth >= 1 }
//     rewrite_pfx: bigint; // (bits depth)
// }