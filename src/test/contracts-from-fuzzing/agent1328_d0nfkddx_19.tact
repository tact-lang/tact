struct Foo {
    a: Int;
    b: Int;
}

contract Multiple {
    f1: Foo;
    f2: Foo;

    init() {
        self.f1 = Foo{ a: 1, b: 2 };
        self.f2 = Foo{ a: 3, b: 4 };
    }
}