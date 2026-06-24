struct Inner {
    x: Int as int64;
    y: Int as uint32;
}

struct Outer {
    a: Inner;
    b: Int as uint8;
    c: Bool;
}

contract PersistExplicitNested {
    foo: Outer;

    init() {
        self.foo = Outer{
            a: Inner{
                x: 123456,
                y: 7890,
            },
            b: 255,
            c: true,
        };
    }
}