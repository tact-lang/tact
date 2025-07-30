struct NestedOptional {
    opt: Int?;
    other: String?;
}

contract OptionalStructComplex {
    nested: NestedOptional?;

    init() {
        self.nested = null;
    }
}