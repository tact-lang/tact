import type { Type } from "./types";
import { getReturnType } from "./types";
import type { IDIdx } from "./id";
import type { GenerativeEntity } from "./generators";
import type {
    AstFunctionDef,
    AstTypedParameter,
    AstTrait,
    AstStatement,
    AstStructDecl,
    AstFieldDecl,
    AstReceiver,
    AstContract,
    AstConstantDecl,
    AstConstantDef,
    AstFunctionDecl,
    AstMessageDecl,
} from "../../src/ast/ast";
import type { NamedGenerativeEntity } from "./generators/generator";

export type ScopeKind =
    | "program"
    | "trait"
    | "contract"
    | "function"
    | "method"
    | "receive"
    | "block";

const namedScopeItemKinds = [
    "field",
    "contract",
    "trait",
    "struct",
    "message",
    "constantDecl",
    "constantDef",
    "functionDecl",
    "functionDef",
    "methodDecl",
    "methodDef",
    "let",
    "parameter",
] as const;
export type NamedScopeItemKind = (typeof namedScopeItemKinds)[number];
function isNamedScopeItemKind(val: string): val is NamedScopeItemKind {
    return namedScopeItemKinds.find((tpe) => tpe === val) ? true : false;
}

// eslint-disable-next-line @typescript-eslint/no-unused-vars
const unnamedScopeItemKinds = ["statement", "receive"] as const;
export type UnnamedScopeItemKind = (typeof unnamedScopeItemKinds)[number];

export type ScopeItemKind = NamedScopeItemKind | UnnamedScopeItemKind;

/** Maps each ScopeItemKind to its respective GenerativeEntity specialization. */
type NamedGenerativeEntityMap = {
    let: NamedGenerativeEntity<AstStatement>;
    parameter: NamedGenerativeEntity<AstTypedParameter>;
    struct: NamedGenerativeEntity<AstStructDecl>;
    message: NamedGenerativeEntity<AstMessageDecl>;
    constantDecl: NamedGenerativeEntity<AstConstantDecl>;
    constantDef: NamedGenerativeEntity<AstConstantDef>;
    functionDecl: NamedGenerativeEntity<AstFunctionDecl>;
    functionDef: NamedGenerativeEntity<AstFunctionDef>;
    methodDecl: NamedGenerativeEntity<AstFunctionDecl>;
    methodDef: NamedGenerativeEntity<AstFunctionDef>;
    field: NamedGenerativeEntity<AstFieldDecl>;
    contract: NamedGenerativeEntity<AstContract>;
    trait: NamedGenerativeEntity<AstTrait>;
};
type GenerativeEntityMap = {
    statement: GenerativeEntity<AstStatement>;
    receive: GenerativeEntity<AstReceiver>;
};

/**
 * Scope contains AST entries generated during the bottom-up AST generation and
 * provides an information to access data in parent scopes.
 */
export class Scope {
    kind: ScopeKind;

    /** Reference to the parent scope. `undefined` for the top-level scope. */
    readonly parentScope?: Scope;

    /**
     * Contains AST entries generated during the bottom-up AST generation.
     */
    private mapUnnamed: Map<
        UnnamedScopeItemKind,
        Map<IDIdx, GenerativeEntity<any>> // eslint-disable-line @typescript-eslint/no-explicit-any
    > = new Map();

    private mapNamed: Map<
        NamedScopeItemKind,
        Map<IDIdx, NamedGenerativeEntity<any>> // eslint-disable-line @typescript-eslint/no-explicit-any
    > = new Map();

    constructor(kind: ScopeKind, parentScope: Scope | undefined) {
        this.kind = kind;
        this.parentScope = parentScope;
    }

    public isProgramScope(): boolean {
        return this.parentScope === undefined;
    }

    /**
     * Returns the top-level scope.
     */
    public getProgramScope(): Scope {
        return this.isProgramScope()
            ? this
            : this.parentScope!.getProgramScope();
    }

    /**
     * Returns the contract-level scope or `undefined` if it is not possible to reach it from the current scope.
     */
    public getContractScope(): Scope | undefined {
        if (this.isContractScope()) {
            return this;
        }
        if (this.parentScope === undefined) {
            return undefined;
        }
        return this.parentScope!.getContractScope();
    }

    public isContractScope(): boolean {
        return (
            this.parentScope !== undefined &&
            this.parentScope.isProgramScope() &&
            this.kind === "contract"
        );
    }

