struct Foo {
    a: Int?;
    b: Int;
}

contract DefaultThenAssign {
    foo: Foo = Foo{ a:null, b:7 };

    init() {
        self.foo = Foo{ a:1, b:2 };
    }
}