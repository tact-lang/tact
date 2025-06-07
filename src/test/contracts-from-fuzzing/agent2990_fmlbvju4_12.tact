struct Foo {
    a: Int;
    b: String;
}

struct Bar {
    x: Foo;
    y: Foo;
}

struct Baz {
    left: Bar;
    right: Bar;
}

contract DeepWide {
    data: Baz;
    init() {
        self.data = Baz{
            left: Bar{ x: Foo{a:1,b:"a"}, y: Foo{a:2,b:"b"} },
            right: Bar{ x: Foo{a:3,b:"c"}, y: Foo{a:4,b:"d"} }
        };
    }
}