struct InnerOpt {
    foo: Int?;
}

struct NestedOpt {
    inner: InnerOpt?;
}

contract OptionalStructInsideOptional {
    test: NestedOpt;

    init() {
        self.test = NestedOpt {
            inner: null
        };
    }
}