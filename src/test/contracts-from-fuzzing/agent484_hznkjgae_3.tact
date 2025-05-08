struct Inner {
    a: Int;
    b: Int?;
    c: Bool;
    d: String;
}

struct Outer {
    p1: Inner;
    p2: Inner;
}

contract TestContract {
    nested: Outer;

    init() {
        self.nested = Outer{
            p1: Inner{ a: 1, b: null, c: true, d: "one" },
            p2: Inner{ a: 2, b: 3, c: false, d: "two" },
        };
    }
}