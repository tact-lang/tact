// Nested structs, outer contract param
struct Bar {
    z: Int;
}

struct Foo {
    bar: Bar;
}

contract NestedParam(
    foo: Foo
) {}