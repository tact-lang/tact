struct Middle {
    id: Int;
    flag: Bool;
}

contract OptionalStructField {
    s: Middle?;

    init() {
        self.s = null;
    }
}
