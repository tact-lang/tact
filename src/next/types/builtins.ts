/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */

import * as Ast from "@/next/ast";

// FIXME
export const tactMethodIds = [113617n, 115390n, 121275n];

const r = Ast.Builtin();

const TypeParams = (typeParams: readonly string[]): Ast.CTypeParams => {
    const arr = typeParams.map((name) => Ast.TypeId(name, r));
    return Ast.CTypeParams(arr, new Set(typeParams));
};

const Params = (params: Record<string, Ast.CType>): Ast.CParameters => {
    const order: Ast.CParameter[] = [];
    const set: Set<string> = new Set();
    for (const [name, type] of Object.entries(params)) {
        order.push(Ast.CParameter(Ast.Id(name, r), Ast.FakeThunk(type), r));
        set.add(name);
    }
    return Ast.CParameters(order, set);
};

const Ref = (name: string): Ast.CTParamRef => {
    return Ast.CTParamRef(Ast.TypeId(name, r), r);
};

const mapType = Ast.SVTMap(Ref("K"), Ref("V"), r);

const GenericFn = (
    name: string,
    typeParams: readonly string[],
    params: Record<string, Ast.CType>,
    returnType: Ast.CType,
): [string, Ast.CTFunction] => {
    return [
        name,
        Ast.CTFunction(
            TypeParams(typeParams),
            Params(params),
            Ast.FakeThunk(returnType),
        ),
    ];
};
const Fn = (
    name: string,
    params: Record<string, Ast.CType>,
    returnType: Ast.CType,
): [string, Ast.CTFunction] => {
    return GenericFn(name, [], params, returnType);
};
const MapMethod = (
    name: string,
    mutates: boolean,
    params: Record<string, Ast.CType>,
    returnType: Ast.CType,
): [string, Ast.CTMethod] => {
    return [
        name,
        Ast.CTMethod(
            mutates,
            TypeParams(["K", "V"]),
            mapType,
            Params(params),
            Ast.FakeThunk(returnType),
        ),
    ];
};

export const Int = Ast.CTBasic(Ast.TInt(Ast.IFInt("signed", 257, r), r), r);
export const Slice = Ast.CTBasic(Ast.TSlice(Ast.SFDefault(r), r), r);
export const Cell = Ast.CTBasic(Ast.TCell(Ast.SFDefault(r), r), r);
export const Builder = Ast.CTBasic(Ast.TBuilder(Ast.SFDefault(r), r), r);
export const Void = Ast.CTBasic(Ast.TVoid(r), r);
export const Null = Ast.CTBasic(Ast.TNull(r), r);
export const Bool = Ast.CTBasic(Ast.TBool(r), r);
export const Address = Ast.CTBasic(Ast.TAddress(r), r);
export const String = Ast.CTBasic(Ast.TString(r), r);
export const StringBuilder = Ast.CTBasic(Ast.TStringBuilder(r), r);
export const MapType = (k: Ast.CType, v: Ast.CType) =>
    Ast.CTMap(k, v, r);
export const Maybe = (t: Ast.CType) => Ast.CTMaybe(t, r);
export const Unit = Ast.TUnit(r);
export const StateInit = Ast.CTBasic(Ast.TStateInit(r), r);

export const stateInitFields = new Map([
    ["code", Cell],
    ["data", Cell],
]);

export const builtinTypes = new Map(
    [
        "Int",
        "Slice",
        "Cell",
        "Builder",
        "Void",
        "Null",
        "Bool",
        "Address",
        "String",
        "StringBuilder",
        "Map",
        "Maybe",
        "StateInit",
    ].map((s) => [s, s]),
);

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

export const builtinFunctions: Map<string, Ast.CTFunction> = new Map([
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

export const builtinMethods: Map<string, Ast.CTMethod> = new Map([
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

export const builtinUnary: Map<string, Ast.CTFunction> = new Map([
    Fn("+", { arg: Int }, Int),
    Fn("-", { arg: Int }, Int),
    Fn("~", { arg: Int }, Int),
    Fn("!", { arg: Bool }, Bool),
    GenericFn("!!", ["T"], { arg: Maybe(Ref("T")) }, Ref("T")),
]);

export const builtinBinary: Map<string, Ast.CTFunction> = new Map([
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

export const builtinAugmented: Map<string, Ast.CTFunction> = new Map([
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

export const getStaticBuiltin = (
    type: Ast.CType,
): Map<string, Ast.CTFunction> => {
    return new Map([
        // Foo.fromSlice(slice: Slice)
        Fn("fromSlice", { slice: Slice }, type),
        // Foo.fromSlice(cell: Cell)
        Fn("fromCell", { cell: Cell }, type),
    ]);
};

// TODO: convert into methods, use `mutates` from them in `lookupMethod`
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
    Fn("opcode", {}, Int),
]);
