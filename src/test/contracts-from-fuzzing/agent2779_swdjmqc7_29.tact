struct OuterMost {
    val: Int = 7;
    mid: Middle;
}

struct Middle {
    x: Int;
    inner: Inner;
}

struct Inner {
    y: Int;
}

contract InitDefaultStructs {
    all: OuterMost;
    init() {
        self.all = OuterMost{
            mid: Middle{
                x: 5,
                inner: Inner{ y: 42 }
            }
        };
    }
}