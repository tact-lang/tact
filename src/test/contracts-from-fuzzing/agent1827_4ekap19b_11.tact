struct StructDefaults {
    a: Int = 7;
    b: Bool = false;
    c: String = "str";
}

contract UsesStructDefaults {
    s: StructDefaults;

    init() {
        self.s = StructDefaults{};
    }
}