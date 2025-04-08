struct SOptField {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract OptionalFields {
    s: SOptField;
    init() {
        self.s = SOptField{
            optInt: null,
            optBool: null,
            optStr: null
        };
    }
}