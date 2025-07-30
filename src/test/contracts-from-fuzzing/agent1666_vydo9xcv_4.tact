struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Slice?;
}

contract OptFieldsTest {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
        };
    }
}