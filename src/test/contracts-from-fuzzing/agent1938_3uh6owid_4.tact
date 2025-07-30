struct NestedWithOptional {
    inner: Int?;
    text: String;
}

contract OptionalNestedTest {
    data: NestedWithOptional?;

    init() {
        self.data = null;
    }
}