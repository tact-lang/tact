struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalContract {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            a: null,
            b: true,
            c: null,
        };
    }
}
