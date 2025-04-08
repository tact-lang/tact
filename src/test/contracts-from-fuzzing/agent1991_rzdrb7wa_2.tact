struct InnerOptional {
    innerValue: Int?;
}

contract NestedOptionalField {
    nested: InnerOptional;

    init() {
        self.nested = InnerOptional{ innerValue: null };
    }
}