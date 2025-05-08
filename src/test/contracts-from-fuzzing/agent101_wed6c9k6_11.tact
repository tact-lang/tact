struct OptionalString {
    s: String?;
}

contract OptionalStringContract {
    state: OptionalString;

    init() {
        self.state = OptionalString{
            s: null,
        };
    }
}