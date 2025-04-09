struct OptionalStrings {
    name: String?;
    description: String?;
    symbol: String?;
    url: String?;
}

contract OptStringFields {
    data: OptionalStrings;

    init() {
        self.data = OptionalStrings{
            name: null,
            description: null,
            symbol: null,
            url: null,
        };
    }
}
