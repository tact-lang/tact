struct Something {
    foo: Int;
}

contract OptionalStructDefaultNull {
    s: Something? = null;
    init() {
        self.s = null;
    }
}
