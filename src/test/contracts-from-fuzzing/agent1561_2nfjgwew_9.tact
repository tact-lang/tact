struct StrWrap {
    s: String;
}

contract OptionalNestedStringTest {
    val: StrWrap?;

    init() {
        self.val = null;
    }
}