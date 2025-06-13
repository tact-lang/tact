/* eslint-disable @typescript-eslint/no-unnecessary-condition */
import type * as $ from "@/next/ast/common";
import { hideProperty } from "@/utils/tricks";
export type Loc = $.Loc;
export type Builtin = $.Builtin;
export const Builtin = (): $.Builtin =>
    Object.freeze({
        kind: "builtin",
    });
export const isBuiltin = ($value: Builtin) => $value.kind === "builtin";
export type Range = $.Range;
export const Range = (
    start: number,
    end: number,
    path: string,
    code: string,
): $.Range => {
    const result: $.Range = {
        kind: "range",
        start,
        end,
        path,
        code,
    };
    hideProperty(result, "code");
    hideProperty(result, "path");
    return Object.freeze(result);
};
export type Id = $.Id;
export const Id = (text: string, loc: $.Loc): $.Id =>
    Object.freeze({
        kind: "id",
        text,
        loc,
    });
export const isId = ($value: Id) => $value.kind === "id";
export type Wildcard = $.Wildcard;
export const Wildcard = (loc: $.Loc): $.Wildcard =>
    Object.freeze({
        kind: "wildcard",
        loc,
    });
export const isWildcard = ($value: Wildcard) => $value.kind === "wildcard";
export type OptionalId = $.OptionalId;
export type FuncId = $.FuncId;
export const FuncId = (text: string, loc: $.Loc): $.FuncId =>
    Object.freeze({
        kind: "func_id",
        text,
        loc,
    });
export const isFuncId = ($value: FuncId) => $value.kind === "func_id";
export type TypeId = $.TypeId;
export const TypeId = (text: string, loc: $.Loc): $.TypeId =>
    Object.freeze({
        kind: "type_id",
        text,
        loc,
    });
export const isTypeId = ($value: TypeId) => $value.kind === "type_id";
export type Ordered<V> = $.Ordered<V>;
export const Ordered = <V>(
    order: readonly string[],
    map: ReadonlyMap<string, V>,
): $.Ordered<V> =>
    Object.freeze({
        order,
        map,
    });
