struct Foo {
    x: Int;
    y: Bool;
}

struct Bar {
    foo1: Foo;
    foo2: Foo;
    s: String;
}

contract TestContract {
    bar: Bar;

    init() {
        self.bar = Bar{
            foo1: Foo{ x: 1, y: true },
            foo2: Foo{ x: 2, y: false },
            s: "test"
        };
    }
}
