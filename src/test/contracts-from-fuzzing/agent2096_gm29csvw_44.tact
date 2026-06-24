struct Inner {
    x: Int;
    y: Bool;
}

contract OptionalStructField {
    opt: Inner?;

    init() {
        self.opt = null;
    }
}