struct Inner {
    val: Int;
}

contract OptionalStructField {
    nested: Inner?;

    init() {
        self.nested = null;
    }
}