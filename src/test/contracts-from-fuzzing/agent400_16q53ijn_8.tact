struct OptionalInner {
    b: String;
    c: Bool?;
}

contract OptionalNestedTest {
    s: OptionalInner?;

    init() {
        self.s = null;
    }
}