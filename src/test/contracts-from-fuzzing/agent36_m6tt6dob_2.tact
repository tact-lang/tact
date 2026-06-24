struct Inner {
    x: Int;
}

contract NestedStructField {
    field: Inner;
    init() {
        self.field = Inner{x: 42};
    }
}