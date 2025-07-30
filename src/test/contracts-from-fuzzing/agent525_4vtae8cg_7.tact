struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract Opts {
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