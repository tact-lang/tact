struct Inner {
    val1: Int?;
    val2: Int;
}

struct Outer {
    first: Inner;
    second: Inner;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            first: Inner{ val1: null, val2: 1 },
            second: Inner{ val1: 2, val2: 3 },
        };
    }
}
