struct Foo {
    x: Int;
    y: Int;
}

struct Bar {
    f1: Foo;
    f2: Foo;
    f3: Foo;
}

contract Test {
    bar: Bar;

    init() {
        self.bar = Bar{
            f1: Foo{x:1,y:2},
            f2: Foo{x:3,y:4},
            f3: Foo{x:5,y:6}
        };
    }
}