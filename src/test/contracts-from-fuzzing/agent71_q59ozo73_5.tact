struct OptionalNested {
    foo: Int?;
    bar: Bool?;
}

contract OptNestedStorage {
    s: OptionalNested;

    init() {
        self.s = OptionalNested{ foo: null, bar: null };
    }
}