struct InnerOptional {
    field1: Int?;
    field2: Bool?;
}

contract NestedOptional {
    nested: InnerOptional;

    init() {
        self.nested = InnerOptional{
            field1: null,
            field2: null
        };
    }
}