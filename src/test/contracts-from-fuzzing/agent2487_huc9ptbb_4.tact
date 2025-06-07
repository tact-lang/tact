struct InnerMost {
    value: Int;
}

struct Inner {
    first: InnerMost;
    second: InnerMost?;
}

struct Outer {
    in1: Inner;
    in2: Inner?;
}

contract TestContract {
    field: Outer;

    init() {
        self.field = Outer{
            in1: Inner{ first: InnerMost{value: 1}, second: null },
            in2: null
        };
    }
}