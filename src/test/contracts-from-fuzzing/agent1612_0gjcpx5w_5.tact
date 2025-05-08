struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract OptionalStructStorage {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            a: null,
            b: true,
            c: null,
            d: null,
        };
    }
}
