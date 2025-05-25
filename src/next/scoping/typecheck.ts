() => E.WithLog<FlatType>

export type Unifier = ReturnType<typeof createUnifier>
export type LocalUnifier = ReturnType<Unifier["withParams"]>

/* eslint-disable @typescript-eslint/no-unnecessary-condition */
/* eslint-disable @typescript-eslint/no-base-to-string */
import { makeVisitor, memo } from "@/utils/tricks";
import type { Logger } from "@/error/logger-util";
import type { Implicit, TactImport, TactSource } from "@/next/imports/source";
import type * as Ast from "@/next/ast";
import type { Loc } from "@/next/ast";
import * as Ty from "@/next/scoping/generated/type";
import { zip } from "@/utils/array";
import { throwInternal } from "@/error/errors";
import { type MismatchTree, TcErrors } from "@/next/scoping/errors";

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

    const mgu = (left: Ty.Type, right: Ty.Type, loc: Ty.Loc): Ty.Type => {
        left = simplifyHead(left);
        right = simplifyHead(right);
        if (left.kind === 'ERROR' || right.kind === 'ERROR') {
            return Ty.TypeErrorRecovered();
        }
        if (left.kind === 'type_var' || right.kind === 'type_var') {
            return throwInternal("Trying to unify type variable");
        }
        const children: MismatchTree[] = [];
        if (assignToAux1(left, right, children)) {
            return left;
        }
        if (assignToAux1(right, left, children)) {
            return right;
        }
        if (isNull(right)) {
            return Maybe(left, loc);
        }
        if (isNull(left)) {
            return Maybe(right, loc);
        }
        for (const tree of children) {
            err.typeMismatch(tree)(loc);
        }
        return Ty.TypeErrorRecovered();
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

    const checkNull = (node: Ast.Null): Ty.Type => {
        return Null(Ty.Inferred(node.loc, "null literal"));
    };

    const checkUnit = (node: Ast.Unit): Ty.Type => {
        return Unit(Ty.Inferred(node.loc, "unit literal"));
    };

    const checkString = (node: Ast.String): Ty.Type => {
        return String(Ty.Inferred(node.loc, "string literal"));
    };

    const checkNumber = (node: Ast.Number): Ty.Type => {
        return Int257(Ty.Inferred(node.loc, "numeric literal"));
    };

    const checkBoolean = (node: Ast.Boolean): Ty.Type => {
        return Bool(Ty.Inferred(node.loc, "boolean literal"));
    };

    const checkUnaryExpr = (node: Ast.OpUnary): Ty.Type => {
        const resultLoc = Ty.Inferred(node.loc, `result of ${node.op} operator`);
        const paramLoc = Ty.Builtin(`parameter of "${node.op}" operator`);
        const argType = checkExpr(node.operand);
        switch (node.op) {
            case "+":
            case "-":
            case "~": {
                if (!assignTo(Int257(paramLoc), argType)) {
                    return Ty.TypeErrorRecovered();
                }
                return Int257(resultLoc);
            }
            case "!": {
                if (!assignTo(Bool(paramLoc), argType)) {
                    return Ty.TypeErrorRecovered();
                }
                return Bool(resultLoc);
            }
            case "!!": {
                // fun !!_<T>(x: T?): T;
                const tv = freshTVar();
                if (!assignTo(Maybe(tv.type, paramLoc), argType)) {
                    return Ty.TypeErrorRecovered();
                }
                return tv.resolve(Ty.Builtin(`type argument of optional type`));
            }
        }
    };

    const checkBinaryExpr = (node: Ast.OpBinary): Ty.Type => {
        const resultLoc = Ty.Inferred(node.loc, `result of ${node.op} operator`);
        const leftLoc = Ty.Builtin(`left parameter of "${node.op}" operator`);
        const rightLoc = Ty.Builtin(`right parameter of "${node.op}" operator`);
        const leftType = checkExpr(node.left);
        const rightType = checkExpr(node.right);

        switch (node.op) {
            case "+":
            case "-":
            case "*":
            case "/":
            case "%":
            case "<<":
            case ">>":
            case "&":
            case "|":
            case "^": {
                if (
                    !assignTo(Int257(leftLoc), leftType)
                    || !assignTo(Int257(rightLoc), rightType)
                ) {
                    return Ty.TypeErrorRecovered();
                }
                return Int257(resultLoc);
            }
            case ">":
            case "<":
            case ">=":
            case "<=": {
                if (
                    !assignTo(Int257(leftLoc), leftType)
                    || !assignTo(Int257(rightLoc), rightType)
                ) {
                    return Ty.TypeErrorRecovered();
                }
                return Bool(resultLoc);
            }
            case "!=":
            case "==": {
                const common = mgu(leftType, rightType, resultLoc);
                if (common.kind === 'ERROR') {
                    return common;
                }
                if (supportsEquality(common)) {
                    return Bool(resultLoc);
                }
                return Ty.TypeErrorRecovered();
            }
            case "&&":
            case "||": {
                if (
                    !assignTo(Bool(leftLoc), leftType)
                    || !assignTo(Bool(rightLoc), rightType)
                ) {
                    return Ty.TypeErrorRecovered();
                }
                return Bool(resultLoc);
            }
        }
    };

    const checkTernary = (node: Ast.Conditional): Ty.Type => {
        const resultLoc = Ty.Inferred(node.loc, `result of ternary operator`);
        const condLoc = Ty.Builtin(`condition of ternary operator`);
        const commonType = mgu(
            checkExpr(node.thenBranch),
            checkExpr(node.elseBranch),
            resultLoc,
        );
        if (
            !assignTo(Bool(condLoc), checkExpr(node.condition))
            || commonType.kind === 'ERROR'
        ) {
            return Ty.TypeErrorRecovered();
        }
        return commonType;
    };

    const getContract = (id: Ty.TypeId): undefined | Ast.Contract => {
        const contract = getType(id.text);
        if (typeof contract === 'undefined') {
            err.contractNotDefined()(id.loc);
            return undefined;
        }
        if (contract.kind !== 'contract') {
            err.typeNotContract()(id.loc);
            return undefined;
        }
        return contract;
    };

    const getStruct = (id: Ty.TypeId): undefined | Ast.StructDecl | Ast.MessageDecl => {
        const struct = getType(id.text);
        if (typeof struct === 'undefined') {
            err.structNotDefined()(id.loc);
            return undefined;
        }
        if (struct.kind !== 'struct_decl' && struct.kind !== 'message_decl') {
            err.typeNotStruct()(id.loc);
            return undefined;
        }
        return struct;
    };

    const checkCodeOf = (node: Ast.CodeOf): Ty.Type => {
        if (!getContract(node.contract)) {
            return Ty.TypeErrorRecovered();
        }
        return Cell(Ty.Inferred(node.loc, "return value of codeOf operator"));
    };

    const checkInitOf = (node: Ast.InitOf): Ty.Type => {
        const contract = getContract(node.contract);
        if (!contract) {
            return Ty.TypeErrorRecovered();
        }

        const { init } = contract;
        if (!init) {
            err.noInit()(node.loc)
            return Ty.TypeErrorRecovered();
        }

        const paramCount = init.params.length;
        const argCount = node.args.length;
        if (paramCount < argCount) {
            err.fnArity(`Contract ${contract.name.text}`, argCount, paramCount)(node.loc);
        }

        for (const [index, param] of init.params.entries()) {
            const arg = node.args[index];
            // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
            if (arg) {
                const children: MismatchTree[] = [];
                if (!assignToAux1(param.type, checkExpr(arg), children)) {
                    for (const tree of children) {
                        // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
                        err.typeMismatch(tree)(arg ? arg.loc : node.loc);
                    }
                }
            } else if (param.kind !== 'field_decl' || !param.initializer) {
                err.fnArity(`Contract ${contract.name.text}`, argCount, paramCount)(node.loc);
            }
        }

        return StateInit(Ty.Inferred(node.loc, "result of initOf operator"));
    };

    type Substitutor = {
        readonly subst: (type: Ty.Type) => Ty.Type;
        readonly getArgs: () => readonly Ty.Type[];
    }

    const fillUpTypeArgs = (args: readonly Ty.Type[], params: readonly Ty.TypeId[]): readonly Ty.Type[] => [
        // cut extraneous arguments
        ...args.slice(0, params.length),
        // pad with missing arguments
        ...new Array(Math.max(0, params.length - args.length))
            .fill(0).map(() => Ty.TypeErrorRecovered())
    ];
    const substTypeParams = (
        struct: Ast.StructDecl | Ast.MessageDecl,
        node: {
            readonly typeArgs: readonly Ty.Type[],
            readonly loc: Ty.Loc,
        },
    ): Substitutor => {
        if (struct.kind === 'message_decl') {
            if (node.typeArgs.length > 0) {
                err.typeArity(struct.name.text, node.typeArgs.length, 0)(node.loc);
            }
            // messages do not have type parameters
            return {
                subst: (type) => type,
                getArgs: () => [],
            };
        }
        if (struct.typeParams.length !== 0 && node.typeArgs.length === 0) {
            // struct F<X> { x: Int; }
            // let a = F { x: 1 };
            const vars = struct.typeParams.map(param => ({
                ...freshTVar(),
                name: param.text,
            }));
            return {
                subst: (type) => {
                    // substitute type variables
                    return substParams(
                        type,
                        struct.typeParams,
                        vars.map(v => v.type),
                    );
                },
                getArgs: () => vars.map(v => {
                    // resolve type variables after all the fields
                    // are assigned
                    return v.resolve(Ty.Inferred(
                        node.loc,
                        `inferred type parameter ${v.name}`,
                    ));
                }),
            };
        }
        if (struct.typeParams.length !== node.typeArgs.length) {
            err.typeArity(struct.name.text, node.typeArgs.length, 0)(node.loc);
        }
        // struct F<X> { x: Int; }
        // let a = F<Int> { x: 1 };
        return {
            subst: (type: Ty.Type) => {
                // substitute passed args
                return substParams(
                    type,
                    struct.typeParams,
                    node.typeArgs,
                );
            },
            getArgs: () => fillUpTypeArgs(node.typeArgs, struct.typeParams),
        };
    };
    const checkStructInstance = (node: Ast.StructInstance): Ty.Type => {
        const struct = getStruct(node.type);
        if (!struct) {
            return Ty.TypeErrorRecovered();
        }
        const { subst, getArgs } = substTypeParams(struct, node);
        const defined: Set<string> = new Set();
        for (const { field: { text, loc }, initializer } of node.args) {
            if (defined.has(text)) {
                err.duplicateField()(loc);
            }
            const field = struct.fields.find(field => field.name.text === text);
            if (field) {
                assignTo(subst(field.type), checkExpr(initializer));
            } else {
                err.fieldNotDefined()(loc);
            }
        }
        for (const field of struct.fields) {
            if (!defined.has(field.name.text) && !field.initializer) {
                assignTo(field.type, Null(Ty.Inferred(node.loc, `omitted field "${field.name.text}"`)));
            }
        }
        const loc = Ty.Inferred(node.loc, "struct literal");
        return Ty.TypeCons(
            Ty.TypeId(node.type.text, loc),
            getArgs(),
            loc,
        );
    };

    const checkStaticMethodCall = (node: Ast.StaticMethodCall): Ty.Type => {
        const struct = getStruct(node.self);
        if (!struct) {
            return Ty.TypeErrorRecovered();
        }
        const name = node.function.text;
        if (name !== "fromSlice" && name !== "fromCell") {
            err.staticMethodNotDefined()(node.function.loc);
            return Ty.TypeErrorRecovered();
        }
        const paramLoc = Ty.Builtin(`parameter of .${name}()`);
        const [arg] = node.args;
        if (node.args.length !== 1 || !arg) {
            err.fnArity(name, node.args.length, 1)(node.loc);
        } else if (name === 'fromSlice') {
            // fromSlice: Struct.(Slice) -> struct
            assignTo(Slice(paramLoc), checkExpr(arg));
        } else if (name === 'fromCell') {
            // fromCell: Struct.(Cell) -> struct
            assignTo(Cell(paramLoc), checkExpr(arg));
        }
        // Message.opcode()
        if (struct.kind === 'struct_decl' && struct.typeParams.length !== node.typeArgs.length) {
            err.typeArity(struct.name.text, node.typeArgs.length, 0)(node.loc);
        }
        const resultLoc = Ty.Inferred(node.loc, `result of .${name}()`);
        return Ty.TypeCons(
            Ty.TypeId(node.self.text, resultLoc),
            struct.kind === 'struct_decl'
                ? fillUpTypeArgs(node.typeArgs, struct.typeParams)
                : [],
            resultLoc,
        );
    };

    const checkFunctionCall = (node: Ast.StaticCall): Ty.Type => {
        // dump: checkDump, // <T>(T) -> void

        // ton: checkTon, // (String) -> Int, строка должна быть конст
        // require: checkRequire, // (Bool, String) -> void
        // address: checkAddress, // (String) -> Address
        // cell: checkCell, // (String) -> Cell
        // dumpStack: checkDumpStack, // () -> void
        // emptyMap: checkEmptyMap, // () -> Null
        // sha256: checkSha256, // (String) -> Int
        // sha256: checkSha256, // (Slice) -> Int
        // slice: checkSlice, // (String) -> Slice
        // rawSlice: checkRawSlice, // (String) -> Slice
        // ascii: checkAscii, // (String) -> Int
        // crc32: checkCrc32, // (String) -> Int
        const resultLoc = Ty.Inferred(node.loc, `result of ${node.op} operator`);
        const leftLoc = Ty.Builtin(`left parameter of "${node.op}" operator`);
        const rightLoc = Ty.Builtin(`right parameter of "${node.op}" operator`);
        const leftType = checkExpr(node.left);
        const rightType = checkExpr(node.right);
        if (
            !assignTo(Int257(leftLoc), leftType)
            || !assignTo(Int257(rightLoc), rightType)
        ) {
            return Ty.TypeErrorRecovered();
        }
        return Int257(resultLoc);
    };

    const checkMethodCall = (node: Ast.MethodCall): Ty.Type => {
        const self = checkExpr(node.self);
        switch (self.kind) {
            case "cons_type": {
                // struct
                // extends fun toCell(self: Struct): Cell
                // extends fun toSlice(self: Struct): Slice

                // bounced<> не переносит методы

                // null
                // Maybe<>, map<>, Null; может быть >1 кандидата
                return;
            }
            case "map_type": {
                // extends fun set(self: map<K, V>, key: K, value: V) -> void
                // extends fun get(self: map<K, V>, key: K) -> Maybe<V>
                // extends fun del(self: map<K, V>, key: K) -> Bool
                // extends fun asCell(self: map<K, V>, ) -> Maybe<Cell>
                // extends fun isEmpty(self: map<K, V>, ) -> Bool
                // extends fun exists(self: map<K, V>, key: K) -> Bool
                // extends fun deepEquals(self: map<K, V>, other: map<K, V>) -> Bool // mgu
                // extends fun replace(self: map<K, V>, key: K, value: V) -> Bool
                // extends fun replaceGet(self: map<K, V>, key: K, value: V) -> map<K, V>
            }
            case "ERROR":
            case "type_var": {
                return;
            }
            case "TyInt":
            case "TySlice":
            case "TyCell":
            case "TyBuilder":
            case "tuple_type":
            case "unit_type":
            case "tensor_type":
        }
    };

    const checkField = (node: Ast.FieldAccess): Ty.Type => {
        // resolveFieldAccess
        // только struct или Maybe или bounced
        // обрезать bounced поля (см. partialFieldCount)
        // ищем в полях и константах
    };

    const checkVariable = (node: Ast.Var): Ty.Type => {
        // 1. константы
        // 3. переменные
        // 4. кастомная ошибка, когда foo, но нужен self.foo
    };

    const checkTuple = (node: Ast.Tuple): Ty.Type => {
        //
    };

    const checkTensor = (node: Ast.Tensor): Ty.Type => {
        //
    };

    const checkMapLiteral = (node: Ast.MapLiteral): Ty.Type => {
        //
    };

    const checkSetLiteral = (node: Ast.SetLiteral): Ty.Type => {
        //
    };

    const checkExpr = makeVisitor<Ast.Expression>()({
        null: checkNull,
        unit: checkUnit,
        string: checkString,
        number: checkNumber,
        boolean: checkBoolean,
        op_unary: checkUnaryExpr,
        op_binary: checkBinaryExpr,
        conditional: checkTernary,
        init_of: checkInitOf,
        code_of: checkCodeOf,
        struct_instance: checkStructInstance,
        static_call: checkFunctionCall,
        method_call: checkMethodCall,
        field_access: checkField,
        var: checkVariable,
        tuple: checkTuple,
        tensor: checkTensor,
        map_literal: checkMapLiteral,
        set_literal: checkSetLiteral,
        static_method_call: checkStaticMethodCall,
    });

    return {
        assignTo,
        freshTVar,
        checkExpr,
    };
};

