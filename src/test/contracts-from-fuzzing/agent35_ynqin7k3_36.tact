struct S {
    a: Int;
}

contract OptionalOuter {
    s: S?;

    init() {
        self.s = null;
    }
}