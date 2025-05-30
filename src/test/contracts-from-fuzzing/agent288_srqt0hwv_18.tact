struct OptionalStrings {
    s1: String?;
    s2: String?;
}

contract TestContract {
    os: OptionalStrings;

    init() {
        self.os = OptionalStrings{
            s1: null,
            s2: "not null"
        };
    }
}