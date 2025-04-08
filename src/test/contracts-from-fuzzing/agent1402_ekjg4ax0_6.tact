struct NestedOptionalStruct {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptionalInsideContract {
    nested: NestedOptionalStruct?;

    init() {
        self.nested = NestedOptionalStruct{foo: 5, bar: null, baz: "cat"};
    }
}