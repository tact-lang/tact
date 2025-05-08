struct Simple {
    a: Int;
}

contract InitDefault {
    foo: Simple = Simple{ a: 7 };

    init() {
        self.foo = Simple{ a: 42 };
    }
}