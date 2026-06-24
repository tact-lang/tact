struct InnerMost {
    ff: Int;
}

struct Inner {
    innerMost: InnerMost;
}

struct Middle {
    inner: Inner;
}

struct OuterMost {
    middle: Middle;
}

contract DeeplyNestedOptional {
    val: OuterMost?;

    init() {
        self.val = null;
    }
}
