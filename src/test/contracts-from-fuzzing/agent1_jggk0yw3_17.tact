contract OptionalStructField {
    s: Inner?;

    init() {
        self.s = null;
    }
}

struct Inner {
    foo: Int;
}