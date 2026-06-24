struct InnerStr {
    txt: String;
}

contract OptionalWithDefault {
    inner: InnerStr?;

    init() {
        self.inner = null;
    }
}