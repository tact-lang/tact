struct Inner {
    val: Int;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
}

contract TwoNested {
    data: Outer;

    init() {
        self.data = Outer{
            inner1: Inner{ val: 10 },
            inner2: Inner{ val: 20 },
        };
    }
}