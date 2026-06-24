struct OptionalNested {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptionalNestedStorage {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            foo: null,
            bar: true,
            baz: null
        };
    }
}