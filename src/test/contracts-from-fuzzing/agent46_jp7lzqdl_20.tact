struct S {
    a: Int;
    b: Bool;
}

contract OptionalContainer {
    s: S?;

    init() {
        self.s = null;
    }
}
