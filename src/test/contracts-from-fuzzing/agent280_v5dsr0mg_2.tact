struct Inner {
    value: Int;
}

struct Outer {
    in1: Inner;
    in2: Inner;
}

contract NestedTest {
    outer: Outer;

    init() {
        self.outer = Outer{
            in1: Inner{value: 1},
            in2: Inner{value: 2},
        };
    }
}