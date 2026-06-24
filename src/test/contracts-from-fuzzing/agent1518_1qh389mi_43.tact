struct OptionalWrap {
    inner: Inner?;
}

struct Inner {
    val: Int?;
}

contract OptionalNesting {
    ow: OptionalWrap;

    init() {
        self.ow = OptionalWrap {
            inner: Inner{ val: null }
        };
    }
}