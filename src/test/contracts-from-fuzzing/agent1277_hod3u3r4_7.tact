struct OptionalStrings {
    f1: String?;
    f2: String?;
    f3: String?;
}

contract OptionalStringFields {
    opts: OptionalStrings;

    init() {
        self.opts = OptionalStrings {
            f1: null,
            f2: null,
            f3: null,
        };
    }
}
