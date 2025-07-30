struct Foo {
    bar: Int;
    baz: Int;
}

contract TestContract {
    a: Foo;
    b: Foo;
    c: Foo;

    init() {
        self.a = Foo{ bar: 1, baz: 2 };
        self.b = Foo{ bar: 3, baz: 4 };
        self.c = Foo{ bar: 5, baz: 6 };
    }
}