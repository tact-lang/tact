struct Outer {
    i: Int;
    j: Inner;
}

struct Inner {
    k: Int;
    l: Int?;
}

contract NestedOpts {
    s: Outer;

    init() {
        self.s = Outer{
            i: 11,
            j: Inner{ k: 22, l: null }
        };
    }
}