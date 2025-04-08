struct Inner {
    val1: Int;
    flag: Bool;
}

struct Outer {
    in1: Inner;
    in2: Inner;
    flag2: Bool;
}

contract DeepNestTest {
    data: Outer;

    init() {
        self.data = Outer{
            in1: Inner{ val1: 1, flag: true },
            in2: Inner{ val1: 2, flag: false },
            flag2: true
        };
    }
}