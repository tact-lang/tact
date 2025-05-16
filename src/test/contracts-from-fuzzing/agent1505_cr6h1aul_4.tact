struct Inner {
    x: Int?;
    y: Bool;
}

struct Outer {
    a: Bool?;
    b: Inner;
}

contract Test {
    s: Outer;
    init() {
        self.s = Outer{
            a: null,
            b: Inner{ x: null, y: true }
        };
    }
}