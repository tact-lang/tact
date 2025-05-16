struct Inner {
    flag: Bool;
}

contract OptionalStructField {
    s: Inner? = null;

    init() {
        self.s = null;
    }
}
