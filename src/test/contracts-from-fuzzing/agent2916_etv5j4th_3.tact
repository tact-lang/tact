struct OptFields {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
}

contract OptFieldsTest {
    data: OptFields;

    init() {
        self.data = OptFields{
            a: 5,
            b: "hello",
            c: null,
            d: null,
        };
    }
}