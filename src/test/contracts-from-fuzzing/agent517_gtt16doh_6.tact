struct Sub {
    value: Int;
}

contract OptionalField {
    s: Sub?;
    init() {
        self.s = null;
    }
}