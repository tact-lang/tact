struct Inside {
    a: Int;
    b: Bool;
}

contract OptionalStructField {
    inner: Inside?;

    init() {
        self.inner = Inside{a: 7, b: true};
    }
}