    /**
     * Determine the appropriate parent scope based on the kind of entity
     */
    private getTargetScopeToAdd(kind: ScopeItemKind) {
        let targetScope: Scope | undefined;
        switch (kind) {
            case "let":
            case "parameter":
            case "statement":
                // eslint-disable-next-line @typescript-eslint/no-this-alias
                targetScope = this;
                break;
            case "constantDecl":
            case "constantDef":
                targetScope = this.findParent("trait", "contract", "program");
                break;
            case "functionDecl":
            case "functionDef":
            case "trait":
                targetScope = this.findParent("program");
                break;
            case "methodDecl":
            case "methodDef":
            case "field":
            case "receive":
                targetScope = this.findParent("trait", "contract");
                break;
            case "contract":
            case "struct":
            case "message":
                targetScope = this.findParent("program");
                break;
            default:
                throw new Error("Unsupported kind for adding to scope.");
        }
        if (targetScope === undefined) {
            throw new Error(`Cannot add "${kind}" to the "${this.kind}" scope`);
        }
        return targetScope;
    }

    /**
     * Put a new entity in the scope according to the Tact semantics.
     */
    public addUnnamed<T extends UnnamedScopeItemKind>(
        kind: T,
        entity: GenerativeEntityMap[T],
    ): void {
        const targetScope = this.getTargetScopeToAdd(kind);
        if (targetScope.mapUnnamed.has(kind)) {
            targetScope.mapUnnamed.get(kind)!.set(entity.idx, entity);
        } else {
            targetScope.mapUnnamed
                .set(kind, new Map())
                .get(kind)!
                .set(entity.idx, entity);
        }
    }

    /**
     * Put a new entity in the scope according to the Tact semantics.
     */
    public addNamed<T extends NamedScopeItemKind>(
        kind: T,
        entity: NamedGenerativeEntityMap[T],
    ): void {
        const targetScope = this.getTargetScopeToAdd(kind);

        if (isNamedScopeItemKind(kind)) {
            if (targetScope.mapNamed.has(kind)) {
                targetScope.mapNamed.get(kind)!.set(entity.idx, entity);
            } else {
                targetScope.mapNamed
                    .set(kind, new Map())
                    .get(kind)!
                    .set(entity.idx, entity);
            }
        }
    }

    public getAllUnnamed<T extends UnnamedScopeItemKind>(
        kind: T,
    ): GenerativeEntityMap[T][] {
        const kindMap = this.mapUnnamed.get(kind);
        if (kindMap) {
            return Array.from(kindMap.values());
        }
        return [];
    }
    public getAllNamed<T extends NamedScopeItemKind>(
        kind: T,
    ): NamedGenerativeEntityMap[T][] {
        const kindMap = this.mapNamed.get(kind);
        if (kindMap) {
            return Array.from(kindMap.values());
        }
        return [];
    }

    /**
     * Collects name-type tuples of all the entries with the given type defined within this scope.
     */
    public getNamedEntries(kind: NamedScopeItemKind): [string, Type][] {
        const names = this.mapNamed.get(kind);
        if (names === undefined) {
            return [];
        }
        return Array.from(names)
            .map(
                ([_id, entry]) =>
                    [entry.name.text, entry.type] as [string | undefined, Type],
            )
            .filter(
                (nameType): nameType is [string, Type] =>
                    nameType[0] !== undefined,
            );
    }

    /**
     * Collects name-type tuples of all the entries with the given type defined within scope
     * and its parent scopes.
     */
    public getNamedEntriesRecursive(
        ...kinds: NamedScopeItemKind[]
    ): [string, Type][] {
        const recursiveHelper = (
            kinds: NamedScopeItemKind[],
            acc: [string, Type][],
            scope?: Scope,
        ): [string, Type][] => {
            if (scope === undefined) {
                return acc;
            }
            const entries = kinds.flatMap((kind) =>
                scope.getNamedEntries(kind),
            );
            if (scope.isProgramScope()) {
                return acc.concat(entries);
            } else {
                return recursiveHelper(
                    kinds,
                    acc.concat(entries),
                    scope.parentScope,
                );
            }
        };
        return recursiveHelper(kinds, [], this);
    }

    /**
     * Collects names of all the entries with the given type defined within this scope.
     */
    public getNames(kind: NamedScopeItemKind, ty: Type): string[] {
        return this.getNamedEntries(kind)
            .filter(([_name, type]) => type === ty)
            .map(([name, _type]) => name);
    }

