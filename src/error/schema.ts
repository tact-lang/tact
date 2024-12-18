/**
 * Describes all possible errors
 */

import { SrcInfo } from '../grammar';
import { ErrorDisplay } from './display';

export const parserErrorSchema = <T, U>({ text, sub }: ErrorDisplay<T>, handle: (t: T) => U) => ({
    noDuplicateFunctionAttribute: (attr: string) => {
        return handle(sub`Duplicate function attribute "${text(attr)}"`);
    },
    reservedVarPrefix: (prefix: string) => {
        return handle(text(`Variable name cannot start with "${prefix}"`));
    },
});

const withLocation = <T, U>(display: ErrorDisplay<T>, handle: (t: T) => U) => {
    return (t: T) => (loc: SrcInfo) => handle(display.at(loc, t));
};

export const errorSchema = <T, U>(display: ErrorDisplay<T>, handle: (t: T) => U) => ({
    parser: parserErrorSchema(display, withLocation(display, handle)),
});

export type ErrorType<T> = ReturnType<typeof errorSchema<unknown, T>>
