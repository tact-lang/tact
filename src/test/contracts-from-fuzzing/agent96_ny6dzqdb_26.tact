struct S {
    s: String?;
}

contract Test {
    s: S?;

    init() {
        self.s = null;
    }
}