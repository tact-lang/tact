struct Inner {
    val: Int;
}

struct Outer {
    in1: Inner;
    in2: Inner;
    flag: Bool;
}

contract MultiNestedTest {
    outerField: Outer;

    init() {
        self.outerField = Outer{
            in1: Inner{ val: 1 },
            in2: Inner{ val: 2 },
            flag: true
        };
    }
}