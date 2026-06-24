struct OptionalFields {
    val1: Int?;
    val2: Bool?;
    val3: Address?;
}

contract OptionalStructFieldsTest {
    storage: OptionalFields;

    init() {
        self.storage = OptionalFields{
            val1: null,
            val2: true,
            val3: null,
        };
    }
}