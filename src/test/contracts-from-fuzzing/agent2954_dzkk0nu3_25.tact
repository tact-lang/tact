struct Foo { bar: Int; }

contract OptionalInOptional {
    foo: Foo?;
    init() {
        self.foo = Foo{ bar: 1 };
    }
}
