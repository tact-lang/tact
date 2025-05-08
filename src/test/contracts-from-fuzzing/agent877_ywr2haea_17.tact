struct OptionalString {
    s: String?;
}

contract OptionalFieldTest {
    data: OptionalString;

    init() {
        self.data = OptionalString{
            s: null,
        };
    }
}