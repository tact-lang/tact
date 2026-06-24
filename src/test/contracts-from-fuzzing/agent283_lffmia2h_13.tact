struct StrOpt {
    a: String?;
    b: String?;
}

contract OptionalStrings {
    s: StrOpt;

    init() {
        self.s = StrOpt {
            a: null,
            b: null
        };
    }
}