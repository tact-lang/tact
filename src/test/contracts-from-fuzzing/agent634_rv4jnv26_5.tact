struct SubNested {
    inner: Bool;
}

struct NestedWithOptional {
    val: Int?;
    nested: SubNested?;
}

contract OptionalNestedField {
    testField: NestedWithOptional;

    init() {
        self.testField = NestedWithOptional{val: null, nested: null};
    }
}