struct OptionalInner {
    foo: Int;
}

contract OptTest {
    data: OptionalInner?;
    init() {
        self.data = null;
    }
}