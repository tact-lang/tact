struct InnerMost {
    val: Int;
}

struct Inner {
    next: InnerMost?;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle?;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            middle: null
        };
    }
}