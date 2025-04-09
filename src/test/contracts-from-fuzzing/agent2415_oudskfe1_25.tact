struct OptionalStr {
    str: String?;
}

contract OptionalStrField {
    optStr: OptionalStr;

    init() {
        self.optStr = OptionalStr{ str: null };
    }
}