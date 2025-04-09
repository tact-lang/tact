struct Bar {
    d: String;
    e: Bool?;
    f: Int?;
}

struct Foo {
    a: Int;
    b: Bool;
    c: Bar;
}

contract Test {
    data: Foo;

    init() {
        self.data = Foo{
            a: 7,
            b: false,
            c: Bar{
                d: "hello",
                e: null,
                f: 42,
            }
        };
    }
}
