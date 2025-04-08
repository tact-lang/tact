struct OptionalStrings {
    name: String?;
    info: String?;
    email: String?;
}

contract OptStringFields {
    data: OptionalStrings;

    init() {
        self.data = OptionalStrings{
            name: null,
            info: null,
            email: null,
        };
    }
}