    /**
     * Collects names of all the entries with the given type defined within scope
     * and its parent scopes.
     */
    public getNamesRecursive(
        kind: NamedScopeItemKind,
        ty: Type,
        acc: string[] = [],
    ): string[] {
        const names = this.getNames(kind, ty);
        if (this.isProgramScope()) {
            return acc.concat(names);
        } else {
            return acc.concat(
                this.parentScope!.getNamesRecursive(kind, ty, names),
            );
        }
    }

    /**
     * Collects all names of all entities in the scope.
     */
    public getAllNames(): string[] {
        return Array.from(this.mapNamed.values()).flatMap((m) =>
            Array.from(m.values()).map((entity) => entity.name.text),
        );
    }

    /**
     * Collects all names of all entities in the scope and it all parent scopes.
     */
    public getAllNamesRecursive(): string[] {
        return this.getAllNames().concat(
            this.parentScope?.getAllNamesRecursive() ?? [],
        );
    }

    /**
     * Returns all items of the given type defined within this scope.
     */
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    public getItems(kind: ScopeItemKind): GenerativeEntity<any>[] {
        const result = isNamedScopeItemKind(kind)
            ? this.mapNamed.get(kind)
            : this.mapUnnamed.get(kind);
        return result === undefined ? [] : Array.from(result.values());
    }

    /**
     * Returns all items of the given type defined within this scope and its parents.
     */
    public getItemsRecursive(
        kind: NamedScopeItemKind,
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        acc?: GenerativeEntity<any>[], // eslint-disable-next-line @typescript-eslint/no-explicit-any
    ): NamedGenerativeEntity<any>[];
    public getItemsRecursive(
        kind: UnnamedScopeItemKind,
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        acc?: GenerativeEntity<any>[], // eslint-disable-next-line @typescript-eslint/no-explicit-any
    ): GenerativeEntity<any>[];
    public getItemsRecursive(
        kind: ScopeItemKind,
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        acc: GenerativeEntity<any>[] = [],
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
    ): GenerativeEntity<any>[] {
        const currentItems = this.getItems(kind);
        const accN = acc.concat(currentItems);
        if (!this.isProgramScope() && this.parentScope)
            return isNamedScopeItemKind(kind)
                ? this.parentScope.getItemsRecursive(kind, accN)
                : this.parentScope.getItemsRecursive(kind, accN);
        else {
            return accN;
        }
    }

    /**
     * Recursively searches for functions or methods that return the specified type.
     * @param kind The kind of callable to search for.
     * @param returnTy The return type to match.
     * @return An array of tuples containing the function/method names and their full signatures.
     */
    public findFunction(
        kind: "methodDecl" | "methodDef" | "functionDecl" | "functionDef",
        returnTy: Type,
    ): [string, Type][] {
        const functions = this.getItemsRecursive(kind);
        return Array.from(functions.values()).reduce<[string, Type][]>(
            (acc, entry) => {
                if (
                    entry.type.kind === "function" &&
                    getReturnType(entry.type) === returnTy
                ) {
                    acc.push([entry.name.text, entry.type]);
                }
                return acc;
            },
            [],
        );
    }

    /**
     * Checks if the given scope defines an identifier.
     */
    public has(kind: NamedScopeItemKind, name: string): boolean {
        return (
            this.mapNamed.has(kind) &&
            Array.from(this.mapNamed.get(kind)!).find(
                ([_id, entry]) => entry.name.text === name,
            ) !== undefined
        );
    }

    /**
     * Checks if the given scope or its parents define an identifier.
     */
    public hasRecursive(kind: NamedScopeItemKind, name: string): boolean {
        if (this.has(kind, name)) {
            return true;
        } else if (this.isProgramScope()) {
            return false;
        } else {
            return this.parentScope!.hasRecursive(kind, name);
        }
    }

    /**
     * Looks for a parent scope with one of the given kinds.
     */
    public findParent(...kinds: ScopeKind[]): Scope | undefined {
        if (kinds.find((kind) => this.kind === kind)) {
            return this;
        } else if (this.parentScope === undefined) {
            return undefined;
        } else if (
            kinds.find(
                (kind) => this.parentScope && this.parentScope.kind === kind,
            )
        ) {
            return this.parentScope;
        } else {
            return this.parentScope.findParent(...kinds);
        }
    }

    /**
     * Returns true if the given scope has one or more ancestors with the given kind.
     */
    public hasParent(...kinds: ScopeKind[]): boolean {
        return this.findParent(...kinds) !== undefined;
    }

    /**
     * Returns true if the given scope is defined inside one of the given kinds.
     */
    public definedIn(...kinds: ScopeKind[]): boolean {
        return kinds.find((k) => this.kind == k) !== undefined;
    }
}
