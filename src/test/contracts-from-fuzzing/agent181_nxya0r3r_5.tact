struct Inner {
    a: Int;
    b: Bool?;
    c: String;
}

contract OptionalStructField {
    inside: Inner?;

    init() {
        self.inside = null;
    }
}
