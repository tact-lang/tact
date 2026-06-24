struct InnerMost {
    a: Int;
    b: Bool;
}

struct Middle {
    inner: InnerMost?;
    z: Int;
}

contract OptionalMidInner {
    nested: Middle?;

    init() {
        self.nested = null;
    }
}