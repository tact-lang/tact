struct Foo { x: Int; y: Int }

contract ArrayLike {
    f1: Foo;
    f2: Foo;
    f3: Foo;

    init() {
        self.f1 = Foo{ x:1, y:11 };
        self.f2 = Foo{ x:2, y:22 };
        self.f3 = Foo{ x:3, y:33 };
    }
}