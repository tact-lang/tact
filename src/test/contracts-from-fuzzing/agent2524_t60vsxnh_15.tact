struct Foo {
    a: Int as uint8;
    b: String?;
}

struct Bar {
    c: Bool;
    d: Int?;
}

contract ParamVariety(
    foo: Foo,
    bar: Bar,
    flag: Bool,
    number: Int as int32,
) {}