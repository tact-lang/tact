struct InnerMost {
    iv1: Int?;
    bv1: Bool?;
    sv1: String?;
    av1: Address?;
}

struct Inner {
    inner_most: InnerMost?;
    x: Int?;
}

struct Outer {
    inner: Inner?;
    y: Int?;
}

contract NestedOpts {
    data: Outer;

    init() {
        self.data = Outer{
            y: null,
            inner: Inner{
                x: null,
                inner_most: InnerMost{
                    iv1: null,
                    bv1: null,
                    sv1: null,
                    av1: null
                }
            }
        };
    }
}