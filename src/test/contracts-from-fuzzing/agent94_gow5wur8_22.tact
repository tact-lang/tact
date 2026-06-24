// deeply nested, many optional fields
struct InnerMost {
    a: Int?;
    b: Bool;
}

struct Inner {
    im: InnerMost;
    x: Int?;
    y: Int;
}

struct Middle {
    i1: Inner;
    i2: Inner;
}

contract Test {
    m: Middle;

    init() {
        self.m = Middle{
            i1: Inner{ im: InnerMost{ a: null, b: true }, x: null, y: 1 },
            i2: Inner{ im: InnerMost{ a: 42, b: false }, x: 5, y: 2 },
        };
    }
}