const supportsEquality = (common: Ty.Type): boolean => {
    return common.kind === 'cons_type' && common.name.text === 'Maybe' && common.typeArgs.every(arg => supportsEquality(arg))
        || common.kind === 'map_type'
        || common.kind === 'cons_type' && [
            "Int", "Bool", "Address", "Cell", "Slice", "String"
        ].includes(common.name.text)
};

const substParams = (into: Ty.Type, params: readonly Ty.TypeId[], args: readonly Ty.Type[]) => {
    return zip(params, args)
        .reduce<Ty.Type>((type, [param, arg]) => {
            return substParam(type, param.text, arg);
        }, into);
};

const substParam = (into: Ty.Type, param: string, value: Ty.Type): Ty.Type => {
    const rec = (into: Ty.Type): Ty.Type => {
        switch (into.kind) {
            case "ERROR":
            case "type_var":
            case "TyInt":
            case "TySlice":
            case "TyCell":
            case "TyBuilder":
            case "unit_type": {
                return into;
            }
            case "cons_type": {
                if (into.name.text !== param) {
                    return Ty.TypeCons(into.name, into.typeArgs.map(arg => rec(arg)), into.loc);
                }
                if (into.typeArgs.length !== 0) {
                    // err.noHkt(param)(into.loc);
                }
                return value;
            }
            case "map_type": {
                return Ty.TypeMap(rec(into.key), rec(into.value), into.loc);
            }
            case "tuple_type": {
                return Ty.TypeTuple(into.typeArgs.map(arg => rec(arg)), into.loc);
            }
            case "tensor_type": {
                return Ty.TypeTensor(into.typeArgs.map(arg => rec(arg)), into.loc);
            }
        }
    };

    return rec(into);
};

