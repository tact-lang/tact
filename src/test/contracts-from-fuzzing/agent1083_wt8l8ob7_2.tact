struct Inner {
    value: Int;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
    optInner: Inner?;
}

contract DoubleNestOpt {
    data: Outer;

    init() {
        self.data = Outer{
            inner1: Inner{value: 1},
            inner2: Inner{value:2},
            optInner: null,
        };
    }
}