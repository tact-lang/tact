struct Foo {
    c: Int;
    b: String;
    a: Bool;
}

struct Bar {
    z: Foo;
    y: String;
    x: Int;
}

contract Test {
    data: Bar;

    init() {
        self.data = Bar{
            z: Foo{ c:1, b:"x", a:true },
            y: "y",
            x: 42
        };
    }
}