struct InnerMost {
    value: Int;
}

struct InnerOptional {
    inner: InnerMost?;
}

contract DeepNestedOpt {
    field: InnerOptional;

    init() {
        self.field = InnerOptional{ inner: null };
    }
}
