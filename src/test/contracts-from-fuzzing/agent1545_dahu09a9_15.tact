struct Inner {
    a: Int;
}

contract OptionalStructField {
    s: Inner?;

    init() {
        self.s = null;
    }
}
