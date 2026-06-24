struct InnerMost {
    a: Int;
}

struct Inner {
    im: InnerMost;
    optVal: Int?;
}

struct Outer {
    inner: Inner;
    optStr: String?;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{ im: InnerMost{ a:1 }, optVal: null },
            optStr: null
        };
    }
}