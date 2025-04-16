struct A {
    i: Int;
}

contract OptionalOverride {
    s: A? = null;

    init() {
        self.s = null;
    }
}