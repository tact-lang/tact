struct Foo {
    bar: Bar;
    baz: Baz;
}

struct Bar {
    x: Int;
    optionalX: Int?;
}

struct Baz {
    y: Bool?;
    z: String?;
}

contract DoubleNestedOptional {
    inner: Foo;

    init() {
        self.inner = Foo{
            bar: Bar{ x:42, optionalX:null },
            baz: Baz{ y:null, z:null },
        };
    }
}