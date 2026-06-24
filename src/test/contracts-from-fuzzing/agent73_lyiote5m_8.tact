struct Inner {
    a: Int
}

struct Outer {
    in1: Inner;
    in2: Inner;
    in3: Inner
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            in1: Inner{ a: 1 },
            in2: Inner{ a: 2 },
            in3: Inner{ a: 3 }
        };
    }
}