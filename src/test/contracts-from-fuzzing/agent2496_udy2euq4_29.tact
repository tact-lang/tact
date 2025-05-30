struct Inner {
    foo: Int;
    bar: Bool;
}

contract OptionalStructField {
    x: Inner?;

    init() {
        self.x = null;
    }
}
