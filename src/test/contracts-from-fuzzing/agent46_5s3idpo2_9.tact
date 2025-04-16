struct S {
    x: Int;
}

contract OptionalStructField {
    opt: S?;

    init() {
        self.opt = null;
    }
}
