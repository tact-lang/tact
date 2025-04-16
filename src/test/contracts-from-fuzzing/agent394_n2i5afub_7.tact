struct Foo {
    a: Int = 1;
    b: Int = 2;
}

struct Bar {
    x: Foo;
    y: Foo;
}

struct Baz {
    bar1: Bar;
    bar2: Bar;
}

contract TestContract {
    deep: Baz;

    init() {
        self.deep = Baz{
            bar1: Bar{
                x: Foo{ a: 11, b: 12 },
                y: Foo{ a: 13, b: 14 }
            },
            bar2: Bar{
                x: Foo{ a: 21, b: 22 },
                y: Foo{ a: 23, b: 24 }
            }
        };
    }
}