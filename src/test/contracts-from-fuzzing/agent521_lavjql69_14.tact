struct OptionalStrings {
    s1: String?;
    s2: String?;
}

contract OptionalStringContract {
    f: OptionalStrings;

    init() {
        self.f = OptionalStrings{
            s1: null,
            s2: "not null",
        };
    }
}