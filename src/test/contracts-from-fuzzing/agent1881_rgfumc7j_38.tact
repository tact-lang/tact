struct OptionalWrap {
    inner: Int?;
}

contract OptWrapTest {
    x: OptionalWrap?;

    init() {
        self.x = null;
    }
}