contract NestedInlineParams(
    foo: Foo,
    bar: Bar?
) {}

struct Foo {
    x: Int;
    y: Bool;
}

struct Bar {
    s: String;
}