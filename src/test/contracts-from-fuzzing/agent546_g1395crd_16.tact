struct S {
    a: Int = 1;
    b: Bool = true;
    c: String = "yes";
}

contract StructWithDefaults {
    s: S;

    init() {
        self.s = S{};
    }
}
