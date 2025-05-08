/* eslint-disable @typescript-eslint/no-base-to-string */
import { makeVisitor, memo } from "@/utils/tricks";
import type { Logger } from "@/error/logger-util";
import type { Implicit, TactImport, TactSource } from "@/next/imports/source";
import type * as Ast from "@/next/ast";
import type { Range } from "@/next/ast";
import * as Ty from "@/next/scoping/generated/type";
import { zip } from "@/utils/array";
import { throwInternal } from "@/error/errors";
import { type MismatchTree, TcErrors } from "@/next/scoping/errors";

export const scope = (
    log: Logger<string, void>,
    root: TactSource,
) => {
    return foldSources(root, scopeIds(log));
};

type Handler<T> = (children: [T, TactImport][], source: TactSource) => T

const foldSources = <T>(root: TactSource, onSource: Handler<T>): T => {
    const rec = (source: TactSource): T => {
        const children: [T, TactImport][] = [];
        for (const imp of source.imports) {
            if (imp.kind === 'tact') {
                children.push([memoedRec(imp.source), imp]);
            }
        }
        return onSource(children, source);
    };
    const memoedRec = memo(rec);
    return memoedRec(root);
};

type Result = {
    // readonly source: TactSource;
    // readonly imports: readonly Result[];
    readonly functions: ReadonlyMap<string, readonly [Ast.Function, TactSource]>;
    readonly extensions: ReadonlyMap<string, readonly [Ast.Extension, TactSource]>;
    readonly constants: ReadonlyMap<string, readonly [Ast.Constant, TactSource]>;
    readonly types: ReadonlyMap<string, readonly [Ast.TypeDecl, TactSource]>;
};

type DeclMap<T> = Map<string, {
    readonly source: TactSource;
    readonly entry: T;
    readonly loc: Range | Implicit;
}>;

type Registry<T> = {
    readonly get: (key: string) => T | undefined;
    readonly add: (
        name: string,
        entry: T,
        nextSource: TactSource,
        loc: Range | Implicit,
    ) => void;
}

const scopeIds = (log: Logger<string, void>) =>
    (children: [Result, TactImport][], source: TactSource): Result => {
        const err = log.source(source.path, source.code, (logger) => TcErrors(logger));

        const makeRegistry = <T>(builtins: Set<string>): Registry<T> => {
            const ids: DeclMap<T> = new Map();
            return {
                get: (key) => ids.get(key)?.entry,
                add: (name, entry, nextSource, loc) => {
                    const prev = ids.get(name);
                    if (builtins.has(name)) {
                        err.shadowsBuiltin(name)(loc);
                    } else if (typeof prev === 'undefined') {
                        ids.set(name, { source: nextSource, entry, loc });
                    } else if (prev.source !== nextSource) {
                        err.shadowsImported(name, source.path, prev.loc)(loc);
                    }
                },
            };
        };

        const functions = makeRegistry<Ast.Function>(new Set());
        const extensions = makeRegistry<Ast.Extension>(new Set());
        const constants = makeRegistry<Ast.Constant>(new Set());
        const types = makeRegistry<Ast.TypeDecl>(new Set([
            "void",
            "bounced",
            "Null",
            "Maybe",
            "Int",
            "Bool",
            "Builder",
            "Slice",
            "Cell",
            "Address",
            "String",
            "StringBuilder",
        ]));

        for (const [sources, imp] of children) {
            for (const [name, [entry, source]] of sources.functions) {
                functions.add(name, entry, source, imp.loc);
            }
            // for (const [name, [entry, source]] of sources.extensions) {
            //     extensions.add(name, entry, source, imp.loc);
            // }
            for (const [name, [entry, source]] of sources.constants) {
                constants.add(name, entry, source, imp.loc);
            }
            for (const [name, [entry, source]] of sources.types) {
                types.add(name, entry, source, imp.loc);
            }
        }

        for (const item of source.items) {
            switch (item.kind) {
                case "function": {
                    functions.add(item.name.text, item, source, item.name.loc);
                    continue;
                }
                case "constant": {
                    constants.add(item.name.text, item, source, item.name.loc);
                    continue;
                }
                case "extension": {
                    const id = item.method.fun.name;
                    extensions.add(id.text, item, source, id.loc);
                    continue;
                }
                case "struct_decl":
                case "message_decl":
                case "union_decl":
                case "alias_decl":
                case "contract":
                case "trait": {
                    types.add(item.name.text, item, source, item.name.loc);
                    continue;
                }
            }
        }

        for (const item of source.items) {
            checkItem(types.get, err, item);
        }

        return {
            functions: functions.get(),
            constants: constants.get(),        
            types: types.get(),
            extensions: extensions.get(),
        };
    };

const noTypeParams = () => false;

const checkItem = (
    getType: (key: string) => Ast.TypeDecl | undefined,
    err: TcErrors<string, void>,
    node: Ast.ModuleItem,
) => {
    // TODO: check kinds
    // TODO: Check if self is initialized
    switch (node.kind) {
        case "constant": {
            const { init } = node;
            if (init.kind === 'constant_def') {
                const { checkExpr, assignTo } = getExprChecker(
                    getType,
                    noTypeParams,
                    err,
                );
                const exprType = checkExpr(init.initializer);
                if (init.type) {
                    const res = assignTo(init.type, exprType);
                }
                return;
            } else {
                // ...
                return;
            }
        }
        case "function": {
            return;
        }
        case "extension": {
            return;
        }
        case "struct_decl": {
            return;
        }
        case "message_decl": {
            return;
        }
        case "union_decl": {
            return;
        }
        case "alias_decl": {
            return;
        }
        case "contract": {
            return;
        }
        case "trait": {
            return;
        }
    }
};

