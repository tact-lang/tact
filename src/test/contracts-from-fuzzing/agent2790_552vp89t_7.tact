struct InnerMost {
    val: Int;
}

struct Inner {
    im: InnerMost;
    optIm: InnerMost?;
}

struct Top {
    inner: Inner;
    optInner: Inner?;
    b: Bool;
}

contract Test {
    data: Top;

    init() {
        self.data = Top{
            inner: Inner{im: InnerMost{val:5}, optIm:null},
            optInner: null,
            b: true
        };
    }
}