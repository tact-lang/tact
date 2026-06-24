struct Inner { a: Int; b: Bool; c: Int?; }

struct Outer {
    d: Inner;
    e: Inner;
}

contract TestContract {
    f: Outer;

    init() {
        self.f = Outer{
            d: Inner{ a: 1, b: true, c: null },
            e: Inner{ a: 2, b: false, c: 7 },
        };
    }
}