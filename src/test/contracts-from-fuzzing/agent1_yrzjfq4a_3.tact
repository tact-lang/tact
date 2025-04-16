struct OptionalNested {
    foo: Int?;
    bar: Int?;
}

contract OptionalNestedStorage {
    s: OptionalNested;

    init() {
        self.s = OptionalNested{
            foo: null,
            bar: 42
        };
    }
}