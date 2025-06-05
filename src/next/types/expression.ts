/* eslint-disable require-yield */
import * as Ast from "@/next/ast";
import { throwInternal } from "@/error/errors";
import {
    Bool,
    builtinBinary,
    builtinFunctions,
    getStaticBuiltin,
    StateInit,
} from "@/next/types/builtins";
import {
    assignType,
    dealiasType,
    decodeDealiasTypeLazy,
    decodeTypeLazy,
    decodeTypeMap,
    checkFnCall,
    instantiateStruct,
    checkFnCallWithArgs,
    mgu,
    lookupMethod,
} from "@/next/types/type";
import { convertValueToExpr } from "@/next/types/value";
import { emptyTypeParams } from "@/next/types/type-params";
import { emptyEff, allEff, shortCircuitEff, anyEff, hasStorageAccess } from "@/next/types/effects";

type Decode<T, U> = (
    node: T,
    ctx: Context,
) => Ast.WithLog<Result<U>>;

type Result<U> = {
    readonly value: U;
    readonly eff: Ast.Effects;
}
const Result = <U>(
    value: U,
    eff: Ast.Effects,
): Result<U> => ({ value, eff });

type Context = {
    readonly Lazy: Ast.ThunkBuilder;
    readonly scopeRef: () => Ast.CSource;
    readonly selfType: Ast.SelfType | undefined;
    readonly typeParams: Ast.CTypeParams;
    readonly localScopeRef: ReadonlyMap<string, [Ast.CType, Ast.Loc]>;
};

export function* decodeExpr(
    Lazy: Ast.ThunkBuilder,
    typeParams: Ast.CTypeParams,
    node: Ast.Expression,
    scopeRef: () => Ast.CSource,
    selfType: Ast.SelfType | undefined,
    localScopeRef: ReadonlyMap<string, [Ast.CType, Ast.Loc]>,
) {
    const result = yield* decodeExprCtx(node, {
        Lazy,
        typeParams,
        scopeRef,
        selfType,
        localScopeRef,
    });
    return { value: result.value, eff: result.eff };
}

export const decodeExprCtx: Decode<Ast.Expression, Ast.DecodedExpression> = (
    node,
    ctx,
) => {
    switch (node.kind) {
        case "null":
            return decodeNullCons(node, ctx);
        case "unit":
            return decodeUnitCons(node, ctx);
        case "string":
            return decodeStringCons(node, ctx);
        case "number":
            return decodeNumberCons(node, ctx);
        case "boolean":
            return decodeBooleanCons(node, ctx);
        case "tuple":
            return decodeTupleCons(node, ctx);
        case "tensor":
            return decodeTensorCons(node, ctx);
        case "map_literal":
            return decodeMapCons(node, ctx);
        case "set_literal":
            return decodeSetCons(node, ctx);
        case "struct_instance":
            return decodeStructCons(node, ctx);

        case "var":
            return decodeVar(node, ctx);
        case "op_binary":
            return decodeBinary(node, ctx);
        case "op_unary":
            return decodeUnary(node, ctx);
        case "conditional":
            return decodeTernary(node, ctx);
        case "method_call":
            return decodeMethodCall(node, ctx);
        case "static_call":
            return decodeFunctionCall(node, ctx);
        case "static_method_call":
            return decodeStaticMethodCall(node, ctx);
        case "field_access":
            return decodeFieldAccess(node, ctx);
        case "init_of":
            return decodeInitOf(node, ctx);
        case "code_of":
            return decodeCodeOf(node, ctx);
    }
};

const decodeNullCons: Decode<Ast.Null, Ast.DNull> = function* (node) {
    return Result(Ast.DNull(Ast.TBasic(Ast.TNull(node.loc), node.loc), node.loc), emptyEff);
};

const decodeUnitCons: Decode<Ast.Unit, Ast.DUnit> = function* (node) {
    return Result(Ast.DUnit(Ast.TBasic(Ast.TUnit(node.loc), node.loc), node.loc), emptyEff);
};

const decodeStringCons: Decode<Ast.String, Ast.DString> = function* (node) {
    return Result(Ast.DString(node.value, Ast.TBasic(Ast.TString(node.loc), node.loc), node.loc), emptyEff);
};

