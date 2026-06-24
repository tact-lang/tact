struct Inner {
    value: Int;
}

contract OptionalStructField {
    data: Inner?;

    init() {
        self.data = Inner{value:42};
    }
}