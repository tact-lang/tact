struct OptionalFields {
    text: String?;
    number: Int?;
    flag: Bool?;
}

contract OptionalStructTest {
    optData: OptionalFields;

    init() {
        self.optData = OptionalFields{
            text: null,
            number: null,
            flag: null
        };
    }
}
