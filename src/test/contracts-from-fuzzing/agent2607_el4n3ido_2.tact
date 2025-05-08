struct Inner {
    a: Int;
    b: Int;
}

struct Outer {
    in1: Inner;
    in2: Inner;
}

contract DeepNestedTest {
    nested: Outer;

    init() {
        self.nested = Outer{
            in1: Inner{ a:1, b:2 },
            in2: Inner{ a:3, b:4 }
        };
    }
}
