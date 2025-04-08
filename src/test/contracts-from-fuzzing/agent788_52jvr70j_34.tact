struct SSS {
    a: Int;
}

contract OptionalStructField {
    s: SSS?;

    init() {
        self.s = null;
    }
}