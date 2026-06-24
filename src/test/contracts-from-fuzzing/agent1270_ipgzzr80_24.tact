struct Inner {
    x: Int;
    y: Bool?;
}

struct Outer {
    a: Int;
    b: Inner;
    c: String;
}

contract Foo {
    field: Outer;

    init() {
        self.field = Outer{
            a: 77,
            b: Inner{ x: 1, y: null },
            c: "yo"
        };
    }
}