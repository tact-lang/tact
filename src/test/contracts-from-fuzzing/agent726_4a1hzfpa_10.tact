struct Inner {
    x: Int;
}

contract OptionalStructField {
    val: Inner?;

    init() {
        self.val = null;
    }
}