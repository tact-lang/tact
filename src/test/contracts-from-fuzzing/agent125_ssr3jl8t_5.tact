struct Foo {
    a: Int;
    b: Bool;
}

struct Bar {
    foo: Foo;
    c: Int;
}

contract ManyNestedFields {
    f1: Bar;
    f2: Bar;
    
    init() {
        self.f1 = Bar{ foo: Foo{ a: 1, b: true }, c: 10 };
        self.f2 = Bar{ foo: Foo{ a: 2, b: false }, c: 20 };
    }
}