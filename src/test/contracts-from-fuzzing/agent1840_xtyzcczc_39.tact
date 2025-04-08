struct S {
    i: Int = 5;
    b: Bool? = null;
}

contract OptDef {
    f: S;
    init() {
        self.f = S{};
    }
}