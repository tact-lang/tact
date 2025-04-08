struct S {
    a: Int;
}

contract Test {
    f: S?;

    init() {
        self.f = null;
    }
}
