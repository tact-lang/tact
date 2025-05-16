struct Foo {
    a: Int;
}

struct Bar {
    foo: Foo;
}

contract Cross {
    bar: Bar;

    init() {
        self.bar = Bar{
            foo: Foo{
                a: 17
            }
        };
    }
}