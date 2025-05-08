struct S {
    x: Int;
}

contract OptionalTop {
    s: S?;

    init() {
        self.s = null;
    }
}