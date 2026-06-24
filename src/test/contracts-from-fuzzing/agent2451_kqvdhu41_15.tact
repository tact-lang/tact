struct OptionalString {
    text: String?;
}

contract OptionalFields {
    value: OptionalString;

    init() {
        self.value = OptionalString{
            text: null
        };
    }
}