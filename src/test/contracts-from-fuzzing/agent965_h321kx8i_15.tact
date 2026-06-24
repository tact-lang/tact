struct S {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    d: Int? = null;
}

contract StructDefaults {
    s: S;

    init() {
        self.s = S{};
    }
}