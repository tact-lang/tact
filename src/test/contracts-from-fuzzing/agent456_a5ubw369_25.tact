struct Foo {
    a: Int;
}

struct Bar {
    foo1: Foo;
    foo2: Foo;
    opt: Foo?;
}

contract StructArrayLike {
    bar: Bar;

    init() {
        self.bar = Bar {
            foo1: Foo { a: 1 },
            foo2: Foo { a: 2 },
            opt: null
        };
    }
}