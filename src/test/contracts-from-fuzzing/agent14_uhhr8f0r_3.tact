struct InnerMost {
    p: Bool;
    q: String?;
}

struct Inner {
    x: Int;
    y: InnerMost;
}

contract Test {
    inner: Inner;

    init() {
        self.inner = Inner{
            x: 99,
            y: InnerMost{p: true, q: null}
        };
    }
}