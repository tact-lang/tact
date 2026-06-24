struct Foo {
    bar: Int?;
    baz: Int;
}

contract MixInit {
    x: Foo;
    init() {
        self.x = Foo{ bar: null, baz: 42 };
    }
}