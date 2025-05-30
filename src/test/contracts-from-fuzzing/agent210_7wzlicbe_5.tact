struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract WithOptionalStruct {
    st: OptionalFields;

    init() {
        self.st = OptionalFields{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}