struct OptionalString {
    desc: String?;
}

contract OptionalStringTest {
    value: OptionalString;

    init() {
        self.value = OptionalString{
            desc: null,
        };
    }
}