const Int257 = (loc: Ty.Loc) => Ty.TypeInt(Ty.IFInt("signed", 257, loc), loc);
const String = (loc: Ty.Loc) => Ty.TypeCons(Ty.TypeId("String", loc), [], loc);
const Bool = (loc: Ty.Loc) => Ty.TypeCons(Ty.TypeId("Bool", loc), [], loc);
const Cell = (loc: Ty.Loc) => Ty.TypeCons(Ty.TypeId("Cell", loc), [], loc);
const StateInit = (loc: Ty.Loc) => Ty.TypeCons(Ty.TypeId("StateInit", loc), [], loc);
const Maybe = (param: Ty.Type, loc: Ty.Loc) => Ty.TypeCons(Ty.TypeId("Maybe", loc), [param], loc);
const Null = (loc: Ty.Loc) => Ty.TypeCons(Ty.TypeId("Null", loc), [], loc);
const Unit = (loc: Ty.Loc) => Ty.TypeTensor([], loc);

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

    const mgu = (left: Ty.Type, right: Ty.Type): Ty.Type => {
        if (left.kind === 'ERROR' || right.kind === 'ERROR') {
            return Ty.TypeErrorRecovered();
        }
        if (left.kind === 'type_var' || right.kind === 'type_var') {
            return throwInternal("Trying to unify type variable");
        }
        const children1: MismatchTree[] = [];
        const children2: MismatchTree[] = [];
        if (assignToAux1(left, right, children1)) {
            return left;
        }
        if (assignToAux1(right, left, children2)) {
            return right;
        }
        // TODO
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
                // TODO:
                // Maybe<T> ? Null
                // Null ? Maybe<T>
                // map<> ? Null
                // Null ? map<>
                // "Int"
                // "Bool"
                // "Address"
                // "Cell"
                // "Slice"
                // "String"
                return Bool(resultLoc);
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
        const thenLoc = Ty.Builtin(`"then" of ternary operator`);
        const elseLoc = Ty.Builtin(`"else" of ternary operator`);
        const condType = checkExpr(node.condition);
        const commonType = mgu(
            checkExpr(node.thenBranch),
            checkExpr(node.elseBranch),
        );
        if (
            !assignTo(Bool(condLoc), condType)
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
        // resolveInitOf
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
            // const paramName = param.name.kind === 'id' ? param.name.text : `number ${index + 1}`;
            // const argType = arg ?  : Null(Ty.Inferred(node.loc, `omitted parameter ${paramName}`));
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
    const substTypeParams = (
        struct: Ast.StructDecl | Ast.MessageDecl,
        node: Ast.StructInstance,
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
            getArgs: () => {
                return [
                    // cut extraneous arguments
                    ...node.typeArgs.slice(0, struct.typeParams.length),
                    // pad with missing arguments
                    ...new Array(Math.max(0, struct.typeParams.length - node.typeArgs.length))
                        .fill(0).map(() => Ty.TypeErrorRecovered())
                ];
            },
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

    const checkFunctionCall = (node: Ast.StaticCall): Ty.Type => {
        // dump: checkDump, // (ref | void | null | map | Cell | Slice | Builder | Address | String | Bool | Int) -> void

        // ton: checkTon, // (String) -> Int, строка должна быть конст
        // require: checkRequire, // (Bool, String) -> void
        // address: checkAddress, // (String) -> Address
        // cell: checkCell, // (String) -> Cell
        // dumpStack: checkDumpStack, // () -> void
        // emptyMap: checkEmptyMap, // () -> Null
        // sha256: checkSha256, // (String | Slice) -> Int
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
        // toCell : struct.() -> Cell
        // toSlice: struct.() -> Slice

        // K = Int|Address
        // set: map<K, V>.(key: K, value: V) -> void
        // get: map<K, V>.(key: K) -> Maybe<V>
        // del: map<K, V>.(key: K) -> Bool
        // asCell: map<K, V>.() -> Maybe<Cell>
        // isEmpty: map<K, V>.() -> Bool
        // exists: map<K, V>.(key: K) -> Bool
        // deepEquals: map<K, V>.(other: map<K, W extends V>) -> Bool // mgu
        // replace: map<K, V>.(key: K, value: V) -> Bool
        // replaceGet: map<K, V>.(key: K, value: V) -> map<K, V>

        // bounced<> не переносит методы
        // null -- Maybe<>, map<>, Null; может быть >1 кандидата
    };

    const checkField = (node: Ast.FieldAccess): Ty.Type => {
        // resolveFieldAccess
        // только struct или Maybe или bounced
        // обрезать bounced поля (см. partialFieldCount)
        // ищем в полях и константах
    };

    const checkVariable = (node: Ast.Var): Ty.Type => {
        // 1. константы
        // 2. Type.foo()
        //    fromCell: Struct.(Cell) -> struct
        //    fromSlice: Struct.(Slice) -> struct
        //    FIXME!!!
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
    });

    return {
        assignTo,
        freshTVar,
        checkExpr,
    };
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