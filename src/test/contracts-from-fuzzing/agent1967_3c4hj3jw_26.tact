contract InitParamContract(
    foo: Int,
    bar: Int?,
    baz: Bool,
    qux: Bool?,
    s: SomeStruct?,
) {}

struct SomeStruct {
    a: Int;
    b: Int?;
    c: String;
}
