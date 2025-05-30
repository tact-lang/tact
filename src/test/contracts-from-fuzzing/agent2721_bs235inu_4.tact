struct OptionalTest {
    val1: Int?;
    val2: Bool?;
    val3: String?;
}

contract OptionalFieldsStorage {
    data: OptionalTest;

    init() {
        self.data = OptionalTest{
            val1: null,
            val2: true,
            val3: null,
        };
    }
}
