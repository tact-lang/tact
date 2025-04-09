struct InnerMost {
    val: Int;
}

struct InnerOption {
    inner: InnerMost?;
}

struct MiddleOption {
    inneropt: InnerOption?;
}

struct OuterOption {
    middle: MiddleOption?;
}

contract Test {
    field: OuterOption;

    init() {
        self.field = OuterOption{
            middle: null
        };
    }
}