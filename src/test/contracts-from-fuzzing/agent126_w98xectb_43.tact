struct Inner {
    val: Int;
}

contract DefaultStructField {
    inner: Inner = Inner{ val: 5 };

    init() {
        self.inner = Inner{ val: 13 };
    }
}