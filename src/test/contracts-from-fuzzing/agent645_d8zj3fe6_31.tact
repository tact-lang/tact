struct Foo {
    a: Int;
    b: String;
}

struct Bar {
    c: Bool;
    d: Foo;
}

contract StructMix {
    field: Bar;

    init() {
        self.field = Bar{
            c: true,
            d: Foo{
                a: 123,
                b: "xyz"
            }
        };
    }
}
