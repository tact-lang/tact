struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    c: Inner;
    d: String;
}

contract TestContract {
    s: Outer;

    init() {
        self.s = Outer{
            c: Inner{ a: 1, b: true },
            d: "nested"
        };
    }
}