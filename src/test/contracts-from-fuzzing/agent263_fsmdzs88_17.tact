struct OptionalStrings {
    a: String?;
    b: String?;
    c: String?;
}

contract OptStringFields {
    data: OptionalStrings;

    init() {
        self.data = OptionalStrings{a: null, b: null, c: null};
    }
}