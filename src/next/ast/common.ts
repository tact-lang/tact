export type Range = {
    readonly start: number;
    readonly end: number;
};

export type OptionalId = Id | Wildcard;

export type Id = {
    readonly kind: "id";
    readonly text: string;
    readonly loc: Range;
};

export type Wildcard = {
    readonly kind: "wildcard";
    readonly loc: Range;
};

export type FuncId = {
    readonly kind: "func_id";
    readonly text: string;
    readonly loc: Range;
};

export type TypeId = {
    readonly kind: "type_id";
    readonly text: string;
    readonly loc: Range;
};

export type Language = "func" | "tact";
