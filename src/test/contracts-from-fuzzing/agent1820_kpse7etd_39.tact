struct OptionalStrings {
    opt1: String?;
    opt2: String?;
}

contract TestContract {
    x: OptionalStrings;
    init() {
        self.x = OptionalStrings{
            opt1: null,
            opt2: null,
        };
    }
}