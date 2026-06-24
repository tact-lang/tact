struct OneOptionalField {
    maybeVal: Int?;
}

contract OptionalFieldTest {
    storage: OneOptionalField;

    init() {
        self.storage = OneOptionalField{
            maybeVal: null
        };
    }
}