struct Sub {
    v: Int;
}

contract OptionalStructWithDefault {
    s: Sub? = null;

    init() {
        self.s = null;
    }
}