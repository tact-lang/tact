struct OptionalNested {
    nested: Inner?;
}

struct Inner {
    value: Int;
    flag: Bool;
}

contract TestOptionalNested {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            nested: null,
        };
    }
}
