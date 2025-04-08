struct OptionalString {
    s: String?;
}

contract OptTest {
    os: OptionalString;

    init() {
        self.os = OptionalString{
            s: null
        };
    }
}
