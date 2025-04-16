struct OptionalString {
    s: String?;
}

contract OptionalStringTest {
    opt: OptionalString;

    init() {
        self.opt = OptionalString{ s: null };
    }
}