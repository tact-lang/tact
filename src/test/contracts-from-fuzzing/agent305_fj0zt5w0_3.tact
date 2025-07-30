struct Inner {
    val: Int;
}

contract NestedStructField {
    nested: Inner;

    init() {
        self.nested = Inner{val: 1};
    }
}