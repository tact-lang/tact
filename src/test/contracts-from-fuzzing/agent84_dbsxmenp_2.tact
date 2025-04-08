struct InnerMost {
    val: Int;
}

struct Inner {
    im: InnerMost;
    flag: Bool;
}

struct Middle {
    inner: Inner;
    message: String?;
}

struct Outer {
    mid: Middle;
    extFlag: Bool?;
}

contract NestedComplex {
    data: Outer;
    init() {
        self.data = Outer{
            mid: Middle{
                inner: Inner{
                    im: InnerMost{val: 42},
                    flag: true,
                },
                message: null,
            },
            extFlag: null,
        };
    }
}
