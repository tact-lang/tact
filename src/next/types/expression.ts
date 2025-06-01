/* eslint-disable require-yield */
import * as Ast from "@/next/ast";
import * as E from "@/next/types/errors";
import { throwInternal } from "@/error/errors";
import { Bool, builtinBinary, builtinFunctions, getStaticBuiltin, StateInit } from "@/next/types/builtins";
import { assignType, dealiasType, decodeDealiasTypeLazy, decodeTypeLazy, decodeTypeMap, checkFnCall, instantiateStruct, checkFnCallWithArgs, mgu, lookupMethod } from "@/next/types/type";
import { convertValueToExpr } from "@/next/types/value";
import { emptyTypeParams } from "@/next/types/type-params";

type Decode<T, U> = (node: T, ctx: Context) => E.WithLog<U>
type Context = {
    readonly scopeRef: () => Ast.Scope;
    readonly selfType: Ast.SelfType | undefined;
    readonly typeParams: Ast.TypeParams;
    readonly localScopeRef: ReadonlyMap<string, [Ast.DecodedType, Ast.Loc]>;
}

export function decodeExpr(
    typeParams: Ast.TypeParams,
    node: Ast.Expression,
    scopeRef: () => Ast.Scope,
    selfType: Ast.SelfType | undefined,
    localScopeRef: ReadonlyMap<string, [Ast.DecodedType, Ast.Loc]>,
): E.WithLog<Ast.DecodedExpression> {
    return decodeExprCtx(node, {
        typeParams,
        scopeRef,
        selfType,
        localScopeRef,
    });
}

export const decodeExprCtx: Decode<Ast.Expression, Ast.DecodedExpression> = (node, ctx) => {
    switch (node.kind) {
        case "null": return decodeNullCons(node, ctx);
        case "unit": return decodeUnitCons(node, ctx);
        case "string": return decodeStringCons(node, ctx);
        case "number": return decodeNumberCons(node, ctx);
        case "boolean": return decodeBooleanCons(node, ctx);
        case "tuple": return decodeTupleCons(node, ctx);
        case "tensor": return decodeTensorCons(node, ctx);
        case "map_literal": return decodeMapCons(node, ctx);
        case "set_literal": return decodeSetCons(node, ctx);
        case "struct_instance": return decodeStructCons(node, ctx);

        case "var": return decodeVar(node, ctx);
        case "op_binary": return decodeBinary(node, ctx);
        case "op_unary": return decodeUnary(node, ctx);
        case "conditional": return decodeTernary(node, ctx);
        case "method_call": return decodeMethodCall(node, ctx);
        case "static_call": return decodeFunctionCall(node, ctx);
        case "static_method_call": return decodeStaticMethodCall(node, ctx);
        case "field_access": return decodeFieldAccess(node, ctx);
        case "init_of": return decodeInitOf(node, ctx);
        case "code_of": return decodeCodeOf(node, ctx);
    }
}

const decodeNullCons: Decode<Ast.Null, Ast.DNull> = function* (node) {
    return Ast.DNull(Ast.TypeNull(node.loc), node.loc);
}

const decodeUnitCons: Decode<Ast.Unit, Ast.DUnit> = function* (node) {
    return Ast.DUnit(Ast.TypeUnit(node.loc), node.loc);
}

const decodeStringCons: Decode<Ast.String, Ast.DString> = function* (node) {
    return Ast.DString(node.value, Ast.TypeString(node.loc), node.loc);
}

const decodeNumberCons: Decode<Ast.Number, Ast.DNumber> = function* (node) {
    return Ast.DNumber(node.base, node.value, Ast.TypeInt(Ast.IFInt('signed', 257, node.loc), node.loc), node.loc);
}

const decodeBooleanCons: Decode<Ast.Boolean, Ast.DBoolean> = function* (node) {
    return Ast.DBoolean(node.value, Ast.TypeBool(node.loc), node.loc);
}

const decodeTupleCons: Decode<Ast.Tuple, Ast.DTuple> = function* (node, ctx) {
    const children = yield* E.mapLog(node.children, child => decodeExprCtx(child, ctx));
    const args = children.map(child => child.computedType);
    return Ast.DTuple(children, Ast.DTypeTuple(args, node.loc), node.loc);
}

const decodeTensorCons: Decode<Ast.Tensor, Ast.DTensor> = function* (node, ctx) {
    const children = yield* E.mapLog(node.children, child => decodeExprCtx(child, ctx));
    const args = children.map(child => child.computedType);
    return Ast.DTensor(children, Ast.DTypeTensor(args, node.loc), node.loc);
}

