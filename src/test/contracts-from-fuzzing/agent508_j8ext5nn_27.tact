struct Inner {
    a: Int as int4;
    b: Int as uint4;
}

struct Middle {
    x: Inner;
    y: Inner;
}

contract Test {
    m: Middle;

    init() {
        self.m = Middle{
            x: Inner{ a: -8, b: 15 },
            y: Inner{ a: 7, b: 0 }
        };
    }
}
