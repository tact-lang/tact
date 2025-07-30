struct DeepOptional {
    inner: Int?;
}

struct OptionalOuter {
    nestedOpt: DeepOptional?;
    regular: Int;
}

contract OptionalOuterField {
    d: OptionalOuter;
    init() {
        self.d = OptionalOuter{ nestedOpt: null, regular: 1 };
    }
}