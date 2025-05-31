/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */

import * as Ast from "@/next/ast";

// FIXME
export const tactMethodIds = [113617n, 115390n, 121275n];

const r = Ast.Builtin();

const FakeLazy = <T>(t: T): Ast.Lazy<T> => function* () {
    return t;
};

const TypeParams = (typeParams: readonly string[]): Ast.TypeParams => {
    const arr = typeParams.map(name => Ast.TypeId(name, r));
    return Ast.TypeParams(arr, new Set(typeParams));
};

const Params = (params: Record<string, Ast.DecodedType>): Ast.Parameters => {
    const order: Ast.Parameter[] = [];
    const set: Set<string> = new Set();
    for (const [name, type] of Object.entries(params)) {
        order.push(Ast.Parameter(Ast.Id(name, r), FakeLazy(type), r));
        set.add(name);
    }
    return Ast.Parameters(order, set);
};

const Ref = (name: string): Ast.DTypeParamRef => {
    return Ast.DTypeParamRef(Ast.TypeId(name, r), r);
};

const mapType = Ast.MVTypeMap(Ref("K"), Ref("V"), r);

const GenericFn = (name: string, typeParams: readonly string[], params: Record<string, Ast.DecodedType>, returnType: Ast.DecodedType): [string, Ast.DecodedFnType] => {
    return [name, Ast.DecodedFnType(
        TypeParams(typeParams),
        Params(params),
        FakeLazy(returnType),
    )];
};
const Fn = (name: string, params: Record<string, Ast.DecodedType>, returnType: Ast.DecodedType): [string, Ast.DecodedFnType] => {
    return GenericFn(name, [], params, returnType);
};
const MapMethod = (name: string, mutates: boolean, params: Record<string, Ast.DecodedType>, returnType: Ast.DecodedType): [string, Ast.DecodedMethodType] => {
    return [name, Ast.DecodedMethodType(
        mutates,
        TypeParams(["K", "V"]),
        mapType,
        Params(params),
        FakeLazy(returnType),
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
export const StateInit = Ast.DTypeStateInit(r);

export const builtinTypes = new Map([
    "Int", "Slice", "Cell", "Builder", "Void", "Null", "Bool",
    "Address", "String", "StringBuilder", "Map", "Maybe"
].map(s => [s, s]));

const ArithBin = (name: string) => {
    return Fn(name, { left: Int, right: Int }, Int);
};
const BoolBin = (name: string) => {
    return Fn(name, { left: Bool, right: Bool }, Bool);
};
const CompBin = (name: string) => {
    return Fn(name, { left: Int, right: Int }, Bool);
};
const EqBin = (name: string) => {
    return GenericFn(name, ["T"], { left: Ref("T"), right: Ref("T") }, Bool);
};
const ArithAssign = (name: string) => {
    return Fn(name, { left: Int, right: Int }, Void);
};
const BoolAssign = (name: string) => {
    return Fn(name, { left: Bool, right: Bool }, Void);
};

export const builtinFunctions: Map<string, Ast.DecodedFnType> = new Map([
    // dump<T>(arg: T): Void
    GenericFn("dump", ["T"], { data: Ref("T") }, Void),
    // ton(value: String): Int
    Fn("ton", { value: String }, Int),
    // require(that: Bool, msg: String): Void
    Fn("require", { that: Bool, msg: String }, Void),
    // address(s: String): Address
    Fn("address", { s: String }, Address),
    // cell(bocBase64: String): Cell
    Fn("cell", { bocBase64: String }, Cell),
    // dumpStack(): Void
    Fn("dumpStack", {}, Void),
    // emptyMap<K, V>(): map<K, V>
    GenericFn("emptyMap", ["K", "V"], {}, mapType),
    // slice(bocBase64: String): Slice
    Fn("slice", { bocBase64: String }, Slice),
    // rawSlice(hex: String): Slice
    Fn("rawSlice", { hex: String }, Slice),
    // ascii(str: String): Int
    Fn("ascii", { str: String }, Int),
    // crc32(str: String): Int
    Fn("crc32", { str: String }, Int),
    // don't forget about our best friend, sha256
    // it is the only overloaded function in the language
    // sha256(data: Slice | String): Int
]);

export const builtinMethods: Map<string, Ast.DecodedMethodType> = new Map([
    // set(key: K, value: V): void
    MapMethod("set", true, { key: Ref("K"), value: Ref("V") }, Void),
    // get(key: K): Maybe<V>
    MapMethod("get", false, { key: Ref("K") }, Maybe(Ref("V"))),
    // del(key: K): Bool
    MapMethod("del", true, { key: Ref("K") }, Bool),
    // asCell(): Maybe<Cell>
    MapMethod("asCell", false, {}, Maybe(Cell)),
    // isEmpty(): Bool
    MapMethod("isEmpty", false, {}, Bool),
    // exists(key: K): Bool
    MapMethod("exists", false, { key: Ref("K") }, Bool),
    // deepEquals(other: map<K, V>): Bool
    MapMethod("deepEquals", false, { other: mapType }, Bool),
    // replace(key: K, value: V): Bool
    MapMethod("replace", true, { key: Ref("K"), value: Ref("V") }, Bool),
    // replaceGet(key: K, value: V): map<K, V>
    MapMethod("replaceGet", true, { key: Ref("K"), value: Ref("V") }, mapType),
]);

export const builtinUnary: Map<string, Ast.DecodedFnType> = new Map([
    Fn("+", { arg: Int }, Int),
    Fn("-", { arg: Int }, Int),
    Fn("~", { arg: Int }, Int),
    Fn("!", { arg: Bool }, Bool),
    GenericFn("!!", ["T"], { arg: Maybe(Ref("T")) }, Ref("T")),
]);

export const builtinBinary: Map<string, Ast.DecodedFnType> = new Map([
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

export const builtinAugmented: Map<string, Ast.DecodedFnType> = new Map([
    // (left: Int, right: Int): Void;
    ArithAssign("+="),
    ArithAssign("-="),
    ArithAssign("*="),
    ArithAssign("/="),
    ArithAssign("%="),
    ArithAssign("<<="),
    ArithAssign(">>="),
    ArithAssign("&="),
    ArithAssign("|="),
    ArithAssign("^="),
    // (left: Bool, right: Bool): Void;
    BoolAssign("&&="),
    BoolAssign("||="),
]);

export const getStaticBuiltin = (type: Ast.DecodedType): Map<string, Ast.DecodedFnType> => {
    return new Map([
        // Foo.fromSlice(slice: Slice)
        Fn("fromSlice", { slice: Slice }, type),
        // Foo.fromSlice(cell: Cell)
        Fn("fromCell", { cell: Cell }, type),
    ])
};

export const structBuiltin = new Map([
    // Foo.toSlice(): Slice
    Fn("toSlice", {}, Slice),
    // Foo.toCell(): Cell
    Fn("toCell", {}, Cell),
]);

export const messageBuiltin = new Map([
    // Foo.toSlice(): Slice
    Fn("toSlice", {}, Slice),
    // Foo.toCell(): Cell
    Fn("toCell", {}, Cell),
    // Foo.opcode(): Int
    Fn("opcode", {}, Int)
]);
