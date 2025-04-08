struct Foo {
    x: Int;
    y: Int;
}

contract ArrayOfFields {
    f1: Foo;
    f2: Foo;
    f3: Foo;
    f4: Foo;
    init() {
        self.f1 = Foo{ x: 1, y: 1 };
        self.f2 = Foo{ x: 2, y: 2 };
        self.f3 = Foo{ x: 3, y: 3 };
        self.f4 = Foo{ x: 4, y: 4 };
    }
}