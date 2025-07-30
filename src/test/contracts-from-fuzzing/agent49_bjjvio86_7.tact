struct OptionalNested {
    optInner: Inner?;
}

struct Inner {
    value: Int;
}

contract WithOptionalNestedStruct {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            optInner: null,
        };
    }
}
