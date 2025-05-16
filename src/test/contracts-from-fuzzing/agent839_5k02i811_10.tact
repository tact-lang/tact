struct InnerMost {
    val: String?;
}

struct Inner {
    im: InnerMost?;
}

contract OptionalNesting {
    field: Inner?;
    init() {
        self.field = null;
    }
}