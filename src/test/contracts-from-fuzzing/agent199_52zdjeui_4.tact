struct OptionalInner {
    foo: Int;
    bar: Bool;
}

contract OptionalStructField {
    optInner: OptionalInner?;

    init() {
        self.optInner = null;
    }
}