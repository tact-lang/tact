struct Foo {
    x: Int?
}

contract OptDefault {
    foo: Foo = Foo{ x:null };

    init() {
        self.foo = Foo{ x:42 };
    }
}