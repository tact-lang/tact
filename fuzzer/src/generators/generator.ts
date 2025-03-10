import type { AstId } from "../../../src/ast/ast";
import { nextId } from "../id";
import type { IDIdx } from "../id";
import type { Type } from "../types";

import type fc from "fast-check";

abstract class GenerativeEntityBase {
    /** The unique index of the entity. */
    public idx: IDIdx;

    /** An optional name of the entity. */
    public name?: AstId;

    /** The type of the entity. */
    public type: Type;

    constructor(type: Type, name?: AstId) {
        this.idx = nextId();
        this.name = name;
        this.type = type;
    }
}

/**
 * Abstract base class for entities that generate AST structures.
 */
export abstract class GenerativeEntity<T> extends GenerativeEntityBase {
    abstract generate(): fc.Arbitrary<T>;
}
/**
 * A specialized version of GenerativeEntity that cannot generate AST entities in some cases.
 */
export abstract class GenerativeEntityOpt<T> extends GenerativeEntityBase {
    abstract generate(): fc.Arbitrary<T> | undefined;
}
