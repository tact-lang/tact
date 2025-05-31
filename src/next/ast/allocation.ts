import type * as Ast from "@/next/ast";
// import * as E from "@/next/types/errors";

export type TlbType =
    | TlbInt
    | TlbVarInt
    | TlbBool
    | TlbAddress
    | TlbString
    | TlbUnknown
    | TlbLiteral
    | TlbBits
    | TlbMap
    | TlbRef
    | TlbMaybe
    | TlbFields
    | TlbUnion

export type TlbTypeNoRef = 
    | TlbInt
    | TlbVarInt
    | TlbBool
    | TlbAddress
    | TlbLiteral
    | TlbBits
    | TlbMaybeNoRef
    | TlbFieldsNoRef
    | TlbUnionNoRef

export type TlbInt = {
    readonly kind: 'int';
    readonly sign: Ast.Signedness;
    readonly width: number;
}

export type TlbVarInt = {
    readonly kind: 'varint';
    readonly sign: Ast.Signedness;
    readonly width: Ast.VarIntWidth;
}

export type TlbBool = {
    readonly kind: 'bool';
}

export type TlbAddress = {
    readonly kind: 'address';
}

export type TlbString = {
    readonly kind: 'string';
}

export type TlbUnknown = {
    // aka ^Cell
    readonly kind: 'unknown';
}

export type TlbLiteral = {
    readonly kind: 'literal';
    readonly width: number;
    readonly value: bigint;
}

export type TlbBits = {
    readonly kind: 'ref';
    readonly width: number;
}

export type TlbRef = {
    readonly kind: 'ref';
    readonly type: TlbType;
}

export type TlbMap = {
    readonly kind: 'map';
    readonly key: TlbTypeNoRef;
    readonly value: TlbType;
}

export type TlbMaybe = {
    readonly kind: 'maybe';
    readonly type: TlbType;
}

export type TlbFields = {
    readonly kind: 'fields';
    readonly children: readonly TlbType[];
}

export type TlbUnion = {
    readonly kind: 'union';
    readonly prefixWidth: number;
    readonly children: readonly TlbCase[];
}

export type TlbCase = {
    readonly prefix: bigint;
    readonly type: TlbType;
}

export type TlbMaybeNoRef = {
    readonly kind: 'maybe';
    readonly type: TlbCaseNoRef;
}

export type TlbFieldsNoRef = {
    readonly kind: 'fields';
    readonly children: readonly TlbCaseNoRef[];
}

export type TlbUnionNoRef = {
    readonly kind: 'union';
    readonly prefixWidth: number;
    readonly children: readonly TlbCaseNoRef[];
}

export type TlbCaseNoRef = {
    readonly prefix: bigint;
    readonly type: TlbCaseNoRef;
}