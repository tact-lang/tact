struct Foo {
    bar: Bar;
}

struct Bar {
    baz: Int;
}

contract NestedSwap {
    fooVal: Foo;
    barVal: Bar;

    init() {
        self.fooVal = Foo{bar: Bar{baz:42}};
        self.barVal = Bar{baz:43};
    }
}