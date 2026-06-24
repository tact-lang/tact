struct S {
    a: Int?;
}

contract C {
    s: S?;

    init() {
        self.s = null;
    }
}