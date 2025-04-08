struct OptionalString {
    text: String?;
}

contract OptNested {
    data: OptionalString;

    init() {
        self.data = OptionalString{
            text: null,
        };
    }
}