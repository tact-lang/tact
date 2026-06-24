struct Inner {
    x: Int;
    y: String?;
}

struct Outer {
    in1: Inner;
    in2: Inner?;
}

contract DeepTest {
    deep: Outer;

    init() {
        self.deep = Outer{
            in1: Inner{x: 1, y: "a"},
            in2: Inner{x: 2, y: null}
        };
    }
}