struct Inner {
    val: Int;
}

contract OptionalStructField {
    data: Inner?;
    init() {
        self.data = null;
    }
}