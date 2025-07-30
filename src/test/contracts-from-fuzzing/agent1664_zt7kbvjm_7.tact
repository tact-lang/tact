struct InnerMost {
    secret: String;
}

struct MiddleOpt {
    data: InnerMost?;
}

struct Outer {
    wrapper: MiddleOpt?;
}

contract NullDeepNestedOpt {
    nested: Outer?;

    init() {
        self.nested = null;
    }
}