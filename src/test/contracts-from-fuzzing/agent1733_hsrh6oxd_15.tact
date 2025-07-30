struct Inner {
    value: Int;
}

struct Middle {
    i1: Inner;
    i2: Inner;
}

contract TestContract {
    m: Middle;

    init() {
        self.m = Middle{
            i1: Inner{ value: 7 },
            i2: Inner{ value: 8 }
        };
    }
}