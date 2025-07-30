struct SOpt {
    a: Int?;
}

contract OptionalStructField {
    s: SOpt?;

    init() {
        self.s = null;
    }
}