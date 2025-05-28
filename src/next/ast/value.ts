export type Value = VNumber

export type VNumber = {
    readonly kind: 'number';
    readonly value: bigint;
}
