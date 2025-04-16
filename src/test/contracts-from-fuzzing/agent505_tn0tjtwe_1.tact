struct Inner {
    a: Int;
    b: Bool;
}

contract NestedStructField {
    data: Inner;

    init() {
        self.data = Inner{a: 5, b: true};
    }
}
