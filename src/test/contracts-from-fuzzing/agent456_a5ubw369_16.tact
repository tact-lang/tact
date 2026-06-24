struct Foo {
    a: Int;
    b: Bool;
}

struct Bar {
    c: Int?;
    d: Foo;
}

contract SwapOrder {
    s: Bar;

    init() {
        self.s = Bar {
            c: null,
            d: Foo { a: 5, b: true }
        };
    }
}