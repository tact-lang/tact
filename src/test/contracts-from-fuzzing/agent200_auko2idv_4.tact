struct OptionalFields {
    number: Int?;
    flag: Bool?;
    text: String?;
}

contract OptionalTest {
    data: OptionalFields;
    init() {
        self.data = OptionalFields{
            number: 5,
            flag: null,
            text: "hi"
        };
    }
}