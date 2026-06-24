struct OptionalString {
    text: String?;
}

contract HasOptionalString {
    s: OptionalString;

    init() {
        self.s = OptionalString{
            text: null
        };
    }
}