struct OptionalString {
    s1: String?;
    s2: String?;
}

contract OptionalStringTest {
    data: OptionalString;

    init() {
        self.data = OptionalString{
            s1: null,
            s2: "not null"
        };
    }
}