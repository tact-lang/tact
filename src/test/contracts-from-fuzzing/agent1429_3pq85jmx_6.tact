struct Inner {
    value: Int;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
    inner3: Inner;
}

contract TestContract {
    bigNest: Outer;

    init() {
        self.bigNest = Outer{
            inner1: Inner{ value:1 },
            inner2: Inner{ value:2 },
            inner3: Inner{ value:3 }
        };
    }
}