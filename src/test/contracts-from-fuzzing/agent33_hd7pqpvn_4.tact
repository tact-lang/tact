struct OptionalFields {
    val1: Int?;
    val2: Bool?;
    val3: String?;
}

contract Test {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            val1: null,
            val2: true,
            val3: null,
        };
    }
}