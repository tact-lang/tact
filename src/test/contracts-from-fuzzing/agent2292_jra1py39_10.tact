struct Foo {
    a: Int;
}

struct Bar {
    foo1: Foo;
    foo2: Foo;
    foo3: Foo;
}

contract NestedRepeats {
    giant: Bar;

    init() {
        self.giant = Bar{
            foo1: Foo{a:1},
            foo2: Foo{a:2},
            foo3: Foo{a:3}
        };
    }
}