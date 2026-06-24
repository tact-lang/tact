struct OptionalStrings {
    s1: String?;
    s2: String?;
}

contract TestContract {
    text: OptionalStrings;

    init() {
        self.text = OptionalStrings{
            s1: null,
            s2: "hello"
        };
    }
}