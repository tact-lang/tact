struct S {
    a: Int? = 0;
    b: Bool? = true;
}

contract Test {
    s: S;

    init() {
        self.s = S{};
    }
}