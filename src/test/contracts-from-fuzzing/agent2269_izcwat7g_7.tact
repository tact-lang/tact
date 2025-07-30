struct Inner {
    x: Int;
}

contract OptionalStructField {
    test: Inner?;

    init() {
        self.test = null;
    }
}
