struct Inner {
    x: Int;
}

struct Outer {
    in1: Inner;
    in2: Inner;
    in3: Inner;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            in1: Inner{ x:1 },
            in2: Inner{ x:2 },
            in3: Inner{ x:3 },
        };
    }
}
