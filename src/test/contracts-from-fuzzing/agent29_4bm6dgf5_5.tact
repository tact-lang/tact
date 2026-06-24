struct OptionalFields {
    a: Int?;
    b: Int?;
    c: Int?;
}

contract OptFieldStructTest {
    opts: OptionalFields;

    init() {
        self.opts = OptionalFields{
            a: null,
            b: null,
            c: null
        };
    }
}