// import { throwInternal } from "@/error/errors";
// import * as Ast from "@/next/ast";
// import * as E from "@/next/types/errors";
// import type { Registry } from "@/next/types/merger";
// import type { TypeEntry } from "@/next/types/typecheck";

// export const decodeType = (
//     userTypes: Registry<TypeEntry>,
//     typeParams: readonly Ast.TypeId[],
//     type: Ast.Type,
// ): E.WithLog<Ast.Type | undefined> => {
//     function* recN(
//         types: readonly Ast.Type[],
//     ): E.WithLog<undefined | readonly Ast.Type[]> {
//         const results: Ast.Type[] = [];
//         for (const type of types) {
//             const result = yield* rec(type);
//             if (result) {
//                 results.push(result);
//             } else {
//                 return undefined
//             }
//         }
//         return results;
//     }

//     function* rec(
//         type: Ast.Type,
//     ): E.WithLog<Ast.Type | undefined> {
//         switch (type.kind) {
//             case "unit_type":
//             case "TyInt":
//             case "TySlice":
//             case "TyCell":
//             case "TyBuilder":
//             case "TypeVoid":
//             case "TypeNull":
//             case "TypeBool":
//             case "TypeAddress":
//             case "TypeString":
//             case "TypeStringBuilder":
//             case "TypeParam": {
//                 return type;
//             }
//             case "tuple_type": {
//                 const result = yield* recN(type.typeArgs);
//                 return result && Ast.TypeTuple(result, type.loc);
//             }
//             case "tensor_type": {
//                 const result = yield* recN(type.typeArgs);
//                 return result && Ast.TypeTensor(result, type.loc);
//             }
//             case "map_type": {
//                 const key = yield* rec(type.key);
//                 const value = yield* rec(type.value);
//                 if (!key || !value) {
//                     return undefined;
//                 }
//                 return Ast.TypeMap(key, value, type.loc);
//             }
//             case "TypeBounced": {
//                 const child = yield* rec(type.type);
//                 if (!child) {
//                     return undefined;
//                 }
//                 return Ast.TypeBounced(child, type.loc);
//             }
//             case "TypeMaybe": {
//                 const child = yield* rec(type.type);
//                 if (!child) {
//                     return undefined;
//                 }
//                 return Ast.TypeMaybe(child, type.loc);
//             }
//             case "TypeAlias": {
//                 return throwInternal("Alias references are never generated in parser");
//             }
//             case "cons_type": {
//                 const name = type.name.text;
//                 const arity = type.typeArgs.length;

