struct OptionalFields {
    one: Int?;
    two: String?;
    three: Bool?;
}

contract OptionalTest {
    value: OptionalFields;
    init() {
        self.value = OptionalFields{
            one: null,
            two: null,
            three: null
        };
    }
}