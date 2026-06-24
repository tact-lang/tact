import { _primitive, type Tlb } from "@/core/tlb";

export const bit: Tlb<boolean> = _primitive({
    store: (t, b) => b.storeBit(t),
    load: (s) => s.loadBit(),
});

export const int = (bits: number): Tlb<number> => _primitive({
    store: (t, b) => b.storeInt(t, bits),
    load: (s) => s.loadInt(bits),
});

export const uint = (bits: number): Tlb<number> => _primitive({
    store: (t, b) => b.storeUint(t, bits),
    load: (s) => s.loadUint(bits),
});

export const intVar = (bits: number): Tlb<number> => _primitive({
    store: (t, b) => b.storeVarInt(t, bits),
    load: (s) => s.loadVarInt(bits),
});

export const uintVar = (bits: number): Tlb<number> => _primitive({
    store: (t, b) => b.storeVarUint(t, bits),
    load: (s) => s.loadVarUint(bits),
});

export const coins = uintVar(16);

export const intBig = (bits: number): Tlb<bigint> => _primitive({
    store: (t, b) => b.storeInt(t, bits),
    load: (s) => s.loadIntBig(bits),
});

export const uintBig = (bits: number): Tlb<bigint> => _primitive({
    store: (t, b) => b.storeUint(t, bits),
    load: (s) => s.loadUintBig(bits),
});

export const intVarBig = (bits: number): Tlb<bigint> => _primitive({
    store: (t, b) => b.storeVarInt(t, bits),
    load: (s) => s.loadVarIntBig(bits),
});

export const uintVarBig = (bits: number): Tlb<bigint> => _primitive({
    store: (t, b) => b.storeVarUint(t, bits),
    load: (s) => s.loadVarUintBig(bits),
});