struct OptionalNested {
    foo: Int?;
    bar: Int?;
}

contract OptionalNestedContract {
    nested: OptionalNested;

    init() {
        self.nested = OptionalNested{
            foo: null,
            bar: 99
        };
    }
}