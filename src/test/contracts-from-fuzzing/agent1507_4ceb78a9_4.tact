struct OptionalFields {
    s: String?;
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract OptionalTest {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            s: null,
            a: null,
            b: null,
            c: null
        };
    }
}