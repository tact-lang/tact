struct Mid {
    foo: Int?;
    bar: Bool;
}

contract OptionalStructField {
    mid: Mid?;

    init() {
        self.mid = null;
    }
}