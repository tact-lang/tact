struct Wrapper {
    val: Int;
}

contract OptionalWrapper {
    inner: Wrapper?;

    init() {
        self.inner = null;
    }
}