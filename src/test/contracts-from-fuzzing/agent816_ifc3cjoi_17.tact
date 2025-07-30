struct SInner {
    v: Int;
}

struct SMiddle {
    a: SInner;
    b: Int?;
}

struct STop {
    s: SMiddle;
    str: String;
}

contract NestedMixedOpt {
    f: STop;

    init() {
        self.f = STop {
            s: SMiddle { a: SInner { v: 9 }, b: null },
            str: "abc"
        };
    }
}