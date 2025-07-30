struct Inner {
    x: Int;
    y: Int?;
}

struct Outer {
    a: Int;
    b: Bool;
    c: Inner;
    d: Inner?;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            a: 1,
            b: true,
            c: Inner{ x: 10, y: null },
            d: null,
        };
    }
}