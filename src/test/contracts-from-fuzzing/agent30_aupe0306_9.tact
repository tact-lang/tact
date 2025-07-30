struct Inner {
    foo: Int?;
    bar: Bool;
}

contract OptionalStructField {
    inner: Inner?;

    init() {
        self.inner = Inner{
            foo: 321,
            bar: true
        };
    }
}