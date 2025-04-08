struct Inner {
    a: Int;
    b: Int?;
}

struct Outer {
    nested: Inner;
    c: Int;
    d: Int?;
}

contract Test {
    info: Outer;

    init() {
        self.info = Outer{
            nested: Inner{
                a: 7,
                b: null,
            },
            c: 42,
            d: null,
        };
    }
}