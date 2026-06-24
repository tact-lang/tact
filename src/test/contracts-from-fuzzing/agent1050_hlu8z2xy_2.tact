struct OptionalStruct {
    val1: Int?;
    val2: Int?;
    val3: Bool?;
    text: String?;
}

contract OptionalFieldsTest {
    stored: OptionalStruct;

    init() {
        self.stored = OptionalStruct{
            val1: null,
            val2: 13,
            val3: true,
            text: null,
        };
    }
}