const decodeMapCons: Decode<Ast.MapLiteral, Ast.DMapLiteral> = function* (node, ctx) {
    const ascribed = yield* decodeTypeMap(ctx.typeParams, node.type, ctx.scopeRef);
    const fields = yield* E.mapLog(node.fields, function* (field) {
        const key = yield* decodeExprCtx(field.key, ctx);
        yield* assignType(field.key.loc, emptyTypeParams, ascribed.key, key.computedType, false);
        const value = yield* decodeExprCtx(field.value, ctx);
        yield* assignType(field.value.loc, emptyTypeParams, ascribed.value, value.computedType, false);
        return Ast.DMapField(key, value);
    });
    return Ast.DMapLiteral(ascribed, fields, node.loc);
}

const decodeSetCons: Decode<Ast.SetLiteral, Ast.DSetLiteral> = function* () {
    return throwInternal("Set literals must have been declined before");
}

const decodeStructCons: Decode<Ast.StructInstance, Ast.DStructInstance> = function* (node, ctx) {
    const typeArgs = yield* E.mapLog(node.typeArgs, function* (arg) {
        return yield* decodeTypeLazy(ctx.typeParams, arg, ctx.scopeRef)();
    });
    const instance = yield* instantiateStruct(
        node.type,
        typeArgs,
        ctx.typeParams,
        ctx.scopeRef,
    );
    // see checkFields in statement.ts
    const fields = yield* checkFields(
        instance?.fields,
        node.args,
        node.loc,
        ctx,
    );
    return Ast.DStructInstance(
        fields,
        instance?.type ?? Ast.DTypeRecover(),
        node.loc
    );
}
function* checkFields(
    typeFields: Ast.Ordered<Ast.InhFieldSig> | undefined,
    args: readonly Ast.StructFieldInitializer[],
    loc: Ast.Loc,
    ctx: Context,
) {
    const map: Map<string, Ast.DecodedExpression> = new Map();
    for (const arg of args) {
        const fieldName = arg.field.text;

        const prev = map.get(fieldName);
        if (prev) {
            yield EDuplicateField(fieldName, prev.loc, arg.loc);
            continue;
        }
        const expr = yield* decodeExprCtx(arg.initializer, ctx);

        if (typeFields) {
            const typeField = typeFields.map.get(fieldName);
            if (typeField) {
                yield* assignType(
                    expr.loc,
                    emptyTypeParams,
                    yield* typeField.type(),
                    expr.computedType,
                    false,
                );
            } else {
                yield ENoSuchField(fieldName, arg.loc);
            }
        }

        map.set(fieldName, expr);
    }

    if (typeFields) {
        const result: Map<string, Ast.DecodedExpression> = new Map();
        for (const fieldName of typeFields.order) {
            const field = typeFields.map.get(fieldName);
            if (!field) {
                return throwInternal("Ordered<>: lost fields")
            }
            const fieldInst = map.get(fieldName);
            if (fieldInst) {
                result.set(fieldName, fieldInst);
            } else if (field.init) {
                const inst = convertValueToExpr(yield* field.init());
                result.set(fieldName, inst);
            } else {
                yield EMissingField(fieldName, loc);
                result.set(fieldName, Ast.DNull(
                    Ast.TypeNull(loc),
                    loc,
                ));
            }
        }
        return Ast.Ordered(typeFields.order, result)
    } else {
        return Ast.Ordered([...map.keys()], map)
    }
}
const EMissingField = (name: string, prev: Ast.Loc): E.TcError => ({
    loc: prev,
    descr: [
        E.TEText(`Value for field "${name}" is missing`),
        E.TECode(prev),
    ],
});
const ENoSuchField = (name: string, next: Ast.Loc): E.TcError => ({
    loc: next,
    descr: [
        E.TEText(`There is no field "${name}"`),
        E.TECode(next),
    ],
});
const EDuplicateField = (name: string, prev: Ast.Loc, next: Ast.Loc): E.TcError => ({
    loc: prev,
    descr: [
        E.TEText(`Duplicate field "${name}"`),
        E.TEText(`Defined at:`),
        E.TECode(next),
        E.TEText(`Previously defined at:`),
        E.TECode(prev),
    ],
});

