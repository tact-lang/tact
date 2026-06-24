// contract with param and many nested arbitrary mixed-depth optionals
contract CrazyParam(
    foo: Foo?
) {}

struct Foo {
    nested: Bar?;
    value: Int;
}

struct Bar {
    v1: Int?;
    v2: Bool?;
    sub: Baz?;
}

struct Baz {
    flag: Bool;
    text: String?;
}