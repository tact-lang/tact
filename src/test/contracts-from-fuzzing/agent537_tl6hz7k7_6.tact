struct Inner {
    a: Int;
}

struct Outer {
    b: Int;
    in1: Inner;
    in2: Inner;
    in3: Inner;
    c: Int;
}

contract TestContract {
    outer: Outer;

    init() {
        self.outer = Outer{
            b: 1,
            in1: Inner{ a: 2 },
            in2: Inner{ a: 3 },
            in3: Inner{ a: 4 },
            c: 5
        };
    }

    receive() {
        self.outer = self.outer;
    }
}
