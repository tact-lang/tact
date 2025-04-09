struct S {
    a: Int;
}

contract OptionalStructs {
    s1: S?;
    s2: S?;

    init() {
        self.s1 = null;
        self.s2 = null;
    }
}