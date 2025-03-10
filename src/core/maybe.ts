export type Maybe<T> = Nothing | Just<T>
export type Nothing = { readonly $: 'nothing' }
export const Nothing: Nothing = Object.freeze({ $: 'nothing' })
export const isNothing = <T>(m: Maybe<T>): m is Nothing => m.$ === 'nothing';
export type Just<T> = { readonly $: 'just', readonly value: T }
export const Just = <T>(value: T): Just<T> => Object.freeze({ $: 'just', value });
export const isJust = <T>(m: Maybe<T>): m is Just<T> => m.$ === 'just';
