struct HasOptionalField {
    field: Int?;
}

contract DefaultOptAssign {
    x: HasOptionalField;

    init() {
        self.x = HasOptionalField{};
    }
}