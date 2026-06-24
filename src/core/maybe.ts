// nothing$0 {X:Type} = Maybe X;
// just$1 {X:Type} value:X = Maybe X;

import { TlbError, type Path, type Tlb } from "@/core/tlb";
import type { Builder, Slice } from "@ton/core";

export type Maybe<T> = Nothing | Just<T>
export type Nothing = { readonly $: 'nothing' }
export const Nothing: Nothing = Object.freeze({ $: 'nothing' })
export const isNothing = <T>(m: Maybe<T>): m is Nothing => m.$ === 'nothing';
export type Just<T> = { readonly $: 'just', readonly value: T }
export const Just = <T>(value: T): Just<T> => Object.freeze({ $: 'just', value });
export const isJust = <T>(m: Maybe<T>): m is Just<T> => m.$ === 'just';

export const maybe = <T>(type: Tlb<T>): Tlb<Maybe<T>> => {
    const store = (t: Maybe<T>, b: Builder, p: Path) => {
        if (t.$ === 'nothing') {
            b.storeBit(0);
            return;
        }
        try {
            b.storeBit(1);
        } catch (e) {
            throw new TlbError(e, [...p, '$']);
        }
        type.store(t.value, b, [...p, 'value']);
    };
    const load = (s: Slice, p: Path) => {
        const bit = (() => {
            try {
                return s.loadBit();
            } catch (e) {
                throw new TlbError(e, [...p, '$']);
            }
        })();
        if (bit) {
            return Just(type.load(s, [...p, 'value']));
        } else {
            return Nothing;
        }
    };
    return { store, load };
};