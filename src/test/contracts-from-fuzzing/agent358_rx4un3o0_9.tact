struct OptionalFields {
    f1: Int?;
    f2: Bool?;
    f3: String?;
    f4: Address?;
}

contract OptFieldsTest {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            f1: null,
            f2: null,
            f3: null,
            f4: null
        };
    }
}
