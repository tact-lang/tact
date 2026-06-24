struct Foo {
    x: Int;
}

struct Bar {
    y: String;
}

contract MultiStructs {
    foo: Foo;
    bar: Bar;

    init() {
        self.foo = Foo{ x: 9 };
        self.bar = Bar{ y: "abc" };
    }
}