//                 const args = yield* recN(type.typeArgs);

//                 const param = typeParams.find(p => p.text);
//                 if (param) {
//                     if (!(yield* matchArity(name, arity, 0, type.loc))) {
//                         return undefined;
//                     }
//                     return Ast.TypeParam(
//                         type.name,
//                         type.loc,
//                     );
//                 }

//                 if (!args) {
//                     return undefined;
//                 }
                
//                 const typeEntry = userTypes.get(name);
//                 if (typeEntry) {
//                     if (!(yield* matchArity(
//                         name,
//                         arity,
//                         typeEntry.value.arity,
//                         type.loc,
//                     ))) {
//                         return undefined;
//                     }
//                     const decl = typeEntry.value.type;
//                     switch (decl.kind) {
//                         case "FlatAlias": {
//                             return ;
//                         }
//                         case "alias_decl": {
//                             return;
//                         }
//                         case "FlatContract":
//                         case "FlatTrait":
//                         case "struct_decl":
//                         case "message_decl":
//                         case "union_decl":
//                         case "contract":
//                         case "trait": {
//                             return Ast.TypeCons(type.name, args, type.loc);
//                         }
//                     }
//                 }

//                 yield ETypeNotFound(name, type.loc);
//                 return undefined;
//             }
//         }
//     }

