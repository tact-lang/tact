struct EmptyOpt {
    dummy: Int;
}

contract OptionalField {
    inner: EmptyOpt?;
    init() {
        self.inner = null;
    }
}
