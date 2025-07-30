struct OptionalDeep {
    val1: Int?;
    val2: Bool?;
    val3: String?;
}

contract OptDeepTest {
    field: OptionalDeep;

    init() {
        self.field = OptionalDeep{
            val1: null,
            val2: true,
            val3: "hello",
        };
    }
}