//     return rec(type);
// }

// export const ETypeNotFound = (
//     name: string,
//     loc: Ast.Range,
// ): E.TcError => ({
//     loc,
//     descr: [
//         E.TEText(`Type "${name}" is not defined`),
//     ],
// });
// export const EContractTraitType = (
//     kind: string,
//     name: string,
//     loc: Ast.Range,
// ): E.TcError => ({
//     loc,
//     descr: [
//         E.TEText(`Cannot use ${kind} ${name} as a type`),
//     ],
// });


// export function* matchArity(
//     name: string,
//     got: number,
//     expected: number,
//     loc: Ast.Range,
// ): E.WithLog<boolean> {
//     const result = got === expected;
//     if (!result) {
//         yield EArity(name, expected, got, loc);
//     }
//     return result;
// }
// export const EArity = (
//     name: string,
//     expected: number,
//     got: number,
//     loc: Ast.Range,
// ): E.TcError => ({
//     loc,
//     descr: [
//         E.TEText(`Type "${name}" is expected to have ${expected} type arguments, got ${got}`),
//     ],
// });

// import * as V from "@/next/types/via";
// import * as E from "@/next/types/errors";
// import type * as Ast from "@/next/ast";
// import type { TactImport, TactSource } from "@/next/imports/source";
// import type { FlatDecl, Schema } from "@/next/types/flat";

