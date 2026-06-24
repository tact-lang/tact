struct Inner {
    i: Int;
    b: Bool;
}

struct Outer {
    in1: Inner;
    in2: Inner;
}

contract Test {
    field: Outer;

    init() {
        self.field = Outer{
            in1: Inner{ i: 1, b: true },
            in2: Inner{ i: 2, b: false },
        };
    }
}