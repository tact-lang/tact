struct OptionalString {
    text: String?;
}

contract TestContract {
    data: OptionalString;

    init() {
        self.data = OptionalString{
            text: null
        };
    }
}