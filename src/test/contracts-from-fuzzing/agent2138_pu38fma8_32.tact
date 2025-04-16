struct Inner {
    a: Int?;
    b: Bool?;
}

struct Outer {
    inr: Inner;
    c: Int?;
}

contract OptionalInOut {
    s: Outer;

    init() {
        self.s = Outer{
            inr: Inner{
                a: 40,
                b: null,
            },
            c: null,
        };
    }
}