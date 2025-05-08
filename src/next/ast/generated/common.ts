/* eslint-disable @typescript-eslint/no-unnecessary-condition */
import type * as $ from "@/next/ast/common";
export type Range = $.Range;
export const Range = (
    start: number,
    end: number,
    path: string,
    code: string,
): Range => {
    const result: Range = {
        kind: "range",
        start,
        end,
        path,
        code,
    };
    Object.defineProperty(result, 'code', {
        value: code,
        writable: true,
        configurable: true,
        enumerable: false,
    });
    return Object.freeze(result);
};
export type Id = $.Id;
export const Id = (text: string, loc: $.Range): $.Id =>
    Object.freeze({
        kind: "id",
        text,
        loc,
    });
export const isId = ($value: Id) => $value.kind === "id";
export type Wildcard = $.Wildcard;
export const Wildcard = (loc: $.Range): $.Wildcard =>
    Object.freeze({
        kind: "wildcard",
        loc,
    });
export const isWildcard = ($value: Wildcard) => $value.kind === "wildcard";
export type OptionalId = $.OptionalId;
export type FuncId = $.FuncId;
export const FuncId = (text: string, loc: $.Range): $.FuncId =>
    Object.freeze({
        kind: "func_id",
        text,
        loc,
    });
export const isFuncId = ($value: FuncId) => $value.kind === "func_id";
export type TypeId = $.TypeId;
export const TypeId = (text: string, loc: $.Range): $.TypeId =>
    Object.freeze({
        kind: "type_id",
        text,
        loc,
    });
export const isTypeId = ($value: TypeId) => $value.kind === "type_id";
