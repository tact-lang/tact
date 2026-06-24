struct HasOptionalField {
    foo: Int?;
}

contract OptStructDefaultVal {
    data: HasOptionalField;

    init() {
        self.data = HasOptionalField{};
    }
}