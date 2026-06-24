struct OptionalTest {
    optInt: Int?;
    optStr: String?;
}

contract OptionalFields {
    field: OptionalTest;

    init() {
        self.field = OptionalTest{ optInt: null, optStr: null };
    }
}