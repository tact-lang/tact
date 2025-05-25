export type Loc = Range | Builtin;

export type Builtin = {
    readonly kind: "builtin";
};

export type Range = {
    readonly kind: "range";
    readonly start: number;
    readonly end: number;
    readonly path: string;
    readonly code: string;
}

export type OptionalId = Id | Wildcard;

export type Id = {
    readonly kind: "id";
    readonly text: string;
    readonly loc: Loc;
};

export type Wildcard = {
    readonly kind: "wildcard";
    readonly loc: Loc;
};

export type FuncId = {
    readonly kind: "func_id";
    readonly text: string;
    readonly loc: Loc;
};

export type TypeId = {
    readonly kind: "type_id";
    readonly text: string;
    readonly loc: Loc;
};

export type Language = "func" | "tact";
