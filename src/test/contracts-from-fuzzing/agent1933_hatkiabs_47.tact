struct S {
    v: Int;
}

contract NullStructAssign {
    s: S?;

    init() {
        self.s = null;
    }
}