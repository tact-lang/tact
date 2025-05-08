struct OptionalStrings {
    s1: String?;
    s2: String?;
    s3: String?;
    s4: String?;
    s5: String?;
}

contract TestOptStrings {
    data: OptionalStrings;

    init() {
        self.data = OptionalStrings{
            s1: null,
            s2: null,
            s3: null,
            s4: null,
            s5: null,
        };
    }
}
