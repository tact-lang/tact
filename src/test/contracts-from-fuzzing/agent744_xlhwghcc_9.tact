struct Outer {
    inner1: Inner;
    inner2: InnerOpt;
}

struct Inner {
    val: Int;
}

struct InnerOpt {
    val: Int?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner1: Inner{ val: 42 },
            inner2: InnerOpt{ val: null }
        };
    }
}