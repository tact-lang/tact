struct OptionalInnerString {
    s: String?;
}

contract OptionalOptional {
    inner: OptionalInnerString?;

    init() {
        self.inner = null;
    }
}