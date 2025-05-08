struct Inner {
    a: Int;
    b: Int;
}

struct Middle {
    in1: Inner;
    in2: Inner;
}

struct Outer {
    mid: Middle;
    val: Int;
}

contract DeepNestedTest {
    storage: Outer;

    init() {
        self.storage = Outer{
            mid: Middle{
                in1: Inner{ a: 1, b: 2 },
                in2: Inner{ a: 3, b: 4 }
            },
            val: 42
        };
    }
}
