struct OptionalStrings {
    a: String?;
    b: String?;
}

contract OptionalStringsContract {
    data: OptionalStrings;

    init() {
        self.data = OptionalStrings{
            a: null,
            b: "hello"
        };
    }
}
