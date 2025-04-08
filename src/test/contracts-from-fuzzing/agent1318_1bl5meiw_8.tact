struct OptionalNested {
    innerOpt: Inner?;
}

struct Inner {
    value: Int;
}

contract OptionalNestedField {
    optNested: OptionalNested;

    init() {
        self.optNested = OptionalNested{
            innerOpt: Inner{ value: 101 }
        };
    }
}