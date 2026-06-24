struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
}

contract TestOptional {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            a: null,
            b: true,
            c: null,
            d: null
        };
    }
}