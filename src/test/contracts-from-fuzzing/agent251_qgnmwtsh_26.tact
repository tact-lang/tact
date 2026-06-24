struct OptionalString {
    s: String?;
}

contract OptStringTest {
    data: OptionalString;

    init() {
        self.data = OptionalString{ s: "hi" };
    }
}