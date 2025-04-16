struct Foo {
    x: Int;
    y: Int?;
}

struct Bar {
    foo: Foo;
    optFoo: Foo?;
}

contract ParamNested(
    bar: Bar,
    optBar: Bar?,
) {
    // no init, storage via parameters
}
