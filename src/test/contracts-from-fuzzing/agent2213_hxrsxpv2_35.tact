struct Inner {
    val: Int;
}

contract OptStructField {
    s: Inner?;

    init() {
        self.s = Inner{ val: 99 };
    }
}
