struct Foo {
    a: Int;
    b: Int?;
}

contract ArrayLike {
    f0: Foo;
    f1: Foo;
    f2: Foo;
    f3: Foo;
    f4: Foo;
    f5: Foo;

    init() {
        self.f0 = Foo{ a: 0, b: null };
        self.f1 = Foo{ a: 1, b: 1 };
        self.f2 = Foo{ a: 2, b: 2 };
        self.f3 = Foo{ a: 3, b: null };
        self.f4 = Foo{ a: 4, b: 4 };
        self.f5 = Foo{ a: 5, b: null };
    }
}