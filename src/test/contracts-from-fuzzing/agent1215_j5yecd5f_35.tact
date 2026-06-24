struct Foo {
    bar: Int;
    baz: Bool?;
}

struct Outer {
    inner: Foo;
    optInner: Foo?;
}

contract NestedOptionalFields(
    param: Outer,
    optParam: Outer?,
) {}