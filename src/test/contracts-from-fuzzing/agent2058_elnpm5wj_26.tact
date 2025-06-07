// contract parameters with many mixed optionals
struct Foo {
    x: Int;
    y: Bool?;
    z: String;
    q: Int?;
}

contract ParamMany(
    a: Int,
    b: Bool?,
    c: String?,
    foo: Foo,
) {}