struct NestedOptional {
    opt: Int?;
    str: String;
}

contract OptionalStructField {
    nested: NestedOptional?;

    init() {
        self.nested = null;
    }
}
