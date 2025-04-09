struct Foo {
    a: Int;
}

contract PersistMulti {
    f1: Foo;
    f2: Foo;

    init() {
        self.f1 = Foo{ a: 1 };
        self.f2 = Foo{ a: 2 };
    }
}