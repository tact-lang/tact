struct S {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
}

contract DefaultMix {
    s: S;
    init() {
        self.s = S{};
    }
}