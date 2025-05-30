struct SimpleS {
    i: Int;
}

contract OptionalStructField {
    s: SimpleS?;

    init() {
        self.s = null;
    }
}
