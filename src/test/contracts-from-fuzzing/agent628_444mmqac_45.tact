struct OptionalNestedWrap {
    val: Int?;
}

struct OptionalWrap {
    wrap: OptionalNestedWrap?;
}

contract OptionalOptional {
    nested: OptionalWrap;

    init() {
        self.nested = OptionalWrap{ wrap: null };
    }
}