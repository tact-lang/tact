import type * as Ast from "@/ast/ast";
import type { Type } from "@/test/fuzzer/src/types";

import type fc from "fast-check";

abstract class GenerativeEntityBase {
    /** The type of the entity. */
    public type: Type;

    constructor(type: Type) {
        this.type = type;
    }
}

/**
 * Abstract base class for entities that generate AST structures.
 */
export abstract class GenerativeEntity<T> extends GenerativeEntityBase {
    abstract generate(): fc.Arbitrary<T>;
}

export abstract class NamedGenerativeEntity<T> extends GenerativeEntity<T> {
    public name: Ast.Id;

    constructor(type: Type, name: Ast.Id) {
        super(type);
        this.name = name;
    }
}

/**
 * A specialized version of GenerativeEntity that cannot generate AST entities in some cases.
 */
export abstract class GenerativeEntityOpt<T> extends GenerativeEntityBase {
    abstract generate(): fc.Arbitrary<T> | undefined;
}
