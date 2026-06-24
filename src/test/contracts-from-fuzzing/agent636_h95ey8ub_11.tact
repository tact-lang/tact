struct OneOptionalField {
    intOpt: Int?;
}

contract StructWithDefaultNull {
    s: OneOptionalField;

    init() {
        self.s = OneOptionalField{};
    }
}