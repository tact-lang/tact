struct Inner {
    x: Int;
    y: Int?;
}

struct Outer {
    a: Int;
    b: Inner;
    c: Int?;
}

contract Test {
    nested: Outer;
    init() {
        self.nested = Outer{
            a: 1,
            b: Inner{ x:2, y: null },
            c: null
        };
    }
}