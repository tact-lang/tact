struct OptionalString {
    s: String?;
}

contract OptStringTest {
    d: OptionalString;
    init() {
        self.d = OptionalString{
            s: null
        };
    }
}
