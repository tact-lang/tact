struct OptionalFields {
    val1: Int?;
    val2: Bool?;
    val3: String?;
}

contract OptionalFieldsTest {
    st: OptionalFields;

    init() {
        self.st = OptionalFields {
            val1: null,
            val2: null,
            val3: null,
        };
    }
}
