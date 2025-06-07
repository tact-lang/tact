struct OptionalStructInner {
    foo: Int;
}

contract OptionalStructField {
    opt: OptionalStructInner?;

    init() {
        self.opt = null;
    }
}