import { Type, getReturnType } from "./types";
import { IDIdx } from "./id";
import { GenerativeEntity } from "./generators";
import {
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

export type ScopeKind =
  | "program"
  | "trait"
  | "contract"
  | "function"
  | "method"
  | "receive"
  | "block";

export type ScopeItemKind =
  | "let"
  | "parameter"
  | "statement"
  | "struct"
  | "message"
  | "constantDecl"
  | "constantDef"
  | "functionDecl"
  | "functionDef"
  | "methodDecl"
  | "methodDef"
  | "receive"
  | "field"
  | "contract"
  | "trait";

/** Maps each ScopeItemKind to its respective GenerativeEntity specialization. */
type GenerativeEntityMap = {
  let: GenerativeEntity<AstStatement>;
  parameter: GenerativeEntity<AstTypedParameter>;
  statement: GenerativeEntity<AstStatement>;
  struct: GenerativeEntity<AstStructDecl>;
  message: GenerativeEntity<AstMessageDecl>;
  constantDecl: GenerativeEntity<AstConstantDecl>;
  constantDef: GenerativeEntity<AstConstantDef>;
  functionDecl: GenerativeEntity<AstFunctionDecl>;
  functionDef: GenerativeEntity<AstFunctionDef>;
  methodDecl: GenerativeEntity<AstFunctionDecl>;
  methodDef: GenerativeEntity<AstFunctionDef>;
  receive: GenerativeEntity<AstReceiver>;
  field: GenerativeEntity<AstFieldDecl>;
  contract: GenerativeEntity<AstContract>;
  trait: GenerativeEntity<AstTrait>;
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
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  private map: Map<ScopeItemKind, Map<IDIdx, GenerativeEntity<any>>> =
    new Map();

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
    return this.isProgramScope() ? this : this.parentScope!.getProgramScope();
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
   * Put a new entity in the scope according to the Tact semantics.
   */
  public add<T extends ScopeItemKind>(
    kind: T,
    entity: GenerativeEntityMap[T],
  ): void {
    // Determine the appropriate parent scope based on the kind of entity
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

    if (targetScope.map.has(kind)) {
      targetScope.map.get(kind)!.set(entity.idx, entity);
    } else {
      targetScope.map.set(kind, new Map()).get(kind)!.set(entity.idx, entity);
    }
  }

  public get<T extends ScopeItemKind>(
    kind: T,
    id: IDIdx,
  ): GenerativeEntityMap[T] | undefined {
    return this.map.get(kind)?.get(id);
  }

  public getAll<T extends ScopeItemKind>(kind: T): GenerativeEntityMap[T][] {
    const kindMap = this.map.get(kind);
    if (kindMap) {
      return Array.from(kindMap.values());
    }
    return [];
  }

  /**
   * Collects name-type tuples of all the entries with the given type defined within this scope.
   */
  public getEntries(kind: ScopeItemKind): [string, Type][] {
    const names = this.map.get(kind);
    if (names === undefined) {
      return [];
    }
    return Array.from(names)
      .map(([_id, entry]) => [entry.name?.text!, entry.type] as [string, Type])
      .filter((entry): entry is [string, Type] => entry[0] !== undefined);
  }

  /**
   * Collects name-type tuples of all the entries with the given type defined within scope
   * and its parent scopes.
   */
  public getEntriesRecursive(...kinds: ScopeItemKind[]): [string, Type][] {
    const recursiveHelper = (
      kinds: ScopeItemKind[],
      acc: [string, Type][],
      scope?: Scope,
    ): [string, Type][] => {
      if (scope === undefined) {
        return acc;
      }
      const entries = kinds.flatMap((kind) => scope.getEntries(kind));
      if (scope.isProgramScope()) {
        return acc.concat(entries);
      } else {
        return recursiveHelper(kinds, acc.concat(entries), scope.parentScope);
      }
    };
    return recursiveHelper(kinds, [], this);
  }

  /**
   * Collects names of all the entries with the given type defined within this scope.
   */
  public getNames(kind: ScopeItemKind, ty: Type): string[] {
    return this.getEntries(kind)
      .filter(([_name, type]) => type === ty)
      .map(([name, _type]) => name);
  }

  /**
   * Collects names of all the entries with the given type defined within scope
   * and its parent scopes.
   */
  public getNamesRecursive(
    kind: ScopeItemKind,
    ty: Type,
    acc: string[] = [],
  ): string[] {
    const names = this.getNames(kind, ty);
    if (this.isProgramScope()) {
      return acc.concat(names);
    } else {
      return acc.concat(this.parentScope!.getNamesRecursive(kind, ty, names));
    }
  }

  /**
   * Returns all items of the given type defined within this scope.
   */
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  public getItems(kind: ScopeItemKind): GenerativeEntity<any>[] {
    const result = this.map.get(kind);
    return result === undefined ? [] : Array.from(result.values());
  }

  /**
   * Returns all items of the given type defined within this scope and its parents.
   */
  public getItemsRecursive(
    kind: ScopeItemKind,
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    acc: GenerativeEntity<any>[] = [],
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
  ): GenerativeEntity<any>[] {
    const currentItems = this.getItems(kind);
    const accN = acc.concat(currentItems);
    if (!this.isProgramScope() && this.parentScope) {
      return this.parentScope.getItemsRecursive(kind, accN);
    } else {
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
    if (functions === undefined) {
      return this.isProgramScope()
        ? []
        : this.parentScope!.findFunction(kind, returnTy);
    }
    return Array.from(functions.values()).reduce<[string, Type][]>(
      (acc, entry) => {
        if (
          entry.type.kind === "function" &&
          getReturnType(entry.type) === returnTy
        ) {
          acc.push([entry.name?.text!, entry.type]);
        }
        return acc;
      },
      [],
    );
  }

  /**
   * Checks if the given scope defines an identifier.
   */
  public has(kind: ScopeItemKind, name: string): boolean {
    return (
      this.map.has(kind) &&
      Array.from(this.map.get(kind)!).find(
        ([_id, entry]) => entry.name?.text === name,
      ) !== undefined
    );
  }

  /**
   * Checks if the given scope or its parents define an identifier.
   */
  public hasRecursive(kind: ScopeItemKind, name: string): boolean {
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
      kinds.find((kind) => this.parentScope && this.parentScope.kind === kind)
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
