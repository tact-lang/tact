struct InnerMost {
    z: Int? = null;
}

struct Inner {
    im: InnerMost;
    s: String? = null;
}

contract Test {
    nested: Inner;

    init() {
        self.nested = Inner{ im: InnerMost{} };
    }
}