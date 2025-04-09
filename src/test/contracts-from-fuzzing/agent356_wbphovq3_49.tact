struct NonOptional {
    x: Int;
}

contract OptionalFieldWrapper {
    inner: NonOptional?;

    init() {
        self.inner = null;
    }
}