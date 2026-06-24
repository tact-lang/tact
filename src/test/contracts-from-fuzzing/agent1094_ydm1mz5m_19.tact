struct Foo {
    a: Int;
    b: Bool;
}

struct Bar {
    inner: Foo;
}

struct Baz {
    b: Bar;
}

struct Qux {
    baz: Baz;
}

contract NestedStructStorage {
    data: Qux;
    init() {
        self.data = Qux{baz: Baz{b: Bar{inner: Foo{a:10, b:false}}}};
    }
}