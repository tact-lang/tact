struct Inner {
    n: Int;
}

contract OptionalInStructDefaultVal {
    maybe: Inner? = null;
    init() {
        self.maybe = null;
    }
}