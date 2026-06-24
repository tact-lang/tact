struct OptionalString {
    description: String?;
    amount: Int;
}

contract OptionalStringField {
    data: OptionalString;

    init() {
        self.data = OptionalString{
            description: null,
            amount: 99
        };
    }
}