const decodeNumberCons: Decode<Ast.Number, Ast.DNumber> = function* (node) {
    return Result(Ast.DNumber(
        node.base,
        node.value,
        Ast.TBasic(Ast.TInt(Ast.IFInt("signed", 257, node.loc), node.loc), node.loc),
        node.loc,
    ), emptyEff);
};

const decodeBooleanCons: Decode<Ast.Boolean, Ast.DBoolean> = function* (node) {
    return Result(Ast.DBoolean(node.value, Ast.TBasic(Ast.TBool(node.loc), node.loc), node.loc), emptyEff);
};

const decodeTupleCons: Decode<Ast.Tuple, Ast.DTuple> = function* (node, ctx) {
    const children = yield* Ast.mapLog(node.children, (child) =>
        decodeExprCtx(child, ctx),
    );
    const exprs = children.map((child) => child.value);
    const argTypes = exprs.map((expr) => expr.computedType);
    const newEff = allEff(children.map((child) => child.eff));
    return Result(Ast.DTuple(exprs, Ast.CTypeTuple(argTypes, node.loc), node.loc), newEff);
};

const decodeTensorCons: Decode<Ast.Tensor, Ast.DTensor> = function* (
    node,
    ctx,
) {
    const children = yield* Ast.mapLog(node.children, (child) =>
        decodeExprCtx(child, ctx),
    );
    const exprs = children.map((child) => child.value);
    const argTypes = exprs.map((expr) => expr.computedType);
    const newEff = allEff(children.map((child) => child.eff));
    return Result(Ast.DTensor(exprs, Ast.CTypeTensor(argTypes, node.loc), node.loc), newEff);
};

const decodeMapCons: Decode<Ast.MapLiteral, Ast.DMapLiteral> = function* (
    node,
    ctx,
) {
    const ascribed = yield* decodeTypeMap(
        ctx.typeParams,
        node.type,
        ctx.scopeRef,
    );
    const fields = yield* Ast.mapLog(node.fields, function* (field) {
        const key = yield* decodeExprCtx(field.key, ctx);
        yield* assignType(
            field.key.loc,
            emptyTypeParams,
            ascribed.key,
            key.value.computedType,
            false,
        );
        const value = yield* decodeExprCtx(field.value, ctx);
        yield* assignType(
            field.value.loc,
            emptyTypeParams,
            ascribed.value,
            value.value.computedType,
            false,
        );
        return Result(
            Ast.DMapField(key.value, value.value),
            allEff([key.eff, value.eff]),
        );
    });

    return Result(
        Ast.DMapLiteral(
            ascribed,
            fields.map(field => field.value),
            node.loc,
        ),
        allEff(fields.map(field => field.eff)),
    );
};

const decodeSetCons: Decode<Ast.SetLiteral, Ast.DSetLiteral> = function* () {
    return throwInternal("Set literals must have been declined before");
};

