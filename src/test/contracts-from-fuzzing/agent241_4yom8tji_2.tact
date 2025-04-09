struct Inner {
    y: Int;
}

contract NestedStructField {
    val: Inner = Inner{ y: 5 };

    init() {
        self.val = Inner{ y: 42 };
    }
}