struct Inner {
    val: Int;
}

struct Outer {
    in1: Inner;
    in2: Inner;
    in3: Inner;
}

contract MultiNested {
    state: Outer;

    init() {
        self.state = Outer{
            in1: Inner{val: 1},
            in2: Inner{val: 2},
            in3: Inner{val: 3},
        };
    }
}
