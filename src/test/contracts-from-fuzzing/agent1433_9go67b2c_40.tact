struct InnerMost {
    s: String;
}

struct Inner {
    a: Int?;
    x: InnerMost;
}

contract NullableMixed {
    inner: Inner?;

    init() {
        self.inner = null;
    }
}
