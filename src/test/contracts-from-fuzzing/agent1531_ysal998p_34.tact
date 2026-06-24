struct Foo {
    a: Int;
    b: Int;
}

struct Bar {
    c: Int;
    d: Foo;
}

contract TestStorage {
    x: Foo;
    y: Bar;

    init() {
        self.x = Foo{a:1,b:2};
        self.y = Bar{c:3,d:Foo{a:4,b:5}};
    }
}
