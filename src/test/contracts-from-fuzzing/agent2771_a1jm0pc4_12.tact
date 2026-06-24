struct HasBool {
    flag: Bool;
}

contract OptionalBoolField {
    inner: HasBool?;

    init() {
        self.inner = null;
    }
}