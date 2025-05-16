struct OptionalWithDefaults {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract OptDefaults {
    s: OptionalWithDefaults;
    init() {
        self.s = OptionalWithDefaults{
            optInt: null,
            optBool: null,
            optStr: null
        };
    }
}