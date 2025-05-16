struct Mid {
    b: Int;
    c: Int?;
}

contract OptionalStructInside {
    s: Mid?;

    init() {
        self.s = null;
    }
}