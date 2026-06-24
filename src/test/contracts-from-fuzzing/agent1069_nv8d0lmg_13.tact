struct NestedOptional {
    val1: Int?;
    val2: Bool?;
}

contract OptionalNested {
    nested: NestedOptional?;

    init() {
        self.nested = null;
    }
}