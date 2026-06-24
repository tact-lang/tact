struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract OptionalStructField {
    s: Inner?;

    init() {
        self.s = null;
    }
}