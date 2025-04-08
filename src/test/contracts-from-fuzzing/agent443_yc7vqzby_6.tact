struct OptFields {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract OptionalsTest {
    field: OptFields;

    init() {
        self.field = OptFields{
            a: null,
            b: true,
            s: null
        };
    }
}