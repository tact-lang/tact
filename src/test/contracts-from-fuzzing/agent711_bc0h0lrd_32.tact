struct OptionalStrings {
    a: String?;
    b: String?;
    c: String?;
}

contract OptStrs {
    data: OptionalStrings;

    init() {
        self.data = OptionalStrings{
            a: "a",
            b: null,
            c: "c"
        };
    }
}