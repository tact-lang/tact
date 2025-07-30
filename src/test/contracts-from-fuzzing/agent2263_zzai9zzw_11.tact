struct S {
    s: String = "";
}

contract Test {
    d: S;

    init() {
        self.d = S{};
    }
}