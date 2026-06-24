struct OptionalFields {
    n: Int?;
    s: String?;
    f: Bool?;
}

contract OptionalStructStorage {
    field: OptionalFields;

    init() {
        self.field = OptionalFields{
            n: null,
            s: null,
            f: null
        };
    }
}