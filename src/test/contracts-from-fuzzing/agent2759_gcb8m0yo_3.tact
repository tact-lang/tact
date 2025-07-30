struct OptionalFields {
    flag: Bool?;
    number: Int?;
    text: String?;
}

contract OptionalStructTest {
    optField: OptionalFields;

    init() {
        self.optField = OptionalFields{
            flag: null,
            number: null,
            text: null
        };
    }
}