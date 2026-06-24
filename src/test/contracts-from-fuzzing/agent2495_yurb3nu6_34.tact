struct OptionalStringInner {
    s: String?;
}

contract OptStrStructTest {
    inner: OptionalStringInner?;

    init() {
        self.inner = null;
    }
}