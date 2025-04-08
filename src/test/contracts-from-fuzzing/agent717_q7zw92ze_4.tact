struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalTest {
    val: OptionalFields;

    init() {
        self.val = OptionalFields{
            a: null,
            b: true,
            c: null,
        };
    }
}