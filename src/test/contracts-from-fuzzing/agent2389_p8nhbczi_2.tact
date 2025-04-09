struct Deep {
    i1: Int?;
    i2: Int?;
    deeper: Inner;
}

struct Inner {
    x: Int;
    y: Int?;
}

contract Tester {
    df: Deep;

    init() {
        self.df = Deep{
            i1: null,
            i2: 10,
            deeper: Inner{ x: 1, y: null },
        };
    }
}