struct Inner {
    val: Int;
}

struct Outer {
    in1: Inner;
    in2: Inner;
}

contract TestContract {
    outer: Outer;

    init() {
        self.outer = Outer{
            in1: Inner{ val: 11 },
            in2: Inner{ val: 22 }
        };
    }
}
