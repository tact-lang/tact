struct Inner {
    a: Int;
}

contract OptionalStructField {
    val: Inner?;

    init() {
        self.val = Inner{a:7};
    }
}