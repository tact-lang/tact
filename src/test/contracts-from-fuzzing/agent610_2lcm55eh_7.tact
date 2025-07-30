struct Inner {
    flag: Bool;
}

contract OptionalStructField {
    nested: Inner?;

    init() {
        self.nested = null;
    }
}