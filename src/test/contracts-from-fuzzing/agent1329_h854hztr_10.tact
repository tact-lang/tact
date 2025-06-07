struct NestedOptionalField {
    name: String?;
    flag: Bool;
}

contract OptFieldContract {
    nested: NestedOptionalField;

    init() {
        self.nested = NestedOptionalField{ name: null, flag: true };
    }
}