struct NestedOptional {
    field1: Int?;
    field2: Bool?;
}

contract UseNestedOptional {
    nested: NestedOptional;

    init() {
        self.nested = NestedOptional{field1: null, field2: null};
    }
}