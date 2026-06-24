struct Inner {
    a: Int = 10;
    b: Bool?;
    c: String?;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
    inner3: Inner;
}

contract DefaultVals {
    s: Outer;

    init() {
        self.s = Outer{
            inner1: Inner{ b: null, c: null },
            inner2: Inner{ b: true, c: "hi" },
            inner3: Inner{ b: false, c: null },
        };
    }
}