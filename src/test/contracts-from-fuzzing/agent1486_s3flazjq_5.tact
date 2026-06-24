struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptContract {
    field: OptionalFields;

    init() {
        self.field = OptionalFields{
            a: null,
            b: null,
            c: null
        };
    }
}