const decodeVar: Decode<Ast.Var, Ast.DVar | Ast.DSelf> = function* (node, ctx) {
    if (node.name !== 'self') {
        const type = yield* lookupVar(node.name, node.loc, ctx);
        return Ast.DVar(node.name, type, node.loc);
    }
    if (ctx.selfType) {
        return Ast.DSelf(ctx.selfType, node.loc);
    }
    yield ENoSelf(node.loc);
    return Ast.DVar(node.name, Ast.TypeNull(node.loc), node.loc);
};
const ENoSelf = (loc: Ast.Loc): E.TcError => ({
    loc,
    descr: [
        E.TEText(`"self" is not allowed here`),
    ],
});
function* lookupVar(
    name: string,
    loc: Ast.Loc,
    ctx: Context,
): E.WithLog<Ast.DecodedType> {
    const local = ctx.localScopeRef.get(name);
    if (local) {
        const [type] = local;
        return type;
    }
    const global = ctx.scopeRef().constants.get(name);
    if (global) {
        return yield* global.decl.type();
    }
    yield EUndefined(name, loc);
    return Ast.DTypeRecover();
}
const EUndefined = (name: string, loc: Ast.Loc): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Variable "${name}" not defined`),
    ],
});

const decodeBinary: Decode<Ast.OpBinary, Ast.DOpBinary> = function* (node, ctx) {
    const left = yield* decodeExprCtx(node.left, ctx);
    const right = yield* decodeExprCtx(node.right, ctx);
    const fnType = builtinBinary.get(node.op);
    if (!fnType) {
        return throwInternal("Builtin operator is not in the map");
    }
    const { returnType, typeArgMap } = yield* checkFnCall(
        node.loc,
        fnType,
        [
            [left.loc, left.computedType],
            [right.loc, right.computedType]
        ],
    );
    if (node.op === '==' || node.op === '!=') {
        const typeArg = typeArgMap.get("T");
        if (!typeArg) {
            return throwInternal("getCallResult produced incorrect substitution");
        }
        if (typeArg.kind !== 'recover' && !supportsEquality(typeArg)) {
            yield ENoEquality(node.loc);
        }
    }
    return Ast.DOpBinary(node.op, left, right, typeArgMap, returnType, node.loc);
}
const ENoEquality = (loc: Ast.Loc): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Equality on this type is not supported`),
    ],
});
const supportsEquality = (common: Ast.DecodedType): boolean => {
    switch (common.kind) {
        case "unit_type":
        case "TyInt":
        case "TySlice":
        case "TyCell":
        case "TypeNull":
        case "TypeBool":
        case "TypeAddress":
        case "TypeString":
        case "map_type": {
            return true;
        }
        case "TypeMaybe": {
            return supportsEquality(common.type);
        }
        case "recover":
        case "type_ref":
        case "TypeVoid":
        case "TypeAlias":
        case "TypeParam":
        case "TypeBounced":
        case "tuple_type":
        case "tensor_type":
        case "TyBuilder":
        case "TypeStateInit":
        case "TypeStringBuilder": {
            return false;
        }
    }
};

const decodeUnary: Decode<Ast.OpUnary, Ast.DOpUnary> = function* (node, ctx) {
    const operand = yield* decodeExprCtx(node.operand, ctx);
    const fnType = builtinBinary.get(node.op);
    if (!fnType) {
        return throwInternal("Builtin operator is not in the map");
    }
    const { returnType, typeArgMap } = yield* checkFnCall(
        node.loc,
        fnType,
        [[operand.loc, operand.computedType]],
    );
    
    return Ast.DOpUnary(node.op, operand, typeArgMap, returnType, node.loc);
}

const decodeTernary: Decode<Ast.Conditional, Ast.DConditional> = function* (node, ctx) {
    const condition = yield* decodeExprCtx(node.condition, ctx);
    yield* assignType(condition.loc, emptyTypeParams, Bool, condition.computedType, false);
    const thenBranch = yield* decodeExprCtx(node.thenBranch, ctx);
    const elseBranch = yield* decodeExprCtx(node.elseBranch, ctx);
    const commonType = yield* mgu(thenBranch.computedType, elseBranch.computedType, node.loc);
    return Ast.DConditional(condition, thenBranch, elseBranch, commonType, node.loc);
}

