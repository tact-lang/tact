struct Inner {
    a: Int;
    b: Bool;
    s: String;
}

contract NestedStructField {
    inner: Inner;

    init() {
        self.inner = Inner{
            a: 10,
            b: true,
            s: "test"
        };
    }
}