struct OptionalString {
    s: String?;
}

contract OptionalTest {
    opt: OptionalString;

    init() {
        self.opt = OptionalString{ s: null };
    }
}