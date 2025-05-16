struct OptionalStrings {
    name: String?;
    description: String?;
}

contract OptStringsContract {
    info: OptionalStrings;

    init() {
        self.info = OptionalStrings{
            name: null,
            description: null
        };
    }
}