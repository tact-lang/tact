struct Wrap {
    v: Int;
}

contract OptionalWrap {
    inner: Wrap?;

    init() {
        self.inner = null;
    }
}