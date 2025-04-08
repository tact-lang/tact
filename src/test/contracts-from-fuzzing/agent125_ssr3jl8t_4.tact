struct Inner {
    a: Int;
    b: Bool;
    c: String?;
}

contract OptionalStructField {
    data: Inner? = null;

    init() {
        self.data = null;
    }
}