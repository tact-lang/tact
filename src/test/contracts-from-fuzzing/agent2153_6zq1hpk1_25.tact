struct OptionalInOptional {
    nested: InnerOptional?;
}

struct InnerOptional {
    val: Int?;
}

contract NestedOptionalVals {
    data: OptionalInOptional;

    init() {
        self.data = OptionalInOptional{ nested: null };
    }
}
