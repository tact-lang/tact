struct Inner {
    flag: Bool;
}

contract OptionalStructField {
    optInner: Inner?;

    init() {
        self.optInner = null;
    }
}