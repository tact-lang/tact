struct InnerMost {
    a: Int;
}

struct Inner {
    im: InnerMost;
    b: Int?;
}

struct Outer {
    inr: Inner;
    c: Bool;
}

contract NestedStructStorage {
    s: Outer;

    init() {
        self.s = Outer{
            inr: Inner{
                im: InnerMost{ a: 1 },
                b: null
            },
            c: true
        };
    }
}
