struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

struct Outer {
    inner: Inner;
    d: Int?;
}

contract DeepOptional {
    s: Outer;

    init() {
        self.s = Outer{
            inner: Inner{ a: 1, b: true, c: "x" },
            d: null
        };
    }
}
