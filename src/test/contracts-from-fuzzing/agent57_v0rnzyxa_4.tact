struct InnerMost {
    deepVal: Int?;
}

struct Inner {
    innerMost: InnerMost?;
}

struct Middle {
    inner: Inner?;
}

struct Outer {
    middle: Middle?;
}

contract DeepOptionals {
    val: Outer;

    init() {
        self.val = Outer{ middle: null };
    }
}