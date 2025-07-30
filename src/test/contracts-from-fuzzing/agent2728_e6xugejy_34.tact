struct Bar {
    q: Int;
}

struct Foo {
    bar: Bar;
}

contract Test {
    optional: Foo?;

    init() {
        self.optional = null;
    }
}
