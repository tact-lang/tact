struct Foo {
    bar: Int?;
    baz: Bool;
}

struct Bar {
    fooOpt: Foo?;
    fooMan: Foo;
}

contract OptMandMix {
    storage: Bar;
    init() {
        self.storage = Bar{
            fooOpt: null,
            fooMan: Foo{ bar: null, baz: true }
        };
    }
}