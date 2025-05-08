struct Inner {
    s: String;
    n: Int;
}

struct Outer {
    a: Int;
    b: Inner;
    c: Int;
    d: Inner;
}

contract TestContract {
    field: Outer;

    init() {
        self.field = Outer{
            a: 1,
            b: Inner{ s: "X", n: 42 },
            c: 3,
            d: Inner{ s: "Y", n: 84 }
        };
    }
}