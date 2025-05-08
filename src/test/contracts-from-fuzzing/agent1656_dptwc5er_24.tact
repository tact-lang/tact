struct OptionalFields {
    o1: Int?;
    o2: Bool?;
}

contract OptionalFieldsTest {
    st: OptionalFields;

    init() {
        self.st = OptionalFields{
            o1: null,
            o2: null,
        };
    }
}
