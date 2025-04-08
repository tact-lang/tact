struct InnerOptional {
    optInt: Int?;  // implicit null default
    optBool: Bool?;
}

contract OptionalFieldsTest {
    optField: InnerOptional = InnerOptional{};

    init() {
        self.optField = InnerOptional{
            optInt: 123,
            optBool: true
        };
    }
}