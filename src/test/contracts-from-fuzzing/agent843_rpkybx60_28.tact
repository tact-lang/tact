struct Foo {
    a: Int?;
}

struct Bar {
    foo: Foo?;
}

contract OptInOpt {
    store: Bar?;

    init() {
        self.store = Bar{ foo: Foo{ a: null } };
    }
}