const decodeStructCons: Decode<Ast.StructInstance, Ast.DStructInstance> =
    function* (node, ctx) {
        const typeArgs = yield* Ast.mapLog(node.typeArgs, function* (arg) {
            return yield* decodeTypeLazy(
                ctx.Lazy,
                ctx.typeParams,
                arg,
                ctx.scopeRef,
            )();
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
        return Result(
            Ast.DStructInstance(
                fields.value,
                instance?.type ?? Ast.CTypeRecover(),
                node.loc,
            ),
            fields.eff,
        );
    };
function* checkFields(
    typeFields: Ast.Ordered<Ast.CField> | undefined,
    args: readonly Ast.StructFieldInitializer[],
    loc: Ast.Loc,
    ctx: Context,
): Ast.WithLog<Result<Ast.Ordered<Ast.Recover<Ast.DecodedExpression>>>> {
    const map: Map<string, Result<Ast.DecodedExpression>> = new Map();
    for (const arg of args) {
        const fieldName = arg.field.text;

        const prev = map.get(fieldName);
        if (prev) {
            yield EDuplicateField(fieldName, prev.value.loc, arg.loc);
            continue;
        }
        const expr = yield* decodeExprCtx(arg.initializer, ctx);

        if (typeFields) {
            const typeField = typeFields.map.get(fieldName);
            if (typeField) {
                yield* assignType(
                    expr.value.loc,
                    emptyTypeParams,
                    yield* typeField.type(),
                    expr.value.computedType,
                    false,
                );
            } else {
                yield ENoSuchField(fieldName, arg.loc);
            }
        }

        map.set(fieldName, expr);
    }

    if (typeFields) {
        const effects: Ast.Effects[] = [];
        const result: Map<
            string,
            Ast.Recover<Ast.DecodedExpression>
        > = new Map();
        for (const fieldName of typeFields.order) {
            const field = typeFields.map.get(fieldName);
            if (!field) {
                return throwInternal("Ordered<>: lost fields");
            }
            const fieldInst = map.get(fieldName);
            if (fieldInst) {
                effects.push(fieldInst.eff);
                result.set(fieldName, fieldInst.value);
            } else if (field.init) {
                const value = yield* field.init();
                if (value) {
                    const inst = convertValueToExpr(value);
                    result.set(fieldName, inst);
                } else {
                    result.set(fieldName, undefined);
                }
            } else {
                yield EMissingField(fieldName, loc);
                result.set(fieldName, undefined);
            }
        }
        return Result(
            Ast.Ordered(typeFields.order, result),
            allEff(effects)
        );
    } else {
        return Result(
            Ast.Ordered(
                [...map.keys()],
                new Map([...map].map(([name, { value }]) => [name, value])),
            ),
            allEff([...map].map(([, { eff }]) => eff)),
        );
    }
}
const EMissingField = (name: string, prev: Ast.Loc): Ast.TcError => ({
    loc: prev,
    descr: [
        Ast.TEText(`Value for field "${name}" is missing`),
        Ast.TECode(prev),
    ],
});
const ENoSuchField = (name: string, next: Ast.Loc): Ast.TcError => ({
    loc: next,
    descr: [Ast.TEText(`There is no field "${name}"`), Ast.TECode(next)],
});
const EDuplicateField = (
    name: string,
    prev: Ast.Loc,
    next: Ast.Loc,
): Ast.TcError => ({
    loc: prev,
    descr: [
        Ast.TEText(`Duplicate field "${name}"`),
        Ast.TEText(`Defined at:`),
        Ast.TECode(next),
        Ast.TEText(`Previously defined at:`),
        Ast.TECode(prev),
    ],
});

const decodeVar: Decode<Ast.Var, Ast.DVar | Ast.DSelf> = function* (node, ctx) {
    if (node.name !== "self") {
        const type = yield* lookupVar(node.name, node.loc, ctx);
        return Result(
            Ast.DVar(node.name, type, node.loc),
            emptyEff,
        );
    }
    if (ctx.selfType) {
        return Result(
            Ast.DSelf(ctx.selfType, node.loc),
            emptyEff,
        );
    }
    yield ENoSelf(node.loc);
    return Result(
        Ast.DVar(node.name, Ast.TBasic(Ast.TNull(node.loc), node.loc), node.loc),
        emptyEff,
    );
};
const ENoSelf = (loc: Ast.Loc): Ast.TcError => ({
    loc,
    descr: [Ast.TEText(`"self" is not allowed here`)],
});
function* lookupVar(
    name: string,
    loc: Ast.Loc,
    ctx: Context,
): Ast.WithLog<Ast.CType> {
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
    return Ast.CTypeRecover();
}
const EUndefined = (name: string, loc: Ast.Loc): Ast.TcError => ({
    loc,
    descr: [Ast.TEText(`Variable "${name}" not defined`)],
});

const decodeBinary: Decode<Ast.OpBinary, Ast.DOpBinary> = function* (
    node,
    ctx,
) {
    const left = yield* decodeExprCtx(node.left, ctx);
    const right = yield* decodeExprCtx(node.right, ctx);
    const fnType = builtinBinary.get(node.op);
    if (!fnType) {
        return throwInternal("Builtin operator is not in the map");
    }
    const { returnType, typeArgMap } = yield* checkFnCall(node.loc, fnType, [
        [left.value.loc, left.value.computedType],
        [right.value.loc, right.value.computedType],
    ]);
    if (node.op === "==" || node.op === "!=") {
        const typeArg = typeArgMap.get("T");
        if (!typeArg) {
            return throwInternal(
                "getCallResult produced incorrect substitution",
            );
        }
        if (typeArg.kind !== "recover" && !supportsEquality(typeArg)) {
            yield ENoEquality(node.loc);
        }
    }
    const newEff = node.op === '&&' || node.op === '||'
        ? shortCircuitEff(left.eff, right.eff)
        : allEff([left.eff, right.eff]);
    return Result(
        Ast.DOpBinary(
            node.op,
            left.value,
            right.value,
            typeArgMap,
            returnType,
            node.loc,
        ),
        newEff,
    );
};
const ENoEquality = (loc: Ast.Loc): Ast.TcError => ({
    loc,
    descr: [Ast.TEText(`Equality on this type is not supported`)],
});
const supportsEquality = (common: Ast.CType): boolean => {
    switch (common.kind) {
        case "map_type": {
            return true;
        }
        case "TypeMaybe": {
            return supportsEquality(common.type);
        }
        case "recover":
        case "type_ref":
        case "TypeAlias":
        case "TypeParam":
        case "TypeBounced":
        case "tuple_type":
        case "tensor_type": {
            return false;
        }
        case "basic": {
            return supportsEqualityBasic(common.type);
        }
    }
};
const supportsEqualityBasic = (common: Ast.BasicType): boolean => {
    switch (common.kind) {
        case "unit_type":
        case "TyInt":
        case "TySlice":
        case "TyCell":
        case "TypeNull":
        case "TypeBool":
        case "TypeAddress":
        case "TypeString": {
            return true;
        }
        case "TypeVoid":
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
    const { returnType, typeArgMap } = yield* checkFnCall(node.loc, fnType, [
        [operand.value.loc, operand.value.computedType],
    ]);

    return Result(
        Ast.DOpUnary(
            node.op,
            operand.value,
            typeArgMap,
            returnType,
            node.loc,
        ),
        operand.eff,
    );
};

const decodeTernary: Decode<Ast.Conditional, Ast.DConditional> = function* (
    node,
    ctx,
) {
    const condition = yield* decodeExprCtx(node.condition, ctx);
    yield* assignType(
        condition.value.loc,
        emptyTypeParams,
        Bool,
        condition.value.computedType,
        false,
    );
    const thenBranch = yield* decodeExprCtx(node.thenBranch, ctx);
    const elseBranch = yield* decodeExprCtx(node.elseBranch, ctx);
    const commonType = yield* mgu(
        thenBranch.value.computedType,
        elseBranch.value.computedType,
        node.loc,
    );
    return Result(
        Ast.DConditional(
            condition.value,
            thenBranch.value,
            elseBranch.value,
            commonType,
            node.loc,
        ),
        allEff([
            condition.eff,
            anyEff([
                thenBranch.eff,
                elseBranch.eff,
            ]),
        ]),
    );
};

const decodeMethodCall: Decode<Ast.MethodCall, Ast.DMethodCall> = function* (
    node,
    ctx,
) {
    const self = yield* decodeExprCtx(node.self, ctx);
    const args = yield* Ast.mapLog(node.args, (arg) => decodeExprCtx(arg, ctx));

    const { typeDecls, extensions } = ctx.scopeRef();
    const { returnType, typeArgMap, mutates } = yield* lookupMethod(
        ctx.Lazy,
        self.value.computedType,
        node.method,
        args.map((child) => [child.value.loc, child.value.computedType]),
        typeDecls,
        extensions,
    );

    const isCallOnStorage = hasStorageAccess(self.value, ctx.selfType);

    const selfArgsEff = allEff([self.eff, ...args.map(arg => arg.eff)]);

    return Result(
        Ast.DMethodCall(
            self.value,
            node.method,
            args.map(arg => arg.value),
            typeArgMap,
            returnType,
            node.loc,
        ),
        {
            mayRead: isCallOnStorage || selfArgsEff.mayRead,
            mayWrite: mutates && isCallOnStorage || selfArgsEff.mayWrite,
            mustThrow: selfArgsEff.mustThrow,
            mustSetSelf: new Set(),
        },
    );
};

const decodeFunctionCall: Decode<
    Ast.StaticCall,
    Ast.DStaticCall | Ast.DNumber
> = function* (node, ctx) {
    const name = node.function;

    const args = yield* Ast.mapLog(node.args, (arg) => decodeExprCtx(arg, ctx));

    if (name.text === "sha256") {
        const [arg] = args;
        const int = Ast.TBasic(Ast.TInt(Ast.IFInt("signed", 257, node.loc), node.loc), node.loc);
        // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
        if (
            args.length !== 1 ||
            !arg ||
            (arg.value.computedType.kind !== "basic") ||
            (
                arg.value.computedType.type.kind !== "TySlice" &&
                arg.value.computedType.type.kind !== "TypeString"
            )
        ) {
            yield EMismatchSha256(node.loc);
            return Result(
                Ast.DNumber("10", 0n, int, node.loc),
                emptyEff,
            );
        } else {
            return Result(
                Ast.DStaticCall(name, new Map(), [arg.value], int, node.loc),
                arg.eff,
            );
        }
    }

    const builtinFnType = builtinFunctions.get(name.text);
    const globalFnType = ctx.scopeRef().functions.get(name.text)?.decl.type;
    const fnType = builtinFnType ?? globalFnType;

    const { returnType, typeArgMap } = yield* checkFnCallWithArgs(
        ctx.Lazy,
        node.function.loc,
        fnType,
        yield* Ast.mapLog(node.typeArgs, function* (arg) {
            return yield* decodeDealiasTypeLazy(
                ctx.Lazy,
                ctx.typeParams,
                arg,
                ctx.scopeRef,
            )();
        }),
        args.map((child) => [child.value.loc, child.value.computedType]),
    );

    const exprs = args.map(arg => arg.value);
    const newEffs = allEff(args.map(arg => arg.eff));

    if (name.text === "throw" || name.text === "nativeThrow") {
        return Result(
            Ast.DStaticCall(name, typeArgMap, exprs, returnType, node.loc), 
            {
                ...newEffs,
                mustThrow: true,
            },
        );
    } else {
        return Result(Ast.DStaticCall(name, typeArgMap, exprs, returnType, node.loc), newEffs);
    }
};
const EMismatchSha256 = (loc: Ast.Loc): Ast.TcError => ({
    loc,
    descr: [Ast.TEText(`sha256() takes either Slice or String`)],
});

const decodeStaticMethodCall: Decode<
    Ast.StaticMethodCall,
    Ast.DStaticMethodCall | Ast.DNull
> = function* (node, ctx) {
    if (node.typeArgs.length > 0) {
        yield EFunctionArity(node.loc);
    }
    const args = yield* Ast.mapLog(node.args, (arg) => decodeExprCtx(arg, ctx));
    const selfDecl = ctx.scopeRef().typeDecls.get(node.self.text);
    if (!(selfDecl?.decl.kind === "struct" || selfDecl?.decl.kind === "message")) {
        yield EUndefinedStatic(node.function.text, node.loc);
        return Result(Ast.DNull(Ast.TBasic(Ast.TNull(node.loc), node.loc), node.loc), emptyEff);
    }
    const builtins = getStaticBuiltin(
        Ast.DTypeRef(node.self, selfDecl.decl, [], node.loc),
    );
    const builtin = builtins.get(node.function.text);
    if (!builtin) {
        yield EUndefinedStatic(node.function.text, node.loc);
        return Result(Ast.DNull(Ast.TBasic(Ast.TNull(node.loc), node.loc), node.loc), emptyEff);
    }
    const { returnType, typeArgMap } = yield* checkFnCallWithArgs(
        ctx.Lazy,
        node.loc,
        builtin,
        [],
        args.map((child) => [child.value.loc, child.value.computedType]),
    );
    const newEffs = allEff(args.map(arg => arg.eff));
    return Result(
        Ast.DStaticMethodCall(
            node.self,
            typeArgMap,
            node.function,
            args.map(arg => arg.value),
            returnType,
            node.loc,
        ),
        newEffs,
    );
};
const EUndefinedStatic = (name: string, loc: Ast.Loc): Ast.TcError => ({
    loc,
    descr: [Ast.TEText(`Static method ${name} doesn't exist`)],
});
const EFunctionArity = (loc: Ast.Loc): Ast.TcError => ({
    loc,
    descr: [Ast.TEText(`Function doesn't take any generic arguments`)],
});

const decodeFieldAccess: Decode<Ast.FieldAccess, Ast.DFieldAccess> = function* (
    node,
    ctx,
) {
    const expr = yield* decodeExprCtx(node.aggregate, ctx);
    const selfType = expr.value.computedType;
    const returnType = yield* lookupField(selfType, node.field, ctx.scopeRef);
    return Result(
        Ast.DFieldAccess(expr.value, node.field, returnType, node.loc),
        {
            ...expr.eff,
            mayRead: hasStorageAccess(expr.value, ctx.selfType) || expr.eff.mayRead,
        },
    );
};

function* lookupField(
    selfType: Ast.CType,
    fieldName: Ast.Id,
    scopeRef: () => Ast.CSource,
): Ast.WithLog<Ast.CType> {
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
                        return Ast.CTypeRecover();
                    }
                    return yield* field.decl.type();
                }
                case "struct":
                case "message": {
                    const field = decl.fields.map.get(fieldName.text);
                    if (!field) {
                        yield ENoSuchField(fieldName.text, fieldName.loc);
                        return Ast.CTypeRecover();
                    }
                    return yield* field.type();
                }
                case "union": {
                    yield ENoSuchField(fieldName.text, fieldName.loc);
                    return Ast.CTypeRecover();
                }
            }
            // linter asks for this unreachable code
            return throwInternal("Not all ref cases handled");
        }
        case "TypeMaybe": {
            const type = yield* lookupField(selfType.type, fieldName, scopeRef);
            if (type.kind === "recover") {
                return type;
            } else {
                return Ast.CTypeMaybe(type, fieldName.loc);
            }
        }
        case "TypeBounced": {
            const decl = scopeRef().typeDecls.get(selfType.name.text);
            if (!decl || decl.decl.kind !== "message") {
                yield ENoSuchField(fieldName.text, fieldName.loc);
                return Ast.CTypeRecover();
            }
            const field = decl.decl.fields.map.get(fieldName.text);
            if (!field) {
                yield ENoSuchField(fieldName.text, fieldName.loc);
                return Ast.CTypeRecover();
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
        case "basic": {
            yield ENoSuchField(fieldName.text, fieldName.loc);
            return Ast.CTypeRecover();
        }
    }
}

