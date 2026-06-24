struct Inner {
    a: Int;
    b: Bool;
}

contract NestedStructField {
    nested: Inner;

    init() {
        self.nested = Inner{a: 5, b: true};
    }
}