const decodeMethodCall: Decode<Ast.MethodCall, Ast.DMethodCall> = function* (node, ctx) {
    const self = yield* decodeExprCtx(node.self, ctx);
    const args = yield* E.mapLog(node.args, arg => decodeExprCtx(arg, ctx));

    const { typeDecls, extensions } = ctx.scopeRef();
    const { returnType, typeArgMap } = yield* lookupMethod(
        self.computedType,
        node.method,
        args.map(child => [child.loc, child.computedType]),
        typeDecls,
        extensions,
    );
    return Ast.DMethodCall(self, node.method, args, typeArgMap, returnType, node.loc);
}

const decodeFunctionCall: Decode<Ast.StaticCall, Ast.DStaticCall | Ast.DThrowCall | Ast.DNumber> = function* (node, ctx) {
    const name = node.function;

    const args = yield* E.mapLog(node.args, arg => decodeExprCtx(arg, ctx));

    if (name.text === 'sha256') {
        const [arg] = args;
        const int = Ast.TypeInt(Ast.IFInt('signed', 257, node.loc), node.loc);
        // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
        if (args.length !== 1 || arg?.computedType.kind !== 'TySlice' && arg?.computedType.kind !== 'TypeString') {
            yield EMismatchSha256(node.loc);
            return Ast.DNumber("10", 0n, int, node.loc);
        } else {
            return Ast.DStaticCall(name, new Map(), args, int, node.loc);
        }
    }

    const builtinFnType = builtinFunctions.get(name.text);
    const globalFnType = ctx.scopeRef().functions.get(name.text)?.decl.type;
    const fnType = builtinFnType ?? globalFnType;

    const { returnType, typeArgMap } = yield* checkFnCallWithArgs(
        node.function.loc,
        fnType,
        yield* E.mapLog(node.typeArgs, function* (arg) {
            return yield* decodeDealiasTypeLazy(ctx.typeParams, arg, ctx.scopeRef)();
        }),
        args.map(child => [child.loc, child.computedType]),
    );

    if (name.text === 'throw' || name.text === 'nativeThrow') {
        return Ast.DThrowCall(name, args, returnType, node.loc);
    } else {
        return Ast.DStaticCall(name, typeArgMap, args, returnType, node.loc);
    }
}
const EMismatchSha256 = (loc: Ast.Loc): E.TcError => ({
    loc,
    descr: [
        E.TEText(`sha256() takes either Slice or String`),
    ],
});

const decodeStaticMethodCall: Decode<Ast.StaticMethodCall, Ast.DStaticMethodCall | Ast.DNull> = function* (node, ctx) {
    if (node.typeArgs.length > 0) {
        yield EFunctionArity(node.loc);
    }
    const args = yield* E.mapLog(node.args, arg => decodeExprCtx(arg, ctx));
    const selfDecl = ctx.scopeRef().typeDecls.get(node.self.text);
    if (selfDecl?.decl.kind === 'struct' || selfDecl?.decl.kind === 'message') {
        const builtins = getStaticBuiltin(Ast.DTypeRef(node.self, selfDecl.decl, [], node.loc));
        const builtin = builtins.get(node.function.text);
        if (!builtin) {
            yield EUndefinedStatic(node.function.text, node.loc);
            return Ast.DNull(Ast.TypeNull(node.loc), node.loc);
        }
        const { returnType, typeArgMap } = yield* checkFnCallWithArgs(
            node.loc,
            builtin,
            [],
            args.map(child => [child.loc, child.computedType]),
        );
        return Ast.DStaticMethodCall(node.self, typeArgMap, node.function, args, returnType, node.loc);
    } else {
        yield EUndefinedStatic(node.function.text, node.loc);
        return Ast.DNull(Ast.TypeNull(node.loc), node.loc);
    }
}
const EUndefinedStatic = (name: string, loc: Ast.Loc): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Static method ${name} doesn't exist`),
    ],
});
const EFunctionArity = (loc: Ast.Loc): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Function doesn't take any generic arguments`),
    ],
});

const decodeFieldAccess: Decode<Ast.FieldAccess, Ast.DFieldAccess> = function* (node, ctx) {
    const expr = yield* decodeExprCtx(node.aggregate, ctx);
    const selfType = expr.computedType;
    const returnType = yield* lookupField(selfType, node.field, ctx.scopeRef);
    return Ast.DFieldAccess(expr, node.field, returnType, node.loc);
}

