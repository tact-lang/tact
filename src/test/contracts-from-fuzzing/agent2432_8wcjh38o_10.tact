struct S {
    a: Int?;
    b: Int;
}

contract Test {
    s: S?;
    init() {
        self.s = null;
    }
}