// export type Def<T> = {
//     // the definition
//     readonly value: T;
//     // where it was defined
//     readonly via: V.ViaUser;
// }
// export const Def = <T>(value: T, via: V.ViaUser): Def<T> => ({ value, via });
// export const importDef = <T>(importedBy: TactImport, { value, via }: Def<T>): Def<T> => Def(value, V.ViaImport(importedBy, via));

// export type Registry<T> = Map<string, Def<T>>;

// export type StructMethod = {
//     readonly mutates: boolean;
//     readonly fun: Ast.Function;
// }

// export type TypeMap = readonly (readonly [Schema, Def<StructMethod>])[]

// export type ExtRegistry = Map<string, TypeMap>

// export type Scope = {
//     readonly types: Registry<FlatDecl>;
//     readonly functions: Registry<Ast.Function>;
//     readonly constants: Registry<Ast.Constant>;
//     readonly extensions: ExtRegistry;
// }

// export type SourceCheckResult = {
//     // import that lead to reading this file
//     readonly importedBy: TactImport;
//     // scopes that were computed from this file
//     readonly globals: Scope;
// }

// export function* mergeExt(
//     results: readonly SourceCheckResult[],
//     source: TactSource,
//     items: Ast.Extension[],
//     builtins: ReadonlyMap<string, readonly Schema[]>,
// ): E.WithLog<ExtRegistry> {
//     const EMethodOverlap = (
//         name: string,
//         prev: V.Via,
//         next: V.ViaUser,
//     ): E.TcError => ({
//         loc: E.viaToRange(next),
//         descr: [
//             E.TEText(`Method "${name}" overlaps previously defined method`),
//             E.TEVia(prev),
//         ],
//     });

//     const imported: ExtRegistry[] = results.map(({ globals, importedBy }) => {
//         const exts = globals.extensions;
//         return new Map(exts.entries().map(([k, v]) => {
//             return [k, v.map(([k, v]) => [k, {
//                 value: v.value,
//                 via: V.ViaImport(importedBy, v.via),
//             }])];
//         }));
//     });

