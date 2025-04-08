struct NestedOpt {
    foo: Int?;
}

struct OptionalNested {
    nested: NestedOpt;
}

contract OptionInNestedStruct {
    payload: OptionalNested;

    init() {
        self.payload = OptionalNested{
            nested: NestedOpt{
                foo: null,
            },
        };
    }
}
