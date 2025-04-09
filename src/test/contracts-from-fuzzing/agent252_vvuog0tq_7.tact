struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
}

contract TestContract {
    data: OptionalFields;

    init() {
        self.data = OptionalFields {
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}