//     const local: ExtRegistry[] = [];
//     for (const item of items) {
//         const fun = item.method.fun;
//         const schema = {
//             typeArgs: fun.typeParams,
//             type: item.selfType,
//         };
//         const def = {
//             value: item.method,
//             via: V.ViaOrigin(fun.loc, source),
//         };
//         const { canExtend } = unifier.withParams(fun.typeParams);
//         if (yield* canExtend(item.selfType)) {
//             local.push(new Map([[fun.name.text, [[schema, def]]]]));
//         }
//     }

//     const all = [...imported, ...local];

//     const prev: Map<string, (readonly [Schema, Def<StructMethod>])[]> = new Map();
//     for (const next of all) {
//         for (const [name, nextMap] of next) {
//             const prevMap = [...prev.get(name) ?? []];
//             const builtin = builtins.get(name) ?? [];
//             for (const [nextSchema, nextDef] of nextMap) {
//                 // defined in compiler
//                 const prevBuiltin = builtin.find(prevSchema => !unifier.areOrdered(
//                     prevSchema, nextSchema
//                 ));
//                 if (prevBuiltin) {
//                     yield EMethodOverlap(name, V.ViaBuiltin(), nextDef.via);
//                     continue;
//                 }
//                 const prevEntry = prevMap.find(([prevSchema]) => !unifier.areOrdered(
//                     prevSchema, nextSchema
//                 ));
//                 // not defined yet; define it now
//                 if (!prevEntry) {
//                     prevMap.push([nextSchema, nextDef]);
//                     continue;
//                 }
//                 const [, prevDef] = prevEntry;
//                 // already defined, and it's not a diamond situation
//                 if (prevDef.via.source !== nextDef.via.source) {
//                     yield EMethodOverlap(name, prevDef.via, nextDef.via);
//                 }
//             }
//             prev.set(name, prevMap);
//         }
//     }
//     return prev;
// }

// export function* merge<T extends { name: Ast.Id | Ast.TypeId, loc: Ast.Range }>(
//     results: readonly SourceCheckResult[],
//     source: TactSource,
//     kind: string,
//     get1: (s: Scope) => Registry<T>,
//     items: T[],
//     builtin: Map<string, unknown>,
// ): E.WithLog<Registry<T>> {
//     const imported = results.map(({ globals, importedBy }) => (
//         mapRegVia<T>(get1(globals), importedBy)
//     ));
//     const local = items.map((item) => createRef(
//         item.name.text,
//         item,
//         V.ViaOrigin(item.loc, source),
//     ));
//     return yield* concatReg(
//         builtin,
//         kind,
//         [...imported, ...local],
//     )
// }

// export const createRef = <V>(name: string, value: V, via: V.ViaUser): Registry<V> => {
//     return new Map([[name, { value, via }]]);
// };

// export const mapRegVia = <V>(fns: Registry<V>, importedBy: TactImport): Registry<V> => {
//     return new Map(fns.entries().map(([k, v]) => {
//         return [k, {
//             value: v.value,
//             via: V.ViaImport(importedBy, v.via),
//         }];
//     }));
// };

// export function* concatReg<V>(
//     builtins: Map<string, unknown>,
//     kind: string,
//     all: readonly Registry<V>[]
// ): E.WithLog<Registry<V>> {
//     const ERedefine = (kind: string, name: string, prev: V.Via, next: V.ViaUser): E.TcError => ({
//         loc: E.viaToRange(next),
//         descr: [
//             E.TEText(`There already is a ${kind} "${name}" from`),
//             E.TEVia(prev),
//         ],
//     });

//     const prev: Map<string, Def<V>> = new Map();
//     for (const next of all) {
//         for (const [name, nextItem] of next) {
//             const prevItem = prev.get(name);
//             // defined in compiler
//             if (builtins.has(name)) {
//                 yield ERedefine(kind, name, V.ViaBuiltin(), nextItem.via);
//                 continue;
//             }
//             // not defined yet; define it now
//             if (typeof prevItem === 'undefined') {
//                 prev.set(name, nextItem);
//                 continue;
//             }
//             // already defined, and it's not a diamond situation
//             if (prevItem.via.source !== nextItem.via.source) {
//                 yield ERedefine(kind, name, prevItem.via, nextItem.via);
//             }
//         }
//     }
//     return prev;
// }
