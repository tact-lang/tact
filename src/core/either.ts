// left$0 {X:Type} {Y:Type} value:X = Either X Y;
// right$1 {X:Type} {Y:Type} value:Y = Either X Y;

import { uint } from "@/core/numeric";
import type { Tlb } from "@/core/tlb";

export type Either<L, R> = Left<L> | Right<R>
export type Left<L> = { readonly $: 'left', readonly value: L }
export const Left = <L>(value: L): Left<L> => Object.freeze({ $: 'left', value });
export const isLeft = <L>(m: Either<L, unknown>): m is Left<L> => m.$ === 'left';
export type Right<R> = { readonly $: 'right', readonly value: R }
export const Right = <R>(value: R): Right<R> => Object.freeze({ $: 'right', value });
export const isRight = <R>(m: Either<unknown, R>): m is Right<R> => m.$ === 'right';

export const either = <L, R>(left: Tlb<L>, right: Tlb<R>): Tlb<Either<L, R>> => ({
    store: (t, b, p) => {
        if (t.$ === 'left') {
            uint(1).store(0, b, [...p, '$']);
            left.store(t.value, b, [...p, 'value']);
        } else {
            uint(1).store(1, b, [...p, '$']);
            right.store(t.value, b, [...p, 'value']);
        }
    },
    load: (s, p) => {
        const type = uint(1).load(s, [...p, '$']);
        if (type === 0) {
            return Left(left.load(s, [...p, 'value']));
        } else {
            return Right(right.load(s, [...p, 'value']));
        }
    },
});
