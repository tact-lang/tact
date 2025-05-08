struct OptInner {
    foo: Int;
}

contract OptStructField {
    oField: OptInner?;

    init() {
        self.oField = null;
    }
}