const decodeInitOf: Decode<Ast.InitOf, Ast.DInitOf> = function* (node, ctx) {
    const args = yield* Ast.mapLog(node.args, (arg) => decodeExprCtx(arg, ctx));
    const contract = ctx.scopeRef().typeDecls.get(node.contract.text);
    if (contract?.decl.kind !== "contract") {
        yield ENotContract(node.contract.text, node.loc);
        return Result(
            Ast.DInitOf(
                node.contract, 
                args.map(arg => arg.value), 
                StateInit, 
                node.loc,
            ),
            allEff(args.map(arg => arg.eff)),
        );
    }

    const params = yield* initParams(contract.decl.init);

    yield* checkFnCallWithArgs(
        ctx.Lazy,
        node.loc,
        Ast.CTypeFunction(
            emptyTypeParams,
            params,
            ctx.Lazy({
                callback: function* () {
                    return StateInit;
                },
                context: [Ast.TEText("checking initOf expression")],
                loc: node.loc,
                recover: StateInit,
            }),
        ),
        [],
        args.map((child) => [child.value.loc, child.value.computedType]),
    );

    return Result(
        Ast.DInitOf(
            node.contract, 
            args.map(arg => arg.value), 
            StateInit, 
            node.loc,
        ),
        allEff(args.map(arg => arg.eff)),
    );
};
function* initParams(init: Ast.CInitSig) {
    switch (init.kind) {
        case "function": {
            return init.params;
        }
        case "empty": {
            return Ast.CParameters([], new Set());
        }
        case "simple": {
            const order: Ast.CParameter[] = [];
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
            return Ast.CParameters(order, set);
        }
    }
}

const decodeCodeOf: Decode<Ast.CodeOf, Ast.DCodeOf> = function* (node, ctx) {
    const contract = ctx.scopeRef().typeDecls.get(node.contract.text);
    if (contract?.decl.kind !== "contract") {
        yield ENotContract(node.contract.text, node.loc);
    }
    return Result(
        Ast.DCodeOf(
            node.contract,
            Ast.TBasic(Ast.TCell(Ast.SFDefault(node.loc), node.loc), node.loc),
            node.loc,
        ),
        emptyEff,
    );
};
const ENotContract = (name: string, loc: Ast.Loc): Ast.TcError => ({
    loc,
    descr: [Ast.TEText(`"${name}" is not a contract`)],
});
