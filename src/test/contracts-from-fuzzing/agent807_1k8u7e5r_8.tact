struct WithOptionalNested {
    nested: Inner?;
}

struct Inner {
    value: Int;
}

contract OptionalNested {
    storage: WithOptionalNested;
    init() {
        self.storage = WithOptionalNested{
            nested: null
        };
    }
}