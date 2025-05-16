struct SimpleNestedOpt {
    foo: Int?;
    bar: Bool?;
}

struct HoldsNestedOpt {
    nested: SimpleNestedOpt;
}

contract OptNestedStructs {
    inner: HoldsNestedOpt;

    init() {
        self.inner = HoldsNestedOpt { nested: SimpleNestedOpt { foo: null, bar: null } };
    }
}