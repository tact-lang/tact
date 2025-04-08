// test contract parameters combined with optional nested struct
struct Foo {
    x: Int;
}

contract ParamsOptNested(
    s: Foo?,
    flag: Bool,
) {}