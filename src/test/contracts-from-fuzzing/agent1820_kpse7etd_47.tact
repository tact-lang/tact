struct NestedMix {
    inner: Inner;
    iopt: Inner?;
}

struct Inner {
    b1: Bool;
    b2: Bool?;
    n: Int as uint32;
    s: String;
}

contract TestContract {
    m: NestedMix;
    init() {
        self.m = NestedMix{
            inner: Inner{
                b1: true,
                b2: null,
                n: 123,
                s: "yo",
            },
            iopt: null,
        };
    }
}