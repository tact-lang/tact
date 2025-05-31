/* eslint-disable @typescript-eslint/no-unnecessary-condition */
/* eslint-disable @typescript-eslint/no-base-to-string */
import type * as Ast from "@/next/ast";
import * as Ty from "@/next/scoping/generated/type";
import { zip } from "@/utils/array";
import { throwInternal } from "@/error/errors";
import { type MismatchTree, TcErrors } from "@/next/scoping/errors";

const VarGen = () => {
    let nextId = 0;
    return function freshTVar() {
        const id = nextId++;
        return Ast.VTypeVar(id);
    };
};

// left: Either<T, U>
// left: Int
// left: Maybe<Cell>
// left: Slice

// isGround = нет типовых переменных: Either<Cell, Cell>
// isSimple = Cons<a, b, c, d>      : Either<T, U>
// isGround || isSimple
// extends fun foo(self: Either<Cell, Cell>) {}
// extends fun foo<T, U>(self: Either<T, U>) {}
// fun bar() { let e: Either<Cell, Cell> = ...; e.foo() }

// extends fun foo<T>(self: T);
// extends fun foo<K, V>(self: Either<K, V>);
// let x: Either<A, B>;
// x.foo();
// findTypeMethod("foo", Either<A, B>);

// const contractExt: Map<string, ContractExtensionRecord[]> = new Map();

const isNull = (type: Ty.LocType) => type.kind === 'cons_type' && type.name.text === 'Null';

const getExprChecker = (
    getType: (key: string) => Ast.TypeDecl | undefined,
    hasTypeParam: (key: string) => boolean,
    err: TcErrors<string, void>,
) => {
    const typeVars: Map<number, Ty.LocType> = new Map();

    const simplifyHead = (type: Ty.Type): Ty.Type => simplifyHeadAux(type, 0);
    const simplifyHeadAux = (type: Ty.Type, depth: number): Ty.Type => {
        switch (type.kind) {
            case "type_var": return simplifyVar(type, depth);
            case "cons_type": return simplifyAlias(type, depth);
            default: return type;
        }
    };
    const simplifyVar = (type: Ty.TypeVar, depth: number): Ty.Type => {
        const foundType = typeVars.get(type.id);
        return foundType ? simplifyHeadAux(foundType, depth + 1) : type;
    };
    const simplifyAlias = (type: Ty.TypeCons, depth: number): Ty.Type => {
        if (depth >= 100) {
            err.instantiationLimit()(type.loc);
            return Ty.TypeErrorRecovered();
        }
        const name = type.name.text;
        const maybeAlias = getType(name);
        if (!maybeAlias) {
            err.typeNotDefined(name)(type.name.loc);
            return Ty.TypeErrorRecovered();
        }
        if (maybeAlias.kind !== 'alias_decl') {
            return type;
        }
        const factualLen = type.typeArgs.length;
        const expectedLen = maybeAlias.typeParams.length;
        if (factualLen !== expectedLen) {
            err.typeArity(name, factualLen, expectedLen)(type.loc);
        }
        return simplifyHeadAux(
            substParams(
                maybeAlias.type,
                maybeAlias.typeParams,
                type.typeArgs,
            ),
            depth + 1,
        );
    };

    const assignTo = (to: Ty.Type, from: Ty.Type): boolean => {
        if (from.kind === 'ERROR') {
            return false;
        }
        if (from.kind === 'type_var') {
            return throwInternal("Type variable on top level of assignment");
        }
        const children: MismatchTree[] = [];
        const result = assignToAux1(to, from, children);
        if (!result) {
            for (const tree of children) {
                err.typeMismatch(tree)(from.loc);
            }
        }
        return result;
    };
    const assignAll = (
        to: readonly Ty.Type[],
        from: readonly Ty.Type[],
        parent: MismatchTree[]
    ): boolean => {
        if (to.length !== from.length) {
            return throwInternal("Arity check failed after kind checks");
        }
        return zip(to, from)
            .map(([elemTo, elemFrom]) => assignToAux1(elemTo, elemFrom, parent))
            // eslint-disable-next-line @typescript-eslint/no-unnecessary-boolean-literal-compare
            .every(x => x === true)
    };
    const assignToAux1 = (
        to: Ty.Type,
        from: Ty.Type,
        parent: MismatchTree[]
    ) => {
        // Substitute type variables and aliases
        to = simplifyHead(to);
        from = simplifyHead(from);
        // If either argument is already a recovery, no more
        // error messages should be emitted
        if (to.kind === 'ERROR' || from.kind === 'ERROR') {
            return false;
        }
        // If we're assigning something with type variables in it,
        // the global invariant of type synthesis was violated
        if (from.kind === 'type_var') {
            return throwInternal("Type variable on right side of assignment");
        }
        if (to.kind === 'type_var') {
            typeVars.set(to.id, from);
            return true;
        }
        const children: MismatchTree[] = [];
        const result = assignToAux2(to, from, children);
        if (!result) {
            parent.push({ to, from, children });
        }
        return result;
    };
    const assignToAux2 = (
        to: Ty.LocType,
        from: Ty.LocType,
        tree: MismatchTree[],
    ): boolean => {
        switch (to.kind) {
            case 'TyBuilder':
            case 'TyCell':
            case 'TyInt':
            case 'TySlice':
            case "unit_type": {
                return from.kind === to.kind;
            }
            case "tuple_type":
            case "tensor_type": {
                return from.kind === to.kind && assignAll(to.typeArgs, from.typeArgs, tree);
            }
            case "map_type": {
                return isNull(from)
                    || from.kind === 'map_type' && assignToAux1(to.key, from.key, tree) && assignToAux1(to.value, from.value, tree);
            }
            case 'cons_type': {
                return hasTypeParam(to.name.text) && to.typeArgs.length === 0
                    || to.name.text === 'Maybe' && isNull(from)
                    || from.kind === 'cons_type' && to.name.text === from.name.text && assignAll(to.typeArgs, from.typeArgs, tree);
            }
        }
    };

    let nextId = 0;
    const freshTVar = () => {
        const id = nextId++;

        const resolve = (loc: Ty.Loc) => {
            const type = typeVars.get(id);
            if (!type) {
                // TODO: think if it should be check at declaration
                //       time and `throwInternal` here
                err.danglingTypeParam()(loc);
                return Ty.TypeErrorRecovered();
            }
            return type;
        };

        return {
            type: Ty.TypeVar(id),
            resolve,
        };
    };

    return {
        assignTo,
        freshTVar,
        checkExpr,
    };
};
