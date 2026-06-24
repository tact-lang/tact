contract NestedOptionalPrimitives {
    i: Int?;
    s: String?;
    inner: Inner?;

    init() {
        self.i = null;
        self.s = null;
        self.inner = null;
    }
}

struct Inner {
    x: Int;
    y: Bool;
}