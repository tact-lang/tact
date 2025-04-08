struct Foo {
    a: Int;
    b: Bool;
}

contract DefaultOptContract {
    a: Int? = null;
    b: Bool? = false;
    foo: Foo = Foo{ a: 0, b: true };

    init() {
        self.a = 7;
        self.b = true;
        self.foo = Foo{ a: 1, b: false };
    }
}