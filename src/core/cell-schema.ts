import { BitReader, Builder, Cell, Slice } from "@ton/core";
import { Just, Maybe, Nothing } from "./maybe";
import { singleton } from "../utils/tricks";
import { Address, AddrExtern, AddrNone, AddrStd, AddrVar } from "./address";

export const getPreload = <T>(f: (s: Slice) => T) => (s: Slice) => {
    const priv = s as unknown as { _reader: BitReader };
    try {
        priv._reader.save();
        return f(s);
    } finally {
        priv._reader.reset();
    }
};

export interface Type<T> {
    store: (t: T, b: Builder) => void;
    load: (s: Slice) => T;
    preload: (s: Slice) => T;
}

export const pure = <T>(t: T): Type<T> => ({
    store: (_t, _b) => {},
    load: (_s) => t,
    preload: (_s) => t,
});

export const ref: Type<Cell> = ({
    store: (t, b) => b.storeRef(t),
    load: (s) => s.loadRef(),
    preload: (s) => s.preloadRef(),
});

export const bit: Type<boolean> = ({
    store: (t, b) => b.storeBit(t),
    load: (s) => s.loadBit(),
    preload: (s) => s.preloadBit(),
});

export const int = (bits: number): Type<number> => ({
    store: (t, b) => b.storeInt(t, bits),
    load: (s) => s.loadInt(bits),
    preload: (s) => s.preloadInt(bits),
});

export const uint = (bits: number): Type<number> => ({
    store: (t, b) => b.storeUint(t, bits),
    load: (s) => s.loadUint(bits),
    preload: (s) => s.loadUint(bits),
});

export const intVar = (bits: number): Type<number> => ({
    store: (t, b) => b.storeVarInt(t, bits),
    load: (s) => s.loadVarInt(bits),
    preload: (s) => s.preloadVarInt(bits),
});

export const coins: Type<bigint> = ({
    store: (t, b) => b.storeCoins(t),
    load: (s) => s.loadCoins(),
    preload: (s) => s.preloadCoins(),
});

export const uintVar = (bits: number): Type<number> => ({
    store: (t, b) => b.storeVarUint(t, bits),
    load: (s) => s.loadVarUint(bits),
    preload: (s) => s.preloadVarUint(bits),
});

export const intBig = (bits: number): Type<bigint> => ({
    store: (t, b) => b.storeInt(t, bits),
    load: (s) => s.loadIntBig(bits),
    preload: (s) => s.preloadIntBig(bits),
});

export const uintBig = (bits: number): Type<bigint> => ({
    store: (t, b) => b.storeUint(t, bits),
    load: (s) => s.loadUintBig(bits),
    preload: (s) => s.preloadUintBig(bits),
});

export const intVarBig = (bits: number): Type<bigint> => ({
    store: (t, b) => b.storeVarInt(t, bits),
    load: (s) => s.loadVarIntBig(bits),
    preload: (s) => s.preloadVarIntBig(bits),
});

export const uintVarBig = (bits: number): Type<bigint> => ({
    store: (t, b) => b.storeVarUint(t, bits),
    load: (s) => s.loadVarUintBig(bits),
    preload: (s) => s.preloadVarUintBig(bits),
});

const loadAddress = (s: Slice): Address => {
    const type = s.loadUint(2);
    if (type === 0) {
        // addr_none$00
        return AddrNone;
    } else if (type === 1) {
        // addr_extern$01 len:(## 9) external_address:(bits len)
        const len = s.loadUint(9);
        return AddrExtern(len, s.loadUintBig(len));
    } else if (type === 2) {
        // addr_std$10 anycast:(Maybe Anycast) workchain_id:int8 address:bits256
        if (s.loadUint(1) !== 0) {
            throw Error('Anycast not supported');
        }
        return AddrStd(s.loadInt(8), s.loadUintBig(256));
    } else if (type === 3) {
        // addr_var$11 anycast:(Maybe Anycast) addr_len:(## 9) workchain_id:int32 address:(bits addr_len)
        if (s.loadUint(1) !== 0) {
            throw Error('Anycast not supported');
        }
        const len = s.loadUint(9);
        return AddrVar(len, s.loadInt(32), s.loadUintBig(len));
    } else {
        throw Error('Unreachable');
    }
};

const storeAddress = (t: Address, b: Builder) => {
    switch (t.$) {
        case 'AddrNone': {
            // addr_none$00
            b.storeUint(0, 2);
            return;
        }
        case 'AddrExtern': {
            // addr_extern$01
            b.storeUint(1, 2);
            // len:(## 9)
            b.storeUint(t.len, 9);
            // external_address:(bits len)
            b.storeUint(t.address, t.len);
            return;
        }
        case 'AddrStd': {
            // addr_std$10
            b.storeUint(2, 2);
            // anycast:(Maybe Anycast)
            b.storeUint(0, 1);
            // workchain_id:int8
            b.storeInt(t.workchainId, 8);
            // address:bits256
            b.storeUint(t.address, 256);
            return;
        }
        case 'AddrVar': {
            // addr_var$11
            b.storeUint(3, 2);
            // anycast:(Maybe Anycast)
            b.storeUint(0, 1);
            // addr_len:(## 9)
            b.storeUint(t.len, 9);
            // workchain_id:int32
            b.storeInt(t.workchainId, 32);
            // address:(bits addr_len)
            b.storeUint(t.address, t.len);
        }
    }
};

export const address: Type<Address> = ({
    store: storeAddress,
    load: loadAddress,
    preload: getPreload(loadAddress),
});

export const maybe = <T>(type: Type<T>): Type<Maybe<T>> => {
    const store = (t: Maybe<T>, b: Builder) => {
        if (t.$ === 'just') {
            b.storeBit(1);
            type.store(t.value, b);
        } else {
            b.storeBit(0);
        }
    };
    const load = (s: Slice) => {
        if (s.loadBit()) {
            return Just(type.load(s));
        } else {
            return Nothing;
        }
    };
    const preload = getPreload(load);
    return { store, load, preload };
};

interface BuildSeq<T> {
    end: Type<T>;
    add: <K extends string, V>(k: K, t: Type<V>) =>
        BuildSeq<T & Record<K, V>>
}
const makeBuildSeq = <T>(end: Type<T>): BuildSeq<T> => {
    const add = <K extends string, V>(k: K, t: Type<V>) => {
        const store = (v: T & Record<K, V>, b: Builder) => {
            end.store(v, b);
            t.store(v[k], b);
        };
        const load = (s: Slice) => ({
            ...end.load(s),
            ...singleton(k, t.load(s)),
        });
        const preload = getPreload(load);
        return makeBuildSeq({ store, load, preload });
    };
    return { end, add };
};

export const object = makeBuildSeq(pure({}));

// interface BuildSel<K, T> {
//     end: Type<T>;
//     add: <V>(k: K, t: Type<V>) => BuildSel<K, T | V>;
// }
// export const sel = <K>(t: Type<K>): BuildSel<K, never> => {
    
// };

// storeBuilder

// storeDict
// storeDictDirect

// storeStringRefTail
// loadStringRefTail

// loadDirect
