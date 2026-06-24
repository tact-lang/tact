struct Foo {
    a: Int;
}

struct Bar {
    foo: Foo;
    fooAgain: Foo;
}

contract RepeatedStructs {
    bar: Bar;

    init() {
        self.bar = Bar {
            foo: Foo { a: 1 },
            fooAgain: Foo { a: 2 }
        };
    }
}