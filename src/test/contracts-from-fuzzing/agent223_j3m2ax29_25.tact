struct Bar {
    z: Bool;
}

struct Foo {
    b: Bar;
}

contract StructChain {
    foo: Foo;

    init() {
        self.foo = Foo{
            b: Bar{
                z: true
            }
        };
    }
}