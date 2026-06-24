struct OptionalInner {
    foo: Int?;
    bar: Int?;
}

contract OptionalStructField {
    data: OptionalInner;

    init() {
        self.data = OptionalInner{ foo: null, bar: 42 };
    }
}