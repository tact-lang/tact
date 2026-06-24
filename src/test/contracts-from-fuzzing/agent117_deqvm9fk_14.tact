struct DeepOpt {
    inner: Bool?;
}

struct NestedOpt {
    outer: DeepOpt;
}

contract OptOpt {
    nested: NestedOpt;

    init() {
        self.nested = NestedOpt{outer: DeepOpt{inner: null}};
    }
}
