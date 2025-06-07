struct OptionalStrings {
    first: String?;
    second: String?;
    third: String?;
}

contract TestContract {
    data: OptionalStrings;

    init() {
        self.data = OptionalStrings{ first: null, second: null, third: null };
    }
}