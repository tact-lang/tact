struct Inner {
    x: Int;
}

contract OptStructField {
    val: Inner?;

    init() {
        self.val = null;
    }
}
