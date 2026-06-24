struct OptionalString {
    s1: String?;
    s2: String?;
}

contract OptStringTest {
    v: OptionalString;
    init() {
        self.v = OptionalString{
            s1: "hello",
            s2: null,
        };
    }
}