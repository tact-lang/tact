struct S {
    a: Int = 1;
    b: Bool = false;
    c: String = "x";
}

contract InitDefaults {
    s: S;

    init() {
        self.s = S{};
    }
}