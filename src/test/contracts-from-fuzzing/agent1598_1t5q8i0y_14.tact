struct Foo { x: Int }

contract FieldOrder {
    a: Foo = Foo{x: 1};
    b: Foo = Foo{x: 2};

    init() {
        self.a = Foo{x: 10};
        self.b = Foo{x: 20};
    }
}