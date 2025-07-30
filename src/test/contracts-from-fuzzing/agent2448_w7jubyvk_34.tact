struct Middle {
    val: Int;
}

struct Top {
    m: Middle;
    optMid: Middle?;
}

contract Topper {
    s: Top;

    init() {
        self.s = Top{
            m: Middle{ val: 10 },
            optMid: null,
        };
    }
}
