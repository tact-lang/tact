struct Foo {
    x: Int;
}

struct Bar {
    foo: Foo?;
}

struct Baz {
    bar: Bar?;
}

contract NestedOptionalStructs {
    data: Baz;

    init() {
        self.data = Baz{ bar: null };
    }
}