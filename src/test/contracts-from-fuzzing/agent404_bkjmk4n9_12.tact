struct Inner {
    s: String;
    i: Int;
}

struct Outer {
    a: Int;
    b: Inner;
    c: String;
    d: Bool;
    e: Bool?;
}

contract DeepMix {
    d: Outer;
    init() {
        self.d = Outer{
            a: 1,
            b: Inner{s: "x", i: 2},
            c: "y",
            d: false,
            e: null
        };
    }
}