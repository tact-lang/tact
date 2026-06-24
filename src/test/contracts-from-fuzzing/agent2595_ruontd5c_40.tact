struct OptionalBoolString {
    optBool: Bool?;
    optStr: String?;
}

contract OptionalComplex {
    data: OptionalBoolString;

    init() {
        self.data = OptionalBoolString{
            optBool: null,
            optStr: null
        };
    }
}