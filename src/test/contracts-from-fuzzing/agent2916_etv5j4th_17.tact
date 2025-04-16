struct OptionalString {
    s: String?;
}

contract OptionalStringTest {
    data: OptionalString;

    init() {
        self.data = OptionalString{
            s: null
        };
    }
}