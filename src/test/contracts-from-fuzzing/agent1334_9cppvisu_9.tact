struct Wrap {
    x: Int;
}

contract OptionalStructField {
    opt: Wrap?;

    init() {
        self.opt = null;
    }
}
