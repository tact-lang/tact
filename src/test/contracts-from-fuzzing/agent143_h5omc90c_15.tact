struct Foo {
    a: Int;
}

struct Bar {
    b: Int;
}

struct Baz {
    c: Int;
}

contract ManyNestedStructs {
    fooField: Foo;
    barField: Bar;
    bazField: Baz;

    init() {
        self.fooField = Foo{ a: 1 };
        self.barField = Bar{ b: 2 };
        self.bazField = Baz{ c: 3 };
    }
}
