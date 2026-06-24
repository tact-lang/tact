struct Foo {
    x: Int;
}

struct Bar {
    foo: Foo?;
}

contract Test {
    f: Foo?;
    b: Bar;
    init() {
        self.f = Foo{ x: 42 };
        self.b = Bar{ foo: null };
    }
    receive() {}
}