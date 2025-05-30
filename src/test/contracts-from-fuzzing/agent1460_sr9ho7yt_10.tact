struct Foo {
    x: Int;
}

struct Bar {
    y: Int;
}

contract ManyStructFields {
    foo1: Foo;
    foo2: Foo;
    foo3: Foo;
    foo4: Foo;
    foo5: Foo;
    bar1: Bar;
    bar2: Bar;
    bar3: Bar;
    bar4: Bar;
    bar5: Bar;

    init() {
        self.foo1 = Foo{ x: 1 };
        self.foo2 = Foo{ x: 2 };
        self.foo3 = Foo{ x: 3 };
        self.foo4 = Foo{ x: 4 };
        self.foo5 = Foo{ x: 5 };
        self.bar1 = Bar{ y: 1 };
        self.bar2 = Bar{ y: 2 };
        self.bar3 = Bar{ y: 3 };
        self.bar4 = Bar{ y: 4 };
        self.bar5 = Bar{ y: 5 };
    }
}
