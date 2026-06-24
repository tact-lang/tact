struct OptionalString {
    text: String?;
}

contract OptStrContract {
    message: OptionalString;

    init() {
        self.message = OptionalString{
            text: null
        };
    }
}