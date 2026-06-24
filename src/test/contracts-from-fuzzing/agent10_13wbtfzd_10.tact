struct Foo {
    a: Int;
    b: String;
}

struct Bar {
    x: Int;
    y: Foo;
}

contract Ordered {
    z: Bar;

    init() {
        self.z = Bar{
            x: 42,
            y: Foo{
                a: 1,
                b: "ok"
            }
        };
    }
}