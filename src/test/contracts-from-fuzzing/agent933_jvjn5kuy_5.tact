struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptTest {
    s: OptionalFields;

    init() {
        self.s = OptionalFields{
            a: null,
            b: true,
            c: null
        };
    }
}
