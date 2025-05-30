struct Inner {
    secret: Int;
}

contract OptionalStructField {
    maybeInner: Inner?;

    init() {
        self.maybeInner = null;
    }
}