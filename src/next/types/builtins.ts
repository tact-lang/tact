/* eslint-disable @typescript-eslint/no-unused-vars */

import * as Ast from "@/next/ast";

const r = Ast.Builtin();

const Param = (name: string, type: Ast.DecodedType) => {
    return Ast.MTypedParameter(
        Ast.Id(name, r),
        type,
        r,
    );
};

const t = Ast.TypeId("T", r);
const tParam = Ast.DTypeParamRef(t, r);

const k = Ast.TypeId("K", r);
const kParam = Ast.DTypeParamRef(k, r);
const key = Param("key", kParam);

const v = Ast.TypeId("V", r);
const vParam = Ast.DTypeParamRef(v, r);
const value = Param("value", vParam);

const mapType = Ast.MVTypeMap(kParam, vParam, r);

const GenericFn = (name: string, typeParams: readonly Ast.TypeId[], args: readonly Ast.MTypedParameter[], returnType: Ast.DecodedType): [string, Ast.MFnType] => {
    return [name, Ast.MFnType(typeParams, args, returnType)];
};
const Fn = (name: string, args: readonly Ast.MTypedParameter[], returnType: Ast.DecodedType): [string, Ast.MFnType] => {
    return [name, Ast.MFnType([], args, returnType)];
};
const MapMethod = (name: string, args: readonly Ast.MTypedParameter[], returnType: Ast.DecodedType): [string, Ast.MMethodFnType] => {
    return [name, Ast.MMethodFnType(
        [k, v],
        mapType,
        args,
        returnType,
    )];
};

export const Int = Ast.TypeInt(Ast.IFInt("signed", 257, r), r);
export const Slice = Ast.TypeSlice(Ast.SFDefault(r), r);
export const Cell = Ast.TypeCell(Ast.SFDefault(r), r);
export const Builder = Ast.TypeBuilder(Ast.SFDefault(r), r);
export const Void = Ast.TypeVoid(r);
export const Null = Ast.TypeNull(r);
export const Bool = Ast.TypeBool(r);
export const Address = Ast.TypeAddress(r);
export const String = Ast.TypeString(r);
export const StringBuilder = Ast.TypeStringBuilder(r);
export const MapType = (k: Ast.DecodedType, v: Ast.DecodedType) => Ast.DTypeMap(k, v, r);
export const Maybe = (t: Ast.DecodedType) => Ast.DTypeMaybe(t, r)
export const Unit = Ast.TypeUnit(r);
export const StateInit = Ast.TypeCons(Ast.TypeId("StateInit", r), [], r);

export const builtinTypes = new Map([
    "Int", "Slice", "Cell", "Builder", "Void", "Null", "Bool",
    "Address", "String", "StringBuilder", "Map", "Maybe"
].map(s => [s, s]));

const ArithBin = (name: string) => {
    return Fn(name, [Param("left", Int), Param("right", Int)], Int);
};
const CompBin = (name: string) => {
    return Fn(name, [Param("left", Int), Param("right", Int)], Bool);
};
const BoolBin = (name: string) => {
    return Fn(name, [Param("left", Bool), Param("right", Bool)], Bool);
};
const EqBin = (name: string) => {
    return GenericFn(name, [t], [Param("left", tParam), Param("right", tParam)], Bool);
};

export const builtinFunctions: Map<string, Ast.MFnType> = new Map([
    // dump<T>(arg: T): Void
    GenericFn("dump", [t], [Param("data", tParam)], Void),
    // ton(value: String): Int
    Fn("ton", [Param("value", String)], Int),
    // require(that: Bool, msg: String): Void
    Fn("require", [Param("that", Bool), Param("msg", String)], Void),
    // address(s: String): Address
    Fn("address", [Param("s", String)], Address),
    // cell(bocBase64: String): Cell
    Fn("cell", [Param("bocBase64", String)], Cell),
    // dumpStack(): Void
    Fn("dumpStack", [], Void),
    // emptyMap<K, V>(): map<K, V>
    GenericFn("emptyMap", [k, v], [], mapType),
    // slice(bocBase64: String): Slice
    Fn("slice", [Param("bocBase64", String)], Slice),
    // rawSlice(hex: String): Slice
    Fn("rawSlice", [Param("hex", String)], Slice),
    // ascii(str: String): Int
    Fn("ascii", [Param("str", String)], Int),
    // crc32(str: String): Int
    Fn("crc32", [Param("str", String)], Int),
    // sha256(data: Slice): Int
    Fn("sha256", [Param("str", Slice)], Int),
]);

export const builtinMethods: Map<string, Ast.MMethodFnType> = new Map([
    // set(key: K, value: V): void
    MapMethod("set", [key, value], Void),
    // get(key: K): Maybe<V>
    MapMethod("get", [key], Maybe(vParam)),
    // del(key: K): Bool
    MapMethod("del", [key], Bool),
    // asCell(): Maybe<Cell>
    MapMethod("asCell", [], Maybe(Cell)),
    // isEmpty(): Bool
    MapMethod("isEmpty", [], Bool),
    // exists(key: K): Bool
    MapMethod("exists", [key], Bool),
    // deepEquals(other: map<K, V>): Bool
    MapMethod("deepEquals", [Param("other", mapType)], Bool),
    // replace(key: K, value: V): Bool
    MapMethod("replace", [key, value], Bool),
    // replaceGet(key: K, value: V): map<K, V>
    MapMethod("replaceGet", [key, value], mapType),
]);

export const builtinUnary: Map<string, Ast.MFnType> = new Map([
    Fn("+", [Param("arg", Int)], Int),
    Fn("-", [Param("arg", Int)], Int),
    Fn("~", [Param("arg", Int)], Int),
    Fn("!", [Param("arg", Bool)], Bool),
    GenericFn("!!", [t], [Param("arg", Maybe(tParam))], tParam),
]);

export const builtinBinary: Map<string, Ast.MFnType> = new Map([
    // (left: Int, right: Int): Int
    ArithBin("+"),
    ArithBin("-"),
    ArithBin("*"),
    ArithBin("/"),
    ArithBin("%"),
    ArithBin("<<"),
    ArithBin(">>"),
    ArithBin("&"),
    ArithBin("|"),
    ArithBin("^"),
    // (left: Int, right: Int): Bool
    CompBin(">"),
    CompBin("<"),
    CompBin(">="),
    CompBin("<="),
    // <T>(left: T, right: T): Bool
    EqBin("=="),
    EqBin("!="),
    // (left: Bool, right: Bool): Bool
    BoolBin("&&"),
    BoolBin("||"),
]);

export const getStaticBuiltin = (type: Ast.DecodedType): Map<string, Ast.MFnType> => {
    return new Map([
        // Foo.fromSlice(slice: Slice)
        Fn("fromSlice", [Param("slice", Slice)], type),
        // Foo.fromSlice(cell: Cell)
        Fn("fromCell", [Param("cell", Cell)], type),
    ])
};

export const structBuiltin = new Map([
    // Foo.toSlice(): Slice
    Fn("toSlice", [], Slice),
    // Foo.toCell(): Cell
    Fn("toCell", [], Cell),
]);

export const messageBuiltin = new Map([
    // Foo.toSlice(): Slice
    Fn("toSlice", [], Slice),
    // Foo.toCell(): Cell
    Fn("toCell", [], Cell),
    // Foo.opcode(): Int
    Fn("opcode", [], Int)
]);
