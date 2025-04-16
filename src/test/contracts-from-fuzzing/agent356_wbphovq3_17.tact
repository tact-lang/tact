struct OptionalString {
    s: String?;
}

contract OptionalStringContract {
    v: OptionalString;

    init() {
        self.v = OptionalString{
            s: null
        };
    }
}