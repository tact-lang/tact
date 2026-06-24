struct OptionalString {
    s: String?;
}

contract OptStrContract {
    data: OptionalString;

    init() {
        self.data = OptionalString{
            s: null
        };
    }
}
