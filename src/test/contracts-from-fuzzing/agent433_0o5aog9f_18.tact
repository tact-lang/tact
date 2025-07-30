struct Inner {
    a: Int;
    b: String;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
    inner3: Inner;
}

contract TestContract {
    outer: Outer;

    init() {
        self.outer = Outer{
            inner1: Inner{ a: 1, b: "x" },
            inner2: Inner{ a: 2, b: "y" },
            inner3: Inner{ a: 3, b: "z" },
        };
    }
}