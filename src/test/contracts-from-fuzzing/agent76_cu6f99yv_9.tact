struct NestedOptional {
    inner: Int?;
}

struct DoubleOptional {
    nested: NestedOptional?;
}

contract OptOpt {
    data: DoubleOptional;
    init() {
        self.data = DoubleOptional{ nested: null };
    }
}