function* lookupField(
    selfType: Ast.DecodedType,
    fieldName: Ast.Id,
    scopeRef: () => Ast.Scope,
): E.WithLog<Ast.DecodedType> {
    switch (selfType.kind) {
        case "type_ref": {
            const decl = selfType.type;
            switch (decl.kind) {
                case "contract":
                case "trait": {
                    const fields = (yield* decl.content()).fieldish;
                    const field = fields.map.get(fieldName.text);
                    if (!field) {
                        yield ENoSuchField(fieldName.text, fieldName.loc);
                        return Ast.DTypeRecover();
                    }
                    return yield* field.decl.type();
                }
                case "struct":
                case "message": {
                    const field = decl.fields.map.get(fieldName.text);
                    if (!field) {
                        yield ENoSuchField(fieldName.text, fieldName.loc);
                        return Ast.DTypeRecover();
                    }
                    return yield* field.type();
                }
                case "union": {
                    yield ENoSuchField(fieldName.text, fieldName.loc);
                    return Ast.DTypeRecover();
                }
            }
            // linter asks for this unreachable code
            return throwInternal("Not all ref cases handled");
        }
        case "TypeMaybe": {
            const type = yield* lookupField(selfType.type, fieldName, scopeRef);
            if (type.kind === 'recover') {
                return type;
            } else {
                return Ast.DTypeMaybe(type, fieldName.loc);
            }
        }
        case "TypeBounced": {
            const decl = scopeRef().typeDecls.get(selfType.name.text);
            if (!decl || decl.decl.kind !== 'message') {
                yield ENoSuchField(fieldName.text, fieldName.loc);
                return Ast.DTypeRecover();
            }
            const field = decl.decl.fields.map.get(fieldName.text);
            if (!field) {
                yield ENoSuchField(fieldName.text, fieldName.loc);
                return Ast.DTypeRecover();
            }
            return yield* field.type();
        }
        case "recover":
        case "TypeAlias": {
            const type = yield* dealiasType(selfType, scopeRef);
            return yield* lookupField(type, fieldName, scopeRef);
        }
        case "TypeParam":
        case "map_type":
        case "tuple_type":
        case "tensor_type":
        case "TyInt":
        case "TySlice":
        case "TyCell":
        case "TyBuilder":
        case "unit_type":
        case "TypeVoid":
        case "TypeNull":
        case "TypeBool":
        case "TypeAddress":
        case "TypeString":
        case "TypeStateInit":
        case "TypeStringBuilder": {
            yield ENoSuchField(fieldName.text, fieldName.loc);
            return Ast.DTypeRecover();
        }
    }
}

const decodeInitOf: Decode<Ast.InitOf, Ast.DInitOf> = function* (node, ctx) {
    const args = yield* E.mapLog(node.args, arg => decodeExprCtx(arg, ctx));
    const contract = ctx.scopeRef().typeDecls.get(node.contract.text);
    if (contract?.decl.kind !== 'contract') {
        yield ENotContract(node.contract.text, node.loc);
        return Ast.DInitOf(node.contract, args, StateInit, node.loc);
    }
    const params = yield* initParams(contract.decl.init);
    yield* checkFnCallWithArgs(
        node.loc,
        Ast.DecodedFnType(emptyTypeParams, params, function*() { return StateInit; }),
        [],
        args.map(child => [child.loc, child.computedType]),
    );
    return Ast.DInitOf(node.contract, args, StateInit, node.loc);
}
function* initParams(init: Ast.InitSig) {
    switch (init.kind) {
        case "function": {
            return init.params;
        }
        case "empty": {
            return Ast.Parameters([], new Set());
        }
        case "simple": {
            const order: Ast.Parameter[] = [];
            const set: Set<string> = new Set();
            for (const name of init.fill.order) {
                const param = init.fill.map.get(name);
                if (!param) {
                    return throwInternal("Ordered<>: missing param");
                }
                set.add(name);
                order.push({
                    name: Ast.Id(name, param.loc),
                    type: param.type,
                    loc: param.loc,
                });
            }
            return Ast.Parameters(order, set);
        }
    }
}

const decodeCodeOf: Decode<Ast.CodeOf, Ast.DCodeOf> = function* (node, ctx) {
    const contract = ctx.scopeRef().typeDecls.get(node.contract.text);
    if (contract?.decl.kind !== 'contract') {
        yield ENotContract(node.contract.text, node.loc);
    }
    return Ast.DCodeOf(node.contract, Ast.TypeCell(Ast.SFDefault(node.loc), node.loc), node.loc);
}
const ENotContract = (name: string, loc: Ast.Loc): E.TcError => ({
    loc,
    descr: [
        E.TEText(`"${name}" is not a contract`),
    ],
});
