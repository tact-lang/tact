struct Bar {
    x: Int?;
    y: Bool;
}

struct Foo {
    a: Int;
    b: Bool?;
    c: Bar;
}

contract OptAndNested {
    data: Foo;

    init() {
        self.data = Foo{
            a: 7,
            b: null,
            c: Bar{x: null, y: true}
        };
    }
}